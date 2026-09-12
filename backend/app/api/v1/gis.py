from typing import Optional
from fastapi import APIRouter, Depends, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func, distinct
from app.db.database import get_db
from app.db.models import Project, RiskPrediction
from app.dependencies import get_current_user

router = APIRouter()


@router.get("/projects")
async def get_projects_geodata(
    state: Optional[str] = Query(None),
    risk_category: Optional[str] = Query(None),
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """
    Return GeoJSON FeatureCollection of all projects with coordinates,
    including latest risk prediction, project type, stage, and metadata.
    """
    # Subquery for latest prediction per project
    latest_pred_subq = (
        select(
            RiskPrediction.project_id,
            RiskPrediction.risk_category,
            RiskPrediction.delay_probability,
            func.row_number()
            .over(
                partition_by=RiskPrediction.project_id,
                order_by=RiskPrediction.requested_at.desc(),
            )
            .label("rn"),
        )
    ).subquery()

    query = (
        select(
            Project.id,
            Project.name,
            Project.project_type,
            Project.state,
            Project.district,
            Project.current_stage,
            Project.status,
            Project.land_area_ha,
            Project.affected_families,
            Project.latitude,
            Project.longitude,
            latest_pred_subq.c.risk_category,
            latest_pred_subq.c.delay_probability,
        )
        .outerjoin(
            latest_pred_subq,
            (latest_pred_subq.c.project_id == Project.id) & (latest_pred_subq.c.rn == 1),
        )
        .where(Project.latitude.is_not(None))
        .where(Project.longitude.is_not(None))
    )

    if state:
        query = query.where(Project.state == state)
    if risk_category:
        query = query.where(latest_pred_subq.c.risk_category == risk_category)

    result = await db.execute(query)
    rows = result.fetchall()

    features = []
    for r in rows:
        lat = float(r.latitude) if r.latitude else None
        lng = float(r.longitude) if r.longitude else None
        prob = float(r.delay_probability) if r.delay_probability is not None else 0.0
        risk_cat = r.risk_category or "low"

        features.append({
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [lng, lat],
            },
            "properties": {
                "id": r.id,
                "name": r.name,
                "project_type": r.project_type,
                "state": r.state,
                "district": r.district,
                "current_stage": r.current_stage,
                "status": r.status,
                "land_area_ha": float(r.land_area_ha) if r.land_area_ha else None,
                "affected_families": r.affected_families,
                "risk_category": risk_cat,
                "delay_probability": round(prob, 4),
            },
        })

    return {
        "type": "FeatureCollection",
        "features": features,
        "total": len(features),
    }


@router.get("/meta/filters")
async def get_gis_filters(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Return available states and project types for map filtering."""
    states_res = await db.execute(
        select(distinct(Project.state)).where(Project.state.is_not(None)).order_by(Project.state)
    )
    states = [s[0] for s in states_res.fetchall()]

    types_res = await db.execute(
        select(distinct(Project.project_type)).where(Project.project_type.is_not(None)).order_by(Project.project_type)
    )
    project_types = [t[0] for t in types_res.fetchall()]

    return {
        "states": states,
        "project_types": project_types,
    }