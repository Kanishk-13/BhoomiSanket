from pydantic import BaseModel, Field, ConfigDict
from typing import Dict, Any, List, Optional
from datetime import datetime
from enum import Enum


class RiskCategory(str, Enum):
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


class ExplanationItem(BaseModel):
    model_config = ConfigDict(extra="forbid")

    feature: str
    impact: str
    importance: float = Field(ge=0, le=1)
    description: str


class RecommendationItem(BaseModel):
    model_config = ConfigDict(extra="forbid")

    action: str
    priority: str
    description: str
    estimated_impact: Optional[str] = None


class StagePrediction(BaseModel):
    model_config = ConfigDict(extra="forbid")

    stage_name: str
    sequence_no: int
    delay_probability: float = Field(ge=0, le=1)
    risk_category: RiskCategory
    expected_duration_days: Optional[int] = None


class MLRequest(BaseModel):
    model_config = ConfigDict(extra="forbid")

    project_id: int
    features: Dict[str, Any]
    feature_schema_version: str
    observation_timestamp: datetime


class MLResponse(BaseModel):
    model_config = ConfigDict(extra="forbid")

    project_id: int
    model_version: str
    delay_probability: float = Field(ge=0, le=1)
    risk_category: RiskCategory
    risk_score: float = Field(ge=0, le=1)
    stage_predictions: List[StagePrediction] = []
    explanations: List[ExplanationItem] = []
    recommendations: List[RecommendationItem] = []
    prediction_timestamp: datetime
    is_mock: bool = False


class MLHealthResponse(BaseModel):
    model_config = ConfigDict(extra="forbid")

    status: str
    model_version: Optional[str] = None
    feature_schema_version: Optional[str] = None
    latency_ms: Optional[int] = None


class MockMLResponse(MLResponse):
    model_config = ConfigDict(extra="forbid")

    is_mock: bool = True