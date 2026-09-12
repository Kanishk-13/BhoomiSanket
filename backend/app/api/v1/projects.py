from datetime import date, datetime
from typing import Optional, List, Union, Any, Dict
from fastapi import APIRouter, Query, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func, or_, and_
from sqlalchemy.orm import selectinload
from pydantic import BaseModel, Field
from geoalchemy2.functions import ST_AsGeoJSON

from app.db.database import get_db
from app.db.models import Project, ProjectStage, ProjectDataSnapshot, RiskPrediction
from app.core.config import settings
from app.dependencies import require_analyst, require_auditor

router = APIRouter()


class ProjectStageResponse(BaseModel):
    id: int
    stage_name: str
    sequence_no: int
    planned_start: Optional[date] = None
    planned_end: Optional[date] = None
    actual_start: Optional[date] = None
    actual_end: Optional[date] = None
    status: str

    class Config:
        from_attributes = True


class ProjectSnapshotResponse(BaseModel):
    id: int
    snapshot_date: date
    days_in_current_stage: Optional[int] = None
    stage_overdue_days: Optional[int] = None
    pct_stages_completed: Optional[float] = None
    compensation_paid_pct: Optional[float] = None
    avg_compensation_pending_days: Optional[int] = None
    num_disputed_claims: int
    legal_dispute_flag: bool
    num_active_legal_cases: int
    has_court_stay: bool
    doc_complete_pct: Optional[float] = None
    approval_pending_days: Optional[int] = None
    num_approvals_pending: int
    sia_approved: bool
    env_clearance_obtained: bool
    rehab_progress_pct: Optional[float] = None
    stakeholder_response_days: Optional[int] = None
    notification_delay_days: Optional[int] = None
    possession_completion_pct: Optional[float] = None
    district_historical_delay_rate: Optional[float] = None
    created_at: datetime

    class Config:
        from_attributes = True


class RiskPredictionResponse(BaseModel):
    id: int
    model_version: Optional[str] = None
    is_mock: bool
    delay_probability: Optional[float] = None
    risk_category: Optional[str] = None
    stage_predictions: Optional[Union[Dict[str, Any], List[Any]]] = None
    explanations: Optional[Union[Dict[str, Any], List[Any]]] = None
    recommendations: Optional[Union[Dict[str, Any], List[Any]]] = None
    is_stale: bool
    stale_since: Optional[datetime] = None
    status: str
    requested_at: datetime
    responded_at: Optional[datetime] = None

    class Config:
        from_attributes = True


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
    data_source: str
    latitude: Optional[float] = None
    longitude: Optional[float] = None

    class Config:
        from_attributes = True


class ProjectDetail(BaseModel):
    id: int
    name: str
    project_type: str
    state: str
    district: str
    latitude: Optional[float] = None
    longitude: Optional[float] = None
    land_area_ha: Optional[float] = None
    affected_families: Optional[int] = None
    start_date: date
    target_end_date: date
    current_stage: str
    status: str
    data_source: str
    created_at: datetime
    updated_at: datetime
    stages: List[ProjectStageResponse] = []
    snapshots: List[ProjectSnapshotResponse] = []
    latest_prediction: Optional[RiskPredictionResponse] = None

    class Config:
        from_attributes = True


class ProjectListResponse(BaseModel):
    projects: List[ProjectSummary]
    total: int
    page: int
    page_size: int
    total_pages: int


def apply_project_filters(query, state, district, project_type, risk_category, status, search):
    """Apply filters to project query."""
    if state:
        query = query.where(Project.state.ilike(f"%{state}%"))
    if district:
        query = query.where(Project.district.ilike(f"%{district}%"))
    if project_type:
        query = query.where(Project.project_type.ilike(f"%{project_type}%"))
    if risk_category:
        query = query.where(Project.risk_category == risk_category)
    if status:
        query = query.where(Project.status.ilike(f"%{status}%"))
    if search:
        search_term = f"%{search}%"
        query = query.where(
            or_(
                Project.name.ilike(search_term),
                Project.state.ilike(search_term),
                Project.district.ilike(search_term),
            )
        )
    return query


@router.get("/", response_model=ProjectListResponse)
async def list_projects(
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    state: Optional[str] = None,
    district: Optional[str] = None,
    project_type: Optional[str] = None,
    risk_category: Optional[str] = None,
    status: Optional[str] = None,
    search: Optional[str] = None,
    sort_by: Optional[str] = Query(None, pattern="^(id|name|state|district|current_stage|status|delay_probability|created_at)$"),
    sort_order: str = Query("asc", pattern="^(asc|desc)$"),
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """List projects with filtering, pagination, and sorting."""
    # Build base query with latest prediction
    subquery = select(
        RiskPrediction.project_id,
        RiskPrediction.delay_probability,
        RiskPrediction.risk_category,
        func.row_number().over(
            partition_by=RiskPrediction.project_id,
            order_by=RiskPrediction.requested_at.desc()
        ).label("rn")
    ).subquery()
    
    latest_pred = select(subquery).where(subquery.c.rn == 1).subquery()
    
    query = select(
        Project,
        latest_pred.c.delay_probability,
        latest_pred.c.risk_category
    ).outerjoin(latest_pred, Project.id == latest_pred.c.project_id)
    
    # Apply filters
    query = apply_project_filters(query, state, district, project_type, risk_category, status, search)
    
    # Get total count
    count_query = select(func.count()).select_from(query.subquery())
    total = await db.scalar(count_query) or 0
    
    # Apply sorting
    if sort_by:
        sort_col = getattr(Project, sort_by, Project.id)
        if sort_order == "desc":
            query = query.order_by(sort_col.desc())
        else:
            query = query.order_by(sort_col.asc())
    else:
        query = query.order_by(Project.id.desc())
    
    # Apply pagination
    offset = (page - 1) * page_size
    query = query.offset(offset).limit(page_size)
    
    # Execute
    result = await db.execute(query)
    rows = result.all()
    
    projects = []
    for row in rows:
        project = row[0]
        delay_prob = row[1]
        risk_cat = row[2]
        
        projects.append(ProjectSummary(
            id=project.id,
            name=project.name,
            project_type=project.project_type,
            state=project.state,
            district=project.district,
            status=project.status,
            current_stage=project.current_stage,
            risk_category=risk_cat,
            delay_probability=delay_prob,
            data_source=project.data_source,
            latitude=float(project.latitude) if project.latitude else None,
            longitude=float(project.longitude) if project.longitude else None,
        ))
    
    total_pages = (total + page_size - 1) // page_size
    
    return ProjectListResponse(
        projects=projects,
        total=total,
        page=page,
        page_size=page_size,
        total_pages=total_pages
    )


@router.get("/{project_id}", response_model=ProjectDetail)
async def get_project(
    project_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get project detail with stages, snapshots, and latest prediction."""
    # Get project with related data
    result = await db.execute(
        select(Project)
        .options(
            selectinload(Project.stages),
            selectinload(Project.snapshots),
        )
        .where(Project.id == project_id)
    )
    project = result.scalar_one_or_none()
    
    if not project:
        from app.core.exceptions import NotFoundError
        raise NotFoundError("Project", project_id)
    
    # Get latest prediction
    pred_result = await db.execute(
        select(RiskPrediction)
        .where(RiskPrediction.project_id == project_id)
        .order_by(RiskPrediction.requested_at.desc())
        .limit(1)
    )
    latest_prediction = pred_result.scalar_one_or_none()
    
    # Sort stages by sequence_no
    stages = sorted(project.stages, key=lambda s: s.sequence_no)
    
    # Sort snapshots by date desc
    snapshots = sorted(project.snapshots, key=lambda s: s.snapshot_date, reverse=True)
    
    return ProjectDetail(
        id=project.id,
        name=project.name,
        project_type=project.project_type,
        state=project.state,
        district=project.district,
        latitude=float(project.latitude) if project.latitude else None,
        longitude=float(project.longitude) if project.longitude else None,
        land_area_ha=float(project.land_area_ha) if project.land_area_ha else None,
        affected_families=project.affected_families,
        start_date=project.start_date,
        target_end_date=project.target_end_date,
        current_stage=project.current_stage,
        status=project.status,
        data_source=project.data_source,
        created_at=project.created_at,
        updated_at=project.updated_at,
        stages=[ProjectStageResponse.model_validate(s) for s in stages],
        snapshots=[ProjectSnapshotResponse.model_validate(s) for s in snapshots],
        latest_prediction=RiskPredictionResponse.model_validate(latest_prediction) if latest_prediction else None,
    )


@router.get("/{project_id}/stages", response_model=List[ProjectStageResponse])
async def get_project_stages(
    project_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get all stages for a project."""
    result = await db.execute(
        select(ProjectStage)
        .where(ProjectStage.project_id == project_id)
        .order_by(ProjectStage.sequence_no)
    )
    stages = result.scalars().all()
    return [ProjectStageResponse.model_validate(s) for s in stages]


@router.get("/{project_id}/snapshots", response_model=List[ProjectSnapshotResponse])
async def get_project_snapshots(
    project_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get all data snapshots for a project."""
    result = await db.execute(
        select(ProjectDataSnapshot)
        .where(ProjectDataSnapshot.project_id == project_id)
        .order_by(ProjectDataSnapshot.snapshot_date.desc())
    )
    snapshots = result.scalars().all()
    return [ProjectSnapshotResponse.model_validate(s) for s in snapshots]


@router.get("/{project_id}/predictions", response_model=List[RiskPredictionResponse])
async def get_project_predictions(
    project_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get all predictions for a project."""
    result = await db.execute(
        select(RiskPrediction)
        .where(RiskPrediction.project_id == project_id)
        .order_by(RiskPrediction.requested_at.desc())
    )
    predictions = result.scalars().all()
    return [RiskPredictionResponse.model_validate(p) for p in predictions]


@router.get("/meta/filters")
async def get_filter_options(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get unique values for filter dropdowns."""
    states_result = await db.execute(select(Project.state).distinct())
    states = [s[0] for s in states_result.all()]
    
    districts_result = await db.execute(select(Project.district).distinct())
    districts = [d[0] for d in districts_result.all()]
    
    types_result = await db.execute(select(Project.project_type).distinct())
    project_types = [t[0] for t in types_result.all()]
    
    statuses_result = await db.execute(select(Project.status).distinct())
    statuses = [s[0] for s in statuses_result.all()]
    
    stages_result = await db.execute(select(Project.current_stage).distinct())
    stages = [s[0] for s in stages_result.all()]
    
    risk_categories = ["low", "medium", "high", "critical"]
    
    return {
        "states": sorted(states),
        "districts": sorted(districts),
        "project_types": sorted(project_types),
        "statuses": sorted(statuses),
        "stages": sorted(stages),
        "risk_categories": risk_categories,
    }