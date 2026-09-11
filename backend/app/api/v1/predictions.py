from fastapi import APIRouter
from pydantic import BaseModel
from typing import Optional
from datetime import datetime

router = APIRouter()


class PredictionRequest(BaseModel):
    project_id: int
    force_refresh: bool = False


class PredictionResponse(BaseModel):
    project_id: int
    model_version: str
    delay_probability: float
    risk_category: str
    risk_score: float
    stage_predictions: list = []
    explanations: list = []
    recommendations: list = []
    prediction_timestamp: datetime
    is_mock: bool = False
    is_stale: bool = False


@router.post("/{project_id}", response_model=PredictionResponse)
async def get_prediction(project_id: int, request: PredictionRequest):
    # Placeholder - will be implemented in M5
    return {"message": f"Prediction for project {project_id} - to be implemented in M5"}


@router.get("/{project_id}/history")
async def get_prediction_history(project_id: int):
    # Placeholder - will be implemented in M5
    return {"message": f"Prediction history for project {project_id} - to be implemented in M5"}


@router.get("/health")
async def ml_health():
    # Placeholder - will be implemented in M5
    return {"status": "not_configured", "message": "ML health endpoint - to be implemented in M5"}