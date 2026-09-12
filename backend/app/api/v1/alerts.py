from datetime import datetime, timezone
from typing import Optional, List
from fastapi import APIRouter, Depends, Query, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, desc, func
from pydantic import BaseModel
import uuid

from app.db.database import get_db
from app.db.models import Alert, MitigationLog, Project, User
from app.dependencies import require_auditor, require_officer, get_current_user

router = APIRouter()


class AlertResponse(BaseModel):
    id: int
    project_id: int
    project_name: Optional[str] = None
    prediction_id: Optional[int] = None
    alert_type: str
    risk_category: Optional[str] = None
    probability_at_trigger: Optional[float] = None
    triggered_at: datetime
    acknowledged_by: Optional[str] = None
    acknowledged_at: Optional[datetime] = None
    is_acknowledged: bool = False

    class Config:
        from_attributes = True


class MitigationRequest(BaseModel):
    action_taken: str
    notes: Optional[str] = None


class MitigationResponse(BaseModel):
    id: int
    project_id: int
    user_id: str
    action_taken: str
    notes: Optional[str] = None
    logged_at: datetime

    class Config:
        from_attributes = True


@router.get("", response_model=List[AlertResponse], include_in_schema=False)
@router.get("/", response_model=List[AlertResponse])
async def list_alerts(
    risk_category: Optional[str] = None,
    is_acknowledged: Optional[bool] = None,
    project_id: Optional[int] = None,
    limit: int = Query(50, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """List alerts with optional filtering by severity, status, and project."""
    query = select(Alert, Project.name.label("project_name")).outerjoin(Project, Alert.project_id == Project.id)

    if risk_category:
        query = query.where(Alert.risk_category == risk_category)
    if is_acknowledged is True:
        query = query.where(Alert.acknowledged_at != None)
    elif is_acknowledged is False:
        query = query.where(Alert.acknowledged_at == None)
    if project_id:
        query = query.where(Alert.project_id == project_id)

    query = query.order_by(desc(Alert.triggered_at)).limit(limit)
    result = await db.execute(query)
    rows = result.all()

    alerts_list = []
    for row in rows:
        alert = row[0]
        p_name = row[1]
        alerts_list.append(AlertResponse(
            id=alert.id,
            project_id=alert.project_id,
            project_name=p_name,
            prediction_id=alert.prediction_id,
            alert_type=alert.alert_type,
            risk_category=alert.risk_category,
            probability_at_trigger=float(alert.probability_at_trigger) if alert.probability_at_trigger else None,
            triggered_at=alert.triggered_at,
            acknowledged_by=str(alert.acknowledged_by) if alert.acknowledged_by else None,
            acknowledged_at=alert.acknowledged_at,
            is_acknowledged=alert.acknowledged_at is not None,
        ))

    return alerts_list


@router.get("/{alert_id}", response_model=AlertResponse)
async def get_alert(
    alert_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get alert detail."""
    query = select(Alert, Project.name.label("project_name")).outerjoin(Project, Alert.project_id == Project.id).where(Alert.id == alert_id)
    result = await db.execute(query)
    row = result.first()

    if not row:
        raise HTTPException(status_code=404, detail=f"Alert {alert_id} not found")

    alert, p_name = row[0], row[1]
    return AlertResponse(
        id=alert.id,
        project_id=alert.project_id,
        project_name=p_name,
        prediction_id=alert.prediction_id,
        alert_type=alert.alert_type,
        risk_category=alert.risk_category,
        probability_at_trigger=float(alert.probability_at_trigger) if alert.probability_at_trigger else None,
        triggered_at=alert.triggered_at,
        acknowledged_by=str(alert.acknowledged_by) if alert.acknowledged_by else None,
        acknowledged_at=alert.acknowledged_at,
        is_acknowledged=alert.acknowledged_at is not None,
    )


@router.post("/{alert_id}/acknowledge", response_model=AlertResponse)
async def acknowledge_alert(
    alert_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_officer),
):
    """Acknowledge an active alert (Officer or Admin)."""
    result = await db.execute(select(Alert).where(Alert.id == alert_id))
    alert = result.scalar_one_or_none()

    if not alert:
        raise HTTPException(status_code=404, detail=f"Alert {alert_id} not found")

    alert.acknowledged_by = uuid.UUID(current_user["id"])
    alert.acknowledged_at = datetime.now(timezone.utc)
    await db.flush()

    return AlertResponse(
        id=alert.id,
        project_id=alert.project_id,
        prediction_id=alert.prediction_id,
        alert_type=alert.alert_type,
        risk_category=alert.risk_category,
        probability_at_trigger=float(alert.probability_at_trigger) if alert.probability_at_trigger else None,
        triggered_at=alert.triggered_at,
        acknowledged_by=str(alert.acknowledged_by),
        acknowledged_at=alert.acknowledged_at,
        is_acknowledged=True,
    )


@router.post("/{alert_id}/action", response_model=MitigationResponse)
async def record_alert_action(
    alert_id: int,
    request: MitigationRequest,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_officer),
):
    """Record a mitigation action for the project associated with this alert."""
    result = await db.execute(select(Alert).where(Alert.id == alert_id))
    alert = result.scalar_one_or_none()

    if not alert:
        raise HTTPException(status_code=404, detail=f"Alert {alert_id} not found")

    # Acknowledge if not already
    if not alert.acknowledged_at:
        alert.acknowledged_by = uuid.UUID(current_user["id"])
        alert.acknowledged_at = datetime.now(timezone.utc)

    mitigation = MitigationLog(
        project_id=alert.project_id,
        user_id=uuid.UUID(current_user["id"]),
        action_taken=request.action_taken,
        notes=request.notes,
        logged_at=datetime.now(timezone.utc),
    )
    db.add(mitigation)
    await db.flush()

    return MitigationResponse(
        id=mitigation.id,
        project_id=mitigation.project_id,
        user_id=str(mitigation.user_id),
        action_taken=mitigation.action_taken,
        notes=mitigation.notes,
        logged_at=mitigation.logged_at,
    )


@router.get("/project/{project_id}/mitigations", response_model=List[MitigationResponse])
async def list_project_mitigations(
    project_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get mitigation action history for a specific project."""
    result = await db.execute(
        select(MitigationLog)
        .where(MitigationLog.project_id == project_id)
        .order_by(desc(MitigationLog.logged_at))
    )
    logs = result.scalars().all()
    return [
        MitigationResponse(
            id=log.id,
            project_id=log.project_id,
            user_id=str(log.user_id),
            action_taken=log.action_taken,
            notes=log.notes,
            logged_at=log.logged_at,
        )
        for log in logs
    ]