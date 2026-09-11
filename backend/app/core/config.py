from pydantic_settings import BaseSettings, SettingsConfigDict
from typing import List
from functools import lru_cache


class Settings(BaseSettings):
    APP_ENV: str = "development"
    APP_NAME: str = "BhoomiSanket"
    APP_VERSION: str = "1.0.0"

    # Database
    DATABASE_URL: str

    # Auth
    JWT_SECRET_KEY: str
    JWT_ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 15
    REFRESH_TOKEN_EXPIRE_DAYS: int = 7
    BCRYPT_ROUNDS: int = 12

    # ML Service
    ML_SERVICE_URL: str = ""
    ML_TIMEOUT_SECONDS: int = 5
    ML_FEATURE_SCHEMA_VERSION: str = "1.0"

    # Email
    SMTP_HOST: str = ""
    SMTP_PORT: int = 587
    SMTP_USER: str = ""
    SMTP_PASSWORD: str = ""
    ALERT_EMAIL_FROM: str = ""
    EMAIL_USE_TLS: bool = True

    # CORS
    ALLOWED_ORIGINS: str = "http://localhost:3000,http://localhost:8000"

    # Risk Thresholds (configurable)
    RISK_THRESHOLD_LOW: float = 0.3
    RISK_THRESHOLD_MEDIUM: float = 0.5
    RISK_THRESHOLD_HIGH: float = 0.7
    RISK_THRESHOLD_CRITICAL: float = 0.9

    # Pagination
    DEFAULT_PAGE_SIZE: int = 20
    MAX_PAGE_SIZE: int = 100

    @property
    def allowed_origins_list(self) -> List[str]:
        return [origin.strip() for origin in self.ALLOWED_ORIGINS.split(",") if origin.strip()]

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore",
        case_sensitive=True,
    )


@lru_cache
def get_settings() -> Settings:
    return Settings()


settings = get_settings()