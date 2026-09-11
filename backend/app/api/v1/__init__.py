from app.api.v1.auth import router as auth_router
from app.api.v1.projects import router as projects_router
from app.api.v1.dashboard import router as dashboard_router
from app.api.v1.predictions import router as predictions_router
from app.api.v1.analytics import router as analytics_router
from app.api.v1.gis import router as gis_router
from app.api.v1.alerts import router as alerts_router
from app.api.v1.notifications import router as notifications_router
from app.api.v1.admin import router as admin_router
from app.api.v1.audit import router as audit_router

__all__ = [
    "auth_router",
    "projects_router",
    "dashboard_router",
    "predictions_router",
    "analytics_router",
    "gis_router",
    "alerts_router",
    "notifications_router",
    "admin_router",
    "audit_router",
]