from fastapi import HTTPException, status
from typing import Any, Optional


class AppException(HTTPException):
    def __init__(
        self,
        status_code: int,
        detail: str,
        error_code: str = "APP_ERROR",
        headers: Optional[dict] = None,
    ):
        super().__init__(status_code=status_code, detail=detail, headers=headers)
        self.error_code = error_code


class NotFoundError(AppException):
    def __init__(self, resource: str = "Resource", resource_id: Any = None):
        detail = f"{resource} not found"
        if resource_id:
            detail += f" (id: {resource_id})"
        super().__init__(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=detail,
            error_code="NOT_FOUND",
        )


class UnauthorizedError(AppException):
    def __init__(self, detail: str = "Not authenticated"):
        super().__init__(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=detail,
            error_code="UNAUTHORIZED",
            headers={"WWW-Authenticate": "Bearer"},
        )


class ForbiddenError(AppException):
    def __init__(self, detail: str = "Not authorized to perform this action"):
        super().__init__(
            status_code=status.HTTP_403_FORBIDDEN,
            detail=detail,
            error_code="FORBIDDEN",
        )


class ValidationError(AppException):
    def __init__(self, detail: str = "Validation failed"):
        super().__init__(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=detail,
            error_code="VALIDATION_ERROR",
        )


class ConflictError(AppException):
    def __init__(self, detail: str = "Resource conflict"):
        super().__init__(
            status_code=status.HTTP_409_CONFLICT,
            detail=detail,
            error_code="CONFLICT",
        )


class MLServiceError(AppException):
    def __init__(self, detail: str = "ML service unavailable"):
        super().__init__(
            status_code=status.HTTP_503_SERVICE_UNAVAILABLE,
            detail=detail,
            error_code="ML_SERVICE_ERROR",
        )


class MLTimeoutError(AppException):
    def __init__(self, detail: str = "ML service timeout"):
        super().__init__(
            status_code=status.HTTP_504_GATEWAY_TIMEOUT,
            detail=detail,
            error_code="ML_TIMEOUT",
        )


class MLInvalidResponseError(AppException):
    def __init__(self, detail: str = "Invalid ML service response"):
        super().__init__(
            status_code=status.HTTP_502_BAD_GATEWAY,
            detail=detail,
            error_code="ML_INVALID_RESPONSE",
        )


class DatabaseError(AppException):
    def __init__(self, detail: str = "Database error"):
        super().__init__(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=detail,
            error_code="DATABASE_ERROR",
        )