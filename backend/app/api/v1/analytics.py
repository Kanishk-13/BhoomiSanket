from fastapi import APIRouter

router = APIRouter()


@router.get("/state")
async def get_state_analytics():
    # Placeholder - will be implemented in M6
    return {"message": "State analytics - to be implemented in M6"}


@router.get("/district")
async def get_district_analytics():
    # Placeholder - will be implemented in M6
    return {"message": "District analytics - to be implemented in M6"}


@router.get("/comparison")
async def get_comparison_analytics():
    # Placeholder - will be implemented in M6
    return {"message": "Comparison analytics - to be implemented in M6"}