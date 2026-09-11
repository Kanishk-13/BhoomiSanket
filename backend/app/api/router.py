from fastapi import APIRouter
from app.api.v1 import (
    auth,
    projects,
    dashboard,
    predictions,
    analytics,
    gis,
    alerts,
    notifications,
    admin,
    audit,
)

api_router = APIRouter(prefix="/api/v1")

api_router.include_router(auth.router, prefix="/auth", tags=["auth"])
api_router.include_router(projects.router, prefix="/projects", tags=["projects"])
api_router.include_router(dashboard.router, prefix="/dashboard", tags=["dashboard"])
api_router.include_router(predictions.router, prefix="/predictions", tags=["predictions"])
api_router.include_router(analytics.router, prefix="/analytics", tags=["analytics"])
api_router.include_router(gis.router, prefix="/gis", tags=["gis"])
api_router.include_router(alerts.router, prefix="/alerts", tags=["alerts"])
api_router.include_router(notifications.router, prefix="/notifications", tags=["notifications"])
api_router.include_router(admin.router, prefix="/admin", tags=["admin"])
api_router.include_router(audit.router, prefix="/audit", tags=["audit"])