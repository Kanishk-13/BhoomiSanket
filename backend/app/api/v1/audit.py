from fastapi import APIRouter, Query

router = APIRouter()


@router.get("/")
async def list_audit_logs(
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    table_name: str = Query(None),
    action: str = Query(None),
    user_id: str = Query(None),
):
    # Placeholder - will be implemented in M6
    return {"message": "Audit logs - to be implemented in M6", "logs": []}


@router.get("/{log_id}")
async def get_audit_log(log_id: int):
    # Placeholder - will be implemented in M6
    return {"message": f"Audit log {log_id} - to be implemented in M6"}