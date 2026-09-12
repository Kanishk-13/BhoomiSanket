# BhoomiSanket

**SIH Problem**: SIH26017 — Predictive Analytics for Early Detection of Land Acquisition Delays

> ⚠ **SYNTHETIC DATA DISCLAIMER**
> The data used in this application is synthetically generated for demonstration and application UI development purposes only.
> It does not represent any real government land acquisition project, district, or individual.
> It must not be presented as real government data under any circumstances.
> **It is NOT an ML training dataset. It cannot be used to claim or validate model performance.**

---

## Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌──────────────────┐
│   Next.js 14    │────▶│   FastAPI        │────▶│  PostgreSQL 15   │
│   (Vercel)      │     │   (Railway)      │     │  + PostGIS 3.4   │
│                 │     │                  │     │  (Supabase-mgd.) │
└─────────────────┘     └────────┬─────────┘     └──────────────────┘
                                 │
                    ┌────────────▼────────────┐
                    │   ML Artifact Layer     │
                    │  ┌─────────────────┐   │
                    │  │ RF model .pkl   │   │  ← loaded at startup
                    │  │ model_loader.py │   │  ← singleton loader
                    │  │ predictor.py    │   │  ← 41-feature pipeline
                    │  └─────────────────┘   │
                    │  Fallback hierarchy:    │
                    │  1. Local RF artifact  │
                    │  2. External ML HTTP   │
                    │  3. Mock stub          │
                    │  4. Stale prediction   │
                    │  5. Unavailable        │
                    └─────────────────────────┘
```

**Key architectural constraint (AD-13):**
BhoomiSanket does **not** train, evaluate, or select the ML model. The application only loads
a pre-trained sklearn Pipeline artifact (`land_acquisition_delay_model.pkl`) and runs inference.

---

## Project Structure

```
BhoomiSanket/
├── backend/
│   ├── app/
│   │   ├── api/v1/
│   │   │   ├── auth.py          # JWT login, /me, refresh
│   │   │   ├── projects.py      # Project CRUD + stages + snapshots
│   │   │   ├── predictions.py   # ML inference + history
│   │   │   ├── dashboard.py     # Summary stats, risk distribution
│   │   │   ├── alerts.py        # Alert listing, acknowledge, mitigation
│   │   │   ├── notifications.py # User-scoped notifications
│   │   │   ├── admin.py         # User mgmt, thresholds, ML status
│   │   │   ├── audit.py         # Audit log retrieval
│   │   │   └── map.py           # GIS data endpoints
│   │   ├── core/                # Config, security, exceptions
│   │   ├── db/                  # SQLAlchemy models, migrations
│   │   ├── ml/
│   │   │   ├── model_loader.py  # Singleton RF artifact loader
│   │   │   ├── predictor.py     # 41-feature pipeline + threshold
│   │   │   ├── schemas.py       # Request/response Pydantic models
│   │   │   └── mock_stub.py     # Deterministic mock fallback
│   │   ├── services/
│   │   │   └── prediction_service.py  # Fallback orchestration
│   │   ├── dependencies.py      # RBAC guards (require_admin, etc.)
│   │   └── main.py              # FastAPI app, lifespan model load
│   ├── models/
│   │   └── land_acquisition_delay_model.pkl  # Pre-trained RF artifact
│   ├── tests/
│   │   ├── conftest.py          # Session-scoped event loop
│   │   ├── test_ml.py           # ML loading, features, inference
│   │   └── test_api.py          # Auth, RBAC, project detail
│   ├── pytest.ini
│   ├── requirements.txt
│   └── Dockerfile
├── frontend/
│   ├── src/
│   │   ├── app/
│   │   │   ├── (auth)/login/page.tsx      # JWT login (OAuth2 form)
│   │   │   └── (dashboard)/
│   │   │       ├── dashboard/page.tsx     # Live summary + recent
│   │   │       │   └── projects/
│   │   │       │       ├── page.tsx       # Paginated project table
│   │   │       │       └── [id]/page.tsx  # Project detail + ML prediction
│   │   │       └── alerts/page.tsx        # Alert table + acknowledge
│   │   ├── components/
│   │   │   ├── ui/              # Badge, Button, Card, Table, etc.
│   │   │   ├── layout/          # Sidebar, DashboardLayout, Header
│   │   │   └── charts/          # Risk distribution charts
│   │   ├── lib/
│   │   │   ├── api.ts           # Axios client with JWT interceptors
│   │   │   └── auth.ts          # Zustand auth store
│   │   └── types/index.ts       # Full domain TypeScript interfaces
│   ├── package.json
│   └── Dockerfile
├── docker-compose.yml
├── .env.example
└── README.md
```

---

## Technology Stack

| Layer | Technology |
|-------|------------|
| Frontend | Next.js 14, React 18, TypeScript, Tailwind CSS |
| Backend | FastAPI, Python 3.11, SQLAlchemy 2.0 (async) |
| Database | PostgreSQL 15 + PostGIS 3.4 |
| Maps | Leaflet + react-leaflet, **CartoDB Positron basemap** |
| Auth | JWT (HS256), bcrypt, refresh token rotation |
| ML Artifact | sklearn Pipeline — RandomForestClassifier (200 trees, class_weight=balanced) |
| ML Fallback | External HTTP client → deterministic mock stub |
| Email | aiosmtplib + FastAPI BackgroundTasks |
| Hosting | Vercel (frontend), Railway (backend), Supabase (DB) |

---

## ML Artifact Integration

### Model Specification

| Property | Value |
|----------|-------|
| Algorithm | RandomForestClassifier (sklearn Pipeline) |
| Feature count | 41 canonical features |
| Categorical features (6) | `project_type`, `state`, `district`, `current_stage`, `compensation_status`, `rr_status` |
| Numerical features (35) | Land area, parcel count, family counts, stage timing, legal cases, compensation ratios, R&R status, etc. |
| Decision threshold | **0.375** (tuned for recall on delay-prone projects) |
| Model version | `rf-delay-v1.0` |
| Artifact path | `backend/models/land_acquisition_delay_model.pkl` |
| Container path | `/app/models/land_acquisition_delay_model.pkl` |

### Fallback Hierarchy

```
1. Local RF artifact (is_mock=False, is_stale=False)   ← primary
2. External ML HTTP service (if ML_SERVICE_URL is set)
3. Deterministic mock stub (is_mock=True)
4. Stale prediction (is_stale=True)
5. 503 Unavailable
```

### Configuration

```bash
ML_MODEL_PATH=/app/models/land_acquisition_delay_model.pkl
ML_DECISION_THRESHOLD=0.375
ML_FEATURE_SCHEMA_VERSION=1.0
ML_SERVICE_URL=                  # leave empty to use local RF artifact
```

---

## Quick Start (Docker Compose)

### Prerequisites
- Docker & Docker Compose
- Port 3000 (frontend), 8000 (backend), 5432 (postgres) available

### Steps

```bash
# 1. Clone and enter the project
git clone <repo-url>
cd BhoomiSanket

# 2. Copy environment file
cp .env.example .env

# 3. Start all services (DB + backend + frontend)
docker-compose up --build

# 4. Access
#   Frontend:   http://localhost:3000
#   Backend:    http://localhost:8000
#   API Docs:   http://localhost:8000/docs
```

The backend auto-seeds the database with **~250 synthetic demo projects** across Maharashtra,
Rajasthan, Uttar Pradesh, Madhya Pradesh, and Karnataka on first startup.

---

## Demo Credentials

| Role | Email | Password | Permissions |
|------|-------|----------|-------------|
| ADMIN | admin@bhoomisanket.gov.in | password | Full access, user management, thresholds |
| OFFICER | officer@bhoomisanket.gov.in | password | Read + run predictions + log mitigations |
| ANALYST | analyst@bhoomisanket.gov.in | password | Read + run predictions |
| AUDITOR | auditor@bhoomisanket.gov.in | password | Read-only (all resources) |

---

## API Reference

### Auth
| Method | Path | Description |
|--------|------|-------------|
| POST | `/api/v1/auth/login` | OAuth2 form login → JWT |
| GET | `/api/v1/auth/me` | Current user info |
| POST | `/api/v1/auth/refresh` | Refresh token |

### Projects
| Method | Path | Auth Required |
|--------|------|--------------|
| GET | `/api/v1/projects/` | AUDITOR+ |
| GET | `/api/v1/projects/{id}` | AUDITOR+ |
| GET | `/api/v1/projects/{id}/stages` | AUDITOR+ |
| GET | `/api/v1/projects/{id}/snapshots` | AUDITOR+ |
| GET | `/api/v1/projects/{id}/predictions` | AUDITOR+ |

### ML Predictions
| Method | Path | Auth Required |
|--------|------|--------------|
| POST | `/api/v1/predictions/{project_id}` | ANALYST+ |
| GET | `/api/v1/predictions/{project_id}/history` | AUDITOR+ |
| GET | `/api/v1/predictions/health` | AUDITOR+ |

### Dashboard
| Method | Path | Auth Required |
|--------|------|--------------|
| GET | `/api/v1/dashboard/summary` | AUDITOR+ |

### Alerts & Mitigations
| Method | Path | Auth Required |
|--------|------|--------------|
| GET | `/api/v1/alerts/` | AUDITOR+ |
| GET | `/api/v1/alerts/{id}` | AUDITOR+ |
| POST | `/api/v1/alerts/{id}/acknowledge` | OFFICER+ |
| POST | `/api/v1/alerts/{id}/action` | OFFICER+ |
| GET | `/api/v1/alerts/project/{id}/mitigations` | AUDITOR+ |

### Notifications
| Method | Path | Auth Required |
|--------|------|--------------|
| GET | `/api/v1/notifications/` | Any authenticated |
| GET | `/api/v1/notifications/unread-count` | Any authenticated |
| POST | `/api/v1/notifications/{id}/read` | Any authenticated |
| POST | `/api/v1/notifications/read-all` | Any authenticated |

### Admin
| Method | Path | Auth Required |
|--------|------|--------------|
| GET | `/api/v1/admin/users` | ADMIN |
| POST | `/api/v1/admin/users` | ADMIN |
| GET | `/api/v1/admin/thresholds` | ADMIN |
| PUT | `/api/v1/admin/thresholds` | ADMIN |
| GET | `/api/v1/admin/ml-status` | ADMIN |

### Audit
| Method | Path | Auth Required |
|--------|------|--------------|
| GET | `/api/v1/audit/` | AUDITOR+ |
| GET | `/api/v1/audit/{log_id}` | AUDITOR+ |

---

## Environment Variables

See `.env.example` for all variables. Critical ones:

```bash
DATABASE_URL=postgresql+asyncpg://user:pass@host:5432/dbname
JWT_SECRET_KEY=<min-32-chars-random>
ML_MODEL_PATH=/app/models/land_acquisition_delay_model.pkl
ML_DECISION_THRESHOLD=0.375
ML_SERVICE_URL=                     # leave blank to use local artifact
SMTP_HOST=smtp.example.com
ALLOWED_ORIGINS=http://localhost:3000
```

---

## Testing

```bash
# Run all backend tests inside Docker container
docker exec bhoomisanket-backend-1 bash -c "cd /app && PYTHONPATH=/app pytest tests/ -v"

# Or if running backend locally
cd backend
PYTHONPATH=. pytest tests/ -v

# Frontend type checking
cd frontend && npm run type-check

# Frontend build verification
cd frontend && npm run build
```

### Test Coverage

| Test | Description | Status |
|------|-------------|--------|
| `test_model_loading` | RF artifact loads, is_loaded=True | ✅ |
| `test_canonical_features_specification` | 41 features: 6 cat + 35 num | ✅ |
| `test_predictor_threshold_and_risk_mapping` | threshold=0.375, risk categories | ✅ |
| `test_prediction_inference_structure` | Real RF inference, prob in [0,1], is_mock=False | ✅ |
| `test_auth_login_and_roles` | All 4 roles + invalid credentials | ✅ |
| `test_projects_rbac_and_detail` | AUDITOR read-only, stages, snapshots, 404 | ✅ |

---

## Milestone Status

| Milestone | Status | Description |
|-----------|--------|-------------|
| M1 | ✅ Done | Project skeleton, Docker, FastAPI, Next.js |
| M2 | ✅ Done | Database models, PostGIS, migrations |
| M3 | ✅ Done | Synthetic demo data (~250 projects, SYNTHETIC_DEMO labeled) |
| M4 | ✅ Done | Auth, JWT, RBAC (ADMIN/OFFICER/ANALYST/AUDITOR) |
| M5 | ✅ Done | Project detail API stabilization, AUDITOR read-only routes |
| M6 | ✅ Done | RF model artifact integration, 41-feature pipeline, threshold=0.375 |
| M7 | ✅ Done | Frontend integration (login, dashboard, projects, alerts, ML predictions) |
| M8 | ✅ Done | Alerts acknowledge, mitigation logging, notifications, admin, audit APIs |
| M9 | ✅ Done | Integration tests (6/6 pass), E2E verification, documentation |

---

## Synthetic Data Notice

All project data, district names, compensation amounts, legal case counts, and officer names
in the demo database are **synthetically generated**. Labels:

- Database records: `data_source = 'SYNTHETIC_DEMO'`
- Predictions generated with `is_mock = False` (real RF inference) but inputs are synthetic

**Do not** use this data to claim, validate, or benchmark the RF model's performance.

---

## License

This project is developed for Smart India Hackathon 2026 (SIH26017).