# BhoomiSanket — Developer & Local Setup Guide

## 1. Prerequisites

- **Docker & Docker Compose** (Docker 24+, Compose v2)
- **Node.js 18+** & `npm` (for frontend development)
- **Python 3.11** (for local backend development)
- **Git**

---

## 2. Quick Start with Docker Compose

The simplest and recommended way to run the entire BhoomiSanket platform is via Docker Compose.

```bash
# 1. Clone repository
git clone https://github.com/Kanishk-13/BhoomiSanket.git
cd BhoomiSanket

# 2. Setup environment configuration
cp .env.example .env

# 3. Build and launch all services
docker compose build
docker compose up -d

# 4. View logs
docker compose logs -f
```

### Verified Service URLs:
- **Frontend App**: `http://localhost:3000`
- **FastAPI Documentation**: `http://localhost:8000/docs`
- **FastAPI Health Check**: `http://localhost:8000/api/v1/health/`
- **PostgreSQL / PostGIS**: `localhost:5432` (`bhoomi_sanket` DB)

---

## 3. Seed Accounts & Roles

On first startup, the database automatically seeds four demo user accounts:

| Role | Email | Password | Allowed Capabilities |
|------|-------|----------|----------------------|
| `ADMIN` | `admin@bhoomisanket.gov.in` | `password` | Full system access, user management, ML diagnostic view |
| `OFFICER` | `officer@bhoomisanket.gov.in` | `password` | View projects, trigger ML predictions, acknowledge alerts & log mitigations |
| `ANALYST` | `analyst@bhoomisanket.gov.in` | `password` | View projects, run on-demand predictions, view analytics & map |
| `AUDITOR` | `auditor@bhoomisanket.gov.in` | `password` | Read-only access to all projects, predictions, alerts, and audit logs |

---

## 4. Local Development Without Docker

### 4.1 Backend (FastAPI)
```bash
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Start FastAPI development server
uvicorn app.main:app --reload --port 8000
```

### 4.2 Frontend (Next.js)
```bash
cd frontend
npm install
npm run dev
# Running on http://localhost:3000
```

---

## 5. Running the Test Suites

### 5.1 Backend Pytest Suite
```bash
# Running inside Docker container
docker exec bhoomisanket-backend-1 pytest -v

# Running locally
cd backend
pytest -v
```

Expected result: **11 passed**.

### 5.2 Frontend Build & Typecheck
```bash
cd frontend
npm run build
```

Expected result: **14/14 static and dynamic routes compiled successfully**.
