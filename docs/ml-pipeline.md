# BhoomiSanket — Machine Learning Pipeline

## 1. Overview & Problem Statement

Land acquisition for infrastructure projects in India (highways, railways, energy corridors, industrial zones) frequently suffers from extensive delays due to statutory compliance steps, compensation disputes, environmental/forest clearances, and litigation.

The BhoomiSanket Machine Learning pipeline delivers early risk detection by modeling land acquisition project trajectories and outputting calibrated delay probabilities and actionable risk explanations.

---

## 2. Model Specifications & Performance

- **Model Artifact**: `backend/app/ml/models/model.joblib` (Size: ~20.8 MB)
- **Threshold Config**: `backend/app/ml/models/threshold.json`
- **Library**: `scikit-learn==1.6.1`
- **Model Type**: `sklearn.pipeline.Pipeline` with internal preprocessing and `RandomForestClassifier`
- **Estimators**: 200 trees (`n_estimators=200`, `class_weight='balanced'`, `random_state=42`)
- **Optimized Decision Threshold**: **0.375** (tuned for high recall to identify potential delays early)
- **Evaluation Metrics (Held-Out Test Set)**:
  - **Test ROC-AUC**: `0.8337`
  - **Optimized F1 Score**: `0.6914`
  - **Optimized Recall**: `0.7412`

---

## 3. The 41 Canonical Feature Contract

The model requires 41 canonical input features in the exact order specified below. The pipeline internally performs imputing, scaling, and one-hot encoding, transforming the 41 input fields into **93 transformed features** before querying the 200 decision trees.

### 3.1 Categorical Features (6)
1. `project_type` (e.g., `"Highway"`, `"Railway"`, `"Energy"`, `"Airport"`, `"Industrial"`, `"Urban"`)
2. `state` (e.g., `"Maharashtra"`, `"Rajasthan"`, `"Uttar Pradesh"`, `"Madhya Pradesh"`, `"Karnataka"`)
3. `district` (e.g., `"Pune"`, `"Jaipur"`, `"Lucknow"`, `"Indore"`, `"Bengaluru"`)
4. `current_stage` (e.g., `"SIA"`, `"Section 4"`, `"Section 11"`, `"Section 19"`, `"Award"`, `"Possession"`)
5. `compensation_status` (e.g., `"Disbursed"`, `"Partial"`, `"Pending"`, `"Disputed"`)
6. `rr_status` (e.g., `"Completed"`, `"In Progress"`, `"Pending"`, `"Not Applicable"`)

### 3.2 Numerical Features (35)
7. `total_land_area_ha`
8. `private_land_area_ha`
9. `government_land_area_ha`
10. `forest_land_area_ha`
11. `total_parcels`
12. `parcels_acquired`
13. `total_affected_families`
14. `paf_resettled`
15. `estimated_cost_cr`
16. `compensation_budget_cr`
17. `compensation_disbursed_cr`
18. `statutory_duration_days`
19. `elapsed_days`
20. `days_in_current_stage`
21. `stage_sequence_no`
22. `pending_objections_count`
23. `resolved_objections_count`
24. `litigation_cases_count`
25. `stay_orders_count`
26. `disputed_area_ha`
27. `forest_clearance_required` (0 or 1)
28. `wildlife_clearance_required` (0 or 1)
29. `crz_clearance_required` (0 or 1)
30. `land_acquisition_officers_count`
31. `survey_teams_count`
32. `private_land_ratio`
33. `government_land_ratio`
34. `forest_land_ratio`
35. `parcel_acquisition_rate`
36. `paf_resettlement_rate`
37. `compensation_disbursement_rate`
38. `time_elapsed_ratio`
39. `objection_resolution_rate`
40. `litigation_intensity`
41. `disputed_area_ratio`

---

## 4. Fallback Hierarchy

To ensure high availability in production, the ML inference engine implements a 5-stage graceful fallback mechanism managed by `prediction_service.py`:

```
┌─────────────────────────────────────────────────────────────┐
│ 1. Local Scikit-Learn Artifact (model.joblib)               │
│    (Primary execution: is_mock=False, is_stale=False)       │
└──────────────────────────────┬──────────────────────────────┘
                               │ Failed / Model missing
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 2. External ML Inference Service (if ML_SERVICE_URL is set) │
│    (HTTP REST inference endpoint)                           │
└──────────────────────────────┬──────────────────────────────┘
                               │ Unreachable / Timed out
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 3. Deterministic Mock Fallback                              │
│    (Calculates heuristic risk score: is_mock=True)          │
└──────────────────────────────┬──────────────────────────────┘
                               │ Calculation error
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 4. Stale Cached Prediction                                  │
│    (Last known prediction from DB: is_stale=True)           │
└──────────────────────────────┬──────────────────────────────┘
                               │ No past predictions exist
                               ▼
┌─────────────────────────────────────────────────────────────┐
│ 5. HTTP 503 Service Unavailable                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 5. Explainability & Mitigation Engine

Along with the delay probability, the model runtime calculates feature impact contributions:
- **Top Risk Factors**: Identifies key indicators driving the delay score (e.g., high stay orders, low compensation disbursement, forest clearance bottlenecks).
- **Automated Recommendations**: Generates actionable, prioritized mitigation steps for district officers to de-risk the acquisition process.
