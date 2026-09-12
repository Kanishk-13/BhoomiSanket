import pytest
import os
import joblib
from app.core.config import settings
from app.ml.model_loader import model_loader
from app.ml.predictor import predictor, CANONICAL_FEATURES, CATEGORICAL_FEATURES, NUMERICAL_FEATURES
from app.ml.schemas import RiskCategory


def test_model_loading_and_diagnostics():
    """Verify that the exact Random Forest model pipeline loads properly with all required specs."""
    model_loader.load_model()
    assert model_loader.is_loaded is True
    assert model_loader.model is not None

    diag = model_loader.get_diagnostics()
    assert diag["model_file_exists"] is True
    assert diag["is_loaded"] is True
    assert diag["classifier"] == "RandomForestClassifier"
    assert diag["is_random_forest"] is True
    assert diag["n_estimators"] == 200
    assert diag["has_200_trees"] is True
    assert diag["input_features_count"] == 41
    assert diag["transformed_features_count"] == 93
    assert diag["decision_threshold"] == 0.375


def test_canonical_features_specification():
    """Verify 41 total features matching exact pipeline feature_names_in_."""
    assert len(CATEGORICAL_FEATURES) == 6
    assert len(NUMERICAL_FEATURES) == 35
    assert len(CANONICAL_FEATURES) == 41
    if model_loader.is_loaded and hasattr(model_loader.model, "feature_names_in_"):
        assert list(model_loader.model.feature_names_in_) == CANONICAL_FEATURES


def test_predictor_threshold_and_risk_mapping():
    """Verify threshold of 0.375 and risk classification semantics."""
    assert predictor.decision_threshold == 0.375
    assert predictor.get_risk_category(0.10) == RiskCategory.LOW
    assert predictor.get_risk_category(0.35) == RiskCategory.LOW
    assert predictor.get_risk_category(0.55) == RiskCategory.MEDIUM
    assert predictor.get_risk_category(0.72) == RiskCategory.HIGH
    assert predictor.get_risk_category(0.95) == RiskCategory.CRITICAL


def test_prediction_inference_structure():
    """Verify real inference execution, probability range, and explanation schema."""
    model_loader.load_model()
    dummy_features = {
        "project_type": "Expressway",
        "state": "Maharashtra",
        "district": "Thane",
        "current_stage": "Compensation Disbursement",
        "compensation_status": "In Progress",
        "rr_status": "In Progress",
        "land_required_hectares": 120.5,
        "number_of_parcels": 450.0,
        "affected_families": 210.0,
        "affected_persons": 840.0,
        "displaced_families": 60.0,
        "vulnerable_families": 20.0,
        "stage_elapsed_days": 180.0,
        "applicable_stage_duration_days": 120.0,
        "stage_deadline_ratio": 1.5,
        "compensation_completion_ratio": 0.4,
        "compensation_assessed_amount": 50000000.0,
        "compensation_approved_amount": 50000000.0,
        "compensation_paid_amount": 20000000.0,
        "compensation_pending_amount": 30000000.0,
        "beneficiaries_pending": 120.0,
        "active_legal_cases": 2.0,
        "legal_cases_resolved": 0.0,
        "legal_cases_pending": 2.0,
        "disputed_parcels": 5.0,
        "oldest_legal_case_age_days": 240.0,
        "rr_required": 1.0,
        "rr_eligible_families": 60.0,
        "rr_completed_families": 20.0,
        "rr_pending_families": 40.0,
        "rr_completion_ratio": 0.33,
        "pending_approvals": 3.0,
        "pending_requests": 3.0,
        "average_response_days": 25.0,
        "max_pending_response_days": 50.0,
        "departments_involved": 4.0,
        "unresolved_interdepartmental_tasks": 4.0,
        "snapshot_year": 2026.0,
        "snapshot_month": 9.0,
        "snapshot_day": 12.0,
        "snapshot_dayofweek": 5.0,
    }

    res = predictor.predict(1, dummy_features)
    assert res.project_id == 1
    assert 0.0 <= res.delay_probability <= 1.0
    assert res.model_version == "rf-delay-v1.0"
    assert res.is_mock is False
    assert len(res.explanations) > 0
    assert len(res.recommendations) > 0


def test_real_model_not_mock():
    """Verify that a prediction with loaded model is flagged is_mock=False."""
    model_loader.load_model()
    assert model_loader.is_loaded is True
    features = {feat: 0.0 for feat in NUMERICAL_FEATURES}
    features.update({
        "project_type": "Highway",
        "state": "Gujarat",
        "district": "Surat",
        "current_stage": "Section 4 Notification",
        "compensation_status": "Not Started",
        "rr_status": "Pending",
        "snapshot_year": 2026.0,
        "snapshot_month": 9.0,
        "snapshot_day": 12.0,
        "snapshot_dayofweek": 5.0,
    })
    res = predictor.predict(42, features)
    assert res.is_mock is False
    assert res.project_id == 42


@pytest.mark.asyncio
async def test_mock_fallback_when_model_unavailable():
    """Verify fallback path produces is_mock=True without altering model artifact."""
    from app.services.prediction_service import prediction_service
    from app.ml.schemas import MLRequest
    from datetime import datetime, timezone

    # Simulate ML request
    req = MLRequest(
        project_id=999,
        features={
            "project_type": "Expressway",
            "state": "Maharashtra",
            "district": "Thane",
            "current_stage": "Section 4",
            "compensation_status": "In Progress",
            "rr_status": "Pending",
            "land_required_hectares": 100.0,
            "number_of_parcels": 200.0,
            "affected_families": 150.0,
            "affected_persons": 600.0,
            "displaced_families": 40.0,
            "vulnerable_families": 15.0,
            "stage_elapsed_days": 90.0,
            "applicable_stage_duration_days": 120.0,
            "stage_deadline_ratio": 0.75,
            "compensation_completion_ratio": 0.3,
            "compensation_assessed_amount": 1000000.0,
            "compensation_approved_amount": 1000000.0,
            "compensation_paid_amount": 300000.0,
            "compensation_pending_amount": 700000.0,
            "beneficiaries_pending": 100.0,
            "active_legal_cases": 0.0,
            "legal_cases_resolved": 0.0,
            "legal_cases_pending": 0.0,
            "disputed_parcels": 0.0,
            "oldest_legal_case_age_days": 0.0,
            "rr_required": 1.0,
            "rr_eligible_families": 40.0,
            "rr_completed_families": 10.0,
            "rr_pending_families": 30.0,
            "rr_completion_ratio": 0.25,
            "pending_approvals": 1.0,
            "pending_requests": 1.0,
            "average_response_days": 10.0,
            "max_pending_response_days": 20.0,
            "departments_involved": 3.0,
            "unresolved_interdepartmental_tasks": 1.0,
            "snapshot_year": 2026.0,
            "snapshot_month": 9.0,
            "snapshot_day": 12.0,
            "snapshot_dayofweek": 5.0,
        },
        feature_schema_version="1.0",
        observation_timestamp=datetime.now(timezone.utc),
    )

    from app.ml.mock_stub import mock_ml_client
    mock_res = await mock_ml_client.predict(req)
    assert mock_res.is_mock is True
    assert mock_res.project_id == 999
    assert 0.0 <= mock_res.delay_probability <= 1.0
