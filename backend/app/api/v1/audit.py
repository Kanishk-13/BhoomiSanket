from datetime import datetime, timezone
from typing import Optional, List, Dict, Any
from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, desc
from pydantic import BaseModel
import uuid

from app.db.database import get_db
from app.db.models import AuditLog
from app.dependencies import require_admin, require_auditor

router = APIRouter()


class AuditLogResponse(BaseModel):
    id: int
    table_name: str
    record_id: str
    action: str
    changed_by: Optional[str] = None
    changed_at: datetime
    old_values: Optional[Dict[str, Any]] = None
    new_values: Optional[Dict[str, Any]] = None

    class Config:
        from_attributes = True


@router.get("", response_model=List[AuditLogResponse], include_in_schema=False)
@router.get("/", response_model=List[AuditLogResponse])
async def list_audit_logs(
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    table_name: Optional[str] = Query(None),
    action: Optional[str] = Query(None),
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Retrieve audit logs with role check (Auditor, Officer, Admin)."""
    query = select(AuditLog)

    if table_name:
        query = query.where(AuditLog.table_name == table_name)
    if action:
        query = query.where(AuditLog.action == action)

    offset = (page - 1) * page_size
    query = query.order_by(desc(AuditLog.changed_at)).offset(offset).limit(page_size)

    result = await db.execute(query)
    logs = result.scalars().all()

    return [
        AuditLogResponse(
            id=log.id,
            table_name=log.table_name,
            record_id=log.record_id,
            action=log.action,
            changed_by=str(log.changed_by) if log.changed_by else None,
            changed_at=log.changed_at,
            old_values=log.old_values,
            new_values=log.new_values,
        )
        for log in logs
    ]


@router.get("/{log_id}", response_model=AuditLogResponse)
async def get_audit_log(
    log_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_auditor),
):
    """Get specific audit log entry."""
    result = await db.execute(select(AuditLog).where(AuditLog.id == log_id))
    log = result.scalar_one_or_none()
    if not log:
        raise HTTPException(status_code=404, detail="Audit log entry not found")

    return AuditLogResponse(
        id=log.id,
        table_name=log.table_name,
        record_id=log.record_id,
        action=log.action,
        changed_by=str(log.changed_by) if log.changed_by else None,
        changed_at=log.changed_at,
        old_values=log.old_values,
        new_values=log.new_values,
    )