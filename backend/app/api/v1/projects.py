from fastapi import APIRouter, Query
from typing import Optional
from pydantic import BaseModel
from app.core.config import settings

router = APIRouter()


class ProjectSummary(BaseModel):
    id: int
    name: str
    project_type: str
    state: str
    district: str
    status: str
    current_stage: str
    risk_category: Optional[str] = None
    delay_probability: Optional[float] = None


class ProjectListResponse(BaseModel):
    projects: list[ProjectSummary]
    total: int
    page: int
    page_size: int


@router.get("/", response_model=ProjectListResponse)
async def list_projects(
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    state: Optional[str] = None,
    district: Optional[str] = None,
    project_type: Optional[str] = None,
    risk_category: Optional[str] = None,
    status: Optional[str] = None,
):
    # Placeholder - will be implemented in M4
    return ProjectListResponse(
        projects=[],
        total=0,
        page=page,
        page_size=min(page_size, settings.MAX_PAGE_SIZE),
    )


@router.get("/{project_id}")
async def get_project(project_id: int):
    # Placeholder - will be implemented in M4
    return {"message": f"Project {project_id} detail - to be implemented in M4"}


@router.get("/{project_id}/stages")
async def get_project_stages(project_id: int):
    return {"message": f"Project {project_id} stages - to be implemented in M4"}


@router.get("/{project_id}/snapshots")
async def get_project_snapshots(project_id: int):
    return {"message": f"Project {project_id} snapshots - to be implemented in M4"}