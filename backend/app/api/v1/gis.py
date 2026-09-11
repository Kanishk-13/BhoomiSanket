from fastapi import APIRouter

router = APIRouter()


@router.get("/projects")
async def get_projects_geodata():
    # Placeholder - will be implemented in M6
    return {"message": "Project geodata - to be implemented in M6", "features": []}


@router.get("/districts")
async def get_district_boundaries():
    # Placeholder - will be implemented in M6
    return {"message": "District boundaries - to be implemented in M6", "features": []}


@router.get("/states")
async def get_state_boundaries():
    # Placeholder - will be implemented in M6
    return {"message": "State boundaries - to be implemented in M6", "features": []}