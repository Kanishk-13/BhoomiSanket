from datetime import datetime, timezone
from typing import Optional, List, Dict, Any
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from pydantic import BaseModel
import uuid
import bcrypt

from app.db.database import get_db
from app.db.models import User, SystemConfig
from app.dependencies import require_admin
from app.services.prediction_service import prediction_service

router = APIRouter()


class UserCreateRequest(BaseModel):
    email: str
    display_name: str
    role: str
    password: str


class UserResponse(BaseModel):
    id: str
    email: str
    display_name: str
    role: str
    is_active: bool
    created_at: datetime

    class Config:
        from_attributes = True


class ThresholdUpdateRequest(BaseModel):
    risk_threshold_low: float
    risk_threshold_medium: float
    risk_threshold_high: float
    risk_threshold_critical: float


@router.get("/users", response_model=List[UserResponse])
async def list_users(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_admin),
):
    """List all registered system users (Admin only)."""
    result = await db.execute(select(User).order_by(User.created_at))
    users = result.scalars().all()
    return [
        UserResponse(
            id=str(u.id),
            email=u.email,
            display_name=u.display_name,
            role=u.role,
            is_active=u.is_active,
            created_at=u.created_at,
        )
        for u in users
    ]


@router.post("/users", response_model=UserResponse)
async def create_user(
    request: UserCreateRequest,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_admin),
):
    """Create a new user with specified role (Admin only)."""
    existing = await db.execute(select(User).where(User.email == request.email))
    if existing.scalar_one_or_none():
        raise HTTPException(status_code=400, detail="User with this email already exists")

    salt = bcrypt.gensalt(rounds=12)
    pw_hash = bcrypt.hashpw(request.password.encode('utf-8'), salt).decode('utf-8')

    new_user = User(
        email=request.email,
        display_name=request.display_name,
        role=request.role.upper(),
        password_hash=pw_hash,
        is_active=True,
    )
    db.add(new_user)
    await db.flush()

    return UserResponse(
        id=str(new_user.id),
        email=new_user.email,
        display_name=new_user.display_name,
        role=new_user.role,
        is_active=new_user.is_active,
        created_at=new_user.created_at,
    )


@router.get("/thresholds")
async def get_risk_thresholds(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_admin),
):
    """Get active risk threshold settings (Admin only)."""
    result = await db.execute(select(SystemConfig).where(SystemConfig.key.like("risk_threshold_%")))
    configs = result.scalars().all()
    thresh_map = {c.key: float(c.value) for c in configs}
    return {
        "risk_threshold_low": thresh_map.get("risk_threshold_low", 0.3),
        "risk_threshold_medium": thresh_map.get("risk_threshold_medium", 0.5),
        "risk_threshold_high": thresh_map.get("risk_threshold_high", 0.7),
        "risk_threshold_critical": thresh_map.get("risk_threshold_critical", 0.9),
        "ml_decision_threshold": 0.375,
    }


@router.put("/thresholds")
async def update_risk_thresholds(
    request: ThresholdUpdateRequest,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_admin),
):
    """Update risk threshold settings in database (Admin only)."""
    updates = {
        "risk_threshold_low": str(request.risk_threshold_low),
        "risk_threshold_medium": str(request.risk_threshold_medium),
        "risk_threshold_high": str(request.risk_threshold_high),
        "risk_threshold_critical": str(request.risk_threshold_critical),
    }

    user_uuid = uuid.UUID(current_user["id"])
    now = datetime.now(timezone.utc)

    for key, val in updates.items():
        res = await db.execute(select(SystemConfig).where(SystemConfig.key == key))
        cfg = res.scalar_one_or_none()
        if cfg:
            cfg.value = val
            cfg.updated_at = now
            cfg.updated_by = user_uuid
        else:
            db.add(SystemConfig(key=key, value=val, updated_by=user_uuid, updated_at=now))

    await db.flush()
    return {"message": "Risk thresholds successfully updated", "thresholds": updates}


@router.get("/ml-status")
async def get_ml_status(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_admin),
):
    """Get ML service & artifact operational status."""
    return prediction_service.get_health()


@router.get("/system-status")
async def get_system_status(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_admin),
):
    """Get overall system health and components."""
    ml_health = prediction_service.get_health()
    return {
        "status": "operational",
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "database": "connected",
        "ml_engine": ml_health.status,
        "model_version": ml_health.model_version,
    }