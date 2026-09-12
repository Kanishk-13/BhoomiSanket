from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, desc
from pydantic import BaseModel
from typing import Optional, List
from datetime import datetime

from app.db.database import get_db
from app.db.models import RiskPrediction, ProjectDataSnapshot
from app.services.prediction_service import prediction_service
from app.dependencies import require_analyst
from app.core.config import settings

router = APIRouter()


class PredictionRequest(BaseModel):
    project_id: Optional[int] = None
    force_refresh: bool = False


class StagePredictionResponse(BaseModel):
    stage_name: str
    sequence_no: int
    delay_probability: float
    risk_category: str
    expected_duration_days: Optional[int] = None

    class Config:
        from_attributes = True


class ExplanationResponse(BaseModel):
    feature: str
    impact: str
    importance: float
    description: str

    class Config:
        from_attributes = True


class RecommendationResponse(BaseModel):
    action: str
    priority: str
    description: str
    estimated_impact: Optional[str] = None

    class Config:
        from_attributes = True


class PredictionResponse(BaseModel):
    project_id: int
    prediction: int = 0
    probability: Optional[float] = None
    threshold: float = 0.375
    model_name: str = "RandomForestClassifier"
    model_version: Optional[str] = None
    delay_probability: Optional[float] = None
    risk_category: Optional[str] = None
    risk_score: Optional[float] = None
    stage_predictions: List[StagePredictionResponse] = []
    explanations: List[ExplanationResponse] = []
    recommendations: List[RecommendationResponse] = []
    prediction_timestamp: Optional[datetime] = None
    is_mock: bool = False
    is_stale: bool = False
    status: str = "success"


class PredictionHistoryResponse(BaseModel):
    id: int
    model_version: Optional[str] = None
    delay_probability: Optional[float] = None
    risk_category: Optional[str] = None
    risk_score: Optional[float] = None
    is_mock: bool
    is_stale: bool
    stale_since: Optional[datetime] = None
    status: str
    requested_at: datetime
    responded_at: Optional[datetime] = None

    class Config:
        from_attributes = True


class MLHealthResponse(BaseModel):
    status: str
    model_version: Optional[str] = None
    feature_schema_version: Optional[str] = None
    latency_ms: Optional[int] = None
    model_file_exists: Optional[bool] = None
    classifier: Optional[str] = None
    is_random_forest: Optional[bool] = None
    n_estimators: Optional[int] = None
    has_200_trees: Optional[bool] = None
    input_features_count: Optional[int] = None
    transformed_features_count: Optional[int] = None
    decision_threshold: Optional[float] = None


@router.post("/{project_id}", response_model=PredictionResponse)
async def get_prediction(
    project_id: int,
    request: Optional[PredictionRequest] = None,
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_analyst),
):
    """Get or generate prediction for a project."""
    try:
        prediction = await prediction_service.predict_with_fallback(db, project_id)
        if not prediction:
            raise HTTPException(status_code=404, detail="Prediction could not be generated")
        
        prob = float(prediction.delay_probability) if prediction.delay_probability is not None else None
        thresh = settings.ML_DECISION_THRESHOLD
        pred_class = 1 if (prob is not None and prob >= thresh) else 0

        return PredictionResponse(
            project_id=prediction.project_id,
            prediction=pred_class,
            probability=prob,
            threshold=thresh,
            model_name="RandomForestClassifier",
            model_version=prediction.model_version,
            delay_probability=prob,
            risk_category=prediction.risk_category,
            risk_score=prob,
            stage_predictions=[
                StagePredictionResponse(**sp) for sp in (prediction.stage_predictions or [])
            ],
            explanations=[
                ExplanationResponse(**e) for e in (prediction.explanations or [])
            ],
            recommendations=[
                RecommendationResponse(**r) for r in (prediction.recommendations or [])
            ],
            prediction_timestamp=prediction.responded_at or prediction.requested_at,
            is_mock=prediction.is_mock,
            is_stale=prediction.is_stale,
            status=prediction.status,
        )
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Prediction failed: {str(e)}")


@router.get("/{project_id}/history", response_model=List[PredictionHistoryResponse])
async def get_prediction_history(
    project_id: int,
    limit: int = Query(20, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_analyst),
):
    """Get prediction history for a project."""
    result = await db.execute(
        select(RiskPrediction)
        .where(RiskPrediction.project_id == project_id)
        .order_by(desc(RiskPrediction.requested_at))
        .limit(limit)
    )
    predictions = result.scalars().all()
    return [PredictionHistoryResponse.model_validate(p) for p in predictions]


@router.get("/health", response_model=MLHealthResponse)
async def ml_health(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(require_analyst),
):
    """Check ML service health."""
    return prediction_service.get_health()