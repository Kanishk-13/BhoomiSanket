# BhoomiSanket — REST API Reference

Base URL: `http://localhost:8000/api/v1`

---

## 1. Authentication (`/auth`)

### `POST /auth/login`
- **Description**: Authenticate with username/password and obtain JWT access & refresh tokens.
- **Content-Type**: `application/x-www-form-urlencoded`
- **Parameters**: `username` (Email), `password`
- **Response**:
```json
{
  "access_token": "eyJhbGciOi...",
  "refresh_token": "eyJhbGciOi...",
  "token_type": "bearer",
  "expires_in": 900
}
```

### `GET /auth/me`
- **Description**: Get current user profile and role permissions.
- **Headers**: `Authorization: Bearer <token>`
- **Response**:
```json
{
  "id": "1",
  "email": "admin@bhoomisanket.gov.in",
  "display_name": "System Administrator",
  "role": "ADMIN",
  "is_active": true
}
```

### `POST /auth/refresh`
- **Description**: Exchange a refresh token for a new access token.

---

## 2. Projects (`/projects`)

### `GET /projects/`
- **Description**: List land acquisition projects with filtering and pagination.
- **Query Params**: `page`, `page_size`, `state`, `district`, `project_type`, `risk_category`, `search`.

### `GET /projects/{id}`
- **Description**: Get full project details including latest stage, metrics, and risk status.

### `GET /projects/{id}/stages`
- **Description**: Get statutory acquisition stage history for a specific project.

### `GET /projects/{id}/snapshots`
- **Description**: Retrieve chronological project data snapshots (the 41 ML features).

### `GET /projects/{id}/predictions`
- **Description**: Retrieve past prediction runs for the project.

---

## 3. Predictions (`/predictions`)

### `POST /predictions/{project_id}`
- **Description**: Execute real-time Random Forest inference for a project.
- **Headers**: `Authorization: Bearer <token>` (Requires `ANALYST`, `OFFICER`, or `ADMIN`)
- **Body**: `{"force_refresh": true}`
- **Response**:
```json
{
  "project_id": 1,
  "prediction": 0,
  "probability": 0.365,
  "threshold": 0.375,
  "model_name": "RandomForestClassifier",
  "model_version": "rf-delay-v1.0",
  "delay_probability": 0.365,
  "risk_category": "low",
  "risk_score": 0.365,
  "stage_predictions": [...],
  "explanations": [
    {
      "feature": "stay_orders_count",
      "impact": "neutral",
      "importance": 0.08,
      "description": "0 active stay orders"
    }
  ],
  "recommendations": [
    {
      "action": "Maintain scheduled monitoring",
      "priority": "LOW",
      "description": "Project metrics are tracking within expected statutory timelines."
    }
  ],
  "is_mock": false,
  "is_stale": false,
  "status": "success"
}
```

---

## 4. Analytics (`/analytics`)

### `GET /analytics/summary`
- **Description**: Summary metrics across all projects (total projects, delayed, critical risk, total cost).

### `GET /analytics/state`
- **Description**: Aggregated analytics by state (count, avg delay probability, total budget).

### `GET /analytics/district`
- **Description**: District-level aggregations and risk breakdown.

### `GET /analytics/project-types`
- **Description**: Metrics segmented by infrastructure type (Highway, Railway, Energy, etc.).

---

## 5. Geospatial GIS (`/gis`)

### `GET /gis/projects`
- **Description**: GeoJSON `FeatureCollection` of project locations with spatial attributes and risk categories.
- **Format**: Standard RFC 7946 GeoJSON.

---

## 6. Alerts & Mitigations (`/alerts`)

### `GET /alerts/`
- **Description**: List triggered alerts filterable by severity (`CRITICAL`, `HIGH`, `MEDIUM`, `LOW`) and status.

### `POST /alerts/{id}/acknowledge`
- **Description**: Acknowledge an alert (Requires `OFFICER` or `ADMIN`).

### `POST /alerts/{id}/action`
- **Description**: Log a mitigation action for an alert.

---

## 7. Admin & Diagnostics (`/admin`)

### `GET /admin/ml-status`
- **Description**: Real-time diagnostic verification of the ML runtime.
- **Response**:
```json
{
  "status": "healthy",
  "model_version": "rf-delay-v1.0",
  "classifier": "RandomForestClassifier",
  "is_random_forest": true,
  "n_estimators": 200,
  "has_200_trees": true,
  "input_features_count": 41,
  "transformed_features_count": 93,
  "decision_threshold": 0.375
}
```

### `GET /admin/users` & `POST /admin/users`
- **Description**: User management and role assignments.

### `GET /admin/thresholds` & `PUT /admin/thresholds`
- **Description**: Configurable system risk alert thresholds.
