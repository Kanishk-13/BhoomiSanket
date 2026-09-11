from fastapi import APIRouter

router = APIRouter()


@router.get("/users")
async def list_users():
    # Placeholder - will be implemented in M6
    return {"message": "User management - to be implemented in M6", "users": []}


@router.post("/users")
async def create_user():
    # Placeholder - will be implemented in M6
    return {"message": "Create user - to be implemented in M6"}


@router.get("/thresholds")
async def get_risk_thresholds():
    # Placeholder - will be implemented in M6
    return {"message": "Risk thresholds - to be implemented in M6"}


@router.put("/thresholds")
async def update_risk_thresholds():
    # Placeholder - will be implemented in M6
    return {"message": "Update risk thresholds - to be implemented in M6"}


@router.get("/ml-status")
async def get_ml_status():
    # Placeholder - will be implemented in M6
    return {"message": "ML service status - to be implemented in M6"}


@router.post("/demo-data/reload")
async def reload_demo_data():
    # Placeholder - will be implemented in M6
    return {"message": "Reload demo data - to be implemented in M6"}


@router.get("/system-status")
async def get_system_status():
    # Placeholder - will be implemented in M6
    return {"message": "System status - to be implemented in M6"}