import os
import logging
from typing import Optional, Any
import joblib
from app.core.config import settings

logger = logging.getLogger(__name__)


class ModelLoader:
    """Singleton model loader to ensure the sklearn pipeline is loaded only once on startup."""

    def __init__(self):
        self._model: Optional[Any] = None
        self._model_path: Optional[str] = None
        self._is_loaded: bool = False
        self._load_error: Optional[str] = None

    def load_model(self) -> None:
        """Load the ML model from configured ML_MODEL_PATH or standard fallback locations."""
        candidates = [
            settings.ML_MODEL_PATH,
            "/app/app/ml/models/model.joblib",
            os.path.join(os.path.dirname(__file__), "models", "model.joblib"),
            "backend/app/ml/models/model.joblib",
        ]
        model_path = None
        for path in candidates:
            if path and os.path.exists(path):
                model_path = path
                break

        self._model_path = model_path

        if not model_path:
            self._is_loaded = False
            self._load_error = f"Model file not found in candidates: {candidates}"
            logger.warning(self._load_error)
            return

        try:
            logger.info("==================================================")
            logger.info("MODEL SOURCE: REAL JOBLIB MODEL")
            logger.info(f"MODEL PATH: {model_path}")
            self._model = joblib.load(model_path)
            self._is_loaded = True
            self._load_error = None

            # Inspect pipeline steps and classifier
            classifier = None
            if hasattr(self._model, "named_steps"):
                classifier = self._model.named_steps.get("classifier")
            elif hasattr(self._model, "steps"):
                classifier = self._model.steps[-1][1]

            clf_name = type(classifier).__name__ if classifier else "Unknown"
            n_trees = getattr(classifier, "n_estimators", "N/A")
            logger.info(f"CLASSIFIER: {clf_name}")
            logger.info(f"TREES: {n_trees}")
            logger.info(f"THRESHOLD: {settings.ML_DECISION_THRESHOLD}")
            logger.info("==================================================")
        except Exception as e:
            self._is_loaded = False
            self._model = None
            self._load_error = str(e)
            logger.error(f"Failed to load ML model artifact from {model_path}: {e}")

    def get_diagnostics(self) -> dict:
        """Get model health diagnostics for audit."""
        file_exists = bool(self._model_path and os.path.exists(self._model_path))
        classifier = None
        n_estimators = None
        transformed_features = None
        feature_names_in = []

        if self.is_loaded and self._model is not None:
            if hasattr(self._model, "named_steps"):
                classifier = self._model.named_steps.get("classifier")
            elif hasattr(self._model, "steps"):
                classifier = self._model.steps[-1][1]

            if classifier:
                n_estimators = getattr(classifier, "n_estimators", None)
                transformed_features = getattr(classifier, "n_features_in_", None)

            if hasattr(self._model, "feature_names_in_"):
                feature_names_in = list(self._model.feature_names_in_)

        clf_type = type(classifier).__name__ if classifier else None

        return {
            "model_file_exists": file_exists,
            "model_path": self._model_path,
            "is_loaded": self.is_loaded,
            "classifier": clf_type,
            "is_random_forest": clf_type == "RandomForestClassifier",
            "n_estimators": n_estimators,
            "has_200_trees": n_estimators == 200,
            "input_features_count": len(feature_names_in),
            "transformed_features_count": transformed_features,
            "decision_threshold": settings.ML_DECISION_THRESHOLD,
            "load_error": self._load_error,
        }

    @property
    def model(self) -> Optional[Any]:
        return self._model

    @property
    def is_loaded(self) -> bool:
        return self._is_loaded and self._model is not None

    @property
    def load_error(self) -> Optional[str]:
        return self._load_error

    @property
    def model_path(self) -> Optional[str]:
        return self._model_path


model_loader = ModelLoader()
