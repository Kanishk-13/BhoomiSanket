# BhoomiSanket (भूमि संकेत)

**SIH Problem Statement**: SIH26017 — Predictive Analytics for Early Detection of Land Acquisition Delays

> ⚠️ **SYNTHETIC DATA DISCLAIMER**  
> All project data, district metrics, compensation records, legal counts, and personnel in this repository are **synthetically generated** for demonstration, interface development, and research validation. They do NOT represent real government land acquisition records, confidential files, or live district personnel.

---

## 1. Overview & Problem Statement

Land acquisition for public infrastructure in India (highways, railways, transmission corridors, airports, and smart industrial nodes) is governed by statutory frameworks such as RFCTLARR Act, 2013 and state-specific amendments. Key hurdles—ranging from social impact assessments (SIA) and preliminary notifications to objection hearings, compensation disbursements, R&R settlements, and judicial stay orders—often compound into multi-year project delays and significant budget escalations.

**BhoomiSanket** is an enterprise-grade AI decision support platform that delivers early risk detection, statutory stage bottleneck monitoring, and automated mitigation planning. Powered by a trained Random Forest model integrated with a PostGIS geospatial database and an interactive Next.js dashboard, BhoomiSanket enables administrators, project officers, and policy analysts to intervene proactively before delays turn critical.

---

## 2. Key Features

- **Trained Random Forest Inference**: Real-time delay probability scoring evaluated against an optimized decision threshold (**0.375**) tuned for high recall.
- **41-Feature Statutory Contract**: Standardized data ingestion pipeline supporting 6 categorical and 35 numerical indicators, expanded to 93 transformed features.
- **Explainable AI (XAI)**: Feature contribution breakdown identifying the root causes of predicted delays (e.g., pending stay orders, lagging compensation disbursement, forest clearance bottlenecks).
- **Automated Mitigation Engine**: Prioritized mitigation recommendations mapped to specific statutory acquisition stages.
- **Interactive PostGIS Map**: Spatial project visualization with CartoDB Positron basemap and risk-coded geospatial markers.
- **Macro Analytics Dashboard**: Instant aggregation of project volumes, risk distributions, and cost burdens by state, district, and project type.
- **Role-Based Access Control (RBAC)**: Fine-grained security supporting `ADMIN`, `OFFICER`, `ANALYST`, and `AUDITOR` workflows with JWT and refresh token rotation.
- **Immutable Audit Logging**: Comprehensive tracking of all authentication events, predictions, alert acknowledgments, and administrative actions.
- **High-Availability Fallback Hierarchy**: Seamless resilience strategy falling back from local RF model to external inference, deterministic mock calculation, or cached predictions.

---

## 3. System Architecture

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

Detailed architecture specifications can be found in [docs/architecture.md](docs/architecture.md).

---

## 4. Machine Learning Pipeline & Contract

The application loads a pre-trained scikit-learn Pipeline artifact and operates strictly in inference mode.

- **Model Artifact**: `backend/app/ml/models/model.joblib` (20.8 MB)
- **Threshold Config**: `backend/app/ml/models/threshold.json`
- **Algorithm**: `RandomForestClassifier` (`n_estimators=200`, `class_weight='balanced'`, `random_state=42`)
- **Scikit-Learn Version**: `1.6.1`
- **Input Contract**: 41 canonical features (6 categorical, 35 numerical)
- **Transformed Feature Dimension**: 93 features (after one-hot encoding, imputation, and scaling)
- **Decision Threshold**: **0.375** (projects with probability $\ge 0.375$ are flagged as delayed)
- **Test Set Evaluation Metrics**:
  - **ROC-AUC**: `0.8337`
  - **Optimized F1**: `0.6914`
  - **Optimized Recall**: `0.7412`

For full details on feature schemas, model diagnostics, and fallback hierarchy, refer to [docs/ml-pipeline.md](docs/ml-pipeline.md).

---

## 5. Technology Stack

| Layer | Technologies |
|-------|--------------|
| **Frontend** | Next.js 14 (App Router), React 18, TypeScript, Tailwind CSS, Lucide Icons, Recharts |
| **Backend** | FastAPI, Python 3.11, Uvicorn, SQLAlchemy 2.0 (asyncio), Pydantic v2 |
| **Database** | PostgreSQL 15 + PostGIS 3.4 (`asyncpg`, `GeoAlchemy2`) |
| **Mapping & GIS** | Leaflet, React-Leaflet, CartoDB Positron tiles, GeoJSON |
| **Machine Learning** | Scikit-learn 1.6.1, Joblib, NumPy, Pandas |
| **Security & Auth** | OAuth2 Password Request Form, JWT (HS256), Passlib (Bcrypt) |
| **Containerization** | Docker, Docker Compose |

---

## 6. Project Structure

```
BhoomiSanket/
├── backend/
│   ├── app/
│   │   ├── api/v1/          # REST endpoints (auth, projects, predictions, alerts, etc.)
│   │   ├── core/            # Config, security, exceptions
│   │   ├── db/              # SQLAlchemy models, async session, initial seed
│   │   ├── ml/
│   │   │   ├── models/      # model.joblib (20.8MB) & threshold.json (0.375)
│   │   │   ├── model_loader.py  # Singleton artifact loader & diagnostics
│   │   │   ├── predictor.py     # 41-feature contract & inference executor
│   │   │   ├── schemas.py       # Pydantic ML request/response schemas
│   │   │   └── mock_stub.py     # Deterministic heuristic fallback
│   │   ├── services/        # Prediction fallback orchestration & notification services
│   │   ├── dependencies.py  # RBAC guards (require_admin, require_officer, etc.)
│   │   └── main.py          # FastAPI application & startup lifecycle
│   ├── tests/               # Pytest suite (11 test cases)
│   ├── Dockerfile
│   └── requirements.txt     # Python runtime dependencies
├── frontend/
│   ├── src/
│   │   ├── app/             # Next.js 14 App Router routes (14 static & dynamic pages)
│   │   ├── components/      # UI components, layout, charts, map components
│   │   ├── lib/             # Axios API client, Zustand stores, auth guard hook
│   │   └── types/           # TypeScript interface definitions
│   ├── Dockerfile
│   └── package.json
├── docs/                    # Technical documentation
│   ├── architecture.md
│   ├── ml-pipeline.md
│   ├── api.md
│   └── development.md
├── docker-compose.yml
├── .env.example
├── .gitignore
└── README.md
```

---

## 7. Quick Start (Docker Compose)

### 7.1 Launching the Platform

```bash
# 1. Clone repository
git clone https://github.com/Kanishk-13/BhoomiSanket.git
cd BhoomiSanket

# 2. Configure environment
cp .env.example .env

# 3. Build and launch all containers
docker compose build
docker compose up -d
```

### 7.2 Access Endpoints

- **Web Dashboard**: [http://localhost:3000](http://localhost:3000)
- **FastAPI Documentation**: [http://localhost:8000/docs](http://localhost:8000/docs)
- **API Health Check**: [http://localhost:8000/api/v1/health/](http://localhost:8000/api/v1/health/)

---

## 8. Demo Credentials

The database automatically seeds standard demo accounts:

| Role | Email | Password | Intended Capabilities |
|------|-------|----------|-----------------------|
| `ADMIN` | `admin@bhoomisanket.gov.in` | `password` | User management, risk thresholds, ML diagnostic status |
| `OFFICER` | `officer@bhoomisanket.gov.in` | `password` | Project review, trigger ML predictions, acknowledge alerts, log mitigations |
| `ANALYST` | `analyst@bhoomisanket.gov.in` | `password` | Project inspection, on-demand ML predictions, analytics & GIS views |
| `AUDITOR` | `auditor@bhoomisanket.gov.in` | `password` | Complete read-only access to all projects, predictions, alerts, and audit logs |

---

## 9. Verification & Testing

### 9.1 Backend Test Suite (Pytest)
```bash
docker exec bhoomisanket-backend-1 pytest -v
```
All **11 tests pass**, verifying:
- Authentication & JWT issuance across all 4 roles.
- RBAC permissions on project listings, stages, and snapshots.
- Real Random Forest model inference (`is_mock=False`, `is_stale=False`, `model_file_exists=True`).
- 41-feature canonical contract and 0.375 decision threshold.
- PostGIS spatial query and analytical aggregation endpoints.
- Diagnostic ML health endpoint (`/api/v1/admin/ml-status`).

### 9.2 Frontend Production Build
```bash
cd frontend && npm run build
```
Generates **14/14 optimized routes** with zero compilation errors.

---

## 10. Project & ML Model Limitations

1. **Synthetic Data**: Demonstrated projects and district metrics are generated synthetically; real-world deployment requires integration with state revenue portals (e.g., Bhoomi, Bhulekh, MahaBhumi).
2. **Tabular Scope**: The model evaluates numerical and statutory stage indicators; it does not currently ingest satellite imagery or unstructured legal PDFs directly.
3. **Regional Adaptation**: The current pre-trained artifact reflects synthesized patterns across 5 states; fine-tuning may be necessary for specific regional legal provisions.

---

## 11. License & Disclaimers

Developed for **Smart India Hackathon (SIH26017)**.  
Released under the MIT License.