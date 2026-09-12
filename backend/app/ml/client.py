import httpx
import time
from typing import Optional
from app.core.config import settings
from app.core.exceptions import MLServiceError, MLTimeoutError, MLInvalidResponseError
from app.ml.schemas import MLRequest, MLResponse, MLHealthResponse


class MLClient:
    def __init__(self):
        self.base_url = settings.ML_SERVICE_URL.rstrip("/") if settings.ML_SERVICE_URL else ""
        self.timeout = settings.ML_TIMEOUT_SECONDS
        self._client: Optional[httpx.AsyncClient] = None

    async def _get_client(self) -> httpx.AsyncClient:
        if self._client is None or self._client.is_closed:
            self._client = httpx.AsyncClient(
                timeout=httpx.Timeout(self.timeout),
                headers={"Content-Type": "application/json"},
            )
        return self._client

    async def close(self) -> None:
        if self._client and not self._client.is_closed:
            await self._client.aclose()
            self._client = None

    async def predict(self, request: MLRequest) -> MLResponse:
        if not self.base_url:
            raise MLServiceError("ML service URL not configured")

        client = await self._get_client()
        start_time = time.time()

        try:
            response = await client.post(
                f"{self.base_url}/predict",
                json=request.model_dump(mode="json"),
            )
            latency_ms = int((time.time() - start_time) * 1000)

            if response.status_code == 408:
                raise MLTimeoutError()

            if response.status_code >= 500:
                raise MLServiceError(f"ML service error: {response.status_code}")

            if response.status_code != 200:
                raise MLInvalidResponseError(f"ML service returned {response.status_code}")

            data = response.json()
            ml_response = MLResponse(**data)
            return ml_response

        except httpx.TimeoutException:
            raise MLTimeoutError()
        except httpx.ConnectError:
            raise MLServiceError("Cannot connect to ML service")
        except Exception as e:
            if isinstance(e, (MLServiceError, MLTimeoutError, MLInvalidResponseError)):
                raise
            raise MLInvalidResponseError(f"Invalid ML response schema: {str(e)}")

    async def health_check(self) -> MLHealthResponse:
        if not self.base_url:
            return MLHealthResponse(status="not_configured")

        client = await self._get_client()
        start_time = time.time()

        try:
            response = await client.get(f"{self.base_url}/health")
            latency_ms = int((time.time() - start_time) * 1000)

            if response.status_code == 200:
                data = response.json()
                return MLHealthResponse(
                    status="healthy",
                    model_version=data.get("model_version"),
                    feature_schema_version=data.get("feature_schema_version"),
                    latency_ms=latency_ms,
                )
            else:
                return MLHealthResponse(
                    status="unhealthy",
                    latency_ms=latency_ms,
                )
        except httpx.TimeoutException:
            return MLHealthResponse(status="timeout")
        except httpx.ConnectError:
            return MLHealthResponse(status="unreachable")
        except Exception:
            return MLHealthResponse(status="error")


ml_client = MLClient()