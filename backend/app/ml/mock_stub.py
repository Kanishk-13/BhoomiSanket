import hashlib
from datetime import datetime, timezone
from typing import Dict, Any, List
from app.ml.schemas import (
    MLRequest,
    MLResponse,
    MockMLResponse,
    RiskCategory,
    ExplanationItem,
    RecommendationItem,
    StagePrediction,
)


def deterministic_hash(value: str) -> float:
    """Generate a deterministic float in [0, 1] from a string."""
    hash_bytes = hashlib.md5(value.encode()).digest()
    return int.from_bytes(hash_bytes[:8], "big") / (2**64 - 1)


def get_risk_category(probability: float) -> RiskCategory:
    from app.core.config import settings
    if probability >= settings.RISK_THRESHOLD_CRITICAL:
        return RiskCategory.CRITICAL
    elif probability >= settings.RISK_THRESHOLD_HIGH:
        return RiskCategory.HIGH
    elif probability >= settings.RISK_THRESHOLD_MEDIUM:
        return RiskCategory.MEDIUM
    else:
        return RiskCategory.LOW


def generate_mock_explanations(features: Dict[str, Any], probability: float) -> List[ExplanationItem]:
    """Generate deterministic mock explanations based on features."""
    explanations = []

    # Top contributing features for land acquisition delays
    feature_impacts = [
        ("compensation_paid_pct", "negative", "Low compensation payment progress increases delay risk"),
        ("num_disputed_claims", "positive", "Active disputed claims significantly delay acquisition"),
        ("legal_dispute_flag", "positive", "Legal disputes are a major cause of project delays"),
        ("approval_pending_days", "positive", "Pending approvals stall project progress"),
        ("doc_complete_pct", "negative", "Incomplete documentation slows administrative processes"),
        ("rehab_progress_pct", "negative", "Slow rehabilitation progress delays possession handover"),
        ("possession_completion_pct", "negative", "Low possession completion indicates ongoing issues"),
        ("district_historical_delay_rate", "positive", "District history of delays correlates with current risk"),
        ("stakeholder_response_days", "positive", "Slow stakeholder responses delay decision-making"),
        ("notification_delay_days", "positive", "Delayed notifications push back acquisition timelines"),
    ]

    for feature_name, impact, description in feature_impacts:
        if feature_name in features:
            value = features[feature_name]
            if value is not None:
                # Deterministic importance based on feature name and project
                seed = f"{feature_name}_{probability}"
                importance = deterministic_hash(seed) * 0.5 + 0.1  # 0.1 to 0.6
                explanations.append(ExplanationItem(
                    feature=feature_name,
                    impact=impact,
                    importance=round(importance, 3),
                    description=description,
                ))

    # Sort by importance descending
    explanations.sort(key=lambda x: x.importance, reverse=True)
    return explanations[:5]  # Top 5


def generate_mock_recommendations(risk_category: RiskCategory) -> List[RecommendationItem]:
    """Generate deterministic mock recommendations based on risk category."""
    base_recommendations = {
        RiskCategory.LOW: [
            RecommendationItem(
                action="Continue monitoring",
                priority="low",
                description="Project is on track. Maintain current oversight cadence.",
            ),
        ],
        RiskCategory.MEDIUM: [
            RecommendationItem(
                action="Review compensation disbursement",
                priority="medium",
                description="Accelerate pending compensation payments to reduce delay risk.",
                estimated_impact="Reduce delay probability by ~10-15%",
            ),
            RecommendationItem(
                action="Schedule stakeholder meeting",
                priority="medium",
                description="Proactively engage stakeholders to address emerging issues.",
                estimated_impact="Improve stakeholder response time by ~20%",
            ),
        ],
        RiskCategory.HIGH: [
            RecommendationItem(
                action="Escalate to district collector",
                priority="high",
                description="Immediate administrative intervention required for critical bottlenecks.",
                estimated_impact="Resolve approval/legal bottlenecks within 30 days",
            ),
            RecommendationItem(
                action="Deploy dedicated compensation team",
                priority="high",
                description="Fast-track pending compensation cases with dedicated resources.",
                estimated_impact="Clear 80% of pending compensation within 45 days",
            ),
            RecommendationItem(
                action="Initiate legal resolution process",
                priority="high",
                description="Engage legal cell to resolve disputed claims and court stays.",
                estimated_impact="Reduce legal dispute impact on timeline",
            ),
        ],
        RiskCategory.CRITICAL: [
            RecommendationItem(
                action="Emergency review meeting with all stakeholders",
                priority="critical",
                description="Convene urgent multi-departmental meeting to unblock project.",
                estimated_impact="Identify and resolve top 3 blocking issues",
            ),
            RecommendationItem(
                action="Request state-level intervention",
                priority="critical",
                description="Escalate to state government for policy-level resolution of systemic issues.",
                estimated_impact="Unblock inter-departmental coordination failures",
            ),
            RecommendationItem(
                action="Activate contingency rehabilitation plan",
                priority="critical",
                description="Implement alternative rehabilitation arrangements to enable possession.",
                estimated_impact="Enable possession handover for affected families",
            ),
        ],
    }

    return base_recommendations.get(risk_category, [])


def generate_mock_stage_predictions(project_id: int, probability: float) -> List[StagePrediction]:
    """Generate deterministic mock stage predictions."""
    stages = [
        ("SIA Notification", 1),
        ("SIA Report Preparation", 2),
        ("SIA Approval", 3),
        ("Preliminary Notification (Section 11)", 4),
        ("Objection Hearing", 5),
        ("Declaration (Section 19)", 6),
        ("Award Preparation (Section 23)", 7),
        ("Award Declaration", 8),
        ("Compensation Disbursement", 9),
        ("Possession Handover", 10),
        ("Rehabilitation & Resettlement", 11),
    ]

    predictions = []
    for stage_name, seq_no in stages:
        seed = f"{project_id}_{stage_name}_{probability}"
        stage_prob = deterministic_hash(seed)
        # Bias towards overall project probability
        stage_prob = (stage_prob + probability) / 2
        predictions.append(StagePrediction(
            stage_name=stage_name,
            sequence_no=seq_no,
            delay_probability=round(stage_prob, 4),
            risk_category=get_risk_category(stage_prob),
            expected_duration_days=30 + int(deterministic_hash(f"{stage_name}_dur") * 60),
        ))

    return predictions


def generate_mock_prediction(request: MLRequest) -> MockMLResponse:
    """Generate a complete deterministic mock prediction."""
    # Use project_id and feature values for deterministic output
    feature_str = str(sorted(request.features.items()))
    seed = f"{request.project_id}_{feature_str}_{request.feature_schema_version}"
    probability = deterministic_hash(seed)

    risk_category = get_risk_category(probability)

    return MockMLResponse(
        project_id=request.project_id,
        model_version="mock-v1.0",
        delay_probability=round(probability, 4),
        risk_category=risk_category,
        risk_score=round(probability, 4),
        stage_predictions=generate_mock_stage_predictions(request.project_id, probability),
        explanations=generate_mock_explanations(request.features, probability),
        recommendations=generate_mock_recommendations(risk_category),
        prediction_timestamp=datetime.now(timezone.utc),
        is_mock=True,
    )


class MockMLClient:
    """Deterministic mock ML client for development and testing."""

    def __init__(self):
        self.model_version = "mock-v1.0"
        self.feature_schema_version = "1.0"

    async def predict(self, request: MLRequest) -> MLResponse:
        return generate_mock_prediction(request)

    async def health_check(self):
        from app.ml.schemas import MLHealthResponse
        return MLHealthResponse(
            status="healthy",
            model_version=self.model_version,
            feature_schema_version=self.feature_schema_version,
            latency_ms=1,
        )


mock_ml_client = MockMLClient()