import logging
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from contextlib import asynccontextmanager
from app.core.config import settings
from app.core.exceptions import AppException
from app.api.router import api_router
from app.db.database import init_db, close_db
from app.ml.client import ml_client
from app.ml.model_loader import model_loader

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
)
logger = logging.getLogger(__name__)


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    await init_db()
    model_loader.load_model()
    yield
    # Shutdown
    await ml_client.close()
    await close_db()


app = FastAPI(
    title="BhoomiSanket API",
    description="API for BhoomiSanket Land Acquisition Analytics (SIH26017)",
    version="1.0.0",
    lifespan=lifespan,
    docs_url="/docs" if settings.APP_ENV != "production" else None,
    redoc_url="/redoc" if settings.APP_ENV != "production" else None,
)


# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.allowed_origins_list,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Global exception handler
@app.exception_handler(AppException)
async def app_exception_handler(request: Request, exc: AppException):
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "error": {
                "code": exc.error_code,
                "message": exc.detail,
            }
        },
    )


@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    if settings.APP_ENV == "development":
        import traceback
        traceback.print_exc()
    return JSONResponse(
        status_code=500,
        content={"error": {"code": "INTERNAL_ERROR", "message": "Internal server error"}},
    )


# Include API router
app.include_router(api_router)


@app.get("/api/v1/health/")
async def health_check():
    return {"status": "ok", "version": "1.0.0", "service": "bhoomisanket-api"}


@app.get("/")
async def root():
    return {
        "name": "BhoomiSanket API",
        "version": "1.0.0",
        "description": "Predictive Analytics for Early Detection of Land Acquisition Delays (SIH26017)",
        "docs": "/docs",
    }