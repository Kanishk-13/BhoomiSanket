from datetime import datetime, timezone
from typing import Optional, List
from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, desc, func
from pydantic import BaseModel
import uuid

from app.db.database import get_db
from app.db.models import Notification
from app.dependencies import get_current_user

router = APIRouter()


class NotificationResponse(BaseModel):
    id: int
    user_id: str
    type: str
    title: str
    message: str
    related_resource_type: Optional[str] = None
    related_resource_id: Optional[str] = None
    is_read: bool
    created_at: datetime
    read_at: Optional[datetime] = None

    class Config:
        from_attributes = True


class UnreadCountResponse(BaseModel):
    unread_count: int


@router.get("/", response_model=List[NotificationResponse])
async def list_notifications(
    limit: int = Query(50, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """List notifications for the currently logged-in user."""
    user_uuid = uuid.UUID(current_user["id"])
    result = await db.execute(
        select(Notification)
        .where(Notification.user_id == user_uuid)
        .order_by(desc(Notification.created_at))
        .limit(limit)
    )
    notifications = result.scalars().all()
    return [
        NotificationResponse(
            id=n.id,
            user_id=str(n.user_id),
            type=n.type,
            title=n.title,
            message=n.message,
            related_resource_type=n.related_resource_type,
            related_resource_id=n.related_resource_id,
            is_read=n.is_read,
            created_at=n.created_at,
            read_at=n.read_at,
        )
        for n in notifications
    ]


@router.get("/unread-count", response_model=UnreadCountResponse)
async def get_unread_count(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Get count of unread notifications for current user."""
    user_uuid = uuid.UUID(current_user["id"])
    count = await db.scalar(
        select(func.count(Notification.id))
        .where(Notification.user_id == user_uuid)
        .where(Notification.is_read == False)
    )
    return UnreadCountResponse(unread_count=count or 0)


@router.post("/{notification_id}/read", response_model=NotificationResponse)
async def mark_notification_read(
    notification_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Mark a notification as read."""
    user_uuid = uuid.UUID(current_user["id"])
    result = await db.execute(
        select(Notification)
        .where(Notification.id == notification_id)
        .where(Notification.user_id == user_uuid)
    )
    notif = result.scalar_one_or_none()
    if not notif:
        raise HTTPException(status_code=404, detail="Notification not found")

    notif.is_read = True
    notif.read_at = datetime.now(timezone.utc)
    await db.flush()

    return NotificationResponse(
        id=notif.id,
        user_id=str(notif.user_id),
        type=notif.type,
        title=notif.title,
        message=notif.message,
        related_resource_type=notif.related_resource_type,
        related_resource_id=notif.related_resource_id,
        is_read=notif.is_read,
        created_at=notif.created_at,
        read_at=notif.read_at,
    )


@router.post("/read-all")
async def mark_all_read(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Mark all notifications as read for current user."""
    user_uuid = uuid.UUID(current_user["id"])
    result = await db.execute(
        select(Notification)
        .where(Notification.user_id == user_uuid)
        .where(Notification.is_read == False)
    )
    unread_notifs = result.scalars().all()
    now = datetime.now(timezone.utc)
    for n in unread_notifs:
        n.is_read = True
        n.read_at = now

    await db.flush()
    return {"message": f"Marked {len(unread_notifs)} notifications as read", "count": len(unread_notifs)}