from fastapi import APIRouter

router = APIRouter()


@router.get("/")
async def list_notifications():
    # Placeholder - will be implemented in M6
    return {"message": "Notifications list - to be implemented in M6", "notifications": []}


@router.post("/{notification_id}/read")
async def mark_notification_read(notification_id: int):
    # Placeholder - will be implemented in M6
    return {"message": f"Mark notification {notification_id} as read - to be implemented in M6"}


@router.post("/read-all")
async def mark_all_read():
    # Placeholder - will be implemented in M6
    return {"message": "Mark all notifications as read - to be implemented in M6"}