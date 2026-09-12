import pytest
from httpx import AsyncClient
from app.main import app
from app.core.config import settings


@pytest.mark.asyncio(loop_scope="session")
async def test_auth_login_and_roles():
    """Verify login for all 4 roles and invalid credentials handling."""
    from httpx import ASGITransport
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        # Invalid credentials
        res = await ac.post("/api/v1/auth/login", data={"username": "wrong@user.com", "password": "bad"})
        assert res.status_code == 401

        # Admin login
        res_admin = await ac.post("/api/v1/auth/login", data={"username": "admin@bhoomisanket.gov.in", "password": "password"})
        assert res_admin.status_code == 200
        tokens_admin = res_admin.json()
        assert "access_token" in tokens_admin

        # Officer login
        res_officer = await ac.post("/api/v1/auth/login", data={"username": "officer@bhoomisanket.gov.in", "password": "password"})
        assert res_officer.status_code == 200

        # Analyst login
        res_analyst = await ac.post("/api/v1/auth/login", data={"username": "analyst@bhoomisanket.gov.in", "password": "password"})
        assert res_analyst.status_code == 200

        # Auditor login
        res_auditor = await ac.post("/api/v1/auth/login", data={"username": "auditor@bhoomisanket.gov.in", "password": "password"})
        assert res_auditor.status_code == 200


@pytest.mark.asyncio(loop_scope="session")
async def test_projects_rbac_and_detail():
    """Verify projects list, detail, stages, snapshots and 404 behavior."""
    from httpx import ASGITransport
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        # Unauthenticated access rejected
        unauth_res = await ac.get("/api/v1/projects/1")
        assert unauth_res.status_code == 401

        # Auditor read-only access allowed
        res_auditor = await ac.post("/api/v1/auth/login", data={"username": "auditor@bhoomisanket.gov.in", "password": "password"})
        token_auditor = res_auditor.json()["access_token"]
        headers_auditor = {"Authorization": f"Bearer {token_auditor}"}

        # Project 1 detail
        p_res = await ac.get("/api/v1/projects/1", headers=headers_auditor)
        assert p_res.status_code == 200
        p_data = p_res.json()
        assert p_data["id"] == 1
        assert len(p_data["stages"]) > 0
        assert len(p_data["snapshots"]) > 0

        # Project stages
        stages_res = await ac.get("/api/v1/projects/1/stages", headers=headers_auditor)
        assert stages_res.status_code == 200
        assert len(stages_res.json()) > 0

        # Project snapshots
        snaps_res = await ac.get("/api/v1/projects/1/snapshots", headers=headers_auditor)
        assert snaps_res.status_code == 200
        assert len(snaps_res.json()) > 0

        # Non-existent project
        not_found_res = await ac.get("/api/v1/projects/999999", headers=headers_auditor)
        assert not_found_res.status_code == 404


@pytest.mark.asyncio(loop_scope="session")
async def test_live_prediction_endpoint():
    """Verify live prediction endpoint with analyst role returns real RF inference."""
    from httpx import ASGITransport
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        # Login as analyst
        res_login = await ac.post("/api/v1/auth/login", data={"username": "analyst@bhoomisanket.gov.in", "password": "password"})
        assert res_login.status_code == 200
        token = res_login.json()["access_token"]
        headers = {"Authorization": f"Bearer {token}"}

        # Predict on project 1
        res = await ac.post("/api/v1/predictions/1", json={"project_id": 1, "force_refresh": True}, headers=headers)
        assert res.status_code == 200
        data = res.json()
        assert data["project_id"] == 1
        assert data["model_name"] == "RandomForestClassifier"
        assert data["threshold"] == 0.375
        assert data["is_mock"] is False
        assert data["is_stale"] is False
        assert data["status"] == "success"
        assert 0.0 <= data["probability"] <= 1.0


@pytest.mark.asyncio(loop_scope="session")
async def test_analytics_and_gis_endpoints():
    """Verify live SQL aggregation endpoints for analytics and GIS."""
    from httpx import ASGITransport
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        res_login = await ac.post("/api/v1/auth/login", data={"username": "officer@bhoomisanket.gov.in", "password": "password"})
        token = res_login.json()["access_token"]
        headers = {"Authorization": f"Bearer {token}"}

        # State analytics
        res_state = await ac.get("/api/v1/analytics/state", headers=headers)
        assert res_state.status_code == 200
        states = res_state.json()
        assert len(states) > 0
        assert "state" in states[0]
        assert "total_projects" in states[0]

        # District analytics
        res_dist = await ac.get("/api/v1/analytics/district", headers=headers)
        assert res_dist.status_code == 200
        districts = res_dist.json()
        assert len(districts) > 0

        # Project type analytics
        res_types = await ac.get("/api/v1/analytics/project-types", headers=headers)
        assert res_types.status_code == 200
        types_data = res_types.json()
        assert len(types_data) > 0

        # Analytics summary
        res_sum = await ac.get("/api/v1/analytics/summary", headers=headers)
        assert res_sum.status_code == 200
        sum_data = res_sum.json()
        assert sum_data["total_projects"] >= 250

        # GIS projects GeoJSON
        res_gis = await ac.get("/api/v1/gis/projects", headers=headers)
        assert res_gis.status_code == 200
        gis_data = res_gis.json()
        assert gis_data["type"] == "FeatureCollection"
        assert gis_data["total"] > 0
        feature = gis_data["features"][0]
        assert feature["geometry"]["type"] == "Point"
        assert len(feature["geometry"]["coordinates"]) == 2


@pytest.mark.asyncio(loop_scope="session")
async def test_admin_ml_status_endpoint():
    """Verify admin-only ML status and system health."""
    from httpx import ASGITransport
    transport = ASGITransport(app=app)
    async with AsyncClient(transport=transport, base_url="http://test") as ac:
        # Officer should be forbidden from admin
        res_off = await ac.post("/api/v1/auth/login", data={"username": "officer@bhoomisanket.gov.in", "password": "password"})
        token_off = res_off.json()["access_token"]
        res_forbid = await ac.get("/api/v1/admin/ml-status", headers={"Authorization": f"Bearer {token_off}"})
        assert res_forbid.status_code == 403

        # Admin login
        res_admin = await ac.post("/api/v1/auth/login", data={"username": "admin@bhoomisanket.gov.in", "password": "password"})
        token_admin = res_admin.json()["access_token"]
        headers_admin = {"Authorization": f"Bearer {token_admin}"}

        # Admin ML status
        res_ml = await ac.get("/api/v1/admin/ml-status", headers=headers_admin)
        assert res_ml.status_code == 200
        ml_data = res_ml.json()
        assert ml_data["status"] == "healthy"
        assert ml_data["classifier"] == "RandomForestClassifier"
        assert ml_data["n_estimators"] == 200
        assert ml_data["decision_threshold"] == 0.375
        assert ml_data["has_200_trees"] is True
