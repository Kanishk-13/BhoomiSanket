from fastapi import APIRouter
from pydantic import BaseModel

router = APIRouter()


class DashboardSummary(BaseModel):
    total_projects: int = 0
    high_risk_projects: int = 0
    critical_risk_projects: int = 0
    projects_needing_intervention: int = 0
    overall_progress_pct: float = 0.0
    risk_distribution: dict = {}


@router.get("/summary", response_model=DashboardSummary)
async def get_dashboard_summary():
    # Placeholder - will be implemented in M6
    return DashboardSummary()


@router.get("/risk-distribution")
async def get_risk_distribution():
    # Placeholder - will be implemented in M6
    return {"low": 0, "medium": 0, "high": 0, "critical": 0}


@router.get("/trends")
async def get_trends():
    # Placeholder - will be implemented in M6
    return {"message": "Trends endpoint - to be implemented in M6"}