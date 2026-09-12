# BhoomiSanket — System Architecture

**SIH Problem Statement**: SIH26017 — Predictive Analytics for Early Detection of Land Acquisition Delays

---

## 1. High-Level Architecture Overview

BhoomiSanket is architected as an enterprise-grade, cloud-ready decision support platform designed to predict, monitor, and mitigate delays in large-scale infrastructure land acquisition projects across Indian states.

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           CLIENT / PRESENTATION LAYER                       │
│  Next.js 14 App Router · TypeScript · Tailwind CSS · Lucide Icons · Recharts│
│  Interactive Leaflet Map (CartoDB Positron) · Role-Based Navigation & Views │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │ HTTP / JSON (Axios with Bearer Token)
                                       ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                             API GATEWAY & APPLICATION                       │
│  FastAPI (Python 3.11) · Uvicorn ASGI Server · Async SQLAlchemy 2.0         │
│  OAuth2 Password Flow + JWT (HS256) · Strict RBAC (Admin, Officer, Analyst) │
└──────────────┬──────────────────────────────────────────────┬───────────────┘
               │                                              │
               ▼                                              ▼
┌──────────────────────────────┐              ┌───────────────────────────────┐
│       DATABASE LAYER         │              │      ML INFERENCE ENGINE      │
│  PostgreSQL 15 + PostGIS 3.4 │              │  sklearn Pipeline (v1.6.1)    │
│  • Projects & Stage History  │              │  • RandomForestClassifier     │
│  • Snapshots (41 ML features)│              │  • 200 Trees (class_weight)   │
│  • Risk Predictions & Alerts │              │  • 41 Canonical Features      │
│  • PostGIS Geometry Points   │              │  • 93 Transformed Features    │
│  • Immutable Audit Logs      │              │  • Decision Threshold = 0.375 │
└──────────────────────────────┘              └───────────────────────────────┘
```

---

## 2. Component Breakdown

### 2.1 Frontend (Next.js 14 App Router)
- **Framework**: Next.js 14 with TypeScript, React 18, and Tailwind CSS.
- **Routing Structure**:
  - `/(auth)/login`: OAuth2 password authentication with role-based redirect.
  - `/(dashboard)/dashboard`: Executive overview, high-risk stats, recent project activity.
  - `/(dashboard)/dashboard/projects` & `/(dashboard)/projects`: Filterable, paginated project registry.
  - `/(dashboard)/dashboard/projects/[id]` & `/(dashboard)/projects/[id]`: Project deep-dive with stages, snapshots, and on-demand ML predictions.
  - `/(dashboard)/analytics`: Aggregated macro analytics by state, district, and project type.
  - `/(dashboard)/map`: Interactive PostGIS geospatial map with Leaflet.
  - `/(dashboard)/alerts`: Risk alert feed with acknowledgment and mitigation tracking.
  - `/(dashboard)/audit`: Immutable audit trail viewer.
  - `/(dashboard)/admin`: User management and ML diagnostic health status.
- **State & Client Security**:
  - Zustand auth store (`useAuthStore`) with `localStorage` token caching.
  - `useAuthGuard` hook ensuring client-side hydration safety and role checking.
  - Axios interceptor appending `Authorization: Bearer <token>` to all requests.

### 2.2 Backend (FastAPI + Async Python 3.11)
- **Framework**: FastAPI with asynchronous route handlers and Uvicorn.
- **Dependency Injection**:
  - `get_db`: Asynchronous SQLAlchemy session per request.
  - `get_current_user`: JWT token decoding and database user validation.
  - Role-based guards: `require_admin`, `require_officer`, `require_analyst`, `require_auditor`.
- **Modular Routers** (`/api/v1`):
  - `/auth`: Login, user profile (`/me`), token refresh.
  - `/projects`: Projects list, project details, stages, snapshots, and prediction history.
  - `/predictions`: Real-time ML prediction with model fallback hierarchy.
  - `/alerts`: Risk alerts generation, acknowledgment, and mitigation actions.
  - `/analytics`: SQL aggregation by state, district, and project type.
  - `/gis`: GeoJSON feature collections for geospatial project mapping.
  - `/admin`: User CRUD, risk thresholds, and ML runtime diagnostics.
  - `/audit`: Immutable system audit trail.

### 2.3 Geospatial Database (PostgreSQL 15 + PostGIS 3.4)
- **PostGIS Capabilities**: Stores project coordinates using `Geometry('POINT', srid=4326)`.
- **Tables**:
  - `users`: User profiles with roles (`ADMIN`, `OFFICER`, `ANALYST`, `AUDITOR`).
  - `projects`: Master project records with PostGIS geometry.
  - `project_stages`: 8 standard statutory acquisition stages with status and timestamps.
  - `project_data_snapshots`: Periodic snapshots capturing the 41 canonical ML features.
  - `risk_predictions`: Inference records containing delay probability, risk score, feature contributions, and recommendations.
  - `alerts` & `alert_mitigations`: Automated notifications triggered by high-risk predictions.
  - `audit_logs`: Append-only activity trail recording user actions, IP addresses, and targets.

---

## 3. Data Flow & Prediction Lifecycle

1. **Project Ingestion & Snapshot Capture**:
   - Field officers update project stages and metrics (land area, parcels, compensation disbursement, litigation).
   - Snapshot records are persisted in `project_data_snapshots`.
2. **Prediction Request**:
   - Authorized user (`ANALYST`, `OFFICER`, or `ADMIN`) initiates a prediction via `POST /api/v1/predictions/{project_id}`.
3. **ML Prediction Execution**:
   - `prediction_service` retrieves the latest snapshot.
   - Extracts the 41 canonical features in the exact contract sequence.
   - Executes `model_loader.predict(features)`.
   - The Random Forest Pipeline imputes missing values, scales numerical fields, one-hot encodes categoricals (expanding 41 inputs into 93 features), and queries 200 estimators.
   - If predicted probability $\ge 0.375$, the project is classified as **delayed (`1`)**; otherwise **on schedule (`0`)**.
4. **Alert Generation**:
   - If risk is evaluated as `HIGH` or `CRITICAL` (probability $\ge 0.7$), an automated alert is inserted into `alerts`.
5. **Audit Logging**:
   - The action is logged to `audit_logs` with timestamp, user ID, and parameters.
