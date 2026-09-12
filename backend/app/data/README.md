# BhoomiSanket Synthetic Demo Data

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
