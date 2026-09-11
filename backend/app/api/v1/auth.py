from fastapi import APIRouter

router = APIRouter()

# Placeholder for auth routes - will be implemented in M4
@router.post("/login")
async def login():
    return {"message": "Login endpoint - to be implemented in M4"}

@router.post("/refresh")
async def refresh_token():
    return {"message": "Refresh token endpoint - to be implemented in M4"}

@router.get("/me")
async def get_current_user():
    return {"message": "Current user endpoint - to be implemented in M4"}