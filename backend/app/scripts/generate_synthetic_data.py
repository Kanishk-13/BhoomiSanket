#!/usr/bin/env python3
"""
Synthetic Demo Data Generator for BhoomiSanket

This script generates approximately 250 synthetic land acquisition projects
for application testing and demonstration purposes.

IMPORTANT: This data is SYNTHETIC / DEMO DATA ONLY.
It is NOT the ML training dataset and must NOT be used to claim or validate
ML model performance. It is NOT real government data.

The actual ML dataset (Dataset A) is developed separately and contains ~5,000
records with 44 columns. This synthetic dataset (Dataset B) is for UI/API testing.
"""

import uuid
import random
from datetime import date, timedelta
from typing import List, Dict, Any
from faker import Faker

# Project data
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
    "National Highway",
    "State Highway",
    "Railway Line",
    "Metro Rail",
    "Expressway",
    "Industrial Corridor",
    "Smart City",
    "Rural Road",
    "Urban Infrastructure",
    "Port Connectivity",
]

ACQUISITION_STAGES = [
    "SIA Initiated",
    "SIA Approved",
    "Notification u/s 11",
    "Objection Hearing",
    "Award Declaration",
    "Compensation Disbursement",
    "Possession Handover",
    "Rehabilitation",
    "Completed",
]

PROJECT_STATUSES = [
    "Planning",
    "In Progress",
    "On Hold",
    "Completed",
    "Cancelled",
]

ALERT_TYPES = [
    "Critical Risk",
    "High Risk",
    "Medium Risk",
    "Stage Delay",
    "Legal Dispute",
    "Compensation Delay",
    "Documentation Gap",
    "Completion",
]

RISK_CATEGORIES = ["low", "medium", "high", "critical"]

STATES = list(STATES_DISTRICTS.keys())


def generate_coordinates(state: str) -> tuple:
    """Generate realistic coordinates for a given state."""
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
    """Generate a realistic project name."""
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


def generate_synthetic_projects(count: int = 250) -> List[Dict[str, Any]]:
    """Generate synthetic project data."""
    fake = Faker('en_IN')
    Faker.seed(42)
    random.seed(42)
    
    projects = []
    project_id = 1
    
    for i in range(count):
        state = random.choice(STATES)
        district = random.choice(STATES_DISTRICTS[state])
        project_type = random.choice(PROJECT_TYPES)
        current_stage = random.choice(ACQUISITION_STAGES)
        status = random.choice(PROJECT_STATUSES)
        
        # Determine risk based on stage and random factor
        stage_risk_map = {
            "SIA Initiated": 0.2,
            "SIA Approved": 0.25,
            "Notification u/s 11": 0.35,
            "Objection Hearing": 0.5,
            "Award Declaration": 0.4,
            "Compensation Disbursement": 0.6,
            "Possession Handover": 0.45,
            "Rehabilitation": 0.3,
            "Completed": 0.05,
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
        
        start_date = fake.date_between(start_date=date(2020, 1, 1), end_date=date(2023, 12, 31))
        target_end_date = start_date + timedelta(days=random.randint(365, 1825))
        
        # Calculate days in current stage
        if status == "Completed":
            days_in_stage = 0
        else:
            days_in_stage = random.randint(30, 730)
        
        # Generate snapshot data
        pct_stages_completed = ACQUISITION_STAGES.index(current_stage) / (len(ACQUISITION_STAGES) - 1)
        pct_stages_completed += random.uniform(-0.1, 0.1)
        pct_stages_completed = max(0, min(1, pct_stages_completed))
        
        compensation_paid = pct_stages_completed * random.uniform(0.7, 1.0)
        compensation_paid = max(0, min(1, compensation_paid))
        
        legal_dispute = random.random() < 0.15
        has_court_stay = legal_dispute and random.random() < 0.3
        
        project = {
            "id": project_id,
            "name": generate_project_name(project_type, state, district, project_id),
            "project_type": project_type,
            "state": state,
            "district": district,
            "latitude": lat,
            "longitude": lon,
            "land_area_ha": round(random.uniform(5.0, 500.0), 2),
            "affected_families": random.randint(10, 5000),
            "start_date": start_date,
            "target_end_date": target_end_date,
            "current_stage": current_stage,
            "status": status,
            "data_source": "SYNTHETIC_DEMO",
            "delay_probability": round(delay_probability, 4),
            "risk_category": risk_category,
            "days_in_current_stage": days_in_stage if status != "Completed" else 0,
            "stage_overdue_days": max(0, days_in_stage - random.randint(180, 365)) if status != "Completed" else 0,
            "pct_stages_completed": round(pct_stages_completed, 4),
            "compensation_paid_pct": round(compensation_paid, 4),
            "avg_compensation_pending_days": random.randint(0, 180) if compensation_paid < 1 else 0,
            "num_disputed_claims": random.randint(1, 50) if legal_dispute else 0,
            "legal_dispute_flag": legal_dispute,
            "num_active_legal_cases": random.randint(1, 5) if legal_dispute else 0,
            "has_court_stay": has_court_stay,
            "doc_complete_pct": round(random.uniform(0.4, 1.0), 4),
            "approval_pending_days": random.randint(0, 120),
            "num_approvals_pending": random.randint(0, 10),
            "sia_approved": current_stage != "SIA Initiated",
            "env_clearance_obtained": random.random() < 0.7,
            "rehab_progress_pct": round(random.uniform(0.0, 1.0), 4),
            "stakeholder_response_days": random.randint(5, 90),
            "notification_delay_days": random.randint(0, 60),
            "possession_completion_pct": round(random.uniform(0.0, 1.0), 4) if current_stage in ["Possession Handover", "Rehabilitation", "Completed"] else 0,
            "district_historical_delay_rate": round(random.uniform(0.1, 0.6), 4),
        }
        
        projects.append(project)
        project_id += 1
    
    return projects


def write_csv(projects: List[Dict[str, Any]], output_path: str):
    """Write projects to CSV."""
    import csv
    
    fieldnames = [
        "id", "name", "project_type", "state", "district", "latitude", "longitude",
        "land_area_ha", "affected_families", "start_date", "target_end_date",
        "current_stage", "status", "data_source", "delay_probability", "risk_category",
        "days_in_current_stage", "stage_overdue_days", "pct_stages_completed",
        "compensation_paid_pct", "avg_compensation_pending_days", "num_disputed_claims",
        "legal_dispute_flag", "num_active_legal_cases", "has_court_stay",
        "doc_complete_pct", "approval_pending_days", "num_approvals_pending",
        "sia_approved", "env_clearance_obtained", "rehab_progress_pct",
        "stakeholder_response_days", "notification_delay_days",
        "possession_completion_pct", "district_historical_delay_rate"
    ]
    
    with open(output_path, 'w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for p in projects:
            writer.writerow(p)
    
    print(f"Written {len(projects)} projects to {output_path}")


def write_sql(projects: List[Dict[str, Any]], output_path: str):
    """Write SQL INSERT statements for projects."""
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write("-- Synthetic Demo Data for BhoomiSanket\n")
        f.write("-- Generated for application testing and demonstration\n")
        f.write("-- THIS IS SYNTHETIC / DEMO DATA - NOT REAL GOVERNMENT DATA\n")
        f.write("-- DO NOT USE FOR ML TRAINING OR PERFORMANCE CLAIMS\n\n")
        
        f.write("-- Clear existing data (optional)\n")
        f.write("-- TRUNCATE TABLE project_data_snapshots, risk_predictions, alerts, mitigation_logs, project_stages, projects RESTART IDENTITY CASCADE;\n\n")
        
        for p in projects:
            # Escape single quotes in name
            name = p["name"].replace("'", "''")
            
            f.write(f"""INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES ({p["id"]}, '{name}', '{p["project_type"]}', '{p["state"]}', '{p["district"]}',
    {p["latitude"]}, {p["longitude"]}, {p["land_area_ha"]}, {p["affected_families"]},
    '{p["start_date"]}', '{p["target_end_date"]}', '{p["current_stage"]}', '{p["status"]}', '{p["data_source"]}');
""")
            
            # Insert project stages
            for stage_idx, stage_name in enumerate(ACQUISITION_STAGES):
                seq = stage_idx + 1
                is_current_or_past = ACQUISITION_STAGES.index(p["current_stage"]) >= stage_idx
                is_completed = ACQUISITION_STAGES.index(p["current_stage"]) > stage_idx
                
                if is_completed:
                    stage_status = "completed"
                elif is_current_or_past:
                    stage_status = "in_progress"
                else:
                    stage_status = "pending"
                
                planned_start = p["start_date"] + timedelta(days=stage_idx * 180)
                planned_end = planned_start + timedelta(days=180)
                
                f.write(f"""INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES ({p["id"]}, '{stage_name}', {seq}, '{planned_start}', '{planned_end}', 
    {'NULL' if stage_status == 'pending' else f"'{planned_start}'"},
    {'NULL' if not is_completed else f"'{planned_end}'"}, '{stage_status}');
""")
            
            # Insert snapshot
            f.write(f"""INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES ({p["id"]}, CURRENT_DATE, {p["days_in_current_stage"]}, {p["stage_overdue_days"]},
    {p["pct_stages_completed"]}, {p["compensation_paid_pct"]}, {p["avg_compensation_pending_days"]},
    {p["num_disputed_claims"]}, {str(p["legal_dispute_flag"]).lower()}, {p["num_active_legal_cases"]},
    {str(p["has_court_stay"]).lower()}, {p["doc_complete_pct"]}, {p["approval_pending_days"]},
    {p["num_approvals_pending"]}, {str(p["sia_approved"]).lower()}, {str(p["env_clearance_obtained"]).lower()},
    {p["rehab_progress_pct"]}, {p["stakeholder_response_days"]}, {p["notification_delay_days"]},
    {p["possession_completion_pct"]}, {p["district_historical_delay_rate"]});
""")
            
            # Insert prediction
            f.write(f"""INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES ({p["id"]}, (SELECT id FROM project_data_snapshots WHERE project_id = {p["id"]} ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, {p["delay_probability"]}, '{p["risk_category"]}', 'success');
""")
            
            # Insert some alerts for high/critical risk
            if p["risk_category"] in ["high", "critical"]:
                alert_type = "Critical Risk" if p["risk_category"] == "critical" else "High Risk"
                f.write(f"""INSERT INTO alerts (project_id, prediction_id, alert_type, risk_category, probability_at_trigger)
VALUES ({p["id"]}, (SELECT id FROM risk_predictions WHERE project_id = {p["id"]} ORDER BY id DESC LIMIT 1),
    '{alert_type}', '{p["risk_category"]}', {p["delay_probability"]});
""")
        
        print(f"Written SQL to {output_path}")


def generate_readme(output_path: str):
    """Generate README for the synthetic data."""
    readme = """# BhoomiSanket Synthetic Demo Data

## Overview
This directory contains synthetic demo data for the BhoomiSanket application (SIH26017).

## Dataset Information
- **Records**: ~250 projects
- **States**: 8 (Karnataka, Maharashtra, Gujarat, Uttar Pradesh, Tamil Nadu, Rajasthan, Telangana, Andhra Pradesh)
- **Districts**: 48 across 8 states
- **Project Types**: 10 types
- **Acquisition Stages**: 9 stages
- **Statuses**: 5 statuses

## Files
- `projects.csv` - CSV format for easy viewing/import
- `seed_data.sql` - SQL INSERT statements for database seeding
- `README.md` - This file

## Data Provenance
**THIS DATA IS SYNTHETIC / DEMO DATA**

This dataset was artificially generated for the sole purpose of:
- UI development and testing
- API development and testing
- Dashboard demonstration
- GIS/map visualization testing
- Analytics page testing
- Alert system testing
- Application demonstration

## Important Disclaimers
1. **NOT REAL GOVERNMENT DATA** - All project names, locations, coordinates, and attributes are fictitious
2. **NOT ML TRAINING DATA** - This dataset must NOT be used for machine learning model training, evaluation, or validation
3. **NO ML PERFORMANCE CLAIMS** - Do not use this data to claim or validate any ML model accuracy, precision, recall, or other metrics
4. **SEPARATE FROM ML DATASET** - The actual ML dataset (Dataset A) contains ~5,000 real records with 44 columns and is developed separately

## Data Schema
Each project includes:
- Basic info: id, name, type, state, district
- Location: latitude, longitude (PostGIS geography point)
- Land: land_area_ha, affected_families
- Timeline: start_date, target_end_date, current_stage, status
- Risk: delay_probability, risk_category (low/medium/high/critical)
- Snapshot features: 20+ acquisition-related metrics
- Prediction: mock ML prediction with probability and risk category
- Alerts: for high/critical risk projects

## Usage
```bash
# Seed database via SQL
psql -d bhoomi_sanket -f seed_data.sql

# Or use the Python seeder script
python seed_synthetic_data.py
```

## Generation
Data was generated using a deterministic seed (42) for reproducibility.
Run `python generate_synthetic_data.py` to regenerate.

## License
This synthetic data is provided for BhoomiSanket application development only.
"""
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(readme)
    print(f"Written README to {output_path}")


def main():
    import sys
    import os
    
    # Add parent directory to path
    sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    
    count = 250
    if len(sys.argv) > 1:
        count = int(sys.argv[1])
    
    print(f"Generating {count} synthetic projects...")
    projects = generate_synthetic_projects(count)
    
    data_dir = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'data')
    os.makedirs(data_dir, exist_ok=True)
    
    write_csv(projects, os.path.join(data_dir, 'projects.csv'))
    write_sql(projects, os.path.join(data_dir, 'seed_data.sql'))
    generate_readme(os.path.join(data_dir, 'README.md'))
    
    # Print summary stats
    print("\n=== Summary ===")
    print(f"Total projects: {len(projects)}")
    print(f"States: {len(set(p['state'] for p in projects))}")
    print(f"Districts: {len(set((p['state'], p['district']) for p in projects))}")
    print(f"Project types: {len(set(p['project_type'] for p in projects))}")
    print(f"Stages: {len(set(p['current_stage'] for p in projects))}")
    print(f"Statuses: {len(set(p['status'] for p in projects))}")
    
    risk_counts = {}
    for p in projects:
        risk_counts[p['risk_category']] = risk_counts.get(p['risk_category'], 0) + 1
    print("\nRisk distribution:")
    for cat in ['low', 'medium', 'high', 'critical']:
        print(f"  {cat}: {risk_counts.get(cat, 0)}")
    
    stage_counts = {}
    for p in projects:
        stage_counts[p['current_stage']] = stage_counts.get(p['current_stage'], 0) + 1
    print("\nStage distribution:")
    for stage in ACQUISITION_STAGES:
        print(f"  {stage}: {stage_counts.get(stage, 0)}")
    
    print("\n✓ Synthetic demo data generated successfully!")
    print("⚠ Remember: THIS IS SYNTHETIC / DEMO DATA - NOT REAL GOVERNMENT DATA")


if __name__ == "__main__":
    main()