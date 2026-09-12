from typing import Optional, List
from fastapi import APIRouter, Depends, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func, case, desc
from app.db.database import get_db
from app.db.models import Project, RiskPrediction, ProjectDataSnapshot
from app.dependencies import get_current_user

router = APIRouter()


@router.get("/state")
async def get_state_analytics(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Return state-level aggregated project counts, land area, affected families, and risk distributions."""
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
            Project.state,
            func.count(Project.id).label("total_projects"),
            func.coalesce(func.sum(Project.land_area_ha), 0).label("total_land_ha"),
            func.coalesce(func.sum(Project.affected_families), 0).label("total_affected_families"),
            func.avg(latest_pred_subq.c.delay_probability).label("avg_delay_probability"),
            func.count(case((latest_pred_subq.c.risk_category == "critical", 1))).label("critical_count"),
            func.count(case((latest_pred_subq.c.risk_category == "high", 1))).label("high_count"),
            func.count(case((latest_pred_subq.c.risk_category == "medium", 1))).label("medium_count"),
            func.count(case((latest_pred_subq.c.risk_category == "low", 1))).label("low_count"),
        )
        .outerjoin(
            latest_pred_subq,
            (latest_pred_subq.c.project_id == Project.id) & (latest_pred_subq.c.rn == 1),
        )
        .where(Project.state.is_not(None))
        .group_by(Project.state)
        .order_by(desc("total_projects"))
    )

    result = await db.execute(query)
    rows = result.fetchall()

    return [
        {
            "state": r.state,
            "total_projects": r.total_projects,
            "total_land_ha": round(float(r.total_land_ha), 2),
            "total_affected_families": int(r.total_affected_families),
            "avg_delay_probability": round(float(r.avg_delay_probability), 4) if r.avg_delay_probability else 0.0,
            "risk_distribution": {
                "critical": r.critical_count,
                "high": r.high_count,
                "medium": r.medium_count,
                "low": r.low_count,
            },
        }
        for r in rows
    ]


@router.get("/district")
async def get_district_analytics(
    state: Optional[str] = Query(None),
    limit: int = Query(25, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Return district-level comparison metrics."""
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
            Project.state,
            Project.district,
            func.count(Project.id).label("total_projects"),
            func.coalesce(func.sum(Project.land_area_ha), 0).label("total_land_ha"),
            func.avg(latest_pred_subq.c.delay_probability).label("avg_delay_probability"),
            func.count(case((latest_pred_subq.c.risk_category == "critical", 1))).label("critical_count"),
            func.count(case((latest_pred_subq.c.risk_category == "high", 1))).label("high_count"),
        )
        .outerjoin(
            latest_pred_subq,
            (latest_pred_subq.c.project_id == Project.id) & (latest_pred_subq.c.rn == 1),
        )
        .where(Project.district.is_not(None))
    )

    if state:
        query = query.where(Project.state == state)

    query = query.group_by(Project.state, Project.district).order_by(desc("total_projects")).limit(limit)

    result = await db.execute(query)
    rows = result.fetchall()

    return [
        {
            "state": r.state,
            "district": r.district,
            "total_projects": r.total_projects,
            "total_land_ha": round(float(r.total_land_ha), 2),
            "avg_delay_probability": round(float(r.avg_delay_probability), 4) if r.avg_delay_probability else 0.0,
            "critical_projects": r.critical_count,
            "high_risk_projects": r.high_count,
        }
        for r in rows
    ]


@router.get("/project-types")
async def get_project_type_analytics(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Return risk and delay metrics grouped by project type (Highway, Expressway, Metro, etc.)."""
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
            Project.project_type,
            func.count(Project.id).label("total_projects"),
            func.avg(latest_pred_subq.c.delay_probability).label("avg_delay_probability"),
            func.count(case((latest_pred_subq.c.risk_category == "critical", 1))).label("critical_count"),
            func.count(case((latest_pred_subq.c.risk_category == "high", 1))).label("high_count"),
            func.count(case((latest_pred_subq.c.risk_category == "medium", 1))).label("medium_count"),
            func.count(case((latest_pred_subq.c.risk_category == "low", 1))).label("low_count"),
        )
        .outerjoin(
            latest_pred_subq,
            (latest_pred_subq.c.project_id == Project.id) & (latest_pred_subq.c.rn == 1),
        )
        .where(Project.project_type.is_not(None))
        .group_by(Project.project_type)
        .order_by(desc("total_projects"))
    )

    result = await db.execute(query)
    rows = result.fetchall()

    return [
        {
            "project_type": r.project_type,
            "total_projects": r.total_projects,
            "avg_delay_probability": round(float(r.avg_delay_probability), 4) if r.avg_delay_probability else 0.0,
            "risk_distribution": {
                "critical": r.critical_count,
                "high": r.high_count,
                "medium": r.medium_count,
                "low": r.low_count,
            },
        }
        for r in rows
    ]


@router.get("/summary")
async def get_analytics_summary(
    db: AsyncSession = Depends(get_db),
    current_user: dict = Depends(get_current_user),
):
    """Return top-level portfolio KPIs: total land area, total families, average progress."""
    result = await db.execute(
        select(
            func.count(Project.id).label("total_projects"),
            func.coalesce(func.sum(Project.land_area_ha), 0).label("total_land_area_ha"),
            func.coalesce(func.sum(Project.affected_families), 0).label("total_affected_families"),
        )
    )
    row = result.fetchone()

    return {
        "total_projects": row.total_projects if row else 0,
        "total_land_area_ha": round(float(row.total_land_area_ha), 2) if row else 0.0,
        "total_affected_families": int(row.total_affected_families) if row else 0,
    }