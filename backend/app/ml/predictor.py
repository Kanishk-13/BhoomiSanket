import logging
from typing import Dict, Any, List, Tuple
from datetime import datetime
import pandas as pd
from app.core.config import settings
from app.ml.model_loader import model_loader
from app.ml.schemas import (
    MLResponse,
    RiskCategory,
    ExplanationItem,
    RecommendationItem,
    StagePrediction,
)

logger = logging.getLogger(__name__)

# Canonical feature specification in exact order expected by trained pipeline
CANONICAL_FEATURES = [
    "project_type",
    "state",
    "district",
    "land_required_hectares",
    "number_of_parcels",
    "affected_families",
    "affected_persons",
    "displaced_families",
    "vulnerable_families",
    "current_stage",
    "stage_elapsed_days",
    "applicable_stage_duration_days",
    "stage_deadline_ratio",
    "compensation_status",
    "compensation_completion_ratio",
    "compensation_assessed_amount",
    "compensation_approved_amount",
    "compensation_paid_amount",
    "compensation_pending_amount",
    "beneficiaries_pending",
    "active_legal_cases",
    "legal_cases_resolved",
    "legal_cases_pending",
    "disputed_parcels",
    "oldest_legal_case_age_days",
    "rr_required",
    "rr_eligible_families",
    "rr_completed_families",
    "rr_pending_families",
    "rr_completion_ratio",
    "rr_status",
    "pending_approvals",
    "pending_requests",
    "average_response_days",
    "max_pending_response_days",
    "departments_involved",
    "unresolved_interdepartmental_tasks",
    "snapshot_year",
    "snapshot_month",
    "snapshot_day",
    "snapshot_dayofweek",
]

CATEGORICAL_FEATURES = [
    "project_type",
    "state",
    "district",
    "current_stage",
    "compensation_status",
    "rr_status",
]

NUMERICAL_FEATURES = [f for f in CANONICAL_FEATURES if f not in CATEGORICAL_FEATURES]

# Top model predictors from feature importance analysis
TOP_PREDICTORS = [
    "stage_deadline_ratio",
    "stage_elapsed_days",
    "oldest_legal_case_age_days",
    "active_legal_cases",
    "legal_cases_pending",
    "disputed_parcels",
    "unresolved_interdepartmental_tasks",
    "legal_cases_resolved",
    "compensation_completion_ratio",
    "rr_completion_ratio",
]

FEATURE_DESCRIPTIONS = {
    "stage_deadline_ratio": ("High stage deadline ratio indicates prolonged acquisition delay", "positive"),
    "stage_elapsed_days": ("High elapsed days in current stage slows momentum", "positive"),
    "oldest_legal_case_age_days": ("Old pending litigation stalls title clearance", "positive"),
    "active_legal_cases": ("Active court cases create legal injunction risks", "positive"),
    "legal_cases_pending": ("Pending judicial disputes delay possession handover", "positive"),
    "disputed_parcels": ("Disputed land parcels prevent clean boundary acquisition", "positive"),
    "unresolved_interdepartmental_tasks": ("Inter-departmental bottlenecks impede statutory clearances", "positive"),
    "legal_cases_resolved": ("High resolved legal cases reduce outstanding dispute risk", "negative"),
    "compensation_completion_ratio": ("Higher compensation disbursement decreases delay risk", "negative"),
    "rr_completion_ratio": ("Progress in rehabilitation & resettlement facilitates faster handover", "negative"),
}


class Predictor:
    """Predictor using loaded Random Forest Pipeline with decision threshold."""

    def __init__(self):
        self.model_version = "rf-delay-v1.0"
        self.decision_threshold = settings.ML_DECISION_THRESHOLD

    def get_risk_category(self, probability: float) -> RiskCategory:
        """Map delay probability to operational risk category based on application settings."""
        if probability >= settings.RISK_THRESHOLD_CRITICAL:
            return RiskCategory.CRITICAL
        elif probability >= settings.RISK_THRESHOLD_HIGH:
            return RiskCategory.HIGH
        elif probability >= settings.RISK_THRESHOLD_MEDIUM:
            return RiskCategory.MEDIUM
        else:
            return RiskCategory.LOW

    def validate_features(self, features: Dict[str, Any]) -> Tuple[bool, List[str]]:
        """Verify that all canonical features exist and are properly typed."""
        missing = []
        for feat in CANONICAL_FEATURES:
            if feat not in features or features[feat] is None:
                missing.append(feat)
        return len(missing) == 0, missing

    def generate_explanations(self, features: Dict[str, Any], probability: float) -> List[ExplanationItem]:
        """Generate domain-specific explanations for the prediction based on top predictors."""
        explanations = []
        for feat in TOP_PREDICTORS:
            if feat in features:
                val = features[feat]
                desc, impact = FEATURE_DESCRIPTIONS.get(feat, (f"Feature {feat} impact on acquisition", "positive"))
                importance = 0.5
                if feat == "stage_deadline_ratio" and val and float(val) > 1.0:
                    importance = 0.85
                elif feat in ["active_legal_cases", "disputed_parcels"] and val and float(val) > 0:
                    importance = 0.75
                elif feat == "compensation_completion_ratio" and val and float(val) < 0.5:
                    importance = 0.70
                else:
                    importance = 0.45

                explanations.append(ExplanationItem(
                    feature=feat,
                    impact=impact,
                    importance=importance,
                    description=f"{desc} (Current value: {val})"
                ))

        explanations.sort(key=lambda x: x.importance, reverse=True)
        return explanations[:5]

    def generate_recommendations(self, features: Dict[str, Any], risk_category: RiskCategory) -> List[RecommendationItem]:
        """Generate prioritized action recommendations based on operational risk."""
        recs = []
        if risk_category in [RiskCategory.HIGH, RiskCategory.CRITICAL]:
            recs.append(RecommendationItem(
                action="Convene Inter-departmental Task Force",
                priority="critical",
                description="Immediately review unresolved interdepartmental approvals and pending departmental responses.",
                estimated_impact="Resolve statutory bottlenecks within 30 days"
            ))
            recs.append(RecommendationItem(
                action="Expedite Legal Dispute Resolution",
                priority="high",
                description="Assign special legal counsel to clear disputed parcels and file vacate-stay applications.",
                estimated_impact="Mitigate stay order risks"
            ))
            recs.append(RecommendationItem(
                action="Accelerate Compensation Disbursement",
                priority="high",
                description="Coordinate with revenue officers and treasury to disburse pending compensation awards.",
                estimated_impact="Increase compensation completion ratio to >80%"
            ))
        elif risk_category == RiskCategory.MEDIUM:
            recs.append(RecommendationItem(
                action="Review Stage Milestone Schedule",
                priority="medium",
                description="Monitor ongoing stage elapsed days against applicable statutory timelines.",
                estimated_impact="Prevent milestone slippage into high-risk bracket"
            ))
            recs.append(RecommendationItem(
                action="Verify R&R Eligible Families Records",
                priority="medium",
                description="Audit rehabilitation and resettlement documentation to avoid downstream disputes.",
                estimated_impact="Improve R&R clearance cadence"
            ))
        else:
            recs.append(RecommendationItem(
                action="Routine Progress Auditing",
                priority="low",
                description="Project indicators are within acceptable limits. Maintain scheduled monitoring.",
                estimated_impact="Sustain on-time execution"
            ))

        return recs

    def predict(self, project_id: int, features: Dict[str, Any]) -> MLResponse:
        """Run ML inference with the loaded Random Forest Pipeline."""
        if not model_loader.is_loaded:
            raise RuntimeError(f"ML Model is not loaded: {model_loader.load_error}")

        model = model_loader.model
        row_df = pd.DataFrame([features])

        # Verify all columns exist in input DataFrame
        for col in CANONICAL_FEATURES:
            if col not in row_df.columns:
                row_df[col] = None

        # Ensure correct column ordering
        row_df = row_df[CANONICAL_FEATURES]

        # Inference
        probs = model.predict_proba(row_df)[0]
        delay_prob = float(probs[1]) if len(probs) > 1 else float(probs[0])
        delay_prob = max(0.0, min(1.0, delay_prob))

        # Binary prediction using optimal threshold
        is_delayed = 1 if delay_prob >= self.decision_threshold else 0
        risk_cat = self.get_risk_category(delay_prob)

        explanations = self.generate_explanations(features, delay_prob)
        recommendations = self.generate_recommendations(features, risk_cat)

        return MLResponse(
            project_id=project_id,
            model_version=self.model_version,
            delay_probability=round(delay_prob, 4),
            risk_category=risk_cat,
            risk_score=round(delay_prob, 4),
            stage_predictions=[],
            explanations=explanations,
            recommendations=recommendations,
            prediction_timestamp=datetime.utcnow(),
            is_mock=False,
        )


predictor = Predictor()
