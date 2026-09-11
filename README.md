# BhoomiSanket

**SIH Problem**: SIH26017 — Predictive Analytics for Early Detection of Land Acquisition Delays

> ⚠ **SYNTHETIC DATA DISCLAIMER**
> The data used in this application is synthetically generated for demonstration and application UI development purposes only.
> It does not represent any real government land acquisition project, district, or individual.
> It must not be presented as real government data under any circumstances.
> **It is NOT an ML training dataset. It cannot be used to claim or validate model performance.**

## Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌──────────────────┐
│   Next.js 14    │────▶│   FastAPI       │────▶│  PostgreSQL      │
│   (Vercel)      │     │   (Railway)     │     │  + PostGIS       │
│                 │     │                 │     │  (Supabase)      │
└─────────────────┘     └────────┬────────┘     └──────────────────┘
                                 │
                    ┌────────────▼────────────┐
                    │   ML Integration Layer  │
                    │  - client.py            │
                    │  - mock_stub.py         │
                    │  - schemas/prediction.py│
                    └────────────┬────────────┘
                                 │ HTTP
                    ┌────────────▼────────────┐
                    │  External ML Service    │
                    │  (Separate, trained     │
                    │   model — XGBoost/      │
                    │   LightGBM/etc.)        │
                    └─────────────────────────┘
```

## Project Structure

```
BhoomiSanket/
├── backend/
│   ├── app/
│   │   ├── api/v1/           # API routes (auth, projects, dashboard, predictions, etc.)
│   │   ├── core/             # Config, security, exceptions
│   │   ├── db/               # Database models, connection
│   │   ├── ml/               # ML client, mock stub, schemas
│   │   ├── schemas/          # Pydantic schemas
│   │   ├── services/         # Business logic layer
│   │   ├── repositories/     # Data access layer
│   │   ├── dependencies.py   # FastAPI dependencies (auth, RBAC)
│   │   └── main.py           # FastAPI application
│   ├── tests/
│   ├── alembic/              # Database migrations
│   ├── requirements.txt
│   └── Dockerfile
├── frontend/
│   ├── src/
│   │   ├── app/              # Next.js App Router pages
│   │   │   ├── (auth)/login  # Login page
│   │   │   └── (dashboard)/  # Protected dashboard routes
│   │   ├── components/       # React components
│   │   │   ├── ui/           # Base UI components
│   │   │   ├── layout/       # Layout components (Sidebar, Header)
│   │   │   ├── charts/       # Chart components
│   │   │   └── map/          # Map components
│   │   ├── lib/              # Utilities (API client, auth store)
│   │   ├── hooks/            # Custom React hooks
│   │   ├── types/            # TypeScript types
│   │   └── styles/           # Global styles
│   ├── package.json
│   ├── tailwind.config.ts
│   ├── next.config.js
│   └── Dockerfile
├── docker-compose.yml
├── .env.example
└── README.md
```

## Technology Stack

| Layer | Technology |
|-------|------------|
| Frontend | Next.js 14, React 18, TypeScript, Tailwind CSS |
| Backend | FastAPI, Python 3.11, SQLAlchemy 2.0 (async) |
| Database | PostgreSQL 15 + PostGIS 3.4 |
| Maps | Leaflet + react-leaflet, CartoDB Positron basemap |
| Auth | JWT (HS256), bcrypt, refresh token rotation |
| ML | External HTTP inference service + deterministic mock |
| Email | aiosmtplib + FastAPI BackgroundTasks |
| Hosting | Vercel (frontend), Railway (backend), Supabase (DB) |

## Features (MVP)

- ✅ Authentication (JWT + refresh tokens)
- ✅ Role-based access control (ADMIN, OFFICER, ANALYST, AUDITOR)
- ✅ Project portfolio dashboard
- ✅ Project listing with filters
- ✅ Project details (placeholder)
- ✅ Risk probability/category display (mock)
- ✅ Stage-wise predictions (mock)
- ✅ Contributing factors/explanations (mock)
- ✅ Recommendations (mock)
- ✅ GIS map with risk visualization (placeholder)
- ✅ District/state analytics (placeholder)
- ✅ Alerts with acknowledgment
- ✅ In-app notifications
- ✅ Email notification capability
- ✅ Minimal Admin panel
- ✅ Audit logs
- ✅ External ML integration contract
- ✅ Deterministic mock ML service
- ✅ Synthetic demo data (~250 projects)
- ✅ API documentation (OpenAPI/Swagger)
- ✅ Error handling
- ✅ Deployment configuration

## How to Run Locally

### Prerequisites
- Docker & Docker Compose
- Node.js 20+ (for frontend development)
- Python 3.11+ (for backend development)

### Using Docker Compose (Recommended)

1. Copy environment file:
   ```bash
   cp .env.example .env
   ```

2. Start all services:
   ```bash
   docker-compose up --build
   ```

3. Access:
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
   - API Docs: http://localhost:8000/docs

### Frontend Development (Host Machine)

```bash
cd frontend
npm install
npm run dev
# Available at http://localhost:3000
```

### Backend Development (Host Machine)

```bash
cd backend
pip install -r requirements.txt
# Requires PostgreSQL running (use docker-compose up db)
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

## Environment Variables

See `.env.example` for all required variables. Key variables:

| Variable | Description |
|----------|-------------|
| `DATABASE_URL` | PostgreSQL connection string (asyncpg) |
| `JWT_SECRET_KEY` | Secret key for JWT signing (min 32 chars) |
| `ML_SERVICE_URL` | External ML inference API URL (empty = mock) |
| `SMTP_HOST` | SMTP server for email notifications |
| `ALLOWED_ORIGINS` | CORS allowed origins |

## Demo Credentials (M4)

| Role | Email | Password |
|------|-------|----------|
| ADMIN | admin@bhoomisanket.gov.in | password |
| OFFICER | officer@bhoomisanket.gov.in | password |
| ANALYST | analyst@bhoomisanket.gov.in | password |
| AUDITOR | auditor@bhoomisanket.gov.in | password |

## ML Integration

### Request Contract
```json
{
  "project_id": 123,
  "features": { "feature_name": "value" },
  "feature_schema_version": "1.0",
  "observation_timestamp": "2024-01-15T10:30:00Z"
}
```

### Response Contract
```json
{
  "project_id": 123,
  "model_version": "xgboost-v2.1",
  "delay_probability": 0.87,
  "risk_category": "high",
  "risk_score": 0.87,
  "stage_predictions": [...],
  "explanations": [...],
  "recommendations": [...],
  "prediction_timestamp": "2024-01-15T10:30:00Z",
  "is_mock": false
}
```

### Fallback Handling
- **STALE**: Previous prediction exists → show with stale badge
- **MODEL UNAVAILABLE**: No previous prediction → show unavailable message

## Deployment

### Production
- **Frontend**: Vercel (connect GitHub repo)
- **Backend**: Railway (connect GitHub repo)
- **Database**: Supabase (PostgreSQL + PostGIS)
- **ML Service**: External inference API

### Environment Variables (Production)
Set all variables from `.env.example` in your hosting platform.

## Development Milestones

| Milestone | Status | Description |
|-----------|--------|-------------|
| M1 | ✅ Done | Project skeleton, Docker, FastAPI, Next.js |
| M2 | 🔄 Next | Database models, migrations, constraints |
| M3 | ⏳ Pending | Synthetic demo data (~250 projects) |
| M4 | ⏳ Pending | Auth, JWT, RBAC, project APIs |
| M5 | ⏳ Pending | ML integration, mock, prediction API |
| M6 | ⏳ Pending | Dashboard, GIS, alerts, admin, audit APIs |
| M7 | ⏳ Pending | Frontend foundation, auth flow, UI components |
| M8 | ⏳ Pending | Frontend pages (Dashboard, Projects, Map, etc.) |
| M9 | ⏳ Pending | Integration tests, bug fixes, documentation |

## Testing

```bash
# Backend tests
cd backend
pytest

# Frontend type checking
cd frontend
npm run type-check

# Frontend linting
cd frontend
npm run lint
```

## License

This project is developed for Smart India Hackathon 2026 (SIH26017).