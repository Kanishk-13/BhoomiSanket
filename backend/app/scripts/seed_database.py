#!/usr/bin/env python3
"""
Database Seeder for BhoomiSanket

Seeds the database with synthetic demo data.
Run inside the backend container or locally with DATABASE_URL set.
"""

import asyncio
import os
import sys
import uuid
from datetime import date, timedelta
from dotenv import load_dotenv

# Load .env from project root
project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
load_dotenv(os.path.join(project_root, '.env'))

# Add parent directory to path
sys.path.insert(0, project_root)

from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker
from sqlalchemy import text

from app.db.models import (
    User, Project, ProjectStage, ProjectDataSnapshot, 
    RiskPrediction, Alert, AlertSetting, SystemConfig
)
from app.core.config import settings


# Demo users
DEMO_USERS = [
    {
        "email": "admin@bhoomisanket.gov.in",
        "display_name": "Admin User",
        "role": "ADMIN",
        "password": "password",
    },
    {
        "email": "officer@bhoomisanket.gov.in",
        "display_name": "Officer User",
        "role": "OFFICER",
        "password": "password",
    },
    {
        "email": "analyst@bhoomisanket.gov.in",
        "display_name": "Analyst User",
        "role": "ANALYST",
        "password": "password",
    },
    {
        "email": "auditor@bhoomisanket.gov.in",
        "display_name": "Auditor User",
        "role": "AUDITOR",
        "password": "password",
    },
]


STATES_DISTRICTS = {
    "Karnataka": ["Bengaluru Rural", "Bengaluru Urban", "Mysuru", "Mandya", "Tumakuru", "Chikkaballapura"],
    "Maharashtra": ["Thane", "Palghar", "Raigad", "Pune", "Nashik", "Ahmednagar"],
    "Gujarat": ["Ahmedabad", "Gandhinagar", "Surat", "Vadodara", "Rajkot", "Bhavnagar"],
    "Uttar Pradesh": ["Meerut", "Ghaziabad", "Gautam Buddha Nagar", "Bulandshahr", "Hapur", "Baghpat"],
    "Tamil Nadu": ["Coimbatore", "Tiruppur", "Erode", "Salem", "Namakkal", "Karur"],
    "Rajasthan": ["Jaipur", "Alwar", "Ajmer", "Bharatpur", "Dausa", "Sikar"],
    "Telangana": ["Rangareddy", "Medchal-Malkajgiri", "Sangareddy", "Yadadri Bhuvanagiri", "Medak", "Siddipet"],
    "Andhra Pradesh": ["Visakhapatnam", "Vizianagaram", "Srikakulam", "East Godavari", "West Godavari", "Krishna"],
}

PROJECT_TYPES = [
    "National Highway", "State Highway", "Railway Line", "Metro Rail", 
    "Expressway", "Industrial Corridor", "Smart City", "Rural Road",
    "Urban Infrastructure", "Port Connectivity",
]

ACQUISITION_STAGES = [
    "SIA Initiated", "SIA Approved", "Notification u/s 11", "Objection Hearing",
    "Award Declaration", "Compensation Disbursement", "Possession Handover",
    "Rehabilitation", "Completed",
]

PROJECT_STATUSES = ["Planning", "In Progress", "On Hold", "Completed", "Cancelled"]

RISK_CATEGORIES = ["low", "medium", "high", "critical"]

STATES = list(STATES_DISTRICTS.keys())

import random
import bcrypt

def hash_password(password: str) -> str:
    # Use bcrypt directly to avoid passlib issues
    salt = bcrypt.gensalt(rounds=12)
    return bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')


def generate_coordinates(state: str) -> tuple:
    state_bounds = {
        "Karnataka": (12.0, 15.5, 74.0, 78.5),
        "Maharashtra": (15.5, 22.0, 72.5, 80.5),
        "Gujarat": (20.0, 24.5, 68.0, 74.5),
        "Uttar Pradesh": (24.0, 30.5, 77.0, 84.5),
        "Tamil Nadu": (8.0, 13.5, 76.0, 80.5),
        "Rajasthan": (23.0, 30.0, 69.5, 78.5),
        "Telangana": (15.5, 19.5, 77.0, 81.5),
        "Andhra Pradesh": (12.5, 19.5, 76.5, 84.5),
    }
    min_lat, max_lat, min_lon, max_lon = state_bounds.get(state, (12.0, 15.5, 74.0, 78.5))
    return (
        round(random.uniform(min_lat, max_lat), 6),
        round(random.uniform(min_lon, max_lon), 6)
    )


def generate_project_name(project_type: str, state: str, district: str, index: int) -> str:
    prefixes = {
        "National Highway": ["NH", "National Highway"],
        "State Highway": ["SH", "State Highway"],
        "Railway Line": ["Railway", "Rail Line"],
        "Metro Rail": ["Metro", "Metro Rail"],
        "Expressway": ["Expressway", "E-way"],
        "Industrial Corridor": ["Industrial Corridor", "Ind Corridor"],
        "Smart City": ["Smart City", "SC Mission"],
        "Rural Road": ["Rural Road", "PMGSY"],
        "Urban Infrastructure": ["Urban Infra", "City Infra"],
        "Port Connectivity": ["Port Connectivity", "Port Link"],
    }
    prefix = random.choice(prefixes.get(project_type, ["Project"]))
    return f"{prefix} {index} ({district}, {state})"


async def seed_users(session: AsyncSession):
    """Seed demo users."""
    print("Seeding demo users...")
    
    for user_data in DEMO_USERS:
        # Check if user exists
        result = await session.execute(
            text("SELECT id FROM users WHERE email = :email"),
            {"email": user_data["email"]}
        )
        if result.scalar():
            print(f"  User {user_data['email']} already exists, skipping")
            continue
        
        user = User(
            email=user_data["email"],
            display_name=user_data["display_name"],
            role=user_data["role"],
            password_hash=hash_password(user_data["password"]),
            is_active=True,
        )
        session.add(user)
        await session.flush()  # Flush to get user.id
        
        # Create alert settings for each user
        alert_setting = AlertSetting(
            user_id=user.id,
            notify_email=True,
            notify_inapp=True,
            alert_on_critical=True,
            alert_on_high=True,
            alert_on_medium=False,
            alert_on_low=False,
        )
        session.add(alert_setting)
    
    await session.flush()
    print(f"  Created {len(DEMO_USERS)} demo users")


async def seed_projects(session: AsyncSession, count: int = 250):
    """Seed synthetic projects."""
    print(f"Seeding {count} synthetic projects...")
    
    # Check if projects already exist
    result = await session.execute(text("SELECT COUNT(*) FROM projects"))
    existing = result.scalar()
    if existing > 0:
        print(f"  {existing} projects already exist, skipping")
        return
    
    random.seed(42)
    project_id = 1
    
    for i in range(count):
        state = random.choice(STATES)
        district = random.choice(STATES_DISTRICTS[state])
        project_type = random.choice(PROJECT_TYPES)
        current_stage = random.choice(ACQUISITION_STAGES)
        status = random.choice(PROJECT_STATUSES)
        
        # Risk calculation
        stage_risk_map = {
            "SIA Initiated": 0.2, "SIA Approved": 0.25, "Notification u/s 11": 0.35,
            "Objection Hearing": 0.5, "Award Declaration": 0.4, "Compensation Disbursement": 0.6,
            "Possession Handover": 0.45, "Rehabilitation": 0.3, "Completed": 0.05,
        }
        base_risk = stage_risk_map.get(current_stage, 0.3)
        risk_variance = random.uniform(-0.15, 0.15)
        delay_probability = max(0.01, min(0.99, base_risk + risk_variance))
        
        if delay_probability >= 0.9:
            risk_category = "critical"
        elif delay_probability >= 0.7:
            risk_category = "high"
        elif delay_probability >= 0.4:
            risk_category = "medium"
        else:
            risk_category = "low"
        
        lat, lon = generate_coordinates(state)
        start_date = date(2020, 1, 1) + timedelta(days=random.randint(0, 1460))
        target_end_date = start_date + timedelta(days=random.randint(365, 1825))
        
        days_in_stage = random.randint(30, 730) if status != "Completed" else 0
        
        pct_stages_completed = ACQUISITION_STAGES.index(current_stage) / (len(ACQUISITION_STAGES) - 1)
        pct_stages_completed += random.uniform(-0.1, 0.1)
        pct_stages_completed = max(0, min(1, pct_stages_completed))
        
        compensation_paid = pct_stages_completed * random.uniform(0.7, 1.0)
        compensation_paid = max(0, min(1, compensation_paid))
        
        legal_dispute = random.random() < 0.15
        has_court_stay = legal_dispute and random.random() < 0.3
        
        # Create project
        project = Project(
            id=project_id,
            name=generate_project_name(project_type, state, district, project_id),
            project_type=project_type,
            state=state,
            district=district,
            latitude=lat,
            longitude=lon,
            land_area_ha=round(random.uniform(5.0, 500.0), 2),
            affected_families=random.randint(10, 5000),
            start_date=start_date,
            target_end_date=target_end_date,
            current_stage=current_stage,
            status=status,
            data_source="SYNTHETIC_DEMO",
        )
        session.add(project)
        
        # Create stages
        for stage_idx, stage_name in enumerate(ACQUISITION_STAGES):
            seq = stage_idx + 1
            is_current_or_past = ACQUISITION_STAGES.index(current_stage) >= stage_idx
            is_completed = ACQUISITION_STAGES.index(current_stage) > stage_idx
            
            if is_completed:
                stage_status = "completed"
            elif is_current_or_past:
                stage_status = "in_progress"
            else:
                stage_status = "pending"
            
            planned_start = start_date + timedelta(days=stage_idx * 180)
            planned_end = planned_start + timedelta(days=180)
            
            stage = ProjectStage(
                project_id=project_id,
                stage_name=stage_name,
                sequence_no=seq,
                planned_start=planned_start,
                planned_end=planned_end,
                actual_start=planned_start if is_current_or_past else None,
                actual_end=planned_end if is_completed else None,
                status=stage_status,
            )
            session.add(stage)
        
        # Create snapshot
        snapshot = ProjectDataSnapshot(
            project_id=project_id,
            snapshot_date=date.today(),
            days_in_current_stage=days_in_stage,
            stage_overdue_days=max(0, days_in_stage - random.randint(180, 365)) if status != "Completed" else 0,
            pct_stages_completed=round(pct_stages_completed, 4),
            compensation_paid_pct=round(compensation_paid, 4),
            avg_compensation_pending_days=random.randint(0, 180) if compensation_paid < 1 else 0,
            num_disputed_claims=random.randint(1, 50) if legal_dispute else 0,
            legal_dispute_flag=legal_dispute,
            num_active_legal_cases=random.randint(1, 5) if legal_dispute else 0,
            has_court_stay=has_court_stay,
            doc_complete_pct=round(random.uniform(0.4, 1.0), 4),
            approval_pending_days=random.randint(0, 120),
            num_approvals_pending=random.randint(0, 10),
            sia_approved=current_stage != "SIA Initiated",
            env_clearance_obtained=random.random() < 0.7,
            rehab_progress_pct=round(random.uniform(0.0, 1.0), 4),
            stakeholder_response_days=random.randint(5, 90),
            notification_delay_days=random.randint(0, 60),
            possession_completion_pct=round(random.uniform(0.0, 1.0), 4) if current_stage in ["Possession Handover", "Rehabilitation", "Completed"] else 0,
            district_historical_delay_rate=round(random.uniform(0.1, 0.6), 4),
        )
        session.add(snapshot)
        
        await session.flush()
        
        # Create prediction
        prediction = RiskPrediction(
            project_id=project_id,
            snapshot_id=snapshot.id,
            requested_at=date.today(),
            responded_at=date.today(),
            model_version="demo-v1.0",
            is_mock=True,
            delay_probability=round(delay_probability, 4),
            risk_category=risk_category,
            stage_predictions={stage: round(random.uniform(0, 1), 4) for stage in ACQUISITION_STAGES},
            explanations={"top_features": ["stage_overdue_days", "compensation_paid_pct", "legal_dispute_flag"]},
            recommendations=["Review compensation schedule", "Resolve legal disputes", "Accelerate documentation"],
            status="success",
        )
        session.add(prediction)
        
        # Create alerts for high/critical risk
        if risk_category in ["high", "critical"]:
            alert = Alert(
                project_id=project_id,
                prediction_id=prediction.id,
                alert_type="Critical Risk" if risk_category == "critical" else "High Risk",
                risk_category=risk_category,
                probability_at_trigger=round(delay_probability, 4),
            )
            session.add(alert)
        
        project_id += 1
        
        if project_id % 50 == 0:
            await session.flush()
            print(f"  Created {project_id - 1} projects...")
    
    await session.flush()
    print(f"  Created {count} projects with stages, snapshots, predictions, and alerts")


async def seed_system_config(session: AsyncSession):
    """Seed system configuration."""
    print("Seeding system configuration...")
    
    configs = [
        ("risk_threshold_low", "0.3", "Low risk threshold (probability)"),
        ("risk_threshold_medium", "0.5", "Medium risk threshold (probability)"),
        ("risk_threshold_high", "0.7", "High risk threshold (probability)"),
        ("risk_threshold_critical", "0.9", "Critical risk threshold (probability)"),
        ("ml_feature_schema_version", "1.0", "Current ML feature schema version"),
        ("demo_data_version", "1.0", "Synthetic demo data version"),
        ("app_name", "BhoomiSanket", "Application name"),
        ("app_version", "1.0.0", "Application version"),
    ]
    
    for key, value, description in configs:
        result = await session.execute(
            text("SELECT key FROM system_config WHERE key = :key"),
            {"key": key}
        )
        if result.scalar():
            continue
        
        config = SystemConfig(key=key, value=value, description=description)
        session.add(config)
    
    await session.flush()
    print(f"  Created {len(configs)} system config entries")


async def main():
    """Main seeding function."""
    print("=" * 60)
    print("BhoomiSanket Database Seeder")
    print("SYNTHETIC / DEMO DATA ONLY")
    print("=" * 60)
    
    engine = create_async_engine(
        settings.DATABASE_URL,
        echo=False,
        pool_pre_ping=True,
    )
    
    async_session = sessionmaker(engine, class_=AsyncSession, expire_on_commit=False)
    
    async with async_session() as session:
        try:
            await seed_users(session)
            await seed_projects(session, 250)
            await seed_system_config(session)
            
            await session.commit()
            print("\n✓ Database seeding completed successfully!")
            print("\nDemo credentials:")
            for u in DEMO_USERS:
                print(f"  {u['role']}: {u['email']} / {u['password']}")
            
        except Exception as e:
            await session.rollback()
            print(f"\n✗ Seeding failed: {e}")
            raise
        finally:
            await engine.dispose()


if __name__ == "__main__":
    asyncio.run(main())