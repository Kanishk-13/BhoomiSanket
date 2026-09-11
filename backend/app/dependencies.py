from typing import Generator
from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.ext.asyncio import AsyncSession
from jose import jwt, JWTError
from pydantic import ValidationError

from app.db.database import get_db
from app.core.config import settings
from app.core.security import decode_token
from app.core.exceptions import UnauthorizedError, ForbiddenError


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/v1/auth/login")


async def get_current_user_id(token: str = Depends(oauth2_scheme)) -> str:
    try:
        payload = decode_token(token)
        if payload.get("type") != "access":
            raise UnauthorizedError("Invalid token type")
        user_id: str = payload.get("sub")
        if user_id is None:
            raise UnauthorizedError("Invalid token payload")
        return user_id
    except (JWTError, ValidationError, ValueError):
        raise UnauthorizedError("Could not validate credentials")


async def get_current_user(
    user_id: str = Depends(get_current_user_id),
    db: AsyncSession = Depends(get_db),
):
    # Placeholder - will be implemented in M4 with actual user lookup
    return {"id": user_id, "role": "OFFICER"}


def require_role(*allowed_roles: str):
    async def role_checker(user: dict = Depends(get_current_user)):
        if user.get("role") not in allowed_roles:
            raise ForbiddenError(f"Requires one of roles: {', '.join(allowed_roles)}")
        return user
    return role_checker


# Admin only dependency
require_admin = require_role("ADMIN")

# Officer and above
require_officer = require_role("ADMIN", "OFFICER")

# Analyst and above
require_analyst = require_role("ADMIN", "OFFICER", "ANALYST")

# Auditor (read-only)
require_auditor = require_role("ADMIN", "OFFICER", "ANALYST", "AUDITOR")