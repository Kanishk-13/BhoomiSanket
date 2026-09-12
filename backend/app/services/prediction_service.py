import logging
from datetime import datetime, timezone
from typing import Optional, Dict, Any
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from sqlalchemy.orm import selectinload

from app.db.models import Project, ProjectDataSnapshot, RiskPrediction, Alert
from app.core.config import settings
from app.ml.schemas import MLRequest, MLResponse, MLHealthResponse
from app.ml.client import ml_client
from app.ml.mock_stub import mock_ml_client
from app.ml.model_loader import model_loader
from app.ml.predictor import predictor
from app.core.exceptions import MLServiceError, MLTimeoutError, MLInvalidResponseError

logger = logging.getLogger(__name__)


class PredictionService:
    """Service for managing risk predictions with trained ML artifact, external service, and mock fallback."""

    def __init__(self):
        pass

    async def get_latest_prediction(
        self, 
        db: AsyncSession, 
        project_id: int
    ) -> Optional[RiskPrediction]:
        """Get the latest prediction for a project."""
        result = await db.execute(
            select(RiskPrediction)
            .where(RiskPrediction.project_id == project_id)
            .order_by(RiskPrediction.requested_at.desc())
            .limit(1)
        )
        return result.scalar_one_or_none()

    async def get_latest_snapshot(
        self, 
        db: AsyncSession, 
        project_id: int
    ) -> Optional[ProjectDataSnapshot]:
        """Get the latest data snapshot for a project."""
        result = await db.execute(
            select(ProjectDataSnapshot)
            .where(ProjectDataSnapshot.project_id == project_id)
            .order_by(ProjectDataSnapshot.snapshot_date.desc())
            .limit(1)
        )
        return result.scalar_one_or_none()

    def map_features(
        self, 
        project: Project, 
        snapshot: ProjectDataSnapshot
    ) -> Dict[str, Any]:
        """
        Deterministic feature mapper that transforms Project + ProjectDataSnapshot
        into the 41 canonical features expected by the trained Random Forest Pipeline.
        """
        snap_date = snapshot.snapshot_date
        
        # Categorical features
        current_stage = project.current_stage or "Planning"
        
        # Determine compensation status
        comp_paid_pct = float(snapshot.compensation_paid_pct) if snapshot.compensation_paid_pct is not None else 0.0
        if comp_paid_pct >= 0.95:
            comp_status = "Disbursed"
        elif comp_paid_pct > 0:
            comp_status = "In Progress"
        else:
            comp_status = "Not Started"

        # Determine R&R status
        rehab_pct = float(snapshot.rehab_progress_pct) if snapshot.rehab_progress_pct is not None else 0.0
        if rehab_pct >= 0.95:
            rr_status = "Completed"
        elif rehab_pct > 0:
            rr_status = "In Progress"
        else:
            rr_status = "Pending"

        # Stage deadline ratio
        days_in_stage = snapshot.days_in_current_stage or 0
        applicable_duration = max(30, (snapshot.stage_overdue_days or 0) + 180)
        stage_deadline_ratio = round(days_in_stage / applicable_duration, 4)

        # Approximate parcel count and affected persons from land area and families
        land_ha = float(project.land_area_ha) if project.land_area_ha else 50.0
        num_parcels = max(1, int(land_ha * 4))
        affected_fam = project.affected_families or 100
        affected_persons = affected_fam * 4
        displaced_fam = int(affected_fam * 0.3) if rr_status != "Not Applicable" else 0
        vulnerable_fam = int(affected_fam * 0.1)

        # Monetary estimations
        assessed_amt = round(land_ha * 2500000.0, 2)
        approved_amt = assessed_amt
        paid_amt = round(approved_amt * comp_paid_pct, 2)
        pending_amt = round(approved_amt - paid_amt, 2)
        pending_beneficiaries = int(affected_fam * (1.0 - comp_paid_pct))

        # Legal estimations
        active_legal = snapshot.num_active_legal_cases or 0
        disputed_parcels = snapshot.num_disputed_claims or 0
        legal_resolved = 1 if not snapshot.legal_dispute_flag and active_legal == 0 else 0
        legal_pending = active_legal
        oldest_case_days = (active_legal * 120) if active_legal > 0 else 0

        # R&R families
        rr_required = 1 if displaced_fam > 0 else 0
        rr_eligible = displaced_fam
        rr_completed = int(rr_eligible * rehab_pct)
        rr_pending = max(0, rr_eligible - rr_completed)
        rr_completion_ratio = round(rehab_pct, 4)

        # Approvals & Inter-departmental
        pending_approvals = snapshot.num_approvals_pending or 0
        avg_resp_days = snapshot.stakeholder_response_days or 15
        max_resp_days = avg_resp_days * 2
        unresolved_tasks = pending_approvals + (1 if not snapshot.env_clearance_obtained else 0)

        features = {
            # Categorical (6)
            "project_type": project.project_type,
            "state": project.state,
            "district": project.district,
            "current_stage": current_stage,
            "compensation_status": comp_status,
            "rr_status": rr_status,
            # Numerical (35)
            "land_required_hectares": land_ha,
            "number_of_parcels": float(num_parcels),
            "affected_families": float(affected_fam),
            "affected_persons": float(affected_persons),
            "displaced_families": float(displaced_fam),
            "vulnerable_families": float(vulnerable_fam),
            "stage_elapsed_days": float(days_in_stage),
            "applicable_stage_duration_days": float(applicable_duration),
            "stage_deadline_ratio": float(stage_deadline_ratio),
            "compensation_completion_ratio": float(comp_paid_pct),
            "compensation_assessed_amount": float(assessed_amt),
            "compensation_approved_amount": float(approved_amt),
            "compensation_paid_amount": float(paid_amt),
            "compensation_pending_amount": float(pending_amt),
            "beneficiaries_pending": float(pending_beneficiaries),
            "active_legal_cases": float(active_legal),
            "legal_cases_resolved": float(legal_resolved),
            "legal_cases_pending": float(legal_pending),
            "disputed_parcels": float(disputed_parcels),
            "oldest_legal_case_age_days": float(oldest_case_days),
            "rr_required": float(rr_required),
            "rr_eligible_families": float(rr_eligible),
            "rr_completed_families": float(rr_completed),
            "rr_pending_families": float(rr_pending),
            "rr_completion_ratio": float(rr_completion_ratio),
            "pending_approvals": float(pending_approvals),
            "pending_requests": float(pending_approvals),
            "average_response_days": float(avg_resp_days),
            "max_pending_response_days": float(max_resp_days),
            "departments_involved": 4.0,
            "unresolved_interdepartmental_tasks": float(unresolved_tasks),
            "snapshot_year": float(snap_date.year),
            "snapshot_month": float(snap_date.month),
            "snapshot_day": float(snap_date.day),
            "snapshot_dayofweek": float(snap_date.weekday()),
        }

        return features

    async def build_ml_request(
        self, 
        db: AsyncSession, 
        project_id: int
    ) -> Optional[MLRequest]:
        """Build ML request with mapped features from latest snapshot."""
        snapshot = await self.get_latest_snapshot(db, project_id)
        if not snapshot:
            return None

        project_result = await db.execute(
            select(Project).where(Project.id == project_id)
        )
        project = project_result.scalar_one_or_none()
        if not project:
            return None

        features = self.map_features(project, snapshot)

        return MLRequest(
            project_id=project_id,
            features=features,
            feature_schema_version=settings.ML_FEATURE_SCHEMA_VERSION,
            observation_timestamp=datetime.now(timezone.utc),
        )

    async def predict_with_fallback(
        self, 
        db: AsyncSession, 
        project_id: int
    ) -> RiskPrediction:
        """
        Predict with complete fallback hierarchy:
        1. Trained local Random Forest model artifact (if loaded)
        2. External ML service API (if ML_SERVICE_URL configured)
        3. Deterministic Mock stub (explicitly flagged is_mock=True)
        4. Stale previous prediction (flagged is_stale=True, status='stale')
        5. Unavailable state (status='unavailable')
        """
        ml_request = await self.build_ml_request(db, project_id)
        if not ml_request:
            return await self._create_unavailable_prediction(db, project_id, "No snapshot data available")

        # 1. Primary: Local Random Forest Pipeline Artifact
        if model_loader.is_loaded:
            try:
                logger.info(f"Executing real Random Forest inference for project {project_id} using model at {model_loader.model_path}")
                ml_response = predictor.predict(project_id, ml_request.features)
                logger.info(f"Real model inference succeeded for project {project_id}: prob={ml_response.delay_probability}, risk={ml_response.risk_category}")
                return await self._save_prediction(db, project_id, ml_request, ml_response, is_mock=False)
            except Exception as e:
                logger.error(f"Real model inference failed for project {project_id}: {e}", exc_info=True)
                # If real model is loaded but failed, log warning before falling back
                logger.warning(f"Falling back from real model for project {project_id}")

        # 2. Secondary: External ML Service API
        if settings.ML_SERVICE_URL:
            try:
                ml_response = await ml_client.predict(ml_request)
                return await self._save_prediction(db, project_id, ml_request, ml_response, is_mock=False)
            except (MLTimeoutError, MLServiceError, MLInvalidResponseError):
                pass

        # 3. Tertiary: Mock ML Stub
        try:
            mock_response = await mock_ml_client.predict(ml_request)
            return await self._save_prediction(db, project_id, ml_request, mock_response, is_mock=True)
        except Exception:
            # Fallback to stale or unavailable
            return await self._handle_fallback(db, project_id)

    async def _save_prediction(
        self, 
        db: AsyncSession, 
        project_id: int,
        ml_request: MLRequest,
        ml_response: MLResponse,
        is_mock: bool
    ) -> RiskPrediction:
        """Save prediction to database and trigger alerts if high/critical."""
        snapshot = await self.get_latest_snapshot(db, project_id)
        risk_cat_str = ml_response.risk_category.value if hasattr(ml_response.risk_category, 'value') else str(ml_response.risk_category)
        
        prediction = RiskPrediction(
            project_id=project_id,
            snapshot_id=snapshot.id if snapshot else project_id,
            requested_at=ml_request.observation_timestamp,
            responded_at=datetime.now(timezone.utc),
            model_version=ml_response.model_version,
            is_mock=is_mock,
            delay_probability=ml_response.delay_probability,
            risk_category=risk_cat_str,
            stage_predictions=[sp.model_dump() for sp in ml_response.stage_predictions],
            explanations=[e.model_dump() for e in ml_response.explanations],
            recommendations=[r.model_dump() for r in ml_response.recommendations],
            is_stale=False,
            status="success",
        )
        db.add(prediction)
        await db.flush()

        # Check for active unacknowledged alert to avoid duplicates
        if risk_cat_str in ["high", "critical"]:
            active_alert_query = await db.execute(
                select(Alert)
                .where(Alert.project_id == project_id)
                .where(Alert.acknowledged_at == None)
            )
            existing_active_alert = active_alert_query.scalar_one_or_none()
            if not existing_active_alert:
                alert = Alert(
                    project_id=project_id,
                    prediction_id=prediction.id,
                    alert_type="Critical Risk" if risk_cat_str == "critical" else "High Risk",
                    risk_category=risk_cat_str,
                    probability_at_trigger=ml_response.delay_probability,
                )
                db.add(alert)
                await db.flush()

        return prediction

    async def _create_unavailable_prediction(
        self, 
        db: AsyncSession, 
        project_id: int,
        reason: str
    ) -> RiskPrediction:
        """Create a prediction record indicating ML is unavailable."""
        snapshot = await self.get_latest_snapshot(db, project_id)
        
        prediction = RiskPrediction(
            project_id=project_id,
            snapshot_id=snapshot.id if snapshot else project_id,
            requested_at=datetime.now(timezone.utc),
            responded_at=None,
            model_version=None,
            is_mock=False,
            delay_probability=None,
            risk_category=None,
            stage_predictions=[],
            explanations=[],
            recommendations=[],
            is_stale=False,
            status="unavailable",
        )
        db.add(prediction)
        await db.flush()
        return prediction

    async def _handle_fallback(
        self, 
        db: AsyncSession, 
        project_id: int
    ) -> RiskPrediction:
        """Handle fallback when all inferences fail: return stale or unavailable."""
        previous = await db.execute(
            select(RiskPrediction)
            .where(RiskPrediction.project_id == project_id)
            .where(RiskPrediction.status == "success")
            .order_by(RiskPrediction.requested_at.desc())
            .limit(1)
        )
        prev_prediction = previous.scalar_one_or_none()
        
        if prev_prediction:
            prev_prediction.is_stale = True
            prev_prediction.stale_since = datetime.now(timezone.utc)
            prev_prediction.status = "stale"
            await db.flush()
            return prev_prediction
        else:
            return await self._create_unavailable_prediction(db, project_id, "Inference and fallback both unavailable")

    async def batch_predict(self, db: AsyncSession, project_ids: list[int]) -> dict[int, RiskPrediction]:
        """Generate predictions for multiple projects."""
        results = {}
        for pid in project_ids:
            try:
                results[pid] = await self.predict_with_fallback(db, pid)
            except Exception:
                results[pid] = None
        return results

    def get_health(self) -> MLHealthResponse:
        """Return operational health of ML service/artifact."""
        diag = model_loader.get_diagnostics()
        if model_loader.is_loaded:
            return MLHealthResponse(
                status="healthy",
                model_version=predictor.model_version,
                feature_schema_version=settings.ML_FEATURE_SCHEMA_VERSION,
                latency_ms=5,
                model_file_exists=diag.get("model_file_exists"),
                classifier=diag.get("classifier"),
                is_random_forest=diag.get("is_random_forest"),
                n_estimators=diag.get("n_estimators"),
                has_200_trees=diag.get("has_200_trees"),
                input_features_count=diag.get("input_features_count"),
                transformed_features_count=diag.get("transformed_features_count"),
                decision_threshold=diag.get("decision_threshold"),
            )
        elif settings.ML_SERVICE_URL:
            return MLHealthResponse(
                status="external_configured",
                model_version=None,
                feature_schema_version=settings.ML_FEATURE_SCHEMA_VERSION,
                latency_ms=None,
                model_file_exists=diag.get("model_file_exists"),
                classifier=None,
                is_random_forest=False,
                n_estimators=None,
                has_200_trees=False,
                input_features_count=0,
                transformed_features_count=None,
                decision_threshold=settings.ML_DECISION_THRESHOLD,
            )
        else:
            return MLHealthResponse(
                status="mock_fallback",
                model_version="mock-v1.0",
                feature_schema_version=settings.ML_FEATURE_SCHEMA_VERSION,
                latency_ms=0,
                model_file_exists=diag.get("model_file_exists"),
                classifier=None,
                is_random_forest=False,
                n_estimators=None,
                has_200_trees=False,
                input_features_count=0,
                transformed_features_count=None,
                decision_threshold=settings.ML_DECISION_THRESHOLD,
            )


prediction_service = PredictionService()