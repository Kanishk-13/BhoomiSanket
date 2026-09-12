from datetime import datetime, timedelta, timezone
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from pydantic import BaseModel, EmailStr
from typing import Optional

from app.db.database import get_db
from app.db.models import User, RefreshToken
from app.core.config import settings
from app.core.security import (
    verify_password, get_password_hash, 
    create_access_token, create_refresh_token, 
    decode_token, get_token_expiry
)
from app.core.exceptions import UnauthorizedError, ValidationError, ConflictError
from app.dependencies import oauth2_scheme, get_current_user_id

router = APIRouter()


class TokenResponse(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"
    expires_in: int


class RefreshTokenRequest(BaseModel):
    refresh_token: str


class UserResponse(BaseModel):
    id: str
    email: str
    display_name: str
    role: str
    is_active: bool


@router.post("/login", response_model=TokenResponse)
async def login(
    form_data: OAuth2PasswordRequestForm = Depends(),
    db: AsyncSession = Depends(get_db),
):
    """Authenticate user and return access and refresh tokens."""
    # Find user by email
    result = await db.execute(
        select(User).where(User.email == form_data.username)
    )
    user = result.scalar_one_or_none()
    
    if not user:
        raise UnauthorizedError("Incorrect email or password")
    
    if not user.is_active:
        raise UnauthorizedError("User account is inactive")
    
    if not verify_password(form_data.password, user.password_hash):
        raise UnauthorizedError("Incorrect email or password")
    
    # Create tokens
    access_token_expires = timedelta(minutes=settings.ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        data={"sub": str(user.id), "email": user.email, "role": user.role},
        expires_delta=access_token_expires
    )
    
    refresh_token_expires = timedelta(days=settings.REFRESH_TOKEN_EXPIRE_DAYS)
    refresh_token = create_refresh_token(
        data={"sub": str(user.id), "email": user.email, "role": user.role},
        expires_delta=refresh_token_expires
    )
    
    # Store refresh token hash in database
    refresh_token_hash = get_password_hash(refresh_token)
    refresh_token_payload = decode_token(refresh_token)
    expires_at = datetime.fromtimestamp(refresh_token_payload["exp"], tz=timezone.utc)
    db_refresh_token = RefreshToken(
        user_id=user.id,
        token_hash=refresh_token_hash,
        expires_at=expires_at
    )
    db.add(db_refresh_token)
    await db.commit()
    
    return TokenResponse(
        access_token=access_token,
        refresh_token=refresh_token,
        expires_in=settings.ACCESS_TOKEN_EXPIRE_MINUTES * 60
    )


@router.post("/refresh", response_model=TokenResponse)
async def refresh_token(
    request: RefreshTokenRequest,
    db: AsyncSession = Depends(get_db),
):
    """Refresh access token using refresh token."""
    try:
        payload = decode_token(request.refresh_token)
        if payload.get("type") != "refresh":
            raise UnauthorizedError("Invalid token type")
        
        user_id = payload.get("sub")
        if not user_id:
            raise UnauthorizedError("Invalid token payload")
        
        # Find the refresh token in database
        result = await db.execute(
            select(RefreshToken).where(RefreshToken.user_id == user_id)
        )
        db_tokens = result.scalars().all()
        
        # Verify refresh token hash
        valid_token = None
        token_expires_at = datetime.fromtimestamp(payload["exp"], tz=timezone.utc)
        for token in db_tokens:
            if verify_password(request.refresh_token, token.token_hash):
                if token.revoked or token.expires_at < token_expires_at:
                    raise UnauthorizedError("Refresh token expired or revoked")
                valid_token = token
                break
        
        if not valid_token:
            raise UnauthorizedError("Invalid refresh token")
        
        # Get user
        result = await db.execute(select(User).where(User.id == user_id))
        user = result.scalar_one_or_none()
        
        if not user or not user.is_active:
            raise UnauthorizedError("User not found or inactive")
        
        # Revoke old refresh token
        valid_token.revoked = True
        
        # Create new tokens
        access_token_expires = timedelta(minutes=settings.ACCESS_TOKEN_EXPIRE_MINUTES)
        access_token = create_access_token(
            data={"sub": str(user.id), "email": user.email, "role": user.role},
            expires_delta=access_token_expires
        )
        
        refresh_token_expires = timedelta(days=settings.REFRESH_TOKEN_EXPIRE_DAYS)
        new_refresh_token = create_refresh_token(
            data={"sub": str(user.id), "email": user.email, "role": user.role},
            expires_delta=refresh_token_expires
        )
        
        # Store new refresh token
        new_refresh_token_hash = get_password_hash(new_refresh_token)
        new_refresh_payload = decode_token(new_refresh_token)
        new_expires_at = datetime.fromtimestamp(new_refresh_payload["exp"], tz=timezone.utc)
        db_new_refresh = RefreshToken(
            user_id=user.id,
            token_hash=new_refresh_token_hash,
            expires_at=new_expires_at
        )
        db.add(db_new_refresh)
        await db.commit()
        
        return TokenResponse(
            access_token=access_token,
            refresh_token=new_refresh_token,
            expires_in=settings.ACCESS_TOKEN_EXPIRE_MINUTES * 60
        )
        
    except ValueError:
        raise UnauthorizedError("Invalid refresh token")


@router.get("/me", response_model=UserResponse)
async def get_current_user(
    user_id: str = Depends(get_current_user_id),
    db: AsyncSession = Depends(get_db),
):
    """Get current authenticated user details."""
    result = await db.execute(select(User).where(User.id == user_id))
    user = result.scalar_one_or_none()
    
    if not user:
        raise UnauthorizedError("User not found")
    
    return UserResponse(
        id=str(user.id),
        email=user.email,
        display_name=user.display_name,
        role=user.role,
        is_active=user.is_active
    )


@router.post("/logout")
async def logout(
    request: RefreshTokenRequest,
    db: AsyncSession = Depends(get_db),
):
    """Logout by revoking refresh token."""
    try:
        payload = decode_token(request.refresh_token)
        if payload.get("type") != "refresh":
            raise UnauthorizedError("Invalid token type")
        
        user_id = payload.get("sub")
        if not user_id:
            raise UnauthorizedError("Invalid token payload")
        
        # Revoke the refresh token
        result = await db.execute(
            select(RefreshToken).where(
                RefreshToken.user_id == user_id,
                RefreshToken.revoked == False
            )
        )
        db_tokens = result.scalars().all()
        
        for token in db_tokens:
            if verify_password(request.refresh_token, token.token_hash):
                token.revoked = True
                break
        
        await db.commit()
        return {"message": "Successfully logged out"}
        
    except ValueError:
        raise UnauthorizedError("Invalid refresh token")