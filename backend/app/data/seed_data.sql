-- Synthetic Demo Data for BhoomiSanket
-- Generated for application testing and demonstration
-- THIS IS SYNTHETIC / DEMO DATA - NOT REAL GOVERNMENT DATA
-- DO NOT USE FOR ML TRAINING OR PERFORMANCE CLAIMS

-- Clear existing data (optional)
-- TRUNCATE TABLE project_data_snapshots, risk_predictions, alerts, mitigation_logs, project_stages, projects RESTART IDENTITY CASCADE;

INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (1, 'Expressway 1 (Thane, Maharashtra)', 'Expressway', 'Maharashtra', 'Thane',
    16.166219, 78.425342, 282.82, 4474,
    '2022-07-22', '2026-08-11', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'SIA Initiated', 1, '2022-07-22', '2023-01-18', 
    '2022-07-22',
    '2023-01-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'SIA Approved', 2, '2023-01-18', '2023-07-17', 
    '2023-01-18',
    '2023-07-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'Notification u/s 11', 3, '2023-07-17', '2024-01-13', 
    '2023-07-17',
    '2024-01-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'Objection Hearing', 4, '2024-01-13', '2024-07-11', 
    '2024-01-13',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'Award Declaration', 5, '2024-07-11', '2025-01-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'Compensation Disbursement', 6, '2025-01-07', '2025-07-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'Possession Handover', 7, '2025-07-06', '2026-01-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'Rehabilitation', 8, '2026-01-02', '2026-07-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (1, 'Completed', 9, '2026-07-01', '2026-12-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (1, CURRENT_DATE, 119, 0,
    0.3931, 0.2789, 56,
    29, true, 5,
    true, 0.5669, 111,
    0, true, false,
    0.1597, 59, 21,
    0, 0.2389);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (1, (SELECT id FROM project_data_snapshots WHERE project_id = 1 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3919, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (2, 'State Highway 2 (Gautam Buddha Nagar, Uttar Pradesh)', 'State Highway', 'Uttar Pradesh', 'Gautam Buddha Nagar',
    29.508713, 81.527945, 44.01, 2411,
    '2020-02-06', '2021-05-04', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'SIA Initiated', 1, '2020-02-06', '2020-08-04', 
    '2020-02-06',
    '2020-08-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'SIA Approved', 2, '2020-08-04', '2021-01-31', 
    '2020-08-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'Notification u/s 11', 3, '2021-01-31', '2021-07-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'Objection Hearing', 4, '2021-07-30', '2022-01-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'Award Declaration', 5, '2022-01-26', '2022-07-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'Compensation Disbursement', 6, '2022-07-25', '2023-01-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'Possession Handover', 7, '2023-01-21', '2023-07-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'Rehabilitation', 8, '2023-07-20', '2024-01-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (2, 'Completed', 9, '2024-01-16', '2024-07-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (2, CURRENT_DATE, 0, 0,
    0.1709, 0.1472, 160,
    0, false, 0,
    false, 0.7711, 110,
    5, true, true,
    0.7046, 10, 42,
    0, 0.2139);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (2, (SELECT id FROM project_data_snapshots WHERE project_id = 2 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.129, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (3, 'Metro 3 (Coimbatore, Tamil Nadu)', 'Metro Rail', 'Tamil Nadu', 'Coimbatore',
    11.496264, 77.641745, 306.52, 1411,
    '2021-02-05', '2024-03-04', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'SIA Initiated', 1, '2021-02-05', '2021-08-04', 
    '2021-02-05',
    '2021-08-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'SIA Approved', 2, '2021-08-04', '2022-01-31', 
    '2021-08-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'Notification u/s 11', 3, '2022-01-31', '2022-07-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'Objection Hearing', 4, '2022-07-30', '2023-01-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'Award Declaration', 5, '2023-01-26', '2023-07-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'Compensation Disbursement', 6, '2023-07-25', '2024-01-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'Possession Handover', 7, '2024-01-21', '2024-07-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'Rehabilitation', 8, '2024-07-19', '2025-01-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (3, 'Completed', 9, '2025-01-15', '2025-07-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (3, CURRENT_DATE, 0, 0,
    0.0961, 0.0865, 136,
    0, false, 0,
    false, 0.8375, 20,
    7, true, true,
    0.9895, 86, 44,
    0, 0.3785);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (3, (SELECT id FROM project_data_snapshots WHERE project_id = 3 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1834, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (4, 'Metro Rail 4 (Jaipur, Rajasthan)', 'Metro Rail', 'Rajasthan', 'Jaipur',
    23.46332, 77.718225, 75.72, 1153,
    '2020-11-21', '2025-01-25', 'SIA Initiated', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'SIA Initiated', 1, '2020-11-21', '2021-05-20', 
    '2020-11-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'SIA Approved', 2, '2021-05-20', '2021-11-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'Notification u/s 11', 3, '2021-11-16', '2022-05-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'Objection Hearing', 4, '2022-05-15', '2022-11-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'Award Declaration', 5, '2022-11-11', '2023-05-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'Compensation Disbursement', 6, '2023-05-10', '2023-11-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'Possession Handover', 7, '2023-11-06', '2024-05-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'Rehabilitation', 8, '2024-05-04', '2024-10-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (4, 'Completed', 9, '2024-10-31', '2025-04-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (4, CURRENT_DATE, 352, 109,
    0, 0, 143,
    0, false, 0,
    false, 0.7234, 95,
    9, false, true,
    0.5835, 51, 14,
    0, 0.5987);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (4, (SELECT id FROM project_data_snapshots WHERE project_id = 4 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1703, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (5, 'PMGSY 5 (Rajkot, Gujarat)', 'Rural Road', 'Gujarat', 'Rajkot',
    20.687786, 69.039883, 266.91, 4542,
    '2022-12-11', '2027-10-04', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'SIA Initiated', 1, '2022-12-11', '2023-06-09', 
    '2022-12-11',
    '2023-06-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'SIA Approved', 2, '2023-06-09', '2023-12-06', 
    '2023-06-09',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'Notification u/s 11', 3, '2023-12-06', '2024-06-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'Objection Hearing', 4, '2024-06-03', '2024-11-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'Award Declaration', 5, '2024-11-30', '2025-05-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'Compensation Disbursement', 6, '2025-05-29', '2025-11-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'Possession Handover', 7, '2025-11-25', '2026-05-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'Rehabilitation', 8, '2026-05-24', '2026-11-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (5, 'Completed', 9, '2026-11-20', '2027-05-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (5, CURRENT_DATE, 462, 280,
    0.1443, 0.1177, 174,
    0, false, 0,
    false, 0.8324, 87,
    8, true, false,
    0.7686, 48, 7,
    0, 0.2468);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (5, (SELECT id FROM project_data_snapshots WHERE project_id = 5 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3583, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (6, 'National Highway 6 (Vadodara, Gujarat)', 'National Highway', 'Gujarat', 'Vadodara',
    22.284568, 68.69167, 382.44, 4428,
    '2022-09-14', '2027-03-17', 'Award Declaration', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'SIA Initiated', 1, '2022-09-14', '2023-03-13', 
    '2022-09-14',
    '2023-03-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'SIA Approved', 2, '2023-03-13', '2023-09-09', 
    '2023-03-13',
    '2023-09-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'Notification u/s 11', 3, '2023-09-09', '2024-03-07', 
    '2023-09-09',
    '2024-03-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'Objection Hearing', 4, '2024-03-07', '2024-09-03', 
    '2024-03-07',
    '2024-09-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'Award Declaration', 5, '2024-09-03', '2025-03-02', 
    '2024-09-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'Compensation Disbursement', 6, '2025-03-02', '2025-08-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'Possession Handover', 7, '2025-08-29', '2026-02-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'Rehabilitation', 8, '2026-02-25', '2026-08-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (6, 'Completed', 9, '2026-08-24', '2027-02-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (6, CURRENT_DATE, 335, 20,
    0.5683, 0.4844, 0,
    0, false, 0,
    false, 0.7594, 62,
    0, true, true,
    0.363, 44, 15,
    0, 0.129);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (6, (SELECT id FROM project_data_snapshots WHERE project_id = 6 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4786, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (7, 'Rural Road 7 (Thane, Maharashtra)', 'Rural Road', 'Maharashtra', 'Thane',
    16.334545, 76.302259, 464.81, 1657,
    '2023-07-26', '2027-08-24', 'SIA Approved', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'SIA Initiated', 1, '2023-07-26', '2024-01-22', 
    '2023-07-26',
    '2024-01-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'SIA Approved', 2, '2024-01-22', '2024-07-20', 
    '2024-01-22',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'Notification u/s 11', 3, '2024-07-20', '2025-01-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'Objection Hearing', 4, '2025-01-16', '2025-07-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'Award Declaration', 5, '2025-07-15', '2026-01-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'Compensation Disbursement', 6, '2026-01-11', '2026-07-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'Possession Handover', 7, '2026-07-10', '2027-01-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'Rehabilitation', 8, '2027-01-06', '2027-07-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (7, 'Completed', 9, '2027-07-05', '2028-01-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (7, CURRENT_DATE, 199, 0,
    0.078, 0.075, 79,
    0, false, 0,
    false, 0.6394, 85,
    10, true, true,
    0.8996, 62, 7,
    0, 0.224);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (7, (SELECT id FROM project_data_snapshots WHERE project_id = 7 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3298, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (8, 'NH 8 (Raigad, Maharashtra)', 'National Highway', 'Maharashtra', 'Raigad',
    15.54674, 78.162728, 142.85, 3986,
    '2020-05-06', '2021-09-03', 'Completed', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'SIA Initiated', 1, '2020-05-06', '2020-11-02', 
    '2020-05-06',
    '2020-11-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'SIA Approved', 2, '2020-11-02', '2021-05-01', 
    '2020-11-02',
    '2021-05-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'Notification u/s 11', 3, '2021-05-01', '2021-10-28', 
    '2021-05-01',
    '2021-10-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'Objection Hearing', 4, '2021-10-28', '2022-04-26', 
    '2021-10-28',
    '2022-04-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'Award Declaration', 5, '2022-04-26', '2022-10-23', 
    '2022-04-26',
    '2022-10-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'Compensation Disbursement', 6, '2022-10-23', '2023-04-21', 
    '2022-10-23',
    '2023-04-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'Possession Handover', 7, '2023-04-21', '2023-10-18', 
    '2023-04-21',
    '2023-10-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'Rehabilitation', 8, '2023-10-18', '2024-04-15', 
    '2023-10-18',
    '2024-04-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (8, 'Completed', 9, '2024-04-15', '2024-10-12', 
    '2024-04-15',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (8, CURRENT_DATE, 264, 30,
    0.9135, 0.648, 138,
    0, false, 0,
    false, 0.4794, 119,
    9, true, true,
    0.243, 65, 51,
    0.4071, 0.1472);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (8, (SELECT id FROM project_data_snapshots WHERE project_id = 8 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0765, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (9, 'Smart City 9 (Sangareddy, Telangana)', 'Smart City', 'Telangana', 'Sangareddy',
    15.716685, 79.94055, 128.08, 1568,
    '2021-09-08', '2026-04-23', 'Possession Handover', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'SIA Initiated', 1, '2021-09-08', '2022-03-07', 
    '2021-09-08',
    '2022-03-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'SIA Approved', 2, '2022-03-07', '2022-09-03', 
    '2022-03-07',
    '2022-09-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'Notification u/s 11', 3, '2022-09-03', '2023-03-02', 
    '2022-09-03',
    '2023-03-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'Objection Hearing', 4, '2023-03-02', '2023-08-29', 
    '2023-03-02',
    '2023-08-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'Award Declaration', 5, '2023-08-29', '2024-02-25', 
    '2023-08-29',
    '2024-02-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'Compensation Disbursement', 6, '2024-02-25', '2024-08-23', 
    '2024-02-25',
    '2024-08-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'Possession Handover', 7, '2024-08-23', '2025-02-19', 
    '2024-08-23',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'Rehabilitation', 8, '2025-02-19', '2025-08-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (9, 'Completed', 9, '2025-08-18', '2026-02-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (9, CURRENT_DATE, 0, 0,
    0.6697, 0.5497, 137,
    0, false, 0,
    false, 0.6692, 54,
    2, true, true,
    0.2498, 14, 28,
    0.808, 0.528);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (9, (SELECT id FROM project_data_snapshots WHERE project_id = 9 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5592, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (10, 'City Infra 10 (Thane, Maharashtra)', 'Urban Infrastructure', 'Maharashtra', 'Thane',
    21.016522, 73.830489, 136.28, 3737,
    '2020-02-13', '2023-11-03', 'SIA Initiated', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'SIA Initiated', 1, '2020-02-13', '2020-08-11', 
    '2020-02-13',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'SIA Approved', 2, '2020-08-11', '2021-02-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'Notification u/s 11', 3, '2021-02-07', '2021-08-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'Objection Hearing', 4, '2021-08-06', '2022-02-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'Award Declaration', 5, '2022-02-02', '2022-08-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'Compensation Disbursement', 6, '2022-08-01', '2023-01-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'Possession Handover', 7, '2023-01-28', '2023-07-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'Rehabilitation', 8, '2023-07-27', '2024-01-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (10, 'Completed', 9, '2024-01-23', '2024-07-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (10, CURRENT_DATE, 522, 269,
    0, 0, 108,
    45, true, 5,
    false, 0.7971, 62,
    2, false, true,
    0.2177, 12, 37,
    0, 0.4679);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (10, (SELECT id FROM project_data_snapshots WHERE project_id = 10 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3279, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (11, 'Industrial Corridor 11 (Chikkaballapura, Karnataka)', 'Industrial Corridor', 'Karnataka', 'Chikkaballapura',
    13.759976, 77.83724, 339.23, 1936,
    '2020-11-15', '2022-10-03', 'SIA Initiated', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'SIA Initiated', 1, '2020-11-15', '2021-05-14', 
    '2020-11-15',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'SIA Approved', 2, '2021-05-14', '2021-11-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'Notification u/s 11', 3, '2021-11-10', '2022-05-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'Objection Hearing', 4, '2022-05-09', '2022-11-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'Award Declaration', 5, '2022-11-05', '2023-05-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'Compensation Disbursement', 6, '2023-05-04', '2023-10-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'Possession Handover', 7, '2023-10-31', '2024-04-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'Rehabilitation', 8, '2024-04-28', '2024-10-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (11, 'Completed', 9, '2024-10-25', '2025-04-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (11, CURRENT_DATE, 88, 0,
    0.0922, 0.0667, 30,
    0, false, 0,
    false, 0.965, 72,
    3, false, true,
    0.0397, 15, 26,
    0, 0.4287);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (11, (SELECT id FROM project_data_snapshots WHERE project_id = 11 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2253, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (12, 'Metro 12 (Ajmer, Rajasthan)', 'Metro Rail', 'Rajasthan', 'Ajmer',
    23.916148, 75.309507, 41.26, 1756,
    '2022-01-07', '2025-07-31', 'Compensation Disbursement', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'SIA Initiated', 1, '2022-01-07', '2022-07-06', 
    '2022-01-07',
    '2022-07-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'SIA Approved', 2, '2022-07-06', '2023-01-02', 
    '2022-07-06',
    '2023-01-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'Notification u/s 11', 3, '2023-01-02', '2023-07-01', 
    '2023-01-02',
    '2023-07-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'Objection Hearing', 4, '2023-07-01', '2023-12-28', 
    '2023-07-01',
    '2023-12-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'Award Declaration', 5, '2023-12-28', '2024-06-25', 
    '2023-12-28',
    '2024-06-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'Compensation Disbursement', 6, '2024-06-25', '2024-12-22', 
    '2024-06-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'Possession Handover', 7, '2024-12-22', '2025-06-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'Rehabilitation', 8, '2025-06-20', '2025-12-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (12, 'Completed', 9, '2025-12-17', '2026-06-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (12, CURRENT_DATE, 353, 44,
    0.7108, 0.6971, 67,
    9, true, 3,
    false, 0.9285, 112,
    3, true, true,
    0.1577, 74, 45,
    0, 0.2513);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (12, (SELECT id FROM project_data_snapshots WHERE project_id = 12 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5297, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (13, 'City Infra 13 (Chikkaballapura, Karnataka)', 'Urban Infrastructure', 'Karnataka', 'Chikkaballapura',
    12.470019, 74.519429, 105.78, 2172,
    '2020-02-08', '2021-09-14', 'Award Declaration', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'SIA Initiated', 1, '2020-02-08', '2020-08-06', 
    '2020-02-08',
    '2020-08-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'SIA Approved', 2, '2020-08-06', '2021-02-02', 
    '2020-08-06',
    '2021-02-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'Notification u/s 11', 3, '2021-02-02', '2021-08-01', 
    '2021-02-02',
    '2021-08-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'Objection Hearing', 4, '2021-08-01', '2022-01-28', 
    '2021-08-01',
    '2022-01-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'Award Declaration', 5, '2022-01-28', '2022-07-27', 
    '2022-01-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'Compensation Disbursement', 6, '2022-07-27', '2023-01-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'Possession Handover', 7, '2023-01-23', '2023-07-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'Rehabilitation', 8, '2023-07-22', '2024-01-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (13, 'Completed', 9, '2024-01-18', '2024-07-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (13, CURRENT_DATE, 596, 287,
    0.4311, 0.3382, 125,
    0, false, 0,
    false, 0.5507, 116,
    0, true, true,
    0.4236, 40, 2,
    0, 0.1018);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (13, (SELECT id FROM project_data_snapshots WHERE project_id = 13 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5317, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (14, 'E-way 14 (Bhavnagar, Gujarat)', 'Expressway', 'Gujarat', 'Bhavnagar',
    21.924591, 68.062853, 293.34, 1223,
    '2020-10-17', '2022-03-20', 'Notification u/s 11', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'SIA Initiated', 1, '2020-10-17', '2021-04-15', 
    '2020-10-17',
    '2021-04-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'SIA Approved', 2, '2021-04-15', '2021-10-12', 
    '2021-04-15',
    '2021-10-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'Notification u/s 11', 3, '2021-10-12', '2022-04-10', 
    '2021-10-12',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'Objection Hearing', 4, '2022-04-10', '2022-10-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'Award Declaration', 5, '2022-10-07', '2023-04-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'Compensation Disbursement', 6, '2023-04-05', '2023-10-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'Possession Handover', 7, '2023-10-02', '2024-03-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'Rehabilitation', 8, '2024-03-30', '2024-09-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (14, 'Completed', 9, '2024-09-26', '2025-03-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (14, CURRENT_DATE, 0, 0,
    0.339, 0.3076, 110,
    9, true, 1,
    true, 0.585, 115,
    0, true, false,
    0.2101, 36, 42,
    0, 0.1514);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (14, (SELECT id FROM project_data_snapshots WHERE project_id = 14 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3655, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (15, 'Railway 15 (Medak, Telangana)', 'Railway Line', 'Telangana', 'Medak',
    18.743087, 80.966373, 137.07, 895,
    '2022-08-06', '2023-09-25', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'SIA Initiated', 1, '2022-08-06', '2023-02-02', 
    '2022-08-06',
    '2023-02-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'SIA Approved', 2, '2023-02-02', '2023-08-01', 
    '2023-02-02',
    '2023-08-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'Notification u/s 11', 3, '2023-08-01', '2024-01-28', 
    '2023-08-01',
    '2024-01-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'Objection Hearing', 4, '2024-01-28', '2024-07-26', 
    '2024-01-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'Award Declaration', 5, '2024-07-26', '2025-01-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'Compensation Disbursement', 6, '2025-01-22', '2025-07-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'Possession Handover', 7, '2025-07-21', '2026-01-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'Rehabilitation', 8, '2026-01-17', '2026-07-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (15, 'Completed', 9, '2026-07-16', '2027-01-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (15, CURRENT_DATE, 213, 0,
    0.4223, 0.3377, 9,
    0, false, 0,
    false, 0.9152, 28,
    3, true, false,
    0.4603, 44, 52,
    0, 0.4977);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (15, (SELECT id FROM project_data_snapshots WHERE project_id = 15 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6429, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (16, 'National Highway 16 (Ghaziabad, Uttar Pradesh)', 'National Highway', 'Uttar Pradesh', 'Ghaziabad',
    29.618294, 84.251668, 469.92, 954,
    '2022-03-06', '2024-09-27', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'SIA Initiated', 1, '2022-03-06', '2022-09-02', 
    '2022-03-06',
    '2022-09-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'SIA Approved', 2, '2022-09-02', '2023-03-01', 
    '2022-09-02',
    '2023-03-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'Notification u/s 11', 3, '2023-03-01', '2023-08-28', 
    '2023-03-01',
    '2023-08-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'Objection Hearing', 4, '2023-08-28', '2024-02-24', 
    '2023-08-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'Award Declaration', 5, '2024-02-24', '2024-08-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'Compensation Disbursement', 6, '2024-08-22', '2025-02-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'Possession Handover', 7, '2025-02-18', '2025-08-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'Rehabilitation', 8, '2025-08-17', '2026-02-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (16, 'Completed', 9, '2026-02-13', '2026-08-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (16, CURRENT_DATE, 0, 0,
    0.3452, 0.2944, 66,
    0, false, 0,
    false, 0.5071, 33,
    0, true, true,
    0.4346, 45, 27,
    0, 0.4031);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (16, (SELECT id FROM project_data_snapshots WHERE project_id = 16 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4485, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (17, 'Port Link 17 (Pune, Maharashtra)', 'Port Connectivity', 'Maharashtra', 'Pune',
    18.334374, 76.659363, 313.46, 1030,
    '2020-11-17', '2024-11-23', 'Objection Hearing', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'SIA Initiated', 1, '2020-11-17', '2021-05-16', 
    '2020-11-17',
    '2021-05-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'SIA Approved', 2, '2021-05-16', '2021-11-12', 
    '2021-05-16',
    '2021-11-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'Notification u/s 11', 3, '2021-11-12', '2022-05-11', 
    '2021-11-12',
    '2022-05-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'Objection Hearing', 4, '2022-05-11', '2022-11-07', 
    '2022-05-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'Award Declaration', 5, '2022-11-07', '2023-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'Compensation Disbursement', 6, '2023-05-06', '2023-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'Possession Handover', 7, '2023-11-02', '2024-04-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'Rehabilitation', 8, '2024-04-30', '2024-10-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (17, 'Completed', 9, '2024-10-27', '2025-04-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (17, CURRENT_DATE, 716, 352,
    0.3144, 0.2608, 76,
    0, false, 0,
    false, 0.7043, 85,
    6, true, true,
    0.6972, 75, 8,
    0, 0.1959);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (17, (SELECT id FROM project_data_snapshots WHERE project_id = 17 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3633, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (18, 'Rail Line 18 (Siddipet, Telangana)', 'Railway Line', 'Telangana', 'Siddipet',
    15.501624, 78.291112, 223.87, 1760,
    '2022-05-10', '2025-10-06', 'Award Declaration', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'SIA Initiated', 1, '2022-05-10', '2022-11-06', 
    '2022-05-10',
    '2022-11-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'SIA Approved', 2, '2022-11-06', '2023-05-05', 
    '2022-11-06',
    '2023-05-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'Notification u/s 11', 3, '2023-05-05', '2023-11-01', 
    '2023-05-05',
    '2023-11-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'Objection Hearing', 4, '2023-11-01', '2024-04-29', 
    '2023-11-01',
    '2024-04-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'Award Declaration', 5, '2024-04-29', '2024-10-26', 
    '2024-04-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'Compensation Disbursement', 6, '2024-10-26', '2025-04-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'Possession Handover', 7, '2025-04-24', '2025-10-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'Rehabilitation', 8, '2025-10-21', '2026-04-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (18, 'Completed', 9, '2026-04-19', '2026-10-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (18, CURRENT_DATE, 0, 0,
    0.5572, 0.4914, 130,
    0, false, 0,
    false, 0.6839, 115,
    2, true, true,
    0.2838, 89, 40,
    0, 0.4096);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (18, (SELECT id FROM project_data_snapshots WHERE project_id = 18 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4144, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (19, 'E-way 19 (Palghar, Maharashtra)', 'Expressway', 'Maharashtra', 'Palghar',
    15.800389, 80.371488, 249.72, 2008,
    '2023-03-27', '2027-08-29', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'SIA Initiated', 1, '2023-03-27', '2023-09-23', 
    '2023-03-27',
    '2023-09-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'SIA Approved', 2, '2023-09-23', '2024-03-21', 
    '2023-09-23',
    '2024-03-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'Notification u/s 11', 3, '2024-03-21', '2024-09-17', 
    '2024-03-21',
    '2024-09-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'Objection Hearing', 4, '2024-09-17', '2025-03-16', 
    '2024-09-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'Award Declaration', 5, '2025-03-16', '2025-09-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'Compensation Disbursement', 6, '2025-09-12', '2026-03-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'Possession Handover', 7, '2026-03-11', '2026-09-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'Rehabilitation', 8, '2026-09-07', '2027-03-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (19, 'Completed', 9, '2027-03-06', '2027-09-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (19, CURRENT_DATE, 104, 0,
    0.3661, 0.3536, 167,
    0, false, 0,
    false, 0.8126, 114,
    1, true, false,
    0.2188, 71, 29,
    0, 0.1251);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (19, (SELECT id FROM project_data_snapshots WHERE project_id = 19 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3942, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (20, 'PMGSY 20 (Meerut, Uttar Pradesh)', 'Rural Road', 'Uttar Pradesh', 'Meerut',
    30.421301, 81.465892, 449.12, 3898,
    '2020-01-10', '2023-07-04', 'Notification u/s 11', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'SIA Initiated', 1, '2020-01-10', '2020-07-08', 
    '2020-01-10',
    '2020-07-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'SIA Approved', 2, '2020-07-08', '2021-01-04', 
    '2020-07-08',
    '2021-01-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'Notification u/s 11', 3, '2021-01-04', '2021-07-03', 
    '2021-01-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'Objection Hearing', 4, '2021-07-03', '2021-12-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'Award Declaration', 5, '2021-12-30', '2022-06-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'Compensation Disbursement', 6, '2022-06-28', '2022-12-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'Possession Handover', 7, '2022-12-25', '2023-06-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'Rehabilitation', 8, '2023-06-23', '2023-12-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (20, 'Completed', 9, '2023-12-20', '2024-06-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (20, CURRENT_DATE, 0, 0,
    0.2725, 0.2496, 115,
    0, false, 0,
    false, 0.5555, 31,
    10, true, true,
    0.7777, 67, 40,
    0, 0.2196);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (20, (SELECT id FROM project_data_snapshots WHERE project_id = 20 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4003, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (21, 'E-way 21 (Visakhapatnam, Andhra Pradesh)', 'Expressway', 'Andhra Pradesh', 'Visakhapatnam',
    18.751188, 77.144621, 206.76, 4455,
    '2023-03-22', '2025-01-23', 'Objection Hearing', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'SIA Initiated', 1, '2023-03-22', '2023-09-18', 
    '2023-03-22',
    '2023-09-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'SIA Approved', 2, '2023-09-18', '2024-03-16', 
    '2023-09-18',
    '2024-03-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'Notification u/s 11', 3, '2024-03-16', '2024-09-12', 
    '2024-03-16',
    '2024-09-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'Objection Hearing', 4, '2024-09-12', '2025-03-11', 
    '2024-09-12',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'Award Declaration', 5, '2025-03-11', '2025-09-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'Compensation Disbursement', 6, '2025-09-07', '2026-03-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'Possession Handover', 7, '2026-03-06', '2026-09-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'Rehabilitation', 8, '2026-09-02', '2027-03-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (21, 'Completed', 9, '2027-03-01', '2027-08-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (21, CURRENT_DATE, 266, 0,
    0.3516, 0.2622, 106,
    0, false, 0,
    false, 0.4374, 106,
    6, true, true,
    0.7698, 7, 54,
    0, 0.5403);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (21, (SELECT id FROM project_data_snapshots WHERE project_id = 21 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4508, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (22, 'NH 22 (Yadadri Bhuvanagiri, Telangana)', 'National Highway', 'Telangana', 'Yadadri Bhuvanagiri',
    18.913792, 81.290437, 246.67, 2245,
    '2022-10-16', '2026-02-20', 'Compensation Disbursement', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'SIA Initiated', 1, '2022-10-16', '2023-04-14', 
    '2022-10-16',
    '2023-04-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'SIA Approved', 2, '2023-04-14', '2023-10-11', 
    '2023-04-14',
    '2023-10-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'Notification u/s 11', 3, '2023-10-11', '2024-04-08', 
    '2023-10-11',
    '2024-04-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'Objection Hearing', 4, '2024-04-08', '2024-10-05', 
    '2024-04-08',
    '2024-10-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'Award Declaration', 5, '2024-10-05', '2025-04-03', 
    '2024-10-05',
    '2025-04-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'Compensation Disbursement', 6, '2025-04-03', '2025-09-30', 
    '2025-04-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'Possession Handover', 7, '2025-09-30', '2026-03-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'Rehabilitation', 8, '2026-03-29', '2026-09-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (22, 'Completed', 9, '2026-09-25', '2027-03-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (22, CURRENT_DATE, 581, 290,
    0.6745, 0.5827, 124,
    0, false, 0,
    false, 0.4174, 43,
    10, true, true,
    0.4043, 26, 53,
    0, 0.3337);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (22, (SELECT id FROM project_data_snapshots WHERE project_id = 22 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.676, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (23, 'Urban Infra 23 (Rajkot, Gujarat)', 'Urban Infrastructure', 'Gujarat', 'Rajkot',
    22.983499, 68.545659, 230.08, 2774,
    '2021-05-11', '2024-10-04', 'SIA Initiated', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'SIA Initiated', 1, '2021-05-11', '2021-11-07', 
    '2021-05-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'SIA Approved', 2, '2021-11-07', '2022-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'Notification u/s 11', 3, '2022-05-06', '2022-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'Objection Hearing', 4, '2022-11-02', '2023-05-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'Award Declaration', 5, '2023-05-01', '2023-10-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'Compensation Disbursement', 6, '2023-10-28', '2024-04-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'Possession Handover', 7, '2024-04-25', '2024-10-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'Rehabilitation', 8, '2024-10-22', '2025-04-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (23, 'Completed', 9, '2025-04-20', '2025-10-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (23, CURRENT_DATE, 0, 0,
    0, 0, 97,
    18, true, 4,
    false, 0.5514, 10,
    7, false, true,
    0.5394, 49, 14,
    0, 0.4251);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (23, (SELECT id FROM project_data_snapshots WHERE project_id = 23 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2276, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (24, 'Metro Rail 24 (Bengaluru Rural, Karnataka)', 'Metro Rail', 'Karnataka', 'Bengaluru Rural',
    12.834907, 76.131025, 88.06, 4984,
    '2020-08-15', '2022-04-06', 'Objection Hearing', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'SIA Initiated', 1, '2020-08-15', '2021-02-11', 
    '2020-08-15',
    '2021-02-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'SIA Approved', 2, '2021-02-11', '2021-08-10', 
    '2021-02-11',
    '2021-08-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'Notification u/s 11', 3, '2021-08-10', '2022-02-06', 
    '2021-08-10',
    '2022-02-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'Objection Hearing', 4, '2022-02-06', '2022-08-05', 
    '2022-02-06',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'Award Declaration', 5, '2022-08-05', '2023-02-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'Compensation Disbursement', 6, '2023-02-01', '2023-07-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'Possession Handover', 7, '2023-07-31', '2024-01-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'Rehabilitation', 8, '2024-01-27', '2024-07-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (24, 'Completed', 9, '2024-07-25', '2025-01-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (24, CURRENT_DATE, 607, 244,
    0.4646, 0.39, 29,
    0, false, 0,
    false, 0.8667, 20,
    4, true, true,
    0.0257, 44, 36,
    0, 0.4387);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (24, (SELECT id FROM project_data_snapshots WHERE project_id = 24 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5364, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (25, 'Metro 25 (Yadadri Bhuvanagiri, Telangana)', 'Metro Rail', 'Telangana', 'Yadadri Bhuvanagiri',
    18.00897, 77.458556, 176.87, 3519,
    '2023-10-29', '2026-07-07', 'SIA Approved', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'SIA Initiated', 1, '2023-10-29', '2024-04-26', 
    '2023-10-29',
    '2024-04-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'SIA Approved', 2, '2024-04-26', '2024-10-23', 
    '2024-04-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'Notification u/s 11', 3, '2024-10-23', '2025-04-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'Objection Hearing', 4, '2025-04-21', '2025-10-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'Award Declaration', 5, '2025-10-18', '2026-04-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'Compensation Disbursement', 6, '2026-04-16', '2026-10-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'Possession Handover', 7, '2026-10-13', '2027-04-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'Rehabilitation', 8, '2027-04-11', '2027-10-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (25, 'Completed', 9, '2027-10-08', '2028-04-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (25, CURRENT_DATE, 730, 381,
    0.1451, 0.1068, 94,
    0, false, 0,
    false, 0.4414, 82,
    5, true, true,
    0.4201, 67, 6,
    0, 0.3168);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (25, (SELECT id FROM project_data_snapshots WHERE project_id = 25 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3072, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (26, 'PMGSY 26 (Sikar, Rajasthan)', 'Rural Road', 'Rajasthan', 'Sikar',
    26.652227, 75.354117, 413.74, 4863,
    '2021-05-06', '2025-10-18', 'Notification u/s 11', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'SIA Initiated', 1, '2021-05-06', '2021-11-02', 
    '2021-05-06',
    '2021-11-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'SIA Approved', 2, '2021-11-02', '2022-05-01', 
    '2021-11-02',
    '2022-05-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'Notification u/s 11', 3, '2022-05-01', '2022-10-28', 
    '2022-05-01',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'Objection Hearing', 4, '2022-10-28', '2023-04-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'Award Declaration', 5, '2023-04-26', '2023-10-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'Compensation Disbursement', 6, '2023-10-23', '2024-04-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'Possession Handover', 7, '2024-04-20', '2024-10-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'Rehabilitation', 8, '2024-10-17', '2025-04-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (26, 'Completed', 9, '2025-04-15', '2025-10-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (26, CURRENT_DATE, 0, 0,
    0.3116, 0.2685, 68,
    0, false, 0,
    false, 0.5934, 31,
    1, true, true,
    0.4508, 64, 36,
    0, 0.4052);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (26, (SELECT id FROM project_data_snapshots WHERE project_id = 26 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2528, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (27, 'NH 27 (Sangareddy, Telangana)', 'National Highway', 'Telangana', 'Sangareddy',
    16.348479, 80.590246, 260.73, 1575,
    '2020-05-15', '2023-04-12', 'Rehabilitation', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'SIA Initiated', 1, '2020-05-15', '2020-11-11', 
    '2020-05-15',
    '2020-11-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'SIA Approved', 2, '2020-11-11', '2021-05-10', 
    '2020-11-11',
    '2021-05-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'Notification u/s 11', 3, '2021-05-10', '2021-11-06', 
    '2021-05-10',
    '2021-11-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'Objection Hearing', 4, '2021-11-06', '2022-05-05', 
    '2021-11-06',
    '2022-05-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'Award Declaration', 5, '2022-05-05', '2022-11-01', 
    '2022-05-05',
    '2022-11-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'Compensation Disbursement', 6, '2022-11-01', '2023-04-30', 
    '2022-11-01',
    '2023-04-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'Possession Handover', 7, '2023-04-30', '2023-10-27', 
    '2023-04-30',
    '2023-10-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'Rehabilitation', 8, '2023-10-27', '2024-04-24', 
    '2023-10-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (27, 'Completed', 9, '2024-04-24', '2024-10-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (27, CURRENT_DATE, 316, 115,
    0.9511, 0.8658, 61,
    0, false, 0,
    false, 0.832, 62,
    8, true, false,
    0.6906, 87, 45,
    0.4908, 0.4965);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (27, (SELECT id FROM project_data_snapshots WHERE project_id = 27 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2046, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (28, 'Metro Rail 28 (Raigad, Maharashtra)', 'Metro Rail', 'Maharashtra', 'Raigad',
    19.280111, 76.286084, 139.1, 2069,
    '2020-05-21', '2024-05-12', 'Possession Handover', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'SIA Initiated', 1, '2020-05-21', '2020-11-17', 
    '2020-05-21',
    '2020-11-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'SIA Approved', 2, '2020-11-17', '2021-05-16', 
    '2020-11-17',
    '2021-05-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'Notification u/s 11', 3, '2021-05-16', '2021-11-12', 
    '2021-05-16',
    '2021-11-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'Objection Hearing', 4, '2021-11-12', '2022-05-11', 
    '2021-11-12',
    '2022-05-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'Award Declaration', 5, '2022-05-11', '2022-11-07', 
    '2022-05-11',
    '2022-11-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'Compensation Disbursement', 6, '2022-11-07', '2023-05-06', 
    '2022-11-07',
    '2023-05-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'Possession Handover', 7, '2023-05-06', '2023-11-02', 
    '2023-05-06',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'Rehabilitation', 8, '2023-11-02', '2024-04-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (28, 'Completed', 9, '2024-04-30', '2024-10-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (28, CURRENT_DATE, 382, 143,
    0.7351, 0.6791, 30,
    0, false, 0,
    false, 0.8328, 40,
    1, true, false,
    0.9509, 28, 12,
    0.2164, 0.3421);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (28, (SELECT id FROM project_data_snapshots WHERE project_id = 28 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3919, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (29, 'Metro 29 (Coimbatore, Tamil Nadu)', 'Metro Rail', 'Tamil Nadu', 'Coimbatore',
    9.662472, 79.186083, 320.75, 4031,
    '2023-05-22', '2025-02-04', 'Award Declaration', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'SIA Initiated', 1, '2023-05-22', '2023-11-18', 
    '2023-05-22',
    '2023-11-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'SIA Approved', 2, '2023-11-18', '2024-05-16', 
    '2023-11-18',
    '2024-05-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'Notification u/s 11', 3, '2024-05-16', '2024-11-12', 
    '2024-05-16',
    '2024-11-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'Objection Hearing', 4, '2024-11-12', '2025-05-11', 
    '2024-11-12',
    '2025-05-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'Award Declaration', 5, '2025-05-11', '2025-11-07', 
    '2025-05-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'Compensation Disbursement', 6, '2025-11-07', '2026-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'Possession Handover', 7, '2026-05-06', '2026-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'Rehabilitation', 8, '2026-11-02', '2027-05-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (29, 'Completed', 9, '2027-05-01', '2027-10-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (29, CURRENT_DATE, 310, 104,
    0.4091, 0.2931, 3,
    0, false, 0,
    false, 0.7444, 60,
    7, true, true,
    0.1844, 11, 16,
    0, 0.5705);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (29, (SELECT id FROM project_data_snapshots WHERE project_id = 29 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3583, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (30, 'State Highway 30 (Visakhapatnam, Andhra Pradesh)', 'State Highway', 'Andhra Pradesh', 'Visakhapatnam',
    16.90612, 76.928873, 305.13, 1858,
    '2022-05-31', '2024-03-31', 'Possession Handover', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'SIA Initiated', 1, '2022-05-31', '2022-11-27', 
    '2022-05-31',
    '2022-11-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'SIA Approved', 2, '2022-11-27', '2023-05-26', 
    '2022-11-27',
    '2023-05-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'Notification u/s 11', 3, '2023-05-26', '2023-11-22', 
    '2023-05-26',
    '2023-11-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'Objection Hearing', 4, '2023-11-22', '2024-05-20', 
    '2023-11-22',
    '2024-05-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'Award Declaration', 5, '2024-05-20', '2024-11-16', 
    '2024-05-20',
    '2024-11-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'Compensation Disbursement', 6, '2024-11-16', '2025-05-15', 
    '2024-11-16',
    '2025-05-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'Possession Handover', 7, '2025-05-15', '2025-11-11', 
    '2025-05-15',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'Rehabilitation', 8, '2025-11-11', '2026-05-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (30, 'Completed', 9, '2026-05-10', '2026-11-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (30, CURRENT_DATE, 0, 0,
    0.8122, 0.7998, 133,
    25, true, 4,
    true, 0.9451, 38,
    9, true, false,
    0.3054, 84, 3,
    0.6096, 0.47);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (30, (SELECT id FROM project_data_snapshots WHERE project_id = 30 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3222, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (31, 'Metro 31 (Baghpat, Uttar Pradesh)', 'Metro Rail', 'Uttar Pradesh', 'Baghpat',
    25.129788, 77.562987, 147.61, 2326,
    '2023-03-24', '2024-03-28', 'Award Declaration', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'SIA Initiated', 1, '2023-03-24', '2023-09-20', 
    '2023-03-24',
    '2023-09-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'SIA Approved', 2, '2023-09-20', '2024-03-18', 
    '2023-09-20',
    '2024-03-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'Notification u/s 11', 3, '2024-03-18', '2024-09-14', 
    '2024-03-18',
    '2024-09-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'Objection Hearing', 4, '2024-09-14', '2025-03-13', 
    '2024-09-14',
    '2025-03-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'Award Declaration', 5, '2025-03-13', '2025-09-09', 
    '2025-03-13',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'Compensation Disbursement', 6, '2025-09-09', '2026-03-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'Possession Handover', 7, '2026-03-08', '2026-09-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'Rehabilitation', 8, '2026-09-04', '2027-03-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (31, 'Completed', 9, '2027-03-03', '2027-08-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (31, CURRENT_DATE, 448, 89,
    0.4901, 0.4304, 116,
    0, false, 0,
    false, 0.4427, 29,
    4, true, false,
    0.6251, 89, 51,
    0, 0.5668);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (31, (SELECT id FROM project_data_snapshots WHERE project_id = 31 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2971, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (32, 'City Infra 32 (Rangareddy, Telangana)', 'Urban Infrastructure', 'Telangana', 'Rangareddy',
    18.806525, 77.321344, 66.56, 2501,
    '2022-12-01', '2024-11-04', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'SIA Initiated', 1, '2022-12-01', '2023-05-30', 
    '2022-12-01',
    '2023-05-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'SIA Approved', 2, '2023-05-30', '2023-11-26', 
    '2023-05-30',
    '2023-11-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'Notification u/s 11', 3, '2023-11-26', '2024-05-24', 
    '2023-11-26',
    '2024-05-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'Objection Hearing', 4, '2024-05-24', '2024-11-20', 
    '2024-05-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'Award Declaration', 5, '2024-11-20', '2025-05-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'Compensation Disbursement', 6, '2025-05-19', '2025-11-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'Possession Handover', 7, '2025-11-15', '2026-05-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'Rehabilitation', 8, '2026-05-14', '2026-11-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (32, 'Completed', 9, '2026-11-10', '2027-05-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (32, CURRENT_DATE, 344, 0,
    0.394, 0.3732, 103,
    0, false, 0,
    false, 0.9656, 64,
    8, true, true,
    0.0804, 10, 56,
    0, 0.316);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (32, (SELECT id FROM project_data_snapshots WHERE project_id = 32 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6225, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (33, 'Expressway 33 (Dausa, Rajasthan)', 'Expressway', 'Rajasthan', 'Dausa',
    27.720089, 77.244652, 382.74, 1445,
    '2022-02-21', '2026-06-07', 'SIA Initiated', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'SIA Initiated', 1, '2022-02-21', '2022-08-20', 
    '2022-02-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'SIA Approved', 2, '2022-08-20', '2023-02-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'Notification u/s 11', 3, '2023-02-16', '2023-08-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'Objection Hearing', 4, '2023-08-15', '2024-02-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'Award Declaration', 5, '2024-02-11', '2024-08-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'Compensation Disbursement', 6, '2024-08-09', '2025-02-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'Possession Handover', 7, '2025-02-05', '2025-08-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'Rehabilitation', 8, '2025-08-04', '2026-01-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (33, 'Completed', 9, '2026-01-31', '2026-07-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (33, CURRENT_DATE, 51, 0,
    0.0999, 0.0901, 132,
    0, false, 0,
    false, 0.7909, 117,
    4, false, true,
    0.5853, 86, 52,
    0, 0.3459);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (33, (SELECT id FROM project_data_snapshots WHERE project_id = 33 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1187, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (34, 'Industrial Corridor 34 (Pune, Maharashtra)', 'Industrial Corridor', 'Maharashtra', 'Pune',
    16.179899, 73.786599, 230.14, 2586,
    '2023-11-21', '2027-03-13', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'SIA Initiated', 1, '2023-11-21', '2024-05-19', 
    '2023-11-21',
    '2024-05-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'SIA Approved', 2, '2024-05-19', '2024-11-15', 
    '2024-05-19',
    '2024-11-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'Notification u/s 11', 3, '2024-11-15', '2025-05-14', 
    '2024-11-15',
    '2025-05-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'Objection Hearing', 4, '2025-05-14', '2025-11-10', 
    '2025-05-14',
    '2025-11-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'Award Declaration', 5, '2025-11-10', '2026-05-09', 
    '2025-11-10',
    '2026-05-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'Compensation Disbursement', 6, '2026-05-09', '2026-11-05', 
    '2026-05-09',
    '2026-11-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'Possession Handover', 7, '2026-11-05', '2027-05-04', 
    '2026-11-05',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'Rehabilitation', 8, '2027-05-04', '2027-10-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (34, 'Completed', 9, '2027-10-31', '2028-04-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (34, CURRENT_DATE, 537, 293,
    0.7076, 0.696, 82,
    0, false, 0,
    false, 0.4696, 98,
    6, true, false,
    0.8249, 5, 42,
    0.8694, 0.331);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (34, (SELECT id FROM project_data_snapshots WHERE project_id = 34 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3963, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (35, 'City Infra 35 (Bengaluru Urban, Karnataka)', 'Urban Infrastructure', 'Karnataka', 'Bengaluru Urban',
    14.188931, 77.419957, 65.11, 4997,
    '2021-07-06', '2023-08-26', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'SIA Initiated', 1, '2021-07-06', '2022-01-02', 
    '2021-07-06',
    '2022-01-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'SIA Approved', 2, '2022-01-02', '2022-07-01', 
    '2022-01-02',
    '2022-07-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'Notification u/s 11', 3, '2022-07-01', '2022-12-28', 
    '2022-07-01',
    '2022-12-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'Objection Hearing', 4, '2022-12-28', '2023-06-26', 
    '2022-12-28',
    '2023-06-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'Award Declaration', 5, '2023-06-26', '2023-12-23', 
    '2023-06-26',
    '2023-12-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'Compensation Disbursement', 6, '2023-12-23', '2024-06-20', 
    '2023-12-23',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'Possession Handover', 7, '2024-06-20', '2024-12-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'Rehabilitation', 8, '2024-12-17', '2025-06-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (35, 'Completed', 9, '2025-06-15', '2025-12-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (35, CURRENT_DATE, 303, 62,
    0.6348, 0.6211, 40,
    0, false, 0,
    false, 0.5865, 1,
    8, true, true,
    0.2247, 19, 29,
    0, 0.5735);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (35, (SELECT id FROM project_data_snapshots WHERE project_id = 35 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6769, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (36, 'Expressway 36 (Vadodara, Gujarat)', 'Expressway', 'Gujarat', 'Vadodara',
    22.171248, 71.069429, 432.69, 2273,
    '2022-03-16', '2025-10-06', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'SIA Initiated', 1, '2022-03-16', '2022-09-12', 
    '2022-03-16',
    '2022-09-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'SIA Approved', 2, '2022-09-12', '2023-03-11', 
    '2022-09-12',
    '2023-03-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'Notification u/s 11', 3, '2023-03-11', '2023-09-07', 
    '2023-03-11',
    '2023-09-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'Objection Hearing', 4, '2023-09-07', '2024-03-05', 
    '2023-09-07',
    '2024-03-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'Award Declaration', 5, '2024-03-05', '2024-09-01', 
    '2024-03-05',
    '2024-09-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'Compensation Disbursement', 6, '2024-09-01', '2025-02-28', 
    '2024-09-01',
    '2025-02-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'Possession Handover', 7, '2025-02-28', '2025-08-27', 
    '2025-02-28',
    '2025-08-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'Rehabilitation', 8, '2025-08-27', '2026-02-23', 
    '2025-08-27',
    '2026-02-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (36, 'Completed', 9, '2026-02-23', '2026-08-22', 
    '2026-02-23',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (36, CURRENT_DATE, 594, 308,
    0.9289, 0.7034, 87,
    0, false, 0,
    false, 0.9605, 64,
    4, true, false,
    0.2828, 43, 53,
    0.5869, 0.5995);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (36, (SELECT id FROM project_data_snapshots WHERE project_id = 36 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0246, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (37, 'Rural Road 37 (Vizianagaram, Andhra Pradesh)', 'Rural Road', 'Andhra Pradesh', 'Vizianagaram',
    16.363422, 80.847441, 288.04, 1923,
    '2023-04-25', '2026-11-12', 'Completed', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'SIA Initiated', 1, '2023-04-25', '2023-10-22', 
    '2023-04-25',
    '2023-10-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'SIA Approved', 2, '2023-10-22', '2024-04-19', 
    '2023-10-22',
    '2024-04-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'Notification u/s 11', 3, '2024-04-19', '2024-10-16', 
    '2024-04-19',
    '2024-10-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'Objection Hearing', 4, '2024-10-16', '2025-04-14', 
    '2024-10-16',
    '2025-04-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'Award Declaration', 5, '2025-04-14', '2025-10-11', 
    '2025-04-14',
    '2025-10-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'Compensation Disbursement', 6, '2025-10-11', '2026-04-09', 
    '2025-10-11',
    '2026-04-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'Possession Handover', 7, '2026-04-09', '2026-10-06', 
    '2026-04-09',
    '2026-10-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'Rehabilitation', 8, '2026-10-06', '2027-04-04', 
    '2026-10-06',
    '2027-04-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (37, 'Completed', 9, '2027-04-04', '2027-10-01', 
    '2027-04-04',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (37, CURRENT_DATE, 0, 0,
    1, 0.9609, 105,
    0, false, 0,
    false, 0.4262, 95,
    7, true, false,
    0.8114, 54, 42,
    0.7924, 0.426);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (37, (SELECT id FROM project_data_snapshots WHERE project_id = 37 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (38, 'National Highway 38 (Vadodara, Gujarat)', 'National Highway', 'Gujarat', 'Vadodara',
    21.493976, 68.65237, 436.11, 1274,
    '2022-06-22', '2025-12-09', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'SIA Initiated', 1, '2022-06-22', '2022-12-19', 
    '2022-06-22',
    '2022-12-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'SIA Approved', 2, '2022-12-19', '2023-06-17', 
    '2022-12-19',
    '2023-06-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'Notification u/s 11', 3, '2023-06-17', '2023-12-14', 
    '2023-06-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'Objection Hearing', 4, '2023-12-14', '2024-06-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'Award Declaration', 5, '2024-06-11', '2024-12-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'Compensation Disbursement', 6, '2024-12-08', '2025-06-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'Possession Handover', 7, '2025-06-06', '2025-12-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'Rehabilitation', 8, '2025-12-03', '2026-06-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (38, 'Completed', 9, '2026-06-01', '2026-11-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (38, CURRENT_DATE, 132, 0,
    0.2552, 0.2136, 120,
    0, false, 0,
    false, 0.8689, 33,
    5, true, true,
    0.3975, 15, 54,
    0, 0.2643);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (38, (SELECT id FROM project_data_snapshots WHERE project_id = 38 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4896, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (39, 'Rural Road 39 (Sangareddy, Telangana)', 'Rural Road', 'Telangana', 'Sangareddy',
    16.439081, 80.079798, 224.62, 2463,
    '2023-06-12', '2026-01-20', 'Completed', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'SIA Initiated', 1, '2023-06-12', '2023-12-09', 
    '2023-06-12',
    '2023-12-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'SIA Approved', 2, '2023-12-09', '2024-06-06', 
    '2023-12-09',
    '2024-06-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'Notification u/s 11', 3, '2024-06-06', '2024-12-03', 
    '2024-06-06',
    '2024-12-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'Objection Hearing', 4, '2024-12-03', '2025-06-01', 
    '2024-12-03',
    '2025-06-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'Award Declaration', 5, '2025-06-01', '2025-11-28', 
    '2025-06-01',
    '2025-11-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'Compensation Disbursement', 6, '2025-11-28', '2026-05-27', 
    '2025-11-28',
    '2026-05-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'Possession Handover', 7, '2026-05-27', '2026-11-23', 
    '2026-05-27',
    '2026-11-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'Rehabilitation', 8, '2026-11-23', '2027-05-22', 
    '2026-11-23',
    '2027-05-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (39, 'Completed', 9, '2027-05-22', '2027-11-18', 
    '2027-05-22',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (39, CURRENT_DATE, 262, 75,
    1, 0.8302, 11,
    21, true, 1,
    false, 0.576, 47,
    6, true, true,
    0.5312, 77, 43,
    0.7925, 0.185);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (39, (SELECT id FROM project_data_snapshots WHERE project_id = 39 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0852, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (40, 'SC Mission 40 (Nashik, Maharashtra)', 'Smart City', 'Maharashtra', 'Nashik',
    16.430265, 76.189199, 451.1, 4487,
    '2022-04-22', '2024-09-23', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'SIA Initiated', 1, '2022-04-22', '2022-10-19', 
    '2022-04-22',
    '2022-10-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'SIA Approved', 2, '2022-10-19', '2023-04-17', 
    '2022-10-19',
    '2023-04-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'Notification u/s 11', 3, '2023-04-17', '2023-10-14', 
    '2023-04-17',
    '2023-10-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'Objection Hearing', 4, '2023-10-14', '2024-04-11', 
    '2023-10-14',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'Award Declaration', 5, '2024-04-11', '2024-10-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'Compensation Disbursement', 6, '2024-10-08', '2025-04-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'Possession Handover', 7, '2025-04-06', '2025-10-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'Rehabilitation', 8, '2025-10-03', '2026-04-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (40, 'Completed', 9, '2026-04-01', '2026-09-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (40, CURRENT_DATE, 0, 0,
    0.3669, 0.3302, 40,
    0, false, 0,
    false, 0.4443, 120,
    5, true, false,
    0.2992, 59, 44,
    0, 0.225);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (40, (SELECT id FROM project_data_snapshots WHERE project_id = 40 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6238, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (41, 'Smart City 41 (Tiruppur, Tamil Nadu)', 'Smart City', 'Tamil Nadu', 'Tiruppur',
    11.145575, 78.586654, 285.13, 411,
    '2022-10-25', '2027-09-26', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'SIA Initiated', 1, '2022-10-25', '2023-04-23', 
    '2022-10-25',
    '2023-04-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'SIA Approved', 2, '2023-04-23', '2023-10-20', 
    '2023-04-23',
    '2023-10-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'Notification u/s 11', 3, '2023-10-20', '2024-04-17', 
    '2023-10-20',
    '2024-04-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'Objection Hearing', 4, '2024-04-17', '2024-10-14', 
    '2024-04-17',
    '2024-10-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'Award Declaration', 5, '2024-10-14', '2025-04-12', 
    '2024-10-14',
    '2025-04-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'Compensation Disbursement', 6, '2025-04-12', '2025-10-09', 
    '2025-04-12',
    '2025-10-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'Possession Handover', 7, '2025-10-09', '2026-04-07', 
    '2025-10-09',
    '2026-04-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'Rehabilitation', 8, '2026-04-07', '2026-10-04', 
    '2026-04-07',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (41, 'Completed', 9, '2026-10-04', '2027-04-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (41, CURRENT_DATE, 332, 0,
    0.7794, 0.7396, 127,
    0, false, 0,
    false, 0.8997, 115,
    4, true, false,
    0.2301, 50, 14,
    0.6366, 0.4104);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (41, (SELECT id FROM project_data_snapshots WHERE project_id = 41 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2212, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (42, 'SH 42 (Bhavnagar, Gujarat)', 'State Highway', 'Gujarat', 'Bhavnagar',
    20.15014, 70.371598, 70.42, 4428,
    '2020-03-07', '2021-12-01', 'SIA Initiated', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'SIA Initiated', 1, '2020-03-07', '2020-09-03', 
    '2020-03-07',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'SIA Approved', 2, '2020-09-03', '2021-03-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'Notification u/s 11', 3, '2021-03-02', '2021-08-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'Objection Hearing', 4, '2021-08-29', '2022-02-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'Award Declaration', 5, '2022-02-25', '2022-08-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'Compensation Disbursement', 6, '2022-08-24', '2023-02-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'Possession Handover', 7, '2023-02-20', '2023-08-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'Rehabilitation', 8, '2023-08-19', '2024-02-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (42, 'Completed', 9, '2024-02-15', '2024-08-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (42, CURRENT_DATE, 122, 0,
    0.0819, 0.0654, 135,
    0, false, 0,
    false, 0.7011, 34,
    2, false, true,
    0.8247, 66, 51,
    0, 0.2476);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (42, (SELECT id FROM project_data_snapshots WHERE project_id = 42 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2866, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (43, 'PMGSY 43 (Jaipur, Rajasthan)', 'Rural Road', 'Rajasthan', 'Jaipur',
    24.579303, 75.586914, 11.89, 4405,
    '2020-11-28', '2025-09-09', 'SIA Approved', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'SIA Initiated', 1, '2020-11-28', '2021-05-27', 
    '2020-11-28',
    '2021-05-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'SIA Approved', 2, '2021-05-27', '2021-11-23', 
    '2021-05-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'Notification u/s 11', 3, '2021-11-23', '2022-05-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'Objection Hearing', 4, '2022-05-22', '2022-11-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'Award Declaration', 5, '2022-11-18', '2023-05-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'Compensation Disbursement', 6, '2023-05-17', '2023-11-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'Possession Handover', 7, '2023-11-13', '2024-05-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'Rehabilitation', 8, '2024-05-11', '2024-11-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (43, 'Completed', 9, '2024-11-07', '2025-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (43, CURRENT_DATE, 436, 225,
    0.2185, 0.2056, 116,
    0, false, 0,
    false, 0.6212, 95,
    10, true, true,
    0.381, 86, 60,
    0, 0.2857);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (43, (SELECT id FROM project_data_snapshots WHERE project_id = 43 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3262, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (44, 'National Highway 44 (Bulandshahr, Uttar Pradesh)', 'National Highway', 'Uttar Pradesh', 'Bulandshahr',
    25.438887, 77.474128, 62.48, 1933,
    '2021-02-26', '2024-10-03', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'SIA Initiated', 1, '2021-02-26', '2021-08-25', 
    '2021-02-26',
    '2021-08-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'SIA Approved', 2, '2021-08-25', '2022-02-21', 
    '2021-08-25',
    '2022-02-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'Notification u/s 11', 3, '2022-02-21', '2022-08-20', 
    '2022-02-21',
    '2022-08-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'Objection Hearing', 4, '2022-08-20', '2023-02-16', 
    '2022-08-20',
    '2023-02-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'Award Declaration', 5, '2023-02-16', '2023-08-15', 
    '2023-02-16',
    '2023-08-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'Compensation Disbursement', 6, '2023-08-15', '2024-02-11', 
    '2023-08-15',
    '2024-02-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'Possession Handover', 7, '2024-02-11', '2024-08-09', 
    '2024-02-11',
    '2024-08-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'Rehabilitation', 8, '2024-08-09', '2025-02-05', 
    '2024-08-09',
    '2025-02-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (44, 'Completed', 9, '2025-02-05', '2025-08-04', 
    '2025-02-05',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (44, CURRENT_DATE, 339, 22,
    1, 0.735, 34,
    25, true, 4,
    true, 0.6226, 95,
    8, true, true,
    0.7423, 24, 56,
    0.4149, 0.1495);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (44, (SELECT id FROM project_data_snapshots WHERE project_id = 44 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1746, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (45, 'SC Mission 45 (West Godavari, Andhra Pradesh)', 'Smart City', 'Andhra Pradesh', 'West Godavari',
    14.020888, 80.057567, 34.97, 2270,
    '2020-04-26', '2022-08-22', 'Award Declaration', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'SIA Initiated', 1, '2020-04-26', '2020-10-23', 
    '2020-04-26',
    '2020-10-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'SIA Approved', 2, '2020-10-23', '2021-04-21', 
    '2020-10-23',
    '2021-04-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'Notification u/s 11', 3, '2021-04-21', '2021-10-18', 
    '2021-04-21',
    '2021-10-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'Objection Hearing', 4, '2021-10-18', '2022-04-16', 
    '2021-10-18',
    '2022-04-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'Award Declaration', 5, '2022-04-16', '2022-10-13', 
    '2022-04-16',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'Compensation Disbursement', 6, '2022-10-13', '2023-04-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'Possession Handover', 7, '2023-04-11', '2023-10-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'Rehabilitation', 8, '2023-10-08', '2024-04-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (45, 'Completed', 9, '2024-04-05', '2024-10-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (45, CURRENT_DATE, 401, 173,
    0.4199, 0.3803, 31,
    0, false, 0,
    false, 0.9694, 105,
    7, true, true,
    0.2121, 86, 38,
    0, 0.5855);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (45, (SELECT id FROM project_data_snapshots WHERE project_id = 45 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4571, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (46, 'Metro 46 (Mysuru, Karnataka)', 'Metro Rail', 'Karnataka', 'Mysuru',
    14.904362, 76.493935, 142.25, 1195,
    '2020-12-05', '2025-03-19', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'SIA Initiated', 1, '2020-12-05', '2021-06-03', 
    '2020-12-05',
    '2021-06-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'SIA Approved', 2, '2021-06-03', '2021-11-30', 
    '2021-06-03',
    '2021-11-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'Notification u/s 11', 3, '2021-11-30', '2022-05-29', 
    '2021-11-30',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'Objection Hearing', 4, '2022-05-29', '2022-11-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'Award Declaration', 5, '2022-11-25', '2023-05-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'Compensation Disbursement', 6, '2023-05-24', '2023-11-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'Possession Handover', 7, '2023-11-20', '2024-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'Rehabilitation', 8, '2024-05-18', '2024-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (46, 'Completed', 9, '2024-11-14', '2025-05-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (46, CURRENT_DATE, 251, 38,
    0.3126, 0.2407, 138,
    0, false, 0,
    false, 0.5504, 22,
    1, true, true,
    0.0258, 6, 22,
    0, 0.495);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (46, (SELECT id FROM project_data_snapshots WHERE project_id = 46 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2616, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (47, 'Industrial Corridor 47 (Hapur, Uttar Pradesh)', 'Industrial Corridor', 'Uttar Pradesh', 'Hapur',
    24.823931, 80.157204, 228.74, 1824,
    '2020-05-27', '2022-01-14', 'SIA Initiated', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'SIA Initiated', 1, '2020-05-27', '2020-11-23', 
    '2020-05-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'SIA Approved', 2, '2020-11-23', '2021-05-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'Notification u/s 11', 3, '2021-05-22', '2021-11-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'Objection Hearing', 4, '2021-11-18', '2022-05-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'Award Declaration', 5, '2022-05-17', '2022-11-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'Compensation Disbursement', 6, '2022-11-13', '2023-05-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'Possession Handover', 7, '2023-05-12', '2023-11-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'Rehabilitation', 8, '2023-11-08', '2024-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (47, 'Completed', 9, '2024-05-06', '2024-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (47, CURRENT_DATE, 95, 0,
    0, 0, 11,
    0, false, 0,
    false, 0.8363, 116,
    10, false, true,
    0.458, 8, 3,
    0, 0.5993);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (47, (SELECT id FROM project_data_snapshots WHERE project_id = 47 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1296, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (48, 'State Highway 48 (Yadadri Bhuvanagiri, Telangana)', 'State Highway', 'Telangana', 'Yadadri Bhuvanagiri',
    15.823162, 79.737338, 193.55, 4903,
    '2021-02-09', '2022-06-23', 'Rehabilitation', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'SIA Initiated', 1, '2021-02-09', '2021-08-08', 
    '2021-02-09',
    '2021-08-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'SIA Approved', 2, '2021-08-08', '2022-02-04', 
    '2021-08-08',
    '2022-02-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'Notification u/s 11', 3, '2022-02-04', '2022-08-03', 
    '2022-02-04',
    '2022-08-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'Objection Hearing', 4, '2022-08-03', '2023-01-30', 
    '2022-08-03',
    '2023-01-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'Award Declaration', 5, '2023-01-30', '2023-07-29', 
    '2023-01-30',
    '2023-07-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'Compensation Disbursement', 6, '2023-07-29', '2024-01-25', 
    '2023-07-29',
    '2024-01-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'Possession Handover', 7, '2024-01-25', '2024-07-23', 
    '2024-01-25',
    '2024-07-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'Rehabilitation', 8, '2024-07-23', '2025-01-19', 
    '2024-07-23',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (48, 'Completed', 9, '2025-01-19', '2025-07-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (48, CURRENT_DATE, 0, 0,
    0.8002, 0.71, 135,
    0, false, 0,
    false, 0.5769, 64,
    9, true, true,
    0.7931, 19, 54,
    0.6547, 0.5389);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (48, (SELECT id FROM project_data_snapshots WHERE project_id = 48 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.172, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (49, 'Rural Road 49 (Bulandshahr, Uttar Pradesh)', 'Rural Road', 'Uttar Pradesh', 'Bulandshahr',
    26.947743, 80.119922, 344.98, 3895,
    '2022-07-17', '2024-01-27', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'SIA Initiated', 1, '2022-07-17', '2023-01-13', 
    '2022-07-17',
    '2023-01-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'SIA Approved', 2, '2023-01-13', '2023-07-12', 
    '2023-01-13',
    '2023-07-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'Notification u/s 11', 3, '2023-07-12', '2024-01-08', 
    '2023-07-12',
    '2024-01-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'Objection Hearing', 4, '2024-01-08', '2024-07-06', 
    '2024-01-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'Award Declaration', 5, '2024-07-06', '2025-01-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'Compensation Disbursement', 6, '2025-01-02', '2025-07-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'Possession Handover', 7, '2025-07-01', '2025-12-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'Rehabilitation', 8, '2025-12-28', '2026-06-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (49, 'Completed', 9, '2026-06-26', '2026-12-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (49, CURRENT_DATE, 0, 0,
    0.3375, 0.2679, 17,
    0, false, 0,
    false, 0.4547, 10,
    1, true, true,
    0.7446, 52, 51,
    0, 0.1651);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (49, (SELECT id FROM project_data_snapshots WHERE project_id = 49 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4517, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (50, 'Urban Infra 50 (Tumakuru, Karnataka)', 'Urban Infrastructure', 'Karnataka', 'Tumakuru',
    13.43783, 77.931233, 81.59, 3960,
    '2021-06-16', '2024-10-29', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'SIA Initiated', 1, '2021-06-16', '2021-12-13', 
    '2021-06-16',
    '2021-12-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'SIA Approved', 2, '2021-12-13', '2022-06-11', 
    '2021-12-13',
    '2022-06-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'Notification u/s 11', 3, '2022-06-11', '2022-12-08', 
    '2022-06-11',
    '2022-12-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'Objection Hearing', 4, '2022-12-08', '2023-06-06', 
    '2022-12-08',
    '2023-06-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'Award Declaration', 5, '2023-06-06', '2023-12-03', 
    '2023-06-06',
    '2023-12-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'Compensation Disbursement', 6, '2023-12-03', '2024-05-31', 
    '2023-12-03',
    '2024-05-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'Possession Handover', 7, '2024-05-31', '2024-11-27', 
    '2024-05-31',
    '2024-11-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'Rehabilitation', 8, '2024-11-27', '2025-05-26', 
    '2024-11-27',
    '2025-05-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (50, 'Completed', 9, '2025-05-26', '2025-11-22', 
    '2025-05-26',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (50, CURRENT_DATE, 82, 0,
    1, 0.8801, 27,
    0, false, 0,
    false, 0.6101, 71,
    5, true, true,
    0.2786, 33, 51,
    0.4291, 0.3805);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (50, (SELECT id FROM project_data_snapshots WHERE project_id = 50 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.101, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (51, 'Expressway 51 (Tumakuru, Karnataka)', 'Expressway', 'Karnataka', 'Tumakuru',
    14.668433, 78.146919, 75.23, 261,
    '2021-06-24', '2024-06-11', 'SIA Initiated', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'SIA Initiated', 1, '2021-06-24', '2021-12-21', 
    '2021-06-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'SIA Approved', 2, '2021-12-21', '2022-06-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'Notification u/s 11', 3, '2022-06-19', '2022-12-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'Objection Hearing', 4, '2022-12-16', '2023-06-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'Award Declaration', 5, '2023-06-14', '2023-12-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'Compensation Disbursement', 6, '2023-12-11', '2024-06-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'Possession Handover', 7, '2024-06-08', '2024-12-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'Rehabilitation', 8, '2024-12-05', '2025-06-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (51, 'Completed', 9, '2025-06-03', '2025-11-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (51, CURRENT_DATE, 36, 0,
    0, 0, 135,
    0, false, 0,
    false, 0.5291, 53,
    7, false, true,
    0.3701, 46, 49,
    0, 0.5707);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (51, (SELECT id FROM project_data_snapshots WHERE project_id = 51 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.132, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (52, 'Railway 52 (Thane, Maharashtra)', 'Railway Line', 'Maharashtra', 'Thane',
    16.03028, 76.044904, 175.86, 918,
    '2020-11-01', '2024-03-18', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'SIA Initiated', 1, '2020-11-01', '2021-04-30', 
    '2020-11-01',
    '2021-04-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'SIA Approved', 2, '2021-04-30', '2021-10-27', 
    '2021-04-30',
    '2021-10-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'Notification u/s 11', 3, '2021-10-27', '2022-04-25', 
    '2021-10-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'Objection Hearing', 4, '2022-04-25', '2022-10-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'Award Declaration', 5, '2022-10-22', '2023-04-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'Compensation Disbursement', 6, '2023-04-20', '2023-10-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'Possession Handover', 7, '2023-10-17', '2024-04-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'Rehabilitation', 8, '2024-04-14', '2024-10-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (52, 'Completed', 9, '2024-10-11', '2025-04-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (52, CURRENT_DATE, 527, 275,
    0.2714, 0.2237, 173,
    0, false, 0,
    false, 0.8071, 62,
    8, true, true,
    0.0454, 55, 38,
    0, 0.1274);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (52, (SELECT id FROM project_data_snapshots WHERE project_id = 52 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2149, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (53, 'Metro Rail 53 (Gautam Buddha Nagar, Uttar Pradesh)', 'Metro Rail', 'Uttar Pradesh', 'Gautam Buddha Nagar',
    24.779898, 80.73039, 40.68, 356,
    '2021-01-24', '2024-06-23', 'Notification u/s 11', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'SIA Initiated', 1, '2021-01-24', '2021-07-23', 
    '2021-01-24',
    '2021-07-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'SIA Approved', 2, '2021-07-23', '2022-01-19', 
    '2021-07-23',
    '2022-01-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'Notification u/s 11', 3, '2022-01-19', '2022-07-18', 
    '2022-01-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'Objection Hearing', 4, '2022-07-18', '2023-01-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'Award Declaration', 5, '2023-01-14', '2023-07-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'Compensation Disbursement', 6, '2023-07-13', '2024-01-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'Possession Handover', 7, '2024-01-09', '2024-07-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'Rehabilitation', 8, '2024-07-07', '2025-01-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (53, 'Completed', 9, '2025-01-03', '2025-07-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (53, CURRENT_DATE, 209, 0,
    0.1758, 0.1512, 4,
    0, false, 0,
    false, 0.6759, 9,
    5, true, true,
    0.5734, 86, 26,
    0, 0.2448);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (53, (SELECT id FROM project_data_snapshots WHERE project_id = 53 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2868, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (54, 'Ind Corridor 54 (Rangareddy, Telangana)', 'Industrial Corridor', 'Telangana', 'Rangareddy',
    18.25844, 78.628337, 435.91, 2791,
    '2023-09-29', '2027-03-11', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'SIA Initiated', 1, '2023-09-29', '2024-03-27', 
    '2023-09-29',
    '2024-03-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'SIA Approved', 2, '2024-03-27', '2024-09-23', 
    '2024-03-27',
    '2024-09-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'Notification u/s 11', 3, '2024-09-23', '2025-03-22', 
    '2024-09-23',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'Objection Hearing', 4, '2025-03-22', '2025-09-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'Award Declaration', 5, '2025-09-18', '2026-03-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'Compensation Disbursement', 6, '2026-03-17', '2026-09-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'Possession Handover', 7, '2026-09-13', '2027-03-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'Rehabilitation', 8, '2027-03-12', '2027-09-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (54, 'Completed', 9, '2027-09-08', '2028-03-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (54, CURRENT_DATE, 138, 0,
    0.1987, 0.1742, 85,
    0, false, 0,
    false, 0.8675, 9,
    8, true, true,
    0.5306, 29, 57,
    0, 0.4881);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (54, (SELECT id FROM project_data_snapshots WHERE project_id = 54 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.338, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (55, 'Rail Line 55 (Sikar, Rajasthan)', 'Railway Line', 'Rajasthan', 'Sikar',
    24.380903, 74.921591, 342.16, 4634,
    '2022-08-04', '2027-04-07', 'Objection Hearing', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'SIA Initiated', 1, '2022-08-04', '2023-01-31', 
    '2022-08-04',
    '2023-01-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'SIA Approved', 2, '2023-01-31', '2023-07-30', 
    '2023-01-31',
    '2023-07-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'Notification u/s 11', 3, '2023-07-30', '2024-01-26', 
    '2023-07-30',
    '2024-01-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'Objection Hearing', 4, '2024-01-26', '2024-07-24', 
    '2024-01-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'Award Declaration', 5, '2024-07-24', '2025-01-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'Compensation Disbursement', 6, '2025-01-20', '2025-07-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'Possession Handover', 7, '2025-07-19', '2026-01-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'Rehabilitation', 8, '2026-01-15', '2026-07-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (55, 'Completed', 9, '2026-07-14', '2027-01-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (55, CURRENT_DATE, 107, 0,
    0.3104, 0.2893, 162,
    0, false, 0,
    false, 0.9919, 41,
    10, true, true,
    0.4398, 65, 28,
    0, 0.4157);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (55, (SELECT id FROM project_data_snapshots WHERE project_id = 55 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3939, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (56, 'National Highway 56 (Namakkal, Tamil Nadu)', 'National Highway', 'Tamil Nadu', 'Namakkal',
    10.539584, 76.169233, 234.04, 4550,
    '2022-06-08', '2025-07-02', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'SIA Initiated', 1, '2022-06-08', '2022-12-05', 
    '2022-06-08',
    '2022-12-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'SIA Approved', 2, '2022-12-05', '2023-06-03', 
    '2022-12-05',
    '2023-06-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'Notification u/s 11', 3, '2023-06-03', '2023-11-30', 
    '2023-06-03',
    '2023-11-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'Objection Hearing', 4, '2023-11-30', '2024-05-28', 
    '2023-11-30',
    '2024-05-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'Award Declaration', 5, '2024-05-28', '2024-11-24', 
    '2024-05-28',
    '2024-11-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'Compensation Disbursement', 6, '2024-11-24', '2025-05-23', 
    '2024-11-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'Possession Handover', 7, '2025-05-23', '2025-11-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'Rehabilitation', 8, '2025-11-19', '2026-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (56, 'Completed', 9, '2026-05-18', '2026-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (56, CURRENT_DATE, 323, 133,
    0.5403, 0.5183, 115,
    0, false, 0,
    false, 0.9454, 73,
    10, true, true,
    0.605, 69, 9,
    0, 0.5789);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (56, (SELECT id FROM project_data_snapshots WHERE project_id = 56 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4723, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (57, 'Ind Corridor 57 (Visakhapatnam, Andhra Pradesh)', 'Industrial Corridor', 'Andhra Pradesh', 'Visakhapatnam',
    12.773995, 82.160974, 196.77, 2781,
    '2020-09-06', '2024-02-22', 'SIA Approved', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'SIA Initiated', 1, '2020-09-06', '2021-03-05', 
    '2020-09-06',
    '2021-03-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'SIA Approved', 2, '2021-03-05', '2021-09-01', 
    '2021-03-05',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'Notification u/s 11', 3, '2021-09-01', '2022-02-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'Objection Hearing', 4, '2022-02-28', '2022-08-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'Award Declaration', 5, '2022-08-27', '2023-02-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'Compensation Disbursement', 6, '2023-02-23', '2023-08-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'Possession Handover', 7, '2023-08-22', '2024-02-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'Rehabilitation', 8, '2024-02-18', '2024-08-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (57, 'Completed', 9, '2024-08-16', '2025-02-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (57, CURRENT_DATE, 566, 213,
    0.1295, 0.0969, 153,
    0, false, 0,
    false, 0.4314, 80,
    10, true, true,
    0.3297, 76, 43,
    0, 0.2933);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (57, (SELECT id FROM project_data_snapshots WHERE project_id = 57 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2938, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (58, 'Port Connectivity 58 (Karur, Tamil Nadu)', 'Port Connectivity', 'Tamil Nadu', 'Karur',
    11.649867, 80.125359, 158.24, 3095,
    '2022-11-30', '2025-08-26', 'Notification u/s 11', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'SIA Initiated', 1, '2022-11-30', '2023-05-29', 
    '2022-11-30',
    '2023-05-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'SIA Approved', 2, '2023-05-29', '2023-11-25', 
    '2023-05-29',
    '2023-11-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'Notification u/s 11', 3, '2023-11-25', '2024-05-23', 
    '2023-11-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'Objection Hearing', 4, '2024-05-23', '2024-11-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'Award Declaration', 5, '2024-11-19', '2025-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'Compensation Disbursement', 6, '2025-05-18', '2025-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'Possession Handover', 7, '2025-11-14', '2026-05-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'Rehabilitation', 8, '2026-05-13', '2026-11-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (58, 'Completed', 9, '2026-11-09', '2027-05-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (58, CURRENT_DATE, 701, 357,
    0.2897, 0.2369, 84,
    0, false, 0,
    false, 0.8879, 85,
    10, true, false,
    0.0935, 90, 27,
    0, 0.3542);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (58, (SELECT id FROM project_data_snapshots WHERE project_id = 58 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2245, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (59, 'Expressway 59 (Mysuru, Karnataka)', 'Expressway', 'Karnataka', 'Mysuru',
    14.681547, 74.864024, 332.65, 1083,
    '2020-08-26', '2022-06-03', 'Notification u/s 11', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'SIA Initiated', 1, '2020-08-26', '2021-02-22', 
    '2020-08-26',
    '2021-02-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'SIA Approved', 2, '2021-02-22', '2021-08-21', 
    '2021-02-22',
    '2021-08-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'Notification u/s 11', 3, '2021-08-21', '2022-02-17', 
    '2021-08-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'Objection Hearing', 4, '2022-02-17', '2022-08-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'Award Declaration', 5, '2022-08-16', '2023-02-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'Compensation Disbursement', 6, '2023-02-12', '2023-08-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'Possession Handover', 7, '2023-08-11', '2024-02-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'Rehabilitation', 8, '2024-02-07', '2024-08-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (59, 'Completed', 9, '2024-08-05', '2025-02-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (59, CURRENT_DATE, 188, 0,
    0.1654, 0.1577, 96,
    10, true, 2,
    false, 0.5085, 88,
    9, true, false,
    0.1655, 61, 2,
    0, 0.3054);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (59, (SELECT id FROM project_data_snapshots WHERE project_id = 59 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3025, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (60, 'Port Link 60 (Bulandshahr, Uttar Pradesh)', 'Port Connectivity', 'Uttar Pradesh', 'Bulandshahr',
    25.554595, 84.241975, 233.53, 2318,
    '2021-07-08', '2025-02-22', 'Award Declaration', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'SIA Initiated', 1, '2021-07-08', '2022-01-04', 
    '2021-07-08',
    '2022-01-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'SIA Approved', 2, '2022-01-04', '2022-07-03', 
    '2022-01-04',
    '2022-07-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'Notification u/s 11', 3, '2022-07-03', '2022-12-30', 
    '2022-07-03',
    '2022-12-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'Objection Hearing', 4, '2022-12-30', '2023-06-28', 
    '2022-12-30',
    '2023-06-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'Award Declaration', 5, '2023-06-28', '2023-12-25', 
    '2023-06-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'Compensation Disbursement', 6, '2023-12-25', '2024-06-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'Possession Handover', 7, '2024-06-22', '2024-12-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'Rehabilitation', 8, '2024-12-19', '2025-06-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (60, 'Completed', 9, '2025-06-17', '2025-12-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (60, CURRENT_DATE, 0, 0,
    0.5808, 0.4404, 97,
    0, false, 0,
    false, 0.7017, 53,
    2, true, false,
    0.8013, 22, 55,
    0, 0.225);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (60, (SELECT id FROM project_data_snapshots WHERE project_id = 60 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3202, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (61, 'Urban Infra 61 (Srikakulam, Andhra Pradesh)', 'Urban Infrastructure', 'Andhra Pradesh', 'Srikakulam',
    14.495441, 82.604935, 409.27, 2873,
    '2023-12-15', '2026-06-25', 'SIA Approved', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'SIA Initiated', 1, '2023-12-15', '2024-06-12', 
    '2023-12-15',
    '2024-06-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'SIA Approved', 2, '2024-06-12', '2024-12-09', 
    '2024-06-12',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'Notification u/s 11', 3, '2024-12-09', '2025-06-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'Objection Hearing', 4, '2025-06-07', '2025-12-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'Award Declaration', 5, '2025-12-04', '2026-06-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'Compensation Disbursement', 6, '2026-06-02', '2026-11-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'Possession Handover', 7, '2026-11-29', '2027-05-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'Rehabilitation', 8, '2027-05-28', '2027-11-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (61, 'Completed', 9, '2027-11-24', '2028-05-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (61, CURRENT_DATE, 490, 304,
    0.2061, 0.1534, 106,
    0, false, 0,
    false, 0.432, 64,
    5, true, true,
    0.9945, 52, 14,
    0, 0.1141);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (61, (SELECT id FROM project_data_snapshots WHERE project_id = 61 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3553, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (62, 'Industrial Corridor 62 (Ahmednagar, Maharashtra)', 'Industrial Corridor', 'Maharashtra', 'Ahmednagar',
    21.463075, 76.279639, 276.66, 4997,
    '2022-07-23', '2024-05-02', 'Notification u/s 11', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'SIA Initiated', 1, '2022-07-23', '2023-01-19', 
    '2022-07-23',
    '2023-01-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'SIA Approved', 2, '2023-01-19', '2023-07-18', 
    '2023-01-19',
    '2023-07-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'Notification u/s 11', 3, '2023-07-18', '2024-01-14', 
    '2023-07-18',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'Objection Hearing', 4, '2024-01-14', '2024-07-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'Award Declaration', 5, '2024-07-12', '2025-01-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'Compensation Disbursement', 6, '2025-01-08', '2025-07-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'Possession Handover', 7, '2025-07-07', '2026-01-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'Rehabilitation', 8, '2026-01-03', '2026-07-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (62, 'Completed', 9, '2026-07-02', '2026-12-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (62, CURRENT_DATE, 510, 195,
    0.2397, 0.1682, 108,
    8, true, 3,
    true, 0.5426, 15,
    0, true, true,
    0.639, 84, 29,
    0, 0.1314);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (62, (SELECT id FROM project_data_snapshots WHERE project_id = 62 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2115, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (63, 'Urban Infra 63 (West Godavari, Andhra Pradesh)', 'Urban Infrastructure', 'Andhra Pradesh', 'West Godavari',
    17.52981, 78.830176, 264.12, 2964,
    '2022-03-24', '2023-03-27', 'SIA Initiated', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'SIA Initiated', 1, '2022-03-24', '2022-09-20', 
    '2022-03-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'SIA Approved', 2, '2022-09-20', '2023-03-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'Notification u/s 11', 3, '2023-03-19', '2023-09-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'Objection Hearing', 4, '2023-09-15', '2024-03-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'Award Declaration', 5, '2024-03-13', '2024-09-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'Compensation Disbursement', 6, '2024-09-09', '2025-03-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'Possession Handover', 7, '2025-03-08', '2025-09-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'Rehabilitation', 8, '2025-09-04', '2026-03-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (63, 'Completed', 9, '2026-03-03', '2026-08-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (63, CURRENT_DATE, 659, 462,
    0, 0, 134,
    0, false, 0,
    false, 0.7264, 100,
    8, false, true,
    0.3905, 65, 2,
    0, 0.4178);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (63, (SELECT id FROM project_data_snapshots WHERE project_id = 63 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2225, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (64, 'NH 64 (Ajmer, Rajasthan)', 'National Highway', 'Rajasthan', 'Ajmer',
    28.130587, 75.154313, 416.04, 3816,
    '2022-09-26', '2026-12-30', 'Compensation Disbursement', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'SIA Initiated', 1, '2022-09-26', '2023-03-25', 
    '2022-09-26',
    '2023-03-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'SIA Approved', 2, '2023-03-25', '2023-09-21', 
    '2023-03-25',
    '2023-09-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'Notification u/s 11', 3, '2023-09-21', '2024-03-19', 
    '2023-09-21',
    '2024-03-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'Objection Hearing', 4, '2024-03-19', '2024-09-15', 
    '2024-03-19',
    '2024-09-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'Award Declaration', 5, '2024-09-15', '2025-03-14', 
    '2024-09-15',
    '2025-03-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'Compensation Disbursement', 6, '2025-03-14', '2025-09-10', 
    '2025-03-14',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'Possession Handover', 7, '2025-09-10', '2026-03-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'Rehabilitation', 8, '2026-03-09', '2026-09-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (64, 'Completed', 9, '2026-09-05', '2027-03-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (64, CURRENT_DATE, 370, 12,
    0.5517, 0.4445, 122,
    0, false, 0,
    false, 0.779, 103,
    2, true, true,
    0.7762, 63, 2,
    0, 0.2467);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (64, (SELECT id FROM project_data_snapshots WHERE project_id = 64 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5534, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (65, 'NH 65 (Bengaluru Urban, Karnataka)', 'National Highway', 'Karnataka', 'Bengaluru Urban',
    15.461929, 76.443638, 433.57, 2729,
    '2023-05-15', '2025-10-14', 'Compensation Disbursement', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'SIA Initiated', 1, '2023-05-15', '2023-11-11', 
    '2023-05-15',
    '2023-11-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'SIA Approved', 2, '2023-11-11', '2024-05-09', 
    '2023-11-11',
    '2024-05-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'Notification u/s 11', 3, '2024-05-09', '2024-11-05', 
    '2024-05-09',
    '2024-11-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'Objection Hearing', 4, '2024-11-05', '2025-05-04', 
    '2024-11-05',
    '2025-05-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'Award Declaration', 5, '2025-05-04', '2025-10-31', 
    '2025-05-04',
    '2025-10-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'Compensation Disbursement', 6, '2025-10-31', '2026-04-29', 
    '2025-10-31',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'Possession Handover', 7, '2026-04-29', '2026-10-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'Rehabilitation', 8, '2026-10-26', '2027-04-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (65, 'Completed', 9, '2027-04-24', '2027-10-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (65, CURRENT_DATE, 67, 0,
    0.6757, 0.5117, 31,
    0, false, 0,
    false, 0.8796, 55,
    6, true, false,
    0.8946, 54, 21,
    0, 0.5869);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (65, (SELECT id FROM project_data_snapshots WHERE project_id = 65 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6046, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (66, 'Rural Road 66 (Krishna, Andhra Pradesh)', 'Rural Road', 'Andhra Pradesh', 'Krishna',
    13.078281, 79.895997, 44.63, 2431,
    '2023-02-06', '2026-07-06', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'SIA Initiated', 1, '2023-02-06', '2023-08-05', 
    '2023-02-06',
    '2023-08-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'SIA Approved', 2, '2023-08-05', '2024-02-01', 
    '2023-08-05',
    '2024-02-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'Notification u/s 11', 3, '2024-02-01', '2024-07-30', 
    '2024-02-01',
    '2024-07-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'Objection Hearing', 4, '2024-07-30', '2025-01-26', 
    '2024-07-30',
    '2025-01-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'Award Declaration', 5, '2025-01-26', '2025-07-25', 
    '2025-01-26',
    '2025-07-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'Compensation Disbursement', 6, '2025-07-25', '2026-01-21', 
    '2025-07-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'Possession Handover', 7, '2026-01-21', '2026-07-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'Rehabilitation', 8, '2026-07-20', '2027-01-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (66, 'Completed', 9, '2027-01-16', '2027-07-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (66, CURRENT_DATE, 646, 388,
    0.724, 0.546, 114,
    0, false, 0,
    false, 0.7616, 54,
    2, true, true,
    0.3515, 10, 46,
    0, 0.535);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (66, (SELECT id FROM project_data_snapshots WHERE project_id = 66 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.53, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (67, 'SC Mission 67 (Dausa, Rajasthan)', 'Smart City', 'Rajasthan', 'Dausa',
    27.462588, 72.7698, 22.23, 560,
    '2020-11-30', '2025-09-21', 'Award Declaration', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'SIA Initiated', 1, '2020-11-30', '2021-05-29', 
    '2020-11-30',
    '2021-05-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'SIA Approved', 2, '2021-05-29', '2021-11-25', 
    '2021-05-29',
    '2021-11-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'Notification u/s 11', 3, '2021-11-25', '2022-05-24', 
    '2021-11-25',
    '2022-05-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'Objection Hearing', 4, '2022-05-24', '2022-11-20', 
    '2022-05-24',
    '2022-11-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'Award Declaration', 5, '2022-11-20', '2023-05-19', 
    '2022-11-20',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'Compensation Disbursement', 6, '2023-05-19', '2023-11-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'Possession Handover', 7, '2023-11-15', '2024-05-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'Rehabilitation', 8, '2024-05-13', '2024-11-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (67, 'Completed', 9, '2024-11-09', '2025-05-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (67, CURRENT_DATE, 193, 0,
    0.5906, 0.4387, 165,
    0, false, 0,
    false, 0.6198, 49,
    9, true, true,
    0.1534, 62, 60,
    0, 0.2855);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (67, (SELECT id FROM project_data_snapshots WHERE project_id = 67 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2725, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (68, 'Port Connectivity 68 (Visakhapatnam, Andhra Pradesh)', 'Port Connectivity', 'Andhra Pradesh', 'Visakhapatnam',
    14.700698, 78.729518, 134.58, 2142,
    '2020-02-16', '2021-10-05', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'SIA Initiated', 1, '2020-02-16', '2020-08-14', 
    '2020-02-16',
    '2020-08-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'SIA Approved', 2, '2020-08-14', '2021-02-10', 
    '2020-08-14',
    '2021-02-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'Notification u/s 11', 3, '2021-02-10', '2021-08-09', 
    '2021-02-10',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'Objection Hearing', 4, '2021-08-09', '2022-02-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'Award Declaration', 5, '2022-02-05', '2022-08-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'Compensation Disbursement', 6, '2022-08-04', '2023-01-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'Possession Handover', 7, '2023-01-31', '2023-07-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'Rehabilitation', 8, '2023-07-30', '2024-01-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (68, 'Completed', 9, '2024-01-26', '2024-07-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (68, CURRENT_DATE, 56, 0,
    0.2971, 0.2525, 114,
    0, false, 0,
    false, 0.5287, 78,
    4, true, true,
    0.9986, 30, 7,
    0, 0.1679);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (68, (SELECT id FROM project_data_snapshots WHERE project_id = 68 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3101, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (69, 'Rail Line 69 (Pune, Maharashtra)', 'Railway Line', 'Maharashtra', 'Pune',
    21.789148, 80.392597, 426.42, 1436,
    '2021-04-05', '2026-01-01', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'SIA Initiated', 1, '2021-04-05', '2021-10-02', 
    '2021-04-05',
    '2021-10-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'SIA Approved', 2, '2021-10-02', '2022-03-31', 
    '2021-10-02',
    '2022-03-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'Notification u/s 11', 3, '2022-03-31', '2022-09-27', 
    '2022-03-31',
    '2022-09-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'Objection Hearing', 4, '2022-09-27', '2023-03-26', 
    '2022-09-27',
    '2023-03-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'Award Declaration', 5, '2023-03-26', '2023-09-22', 
    '2023-03-26',
    '2023-09-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'Compensation Disbursement', 6, '2023-09-22', '2024-03-20', 
    '2023-09-22',
    '2024-03-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'Possession Handover', 7, '2024-03-20', '2024-09-16', 
    '2024-03-20',
    '2024-09-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'Rehabilitation', 8, '2024-09-16', '2025-03-15', 
    '2024-09-16',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (69, 'Completed', 9, '2025-03-15', '2025-09-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (69, CURRENT_DATE, 385, 113,
    0.9169, 0.7931, 130,
    0, false, 0,
    false, 0.5345, 25,
    2, true, true,
    0.494, 51, 35,
    0.5723, 0.3337);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (69, (SELECT id FROM project_data_snapshots WHERE project_id = 69 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3932, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (70, 'SH 70 (Rajkot, Gujarat)', 'State Highway', 'Gujarat', 'Rajkot',
    23.226201, 71.111323, 227.74, 4248,
    '2021-01-25', '2024-05-15', 'SIA Approved', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'SIA Initiated', 1, '2021-01-25', '2021-07-24', 
    '2021-01-25',
    '2021-07-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'SIA Approved', 2, '2021-07-24', '2022-01-20', 
    '2021-07-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'Notification u/s 11', 3, '2022-01-20', '2022-07-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'Objection Hearing', 4, '2022-07-19', '2023-01-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'Award Declaration', 5, '2023-01-15', '2023-07-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'Compensation Disbursement', 6, '2023-07-14', '2024-01-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'Possession Handover', 7, '2024-01-10', '2024-07-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'Rehabilitation', 8, '2024-07-08', '2025-01-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (70, 'Completed', 9, '2025-01-04', '2025-07-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (70, CURRENT_DATE, 449, 181,
    0.1897, 0.137, 32,
    0, false, 0,
    false, 0.9268, 99,
    8, true, true,
    0.182, 21, 27,
    0, 0.3514);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (70, (SELECT id FROM project_data_snapshots WHERE project_id = 70 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2194, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (71, 'City Infra 71 (Bengaluru Rural, Karnataka)', 'Urban Infrastructure', 'Karnataka', 'Bengaluru Rural',
    13.129313, 77.191995, 66.96, 2490,
    '2020-11-04', '2023-10-13', 'Notification u/s 11', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'SIA Initiated', 1, '2020-11-04', '2021-05-03', 
    '2020-11-04',
    '2021-05-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'SIA Approved', 2, '2021-05-03', '2021-10-30', 
    '2021-05-03',
    '2021-10-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'Notification u/s 11', 3, '2021-10-30', '2022-04-28', 
    '2021-10-30',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'Objection Hearing', 4, '2022-04-28', '2022-10-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'Award Declaration', 5, '2022-10-25', '2023-04-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'Compensation Disbursement', 6, '2023-04-23', '2023-10-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'Possession Handover', 7, '2023-10-20', '2024-04-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'Rehabilitation', 8, '2024-04-17', '2024-10-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (71, 'Completed', 9, '2024-10-14', '2025-04-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (71, CURRENT_DATE, 561, 224,
    0.329, 0.3138, 136,
    0, false, 0,
    false, 0.4561, 82,
    2, true, true,
    0.5806, 26, 42,
    0, 0.4122);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (71, (SELECT id FROM project_data_snapshots WHERE project_id = 71 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2494, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (72, 'National Highway 72 (Dausa, Rajasthan)', 'National Highway', 'Rajasthan', 'Dausa',
    27.490176, 74.690941, 445.05, 4479,
    '2023-10-08', '2028-06-01', 'SIA Initiated', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'SIA Initiated', 1, '2023-10-08', '2024-04-05', 
    '2023-10-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'SIA Approved', 2, '2024-04-05', '2024-10-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'Notification u/s 11', 3, '2024-10-02', '2025-03-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'Objection Hearing', 4, '2025-03-31', '2025-09-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'Award Declaration', 5, '2025-09-27', '2026-03-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'Compensation Disbursement', 6, '2026-03-26', '2026-09-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'Possession Handover', 7, '2026-09-22', '2027-03-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'Rehabilitation', 8, '2027-03-21', '2027-09-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (72, 'Completed', 9, '2027-09-17', '2028-03-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (72, CURRENT_DATE, 245, 0,
    0.0534, 0.044, 164,
    0, false, 0,
    false, 0.974, 61,
    3, false, false,
    0.685, 43, 29,
    0, 0.1365);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (72, (SELECT id FROM project_data_snapshots WHERE project_id = 72 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0636, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (73, 'Rural Road 73 (Bengaluru Urban, Karnataka)', 'Rural Road', 'Karnataka', 'Bengaluru Urban',
    13.190674, 74.646509, 381.53, 4228,
    '2023-07-03', '2026-04-16', 'Possession Handover', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'SIA Initiated', 1, '2023-07-03', '2023-12-30', 
    '2023-07-03',
    '2023-12-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'SIA Approved', 2, '2023-12-30', '2024-06-27', 
    '2023-12-30',
    '2024-06-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'Notification u/s 11', 3, '2024-06-27', '2024-12-24', 
    '2024-06-27',
    '2024-12-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'Objection Hearing', 4, '2024-12-24', '2025-06-22', 
    '2024-12-24',
    '2025-06-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'Award Declaration', 5, '2025-06-22', '2025-12-19', 
    '2025-06-22',
    '2025-12-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'Compensation Disbursement', 6, '2025-12-19', '2026-06-17', 
    '2025-12-19',
    '2026-06-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'Possession Handover', 7, '2026-06-17', '2026-12-14', 
    '2026-06-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'Rehabilitation', 8, '2026-12-14', '2027-06-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (73, 'Completed', 9, '2027-06-12', '2027-12-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (73, CURRENT_DATE, 0, 0,
    0.7968, 0.7636, 143,
    0, false, 0,
    false, 0.4637, 30,
    7, true, true,
    0.4496, 23, 6,
    0.0506, 0.5727);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (73, (SELECT id FROM project_data_snapshots WHERE project_id = 73 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4393, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (74, 'Rail Line 74 (Medchal-Malkajgiri, Telangana)', 'Railway Line', 'Telangana', 'Medchal-Malkajgiri',
    16.259336, 77.717041, 483.51, 1772,
    '2021-04-04', '2025-02-21', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'SIA Initiated', 1, '2021-04-04', '2021-10-01', 
    '2021-04-04',
    '2021-10-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'SIA Approved', 2, '2021-10-01', '2022-03-30', 
    '2021-10-01',
    '2022-03-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'Notification u/s 11', 3, '2022-03-30', '2022-09-26', 
    '2022-03-30',
    '2022-09-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'Objection Hearing', 4, '2022-09-26', '2023-03-25', 
    '2022-09-26',
    '2023-03-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'Award Declaration', 5, '2023-03-25', '2023-09-21', 
    '2023-03-25',
    '2023-09-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'Compensation Disbursement', 6, '2023-09-21', '2024-03-19', 
    '2023-09-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'Possession Handover', 7, '2024-03-19', '2024-09-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'Rehabilitation', 8, '2024-09-15', '2025-03-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (74, 'Completed', 9, '2025-03-14', '2025-09-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (74, CURRENT_DATE, 508, 179,
    0.6248, 0.4952, 90,
    4, true, 1,
    false, 0.5688, 76,
    10, true, true,
    0.2857, 6, 54,
    0, 0.1537);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (74, (SELECT id FROM project_data_snapshots WHERE project_id = 74 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6663, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (75, 'Ind Corridor 75 (Surat, Gujarat)', 'Industrial Corridor', 'Gujarat', 'Surat',
    20.23021, 71.65181, 413.53, 983,
    '2022-08-14', '2025-08-25', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'SIA Initiated', 1, '2022-08-14', '2023-02-10', 
    '2022-08-14',
    '2023-02-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'SIA Approved', 2, '2023-02-10', '2023-08-09', 
    '2023-02-10',
    '2023-08-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'Notification u/s 11', 3, '2023-08-09', '2024-02-05', 
    '2023-08-09',
    '2024-02-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'Objection Hearing', 4, '2024-02-05', '2024-08-03', 
    '2024-02-05',
    '2024-08-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'Award Declaration', 5, '2024-08-03', '2025-01-30', 
    '2024-08-03',
    '2025-01-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'Compensation Disbursement', 6, '2025-01-30', '2025-07-29', 
    '2025-01-30',
    '2025-07-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'Possession Handover', 7, '2025-07-29', '2026-01-25', 
    '2025-07-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'Rehabilitation', 8, '2026-01-25', '2026-07-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (75, 'Completed', 9, '2026-07-24', '2027-01-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (75, CURRENT_DATE, 596, 384,
    0.7077, 0.5774, 24,
    0, false, 0,
    false, 0.6363, 101,
    5, true, true,
    0.3656, 23, 12,
    0.6025, 0.3007);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (75, (SELECT id FROM project_data_snapshots WHERE project_id = 75 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3136, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (76, 'National Highway 76 (Bengaluru Rural, Karnataka)', 'National Highway', 'Karnataka', 'Bengaluru Rural',
    13.817664, 74.670233, 298.89, 4165,
    '2021-07-31', '2025-06-20', 'Notification u/s 11', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'SIA Initiated', 1, '2021-07-31', '2022-01-27', 
    '2021-07-31',
    '2022-01-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'SIA Approved', 2, '2022-01-27', '2022-07-26', 
    '2022-01-27',
    '2022-07-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'Notification u/s 11', 3, '2022-07-26', '2023-01-22', 
    '2022-07-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'Objection Hearing', 4, '2023-01-22', '2023-07-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'Award Declaration', 5, '2023-07-21', '2024-01-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'Compensation Disbursement', 6, '2024-01-17', '2024-07-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'Possession Handover', 7, '2024-07-15', '2025-01-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'Rehabilitation', 8, '2025-01-11', '2025-07-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (76, 'Completed', 9, '2025-07-10', '2026-01-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (76, CURRENT_DATE, 173, 0,
    0.2156, 0.1906, 136,
    0, false, 0,
    false, 0.6939, 72,
    4, true, true,
    0.0166, 47, 43,
    0, 0.1548);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (76, (SELECT id FROM project_data_snapshots WHERE project_id = 76 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4412, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (77, 'E-way 77 (Medak, Telangana)', 'Expressway', 'Telangana', 'Medak',
    19.368283, 80.523068, 78.15, 1994,
    '2023-08-28', '2027-11-24', 'SIA Initiated', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'SIA Initiated', 1, '2023-08-28', '2024-02-24', 
    '2023-08-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'SIA Approved', 2, '2024-02-24', '2024-08-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'Notification u/s 11', 3, '2024-08-22', '2025-02-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'Objection Hearing', 4, '2025-02-18', '2025-08-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'Award Declaration', 5, '2025-08-17', '2026-02-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'Compensation Disbursement', 6, '2026-02-13', '2026-08-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'Possession Handover', 7, '2026-08-12', '2027-02-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'Rehabilitation', 8, '2027-02-08', '2027-08-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (77, 'Completed', 9, '2027-08-07', '2028-02-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (77, CURRENT_DATE, 621, 433,
    0, 0, 146,
    0, false, 0,
    false, 0.9689, 14,
    3, false, true,
    0.3137, 24, 26,
    0, 0.4453);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (77, (SELECT id FROM project_data_snapshots WHERE project_id = 77 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1924, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (78, 'Port Link 78 (Medak, Telangana)', 'Port Connectivity', 'Telangana', 'Medak',
    17.574733, 79.52399, 275.41, 2175,
    '2021-10-31', '2026-07-18', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'SIA Initiated', 1, '2021-10-31', '2022-04-29', 
    '2021-10-31',
    '2022-04-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'SIA Approved', 2, '2022-04-29', '2022-10-26', 
    '2022-04-29',
    '2022-10-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'Notification u/s 11', 3, '2022-10-26', '2023-04-24', 
    '2022-10-26',
    '2023-04-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'Objection Hearing', 4, '2023-04-24', '2023-10-21', 
    '2023-04-24',
    '2023-10-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'Award Declaration', 5, '2023-10-21', '2024-04-18', 
    '2023-10-21',
    '2024-04-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'Compensation Disbursement', 6, '2024-04-18', '2024-10-15', 
    '2024-04-18',
    '2024-10-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'Possession Handover', 7, '2024-10-15', '2025-04-13', 
    '2024-10-15',
    '2025-04-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'Rehabilitation', 8, '2025-04-13', '2025-10-10', 
    '2025-04-13',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (78, 'Completed', 9, '2025-10-10', '2026-04-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (78, CURRENT_DATE, 519, 183,
    0.8801, 0.6989, 123,
    0, false, 0,
    false, 0.5154, 31,
    4, true, true,
    0.2249, 43, 49,
    0.289, 0.2036);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (78, (SELECT id FROM project_data_snapshots WHERE project_id = 78 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3617, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (79, 'PMGSY 79 (Srikakulam, Andhra Pradesh)', 'Rural Road', 'Andhra Pradesh', 'Srikakulam',
    18.067837, 78.68766, 477.53, 1209,
    '2021-01-21', '2022-09-27', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'SIA Initiated', 1, '2021-01-21', '2021-07-20', 
    '2021-01-21',
    '2021-07-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'SIA Approved', 2, '2021-07-20', '2022-01-16', 
    '2021-07-20',
    '2022-01-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'Notification u/s 11', 3, '2022-01-16', '2022-07-15', 
    '2022-01-16',
    '2022-07-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'Objection Hearing', 4, '2022-07-15', '2023-01-11', 
    '2022-07-15',
    '2023-01-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'Award Declaration', 5, '2023-01-11', '2023-07-10', 
    '2023-01-11',
    '2023-07-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'Compensation Disbursement', 6, '2023-07-10', '2024-01-06', 
    '2023-07-10',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'Possession Handover', 7, '2024-01-06', '2024-07-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'Rehabilitation', 8, '2024-07-04', '2024-12-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (79, 'Completed', 9, '2024-12-31', '2025-06-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (79, CURRENT_DATE, 617, 363,
    0.6603, 0.5374, 10,
    0, false, 0,
    false, 0.5726, 91,
    1, true, true,
    0.4424, 37, 47,
    0, 0.3395);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (79, (SELECT id FROM project_data_snapshots WHERE project_id = 79 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.7301, 'high', 'success');
INSERT INTO alerts (project_id, prediction_id, alert_type, risk_category, probability_at_trigger)
VALUES (79, (SELECT id FROM risk_predictions WHERE project_id = 79 ORDER BY id DESC LIMIT 1),
    'High Risk', 'high', 0.7301);
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (80, 'Expressway 80 (Hapur, Uttar Pradesh)', 'Expressway', 'Uttar Pradesh', 'Hapur',
    28.001901, 81.401229, 54.6, 2715,
    '2020-12-26', '2023-05-06', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'SIA Initiated', 1, '2020-12-26', '2021-06-24', 
    '2020-12-26',
    '2021-06-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'SIA Approved', 2, '2021-06-24', '2021-12-21', 
    '2021-06-24',
    '2021-12-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'Notification u/s 11', 3, '2021-12-21', '2022-06-19', 
    '2021-12-21',
    '2022-06-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'Objection Hearing', 4, '2022-06-19', '2022-12-16', 
    '2022-06-19',
    '2022-12-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'Award Declaration', 5, '2022-12-16', '2023-06-14', 
    '2022-12-16',
    '2023-06-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'Compensation Disbursement', 6, '2023-06-14', '2023-12-11', 
    '2023-06-14',
    '2023-12-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'Possession Handover', 7, '2023-12-11', '2024-06-08', 
    '2023-12-11',
    '2024-06-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'Rehabilitation', 8, '2024-06-08', '2024-12-05', 
    '2024-06-08',
    '2024-12-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (80, 'Completed', 9, '2024-12-05', '2025-06-03', 
    '2024-12-05',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (80, CURRENT_DATE, 81, 0,
    1, 0.8593, 120,
    0, false, 0,
    false, 0.4603, 98,
    2, true, true,
    0.5504, 25, 26,
    0.6529, 0.5403);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (80, (SELECT id FROM project_data_snapshots WHERE project_id = 80 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (81, 'Metro 81 (East Godavari, Andhra Pradesh)', 'Metro Rail', 'Andhra Pradesh', 'East Godavari',
    12.914138, 82.6498, 457.05, 1444,
    '2022-03-30', '2026-11-24', 'Award Declaration', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'SIA Initiated', 1, '2022-03-30', '2022-09-26', 
    '2022-03-30',
    '2022-09-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'SIA Approved', 2, '2022-09-26', '2023-03-25', 
    '2022-09-26',
    '2023-03-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'Notification u/s 11', 3, '2023-03-25', '2023-09-21', 
    '2023-03-25',
    '2023-09-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'Objection Hearing', 4, '2023-09-21', '2024-03-19', 
    '2023-09-21',
    '2024-03-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'Award Declaration', 5, '2024-03-19', '2024-09-15', 
    '2024-03-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'Compensation Disbursement', 6, '2024-09-15', '2025-03-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'Possession Handover', 7, '2025-03-14', '2025-09-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'Rehabilitation', 8, '2025-09-10', '2026-03-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (81, 'Completed', 9, '2026-03-09', '2026-09-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (81, CURRENT_DATE, 617, 331,
    0.4464, 0.4114, 45,
    0, false, 0,
    false, 0.9604, 4,
    6, true, false,
    0.1863, 42, 56,
    0, 0.1187);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (81, (SELECT id FROM project_data_snapshots WHERE project_id = 81 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3356, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (82, 'Port Connectivity 82 (Namakkal, Tamil Nadu)', 'Port Connectivity', 'Tamil Nadu', 'Namakkal',
    13.440047, 78.444852, 168.69, 3769,
    '2021-01-18', '2024-10-25', 'SIA Approved', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'SIA Initiated', 1, '2021-01-18', '2021-07-17', 
    '2021-01-18',
    '2021-07-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'SIA Approved', 2, '2021-07-17', '2022-01-13', 
    '2021-07-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'Notification u/s 11', 3, '2022-01-13', '2022-07-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'Objection Hearing', 4, '2022-07-12', '2023-01-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'Award Declaration', 5, '2023-01-08', '2023-07-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'Compensation Disbursement', 6, '2023-07-07', '2024-01-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'Possession Handover', 7, '2024-01-03', '2024-07-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'Rehabilitation', 8, '2024-07-01', '2024-12-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (82, 'Completed', 9, '2024-12-28', '2025-06-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (82, CURRENT_DATE, 167, 0,
    0.1952, 0.1641, 65,
    0, false, 0,
    false, 0.8312, 1,
    5, true, false,
    0.5678, 29, 11,
    0, 0.4055);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (82, (SELECT id FROM project_data_snapshots WHERE project_id = 82 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1854, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (83, 'City Infra 83 (Yadadri Bhuvanagiri, Telangana)', 'Urban Infrastructure', 'Telangana', 'Yadadri Bhuvanagiri',
    15.88154, 81.417583, 378.11, 2710,
    '2022-05-03', '2026-01-04', 'Compensation Disbursement', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'SIA Initiated', 1, '2022-05-03', '2022-10-30', 
    '2022-05-03',
    '2022-10-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'SIA Approved', 2, '2022-10-30', '2023-04-28', 
    '2022-10-30',
    '2023-04-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'Notification u/s 11', 3, '2023-04-28', '2023-10-25', 
    '2023-04-28',
    '2023-10-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'Objection Hearing', 4, '2023-10-25', '2024-04-22', 
    '2023-10-25',
    '2024-04-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'Award Declaration', 5, '2024-04-22', '2024-10-19', 
    '2024-04-22',
    '2024-10-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'Compensation Disbursement', 6, '2024-10-19', '2025-04-17', 
    '2024-10-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'Possession Handover', 7, '2025-04-17', '2025-10-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'Rehabilitation', 8, '2025-10-14', '2026-04-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (83, 'Completed', 9, '2026-04-12', '2026-10-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (83, CURRENT_DATE, 361, 104,
    0.7122, 0.5, 149,
    0, false, 0,
    false, 0.8337, 1,
    4, true, true,
    0.6928, 12, 42,
    0, 0.1591);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (83, (SELECT id FROM project_data_snapshots WHERE project_id = 83 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5702, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (84, 'SC Mission 84 (Tiruppur, Tamil Nadu)', 'Smart City', 'Tamil Nadu', 'Tiruppur',
    11.512912, 80.23286, 375.13, 4972,
    '2023-08-03', '2026-08-24', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'SIA Initiated', 1, '2023-08-03', '2024-01-30', 
    '2023-08-03',
    '2024-01-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'SIA Approved', 2, '2024-01-30', '2024-07-28', 
    '2024-01-30',
    '2024-07-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'Notification u/s 11', 3, '2024-07-28', '2025-01-24', 
    '2024-07-28',
    '2025-01-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'Objection Hearing', 4, '2025-01-24', '2025-07-23', 
    '2025-01-24',
    '2025-07-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'Award Declaration', 5, '2025-07-23', '2026-01-19', 
    '2025-07-23',
    '2026-01-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'Compensation Disbursement', 6, '2026-01-19', '2026-07-18', 
    '2026-01-19',
    '2026-07-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'Possession Handover', 7, '2026-07-18', '2027-01-14', 
    '2026-07-18',
    '2027-01-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'Rehabilitation', 8, '2027-01-14', '2027-07-13', 
    '2027-01-14',
    '2027-07-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (84, 'Completed', 9, '2027-07-13', '2028-01-09', 
    '2027-07-13',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (84, CURRENT_DATE, 659, 384,
    0.9442, 0.9321, 106,
    0, false, 0,
    false, 0.8212, 116,
    7, true, false,
    0.802, 32, 48,
    0.2475, 0.4774);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (84, (SELECT id FROM project_data_snapshots WHERE project_id = 84 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1071, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (85, 'PMGSY 85 (Nashik, Maharashtra)', 'Rural Road', 'Maharashtra', 'Nashik',
    19.167097, 72.994064, 62.54, 1692,
    '2021-08-06', '2025-08-31', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'SIA Initiated', 1, '2021-08-06', '2022-02-02', 
    '2021-08-06',
    '2022-02-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'SIA Approved', 2, '2022-02-02', '2022-08-01', 
    '2022-02-02',
    '2022-08-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'Notification u/s 11', 3, '2022-08-01', '2023-01-28', 
    '2022-08-01',
    '2023-01-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'Objection Hearing', 4, '2023-01-28', '2023-07-27', 
    '2023-01-28',
    '2023-07-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'Award Declaration', 5, '2023-07-27', '2024-01-23', 
    '2023-07-27',
    '2024-01-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'Compensation Disbursement', 6, '2024-01-23', '2024-07-21', 
    '2024-01-23',
    '2024-07-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'Possession Handover', 7, '2024-07-21', '2025-01-17', 
    '2024-07-21',
    '2025-01-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'Rehabilitation', 8, '2025-01-17', '2025-07-16', 
    '2025-01-17',
    '2025-07-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (85, 'Completed', 9, '2025-07-16', '2026-01-12', 
    '2025-07-16',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (85, CURRENT_DATE, 547, 184,
    0.9404, 0.8097, 149,
    0, false, 0,
    false, 0.6933, 115,
    8, true, true,
    0.0556, 21, 32,
    0.4154, 0.382);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (85, (SELECT id FROM project_data_snapshots WHERE project_id = 85 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (86, 'Expressway 86 (Krishna, Andhra Pradesh)', 'Expressway', 'Andhra Pradesh', 'Krishna',
    12.521108, 78.24321, 493.14, 3877,
    '2020-11-16', '2022-04-14', 'SIA Initiated', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'SIA Initiated', 1, '2020-11-16', '2021-05-15', 
    '2020-11-16',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'SIA Approved', 2, '2021-05-15', '2021-11-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'Notification u/s 11', 3, '2021-11-11', '2022-05-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'Objection Hearing', 4, '2022-05-10', '2022-11-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'Award Declaration', 5, '2022-11-06', '2023-05-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'Compensation Disbursement', 6, '2023-05-05', '2023-11-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'Possession Handover', 7, '2023-11-01', '2024-04-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'Rehabilitation', 8, '2024-04-29', '2024-10-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (86, 'Completed', 9, '2024-10-26', '2025-04-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (86, CURRENT_DATE, 0, 0,
    0, 0, 8,
    19, true, 4,
    false, 0.508, 17,
    10, false, false,
    0.6459, 58, 23,
    0, 0.5964);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (86, (SELECT id FROM project_data_snapshots WHERE project_id = 86 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1263, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (87, 'Smart City 87 (Yadadri Bhuvanagiri, Telangana)', 'Smart City', 'Telangana', 'Yadadri Bhuvanagiri',
    18.14717, 79.426851, 365.29, 1834,
    '2023-12-27', '2028-08-25', 'Possession Handover', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'SIA Initiated', 1, '2023-12-27', '2024-06-24', 
    '2023-12-27',
    '2024-06-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'SIA Approved', 2, '2024-06-24', '2024-12-21', 
    '2024-06-24',
    '2024-12-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'Notification u/s 11', 3, '2024-12-21', '2025-06-19', 
    '2024-12-21',
    '2025-06-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'Objection Hearing', 4, '2025-06-19', '2025-12-16', 
    '2025-06-19',
    '2025-12-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'Award Declaration', 5, '2025-12-16', '2026-06-14', 
    '2025-12-16',
    '2026-06-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'Compensation Disbursement', 6, '2026-06-14', '2026-12-11', 
    '2026-06-14',
    '2026-12-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'Possession Handover', 7, '2026-12-11', '2027-06-09', 
    '2026-12-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'Rehabilitation', 8, '2027-06-09', '2027-12-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (87, 'Completed', 9, '2027-12-06', '2028-06-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (87, CURRENT_DATE, 386, 206,
    0.6737, 0.6723, 5,
    0, false, 0,
    false, 0.9871, 59,
    10, true, false,
    0.4241, 53, 52,
    0.2297, 0.3303);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (87, (SELECT id FROM project_data_snapshots WHERE project_id = 87 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5048, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (88, 'Metro 88 (Surat, Gujarat)', 'Metro Rail', 'Gujarat', 'Surat',
    21.886583, 72.979348, 126.14, 372,
    '2022-01-13', '2023-02-14', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'SIA Initiated', 1, '2022-01-13', '2022-07-12', 
    '2022-01-13',
    '2022-07-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'SIA Approved', 2, '2022-07-12', '2023-01-08', 
    '2022-07-12',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'Notification u/s 11', 3, '2023-01-08', '2023-07-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'Objection Hearing', 4, '2023-07-07', '2024-01-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'Award Declaration', 5, '2024-01-03', '2024-07-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'Compensation Disbursement', 6, '2024-07-01', '2024-12-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'Possession Handover', 7, '2024-12-28', '2025-06-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'Rehabilitation', 8, '2025-06-26', '2025-12-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (88, 'Completed', 9, '2025-12-23', '2026-06-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (88, CURRENT_DATE, 276, 0,
    0.0662, 0.0484, 112,
    15, true, 5,
    false, 0.5304, 110,
    0, true, true,
    0.9935, 34, 52,
    0, 0.5582);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (88, (SELECT id FROM project_data_snapshots WHERE project_id = 88 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3428, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (89, 'Port Connectivity 89 (Dausa, Rajasthan)', 'Port Connectivity', 'Rajasthan', 'Dausa',
    24.002823, 75.441912, 314.87, 3509,
    '2020-05-12', '2022-08-07', 'Compensation Disbursement', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'SIA Initiated', 1, '2020-05-12', '2020-11-08', 
    '2020-05-12',
    '2020-11-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'SIA Approved', 2, '2020-11-08', '2021-05-07', 
    '2020-11-08',
    '2021-05-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'Notification u/s 11', 3, '2021-05-07', '2021-11-03', 
    '2021-05-07',
    '2021-11-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'Objection Hearing', 4, '2021-11-03', '2022-05-02', 
    '2021-11-03',
    '2022-05-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'Award Declaration', 5, '2022-05-02', '2022-10-29', 
    '2022-05-02',
    '2022-10-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'Compensation Disbursement', 6, '2022-10-29', '2023-04-27', 
    '2022-10-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'Possession Handover', 7, '2023-04-27', '2023-10-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'Rehabilitation', 8, '2023-10-24', '2024-04-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (89, 'Completed', 9, '2024-04-21', '2024-10-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (89, CURRENT_DATE, 453, 131,
    0.5851, 0.4203, 126,
    0, false, 0,
    false, 0.4281, 44,
    10, true, true,
    0.7858, 45, 44,
    0, 0.3082);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (89, (SELECT id FROM project_data_snapshots WHERE project_id = 89 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5405, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (90, 'SC Mission 90 (Surat, Gujarat)', 'Smart City', 'Gujarat', 'Surat',
    23.822034, 69.954787, 280.86, 1108,
    '2020-03-09', '2025-02-25', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'SIA Initiated', 1, '2020-03-09', '2020-09-05', 
    '2020-03-09',
    '2020-09-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'SIA Approved', 2, '2020-09-05', '2021-03-04', 
    '2020-09-05',
    '2021-03-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'Notification u/s 11', 3, '2021-03-04', '2021-08-31', 
    '2021-03-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'Objection Hearing', 4, '2021-08-31', '2022-02-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'Award Declaration', 5, '2022-02-27', '2022-08-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'Compensation Disbursement', 6, '2022-08-26', '2023-02-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'Possession Handover', 7, '2023-02-22', '2023-08-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'Rehabilitation', 8, '2023-08-21', '2024-02-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (90, 'Completed', 9, '2024-02-17', '2024-08-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (90, CURRENT_DATE, 177, 0,
    0.3112, 0.3032, 62,
    0, false, 0,
    false, 0.553, 42,
    10, true, true,
    0.4498, 52, 5,
    0, 0.3678);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (90, (SELECT id FROM project_data_snapshots WHERE project_id = 90 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3421, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (91, 'E-way 91 (Meerut, Uttar Pradesh)', 'Expressway', 'Uttar Pradesh', 'Meerut',
    29.678533, 78.411225, 155.08, 135,
    '2020-06-09', '2024-09-24', 'Possession Handover', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'SIA Initiated', 1, '2020-06-09', '2020-12-06', 
    '2020-06-09',
    '2020-12-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'SIA Approved', 2, '2020-12-06', '2021-06-04', 
    '2020-12-06',
    '2021-06-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'Notification u/s 11', 3, '2021-06-04', '2021-12-01', 
    '2021-06-04',
    '2021-12-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'Objection Hearing', 4, '2021-12-01', '2022-05-30', 
    '2021-12-01',
    '2022-05-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'Award Declaration', 5, '2022-05-30', '2022-11-26', 
    '2022-05-30',
    '2022-11-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'Compensation Disbursement', 6, '2022-11-26', '2023-05-25', 
    '2022-11-26',
    '2023-05-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'Possession Handover', 7, '2023-05-25', '2023-11-21', 
    '2023-05-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'Rehabilitation', 8, '2023-11-21', '2024-05-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (91, 'Completed', 9, '2024-05-19', '2024-11-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (91, CURRENT_DATE, 717, 483,
    0.7618, 0.6428, 48,
    0, false, 0,
    false, 0.9772, 15,
    7, true, false,
    0.6956, 31, 25,
    0.9151, 0.376);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (91, (SELECT id FROM project_data_snapshots WHERE project_id = 91 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4809, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (92, 'PMGSY 92 (Salem, Tamil Nadu)', 'Rural Road', 'Tamil Nadu', 'Salem',
    9.978045, 79.972654, 457.59, 3046,
    '2022-07-05', '2026-02-13', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'SIA Initiated', 1, '2022-07-05', '2023-01-01', 
    '2022-07-05',
    '2023-01-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'SIA Approved', 2, '2023-01-01', '2023-06-30', 
    '2023-01-01',
    '2023-06-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'Notification u/s 11', 3, '2023-06-30', '2023-12-27', 
    '2023-06-30',
    '2023-12-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'Objection Hearing', 4, '2023-12-27', '2024-06-24', 
    '2023-12-27',
    '2024-06-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'Award Declaration', 5, '2024-06-24', '2024-12-21', 
    '2024-06-24',
    '2024-12-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'Compensation Disbursement', 6, '2024-12-21', '2025-06-19', 
    '2024-12-21',
    '2025-06-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'Possession Handover', 7, '2025-06-19', '2025-12-16', 
    '2025-06-19',
    '2025-12-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'Rehabilitation', 8, '2025-12-16', '2026-06-14', 
    '2025-12-16',
    '2026-06-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (92, 'Completed', 9, '2026-06-14', '2026-12-11', 
    '2026-06-14',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (92, CURRENT_DATE, 130, 0,
    1, 0.9167, 105,
    0, false, 0,
    false, 0.4274, 110,
    3, true, false,
    0.0162, 75, 59,
    0.584, 0.46);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (92, (SELECT id FROM project_data_snapshots WHERE project_id = 92 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (93, 'Metro Rail 93 (Tiruppur, Tamil Nadu)', 'Metro Rail', 'Tamil Nadu', 'Tiruppur',
    12.583495, 78.246857, 233.11, 2895,
    '2023-03-02', '2027-11-01', 'Compensation Disbursement', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'SIA Initiated', 1, '2023-03-02', '2023-08-29', 
    '2023-03-02',
    '2023-08-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'SIA Approved', 2, '2023-08-29', '2024-02-25', 
    '2023-08-29',
    '2024-02-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'Notification u/s 11', 3, '2024-02-25', '2024-08-23', 
    '2024-02-25',
    '2024-08-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'Objection Hearing', 4, '2024-08-23', '2025-02-19', 
    '2024-08-23',
    '2025-02-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'Award Declaration', 5, '2025-02-19', '2025-08-18', 
    '2025-02-19',
    '2025-08-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'Compensation Disbursement', 6, '2025-08-18', '2026-02-14', 
    '2025-08-18',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'Possession Handover', 7, '2026-02-14', '2026-08-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'Rehabilitation', 8, '2026-08-13', '2027-02-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (93, 'Completed', 9, '2027-02-09', '2027-08-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (93, CURRENT_DATE, 375, 152,
    0.5765, 0.5456, 35,
    0, false, 0,
    false, 0.8322, 62,
    2, true, false,
    0.5421, 87, 3,
    0, 0.362);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (93, (SELECT id FROM project_data_snapshots WHERE project_id = 93 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.564, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (94, 'National Highway 94 (Ahmednagar, Maharashtra)', 'National Highway', 'Maharashtra', 'Ahmednagar',
    19.599561, 73.043744, 331.35, 138,
    '2021-09-08', '2023-07-14', 'SIA Initiated', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'SIA Initiated', 1, '2021-09-08', '2022-03-07', 
    '2021-09-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'SIA Approved', 2, '2022-03-07', '2022-09-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'Notification u/s 11', 3, '2022-09-03', '2023-03-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'Objection Hearing', 4, '2023-03-02', '2023-08-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'Award Declaration', 5, '2023-08-29', '2024-02-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'Compensation Disbursement', 6, '2024-02-25', '2024-08-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'Possession Handover', 7, '2024-08-23', '2025-02-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'Rehabilitation', 8, '2025-02-19', '2025-08-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (94, 'Completed', 9, '2025-08-18', '2026-02-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (94, CURRENT_DATE, 0, 0,
    0, 0, 1,
    0, false, 0,
    false, 0.7193, 52,
    0, false, true,
    0.7222, 73, 18,
    0, 0.1086);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (94, (SELECT id FROM project_data_snapshots WHERE project_id = 94 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0912, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (95, 'State Highway 95 (Medchal-Malkajgiri, Telangana)', 'State Highway', 'Telangana', 'Medchal-Malkajgiri',
    16.267728, 79.369052, 284.68, 1860,
    '2020-04-02', '2023-03-28', 'SIA Approved', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'SIA Initiated', 1, '2020-04-02', '2020-09-29', 
    '2020-04-02',
    '2020-09-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'SIA Approved', 2, '2020-09-29', '2021-03-28', 
    '2020-09-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'Notification u/s 11', 3, '2021-03-28', '2021-09-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'Objection Hearing', 4, '2021-09-24', '2022-03-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'Award Declaration', 5, '2022-03-23', '2022-09-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'Compensation Disbursement', 6, '2022-09-19', '2023-03-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'Possession Handover', 7, '2023-03-18', '2023-09-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'Rehabilitation', 8, '2023-09-14', '2024-03-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (95, 'Completed', 9, '2024-03-12', '2024-09-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (95, CURRENT_DATE, 303, 47,
    0.184, 0.1332, 175,
    0, false, 0,
    false, 0.8968, 10,
    10, true, false,
    0.6499, 9, 5,
    0, 0.3026);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (95, (SELECT id FROM project_data_snapshots WHERE project_id = 95 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1447, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (96, 'Rural Road 96 (Medak, Telangana)', 'Rural Road', 'Telangana', 'Medak',
    15.830744, 80.803984, 118.73, 4653,
    '2021-07-11', '2026-02-20', 'SIA Initiated', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'SIA Initiated', 1, '2021-07-11', '2022-01-07', 
    '2021-07-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'SIA Approved', 2, '2022-01-07', '2022-07-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'Notification u/s 11', 3, '2022-07-06', '2023-01-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'Objection Hearing', 4, '2023-01-02', '2023-07-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'Award Declaration', 5, '2023-07-01', '2023-12-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'Compensation Disbursement', 6, '2023-12-28', '2024-06-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'Possession Handover', 7, '2024-06-25', '2024-12-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'Rehabilitation', 8, '2024-12-22', '2025-06-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (96, 'Completed', 9, '2025-06-20', '2025-12-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (96, CURRENT_DATE, 369, 68,
    0.0132, 0.0126, 69,
    3, true, 1,
    false, 0.8107, 35,
    8, false, true,
    0.0329, 45, 1,
    0, 0.5807);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (96, (SELECT id FROM project_data_snapshots WHERE project_id = 96 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2609, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (97, 'Smart City 97 (Bhavnagar, Gujarat)', 'Smart City', 'Gujarat', 'Bhavnagar',
    21.082125, 73.425229, 396.3, 652,
    '2023-12-25', '2027-02-28', 'SIA Approved', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'SIA Initiated', 1, '2023-12-25', '2024-06-22', 
    '2023-12-25',
    '2024-06-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'SIA Approved', 2, '2024-06-22', '2024-12-19', 
    '2024-06-22',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'Notification u/s 11', 3, '2024-12-19', '2025-06-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'Objection Hearing', 4, '2025-06-17', '2025-12-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'Award Declaration', 5, '2025-12-14', '2026-06-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'Compensation Disbursement', 6, '2026-06-12', '2026-12-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'Possession Handover', 7, '2026-12-09', '2027-06-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'Rehabilitation', 8, '2027-06-07', '2027-12-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (97, 'Completed', 9, '2027-12-04', '2028-06-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (97, CURRENT_DATE, 723, 415,
    0.2043, 0.1633, 88,
    0, false, 0,
    false, 0.4322, 55,
    3, true, false,
    0.3406, 83, 38,
    0, 0.2984);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (97, (SELECT id FROM project_data_snapshots WHERE project_id = 97 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1487, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (98, 'Expressway 98 (Jaipur, Rajasthan)', 'Expressway', 'Rajasthan', 'Jaipur',
    26.871264, 72.878843, 357.99, 682,
    '2022-02-11', '2024-02-26', 'Rehabilitation', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'SIA Initiated', 1, '2022-02-11', '2022-08-10', 
    '2022-02-11',
    '2022-08-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'SIA Approved', 2, '2022-08-10', '2023-02-06', 
    '2022-08-10',
    '2023-02-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'Notification u/s 11', 3, '2023-02-06', '2023-08-05', 
    '2023-02-06',
    '2023-08-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'Objection Hearing', 4, '2023-08-05', '2024-02-01', 
    '2023-08-05',
    '2024-02-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'Award Declaration', 5, '2024-02-01', '2024-07-30', 
    '2024-02-01',
    '2024-07-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'Compensation Disbursement', 6, '2024-07-30', '2025-01-26', 
    '2024-07-30',
    '2025-01-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'Possession Handover', 7, '2025-01-26', '2025-07-25', 
    '2025-01-26',
    '2025-07-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'Rehabilitation', 8, '2025-07-25', '2026-01-21', 
    '2025-07-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (98, 'Completed', 9, '2026-01-21', '2026-07-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (98, CURRENT_DATE, 0, 0,
    0.9109, 0.8182, 68,
    10, true, 4,
    false, 0.827, 81,
    2, true, false,
    0.3167, 18, 5,
    0.0052, 0.2541);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (98, (SELECT id FROM project_data_snapshots WHERE project_id = 98 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2184, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (99, 'State Highway 99 (Ajmer, Rajasthan)', 'State Highway', 'Rajasthan', 'Ajmer',
    26.141906, 74.49266, 432.54, 111,
    '2023-11-18', '2027-03-02', 'Notification u/s 11', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'SIA Initiated', 1, '2023-11-18', '2024-05-16', 
    '2023-11-18',
    '2024-05-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'SIA Approved', 2, '2024-05-16', '2024-11-12', 
    '2024-05-16',
    '2024-11-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'Notification u/s 11', 3, '2024-11-12', '2025-05-11', 
    '2024-11-12',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'Objection Hearing', 4, '2025-05-11', '2025-11-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'Award Declaration', 5, '2025-11-07', '2026-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'Compensation Disbursement', 6, '2026-05-06', '2026-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'Possession Handover', 7, '2026-11-02', '2027-05-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'Rehabilitation', 8, '2027-05-01', '2027-10-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (99, 'Completed', 9, '2027-10-28', '2028-04-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (99, CURRENT_DATE, 135, 0,
    0.1553, 0.1252, 105,
    25, true, 1,
    false, 0.8349, 71,
    3, true, true,
    0.1696, 53, 10,
    0, 0.1694);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (99, (SELECT id FROM project_data_snapshots WHERE project_id = 99 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2562, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (100, 'Rural Road 100 (Erode, Tamil Nadu)', 'Rural Road', 'Tamil Nadu', 'Erode',
    9.51779, 77.348885, 231.64, 1119,
    '2023-06-10', '2024-11-13', 'Notification u/s 11', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'SIA Initiated', 1, '2023-06-10', '2023-12-07', 
    '2023-06-10',
    '2023-12-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'SIA Approved', 2, '2023-12-07', '2024-06-04', 
    '2023-12-07',
    '2024-06-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'Notification u/s 11', 3, '2024-06-04', '2024-12-01', 
    '2024-06-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'Objection Hearing', 4, '2024-12-01', '2025-05-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'Award Declaration', 5, '2025-05-30', '2025-11-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'Compensation Disbursement', 6, '2025-11-26', '2026-05-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'Possession Handover', 7, '2026-05-25', '2026-11-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'Rehabilitation', 8, '2026-11-21', '2027-05-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (100, 'Completed', 9, '2027-05-20', '2027-11-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (100, CURRENT_DATE, 399, 142,
    0.2003, 0.1551, 1,
    0, false, 0,
    false, 0.9693, 42,
    9, true, true,
    0.8622, 61, 21,
    0, 0.3153);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (100, (SELECT id FROM project_data_snapshots WHERE project_id = 100 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2502, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (101, 'Industrial Corridor 101 (Surat, Gujarat)', 'Industrial Corridor', 'Gujarat', 'Surat',
    24.340586, 74.296714, 166.31, 2306,
    '2020-01-17', '2022-09-04', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'SIA Initiated', 1, '2020-01-17', '2020-07-15', 
    '2020-01-17',
    '2020-07-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'SIA Approved', 2, '2020-07-15', '2021-01-11', 
    '2020-07-15',
    '2021-01-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'Notification u/s 11', 3, '2021-01-11', '2021-07-10', 
    '2021-01-11',
    '2021-07-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'Objection Hearing', 4, '2021-07-10', '2022-01-06', 
    '2021-07-10',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'Award Declaration', 5, '2022-01-06', '2022-07-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'Compensation Disbursement', 6, '2022-07-05', '2023-01-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'Possession Handover', 7, '2023-01-01', '2023-06-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'Rehabilitation', 8, '2023-06-30', '2023-12-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (101, 'Completed', 9, '2023-12-27', '2024-06-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (101, CURRENT_DATE, 0, 0,
    0.422, 0.3755, 100,
    0, false, 0,
    false, 0.619, 119,
    9, true, true,
    0.9973, 28, 43,
    0, 0.4838);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (101, (SELECT id FROM project_data_snapshots WHERE project_id = 101 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4443, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (102, 'PMGSY 102 (Chikkaballapura, Karnataka)', 'Rural Road', 'Karnataka', 'Chikkaballapura',
    14.909486, 74.311214, 331.04, 3476,
    '2022-11-18', '2026-03-04', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'SIA Initiated', 1, '2022-11-18', '2023-05-17', 
    '2022-11-18',
    '2023-05-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'SIA Approved', 2, '2023-05-17', '2023-11-13', 
    '2023-05-17',
    '2023-11-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'Notification u/s 11', 3, '2023-11-13', '2024-05-11', 
    '2023-11-13',
    '2024-05-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'Objection Hearing', 4, '2024-05-11', '2024-11-07', 
    '2024-05-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'Award Declaration', 5, '2024-11-07', '2025-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'Compensation Disbursement', 6, '2025-05-06', '2025-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'Possession Handover', 7, '2025-11-02', '2026-05-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'Rehabilitation', 8, '2026-05-01', '2026-10-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (102, 'Completed', 9, '2026-10-28', '2027-04-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (102, CURRENT_DATE, 0, 0,
    0.4096, 0.3038, 96,
    0, false, 0,
    false, 0.4444, 76,
    7, true, true,
    0.5344, 58, 34,
    0, 0.1184);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (102, (SELECT id FROM project_data_snapshots WHERE project_id = 102 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5893, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (103, 'City Infra 103 (Sikar, Rajasthan)', 'Urban Infrastructure', 'Rajasthan', 'Sikar',
    27.603212, 72.695079, 483.57, 2726,
    '2022-09-22', '2027-05-09', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'SIA Initiated', 1, '2022-09-22', '2023-03-21', 
    '2022-09-22',
    '2023-03-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'SIA Approved', 2, '2023-03-21', '2023-09-17', 
    '2023-03-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'Notification u/s 11', 3, '2023-09-17', '2024-03-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'Objection Hearing', 4, '2024-03-15', '2024-09-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'Award Declaration', 5, '2024-09-11', '2025-03-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'Compensation Disbursement', 6, '2025-03-10', '2025-09-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'Possession Handover', 7, '2025-09-06', '2026-03-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'Rehabilitation', 8, '2026-03-05', '2026-09-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (103, 'Completed', 9, '2026-09-01', '2027-02-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (103, CURRENT_DATE, 657, 367,
    0.0339, 0.0337, 27,
    0, false, 0,
    false, 0.4063, 33,
    3, true, true,
    0.5188, 79, 44,
    0, 0.3876);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (103, (SELECT id FROM project_data_snapshots WHERE project_id = 103 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3307, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (104, 'Smart City 104 (Srikakulam, Andhra Pradesh)', 'Smart City', 'Andhra Pradesh', 'Srikakulam',
    13.555215, 84.481622, 177.42, 2820,
    '2022-02-22', '2025-11-06', 'Rehabilitation', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'SIA Initiated', 1, '2022-02-22', '2022-08-21', 
    '2022-02-22',
    '2022-08-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'SIA Approved', 2, '2022-08-21', '2023-02-17', 
    '2022-08-21',
    '2023-02-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'Notification u/s 11', 3, '2023-02-17', '2023-08-16', 
    '2023-02-17',
    '2023-08-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'Objection Hearing', 4, '2023-08-16', '2024-02-12', 
    '2023-08-16',
    '2024-02-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'Award Declaration', 5, '2024-02-12', '2024-08-10', 
    '2024-02-12',
    '2024-08-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'Compensation Disbursement', 6, '2024-08-10', '2025-02-06', 
    '2024-08-10',
    '2025-02-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'Possession Handover', 7, '2025-02-06', '2025-08-05', 
    '2025-02-06',
    '2025-08-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'Rehabilitation', 8, '2025-08-05', '2026-02-01', 
    '2025-08-05',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (104, 'Completed', 9, '2026-02-01', '2026-07-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (104, CURRENT_DATE, 137, 0,
    0.8341, 0.8142, 52,
    34, true, 4,
    false, 0.609, 12,
    7, true, false,
    0.4524, 13, 19,
    0.0447, 0.4554);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (104, (SELECT id FROM project_data_snapshots WHERE project_id = 104 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3571, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (105, 'State Highway 105 (Mysuru, Karnataka)', 'State Highway', 'Karnataka', 'Mysuru',
    13.931686, 75.489453, 200.81, 1626,
    '2021-01-24', '2024-06-15', 'Notification u/s 11', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'SIA Initiated', 1, '2021-01-24', '2021-07-23', 
    '2021-01-24',
    '2021-07-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'SIA Approved', 2, '2021-07-23', '2022-01-19', 
    '2021-07-23',
    '2022-01-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'Notification u/s 11', 3, '2022-01-19', '2022-07-18', 
    '2022-01-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'Objection Hearing', 4, '2022-07-18', '2023-01-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'Award Declaration', 5, '2023-01-14', '2023-07-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'Compensation Disbursement', 6, '2023-07-13', '2024-01-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'Possession Handover', 7, '2024-01-09', '2024-07-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'Rehabilitation', 8, '2024-07-07', '2025-01-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (105, 'Completed', 9, '2025-01-03', '2025-07-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (105, CURRENT_DATE, 503, 208,
    0.1964, 0.1613, 151,
    0, false, 0,
    false, 0.6577, 0,
    3, true, true,
    0.7523, 13, 36,
    0, 0.1509);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (105, (SELECT id FROM project_data_snapshots WHERE project_id = 105 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3548, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (106, 'Industrial Corridor 106 (Surat, Gujarat)', 'Industrial Corridor', 'Gujarat', 'Surat',
    23.018156, 71.181646, 177.22, 3760,
    '2022-07-24', '2027-02-21', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'SIA Initiated', 1, '2022-07-24', '2023-01-20', 
    '2022-07-24',
    '2023-01-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'SIA Approved', 2, '2023-01-20', '2023-07-19', 
    '2023-01-20',
    '2023-07-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'Notification u/s 11', 3, '2023-07-19', '2024-01-15', 
    '2023-07-19',
    '2024-01-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'Objection Hearing', 4, '2024-01-15', '2024-07-13', 
    '2024-01-15',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'Award Declaration', 5, '2024-07-13', '2025-01-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'Compensation Disbursement', 6, '2025-01-09', '2025-07-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'Possession Handover', 7, '2025-07-08', '2026-01-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'Rehabilitation', 8, '2026-01-04', '2026-07-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (106, 'Completed', 9, '2026-07-03', '2026-12-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (106, CURRENT_DATE, 0, 0,
    0.3377, 0.2757, 158,
    0, false, 0,
    false, 0.5035, 86,
    4, true, false,
    0.5902, 22, 20,
    0, 0.1589);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (106, (SELECT id FROM project_data_snapshots WHERE project_id = 106 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3842, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (107, 'Railway 107 (Coimbatore, Tamil Nadu)', 'Railway Line', 'Tamil Nadu', 'Coimbatore',
    10.300315, 76.620403, 279.68, 4021,
    '2020-06-11', '2023-08-05', 'Compensation Disbursement', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'SIA Initiated', 1, '2020-06-11', '2020-12-08', 
    '2020-06-11',
    '2020-12-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'SIA Approved', 2, '2020-12-08', '2021-06-06', 
    '2020-12-08',
    '2021-06-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'Notification u/s 11', 3, '2021-06-06', '2021-12-03', 
    '2021-06-06',
    '2021-12-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'Objection Hearing', 4, '2021-12-03', '2022-06-01', 
    '2021-12-03',
    '2022-06-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'Award Declaration', 5, '2022-06-01', '2022-11-28', 
    '2022-06-01',
    '2022-11-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'Compensation Disbursement', 6, '2022-11-28', '2023-05-27', 
    '2022-11-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'Possession Handover', 7, '2023-05-27', '2023-11-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'Rehabilitation', 8, '2023-11-23', '2024-05-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (107, 'Completed', 9, '2024-05-21', '2024-11-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (107, CURRENT_DATE, 463, 210,
    0.5622, 0.5007, 35,
    0, false, 0,
    false, 0.5123, 107,
    7, true, true,
    0.8655, 6, 31,
    0, 0.1683);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (107, (SELECT id FROM project_data_snapshots WHERE project_id = 107 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6032, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (108, 'Urban Infra 108 (Medak, Telangana)', 'Urban Infrastructure', 'Telangana', 'Medak',
    17.162522, 80.779513, 149.58, 2261,
    '2021-09-26', '2025-06-22', 'Rehabilitation', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'SIA Initiated', 1, '2021-09-26', '2022-03-25', 
    '2021-09-26',
    '2022-03-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'SIA Approved', 2, '2022-03-25', '2022-09-21', 
    '2022-03-25',
    '2022-09-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'Notification u/s 11', 3, '2022-09-21', '2023-03-20', 
    '2022-09-21',
    '2023-03-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'Objection Hearing', 4, '2023-03-20', '2023-09-16', 
    '2023-03-20',
    '2023-09-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'Award Declaration', 5, '2023-09-16', '2024-03-14', 
    '2023-09-16',
    '2024-03-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'Compensation Disbursement', 6, '2024-03-14', '2024-09-10', 
    '2024-03-14',
    '2024-09-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'Possession Handover', 7, '2024-09-10', '2025-03-09', 
    '2024-09-10',
    '2025-03-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'Rehabilitation', 8, '2025-03-09', '2025-09-05', 
    '2025-03-09',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (108, 'Completed', 9, '2025-09-05', '2026-03-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (108, CURRENT_DATE, 0, 0,
    0.8085, 0.703, 57,
    0, false, 0,
    false, 0.7226, 21,
    7, true, true,
    0.7725, 68, 35,
    0.5108, 0.3864);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (108, (SELECT id FROM project_data_snapshots WHERE project_id = 108 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3554, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (109, 'Industrial Corridor 109 (Namakkal, Tamil Nadu)', 'Industrial Corridor', 'Tamil Nadu', 'Namakkal',
    10.427516, 76.983439, 227.62, 2865,
    '2021-10-24', '2025-03-12', 'Completed', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'SIA Initiated', 1, '2021-10-24', '2022-04-22', 
    '2021-10-24',
    '2022-04-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'SIA Approved', 2, '2022-04-22', '2022-10-19', 
    '2022-04-22',
    '2022-10-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'Notification u/s 11', 3, '2022-10-19', '2023-04-17', 
    '2022-10-19',
    '2023-04-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'Objection Hearing', 4, '2023-04-17', '2023-10-14', 
    '2023-04-17',
    '2023-10-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'Award Declaration', 5, '2023-10-14', '2024-04-11', 
    '2023-10-14',
    '2024-04-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'Compensation Disbursement', 6, '2024-04-11', '2024-10-08', 
    '2024-04-11',
    '2024-10-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'Possession Handover', 7, '2024-10-08', '2025-04-06', 
    '2024-10-08',
    '2025-04-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'Rehabilitation', 8, '2025-04-06', '2025-10-03', 
    '2025-04-06',
    '2025-10-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (109, 'Completed', 9, '2025-10-03', '2026-04-01', 
    '2025-10-03',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (109, CURRENT_DATE, 134, 0,
    1, 0.8961, 112,
    0, false, 0,
    false, 0.9192, 15,
    3, true, true,
    0.7376, 49, 55,
    0.7108, 0.4164);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (109, (SELECT id FROM project_data_snapshots WHERE project_id = 109 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.128, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (110, 'Rail Line 110 (Rajkot, Gujarat)', 'Railway Line', 'Gujarat', 'Rajkot',
    22.565335, 71.459825, 476.44, 4224,
    '2023-10-24', '2028-02-27', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'SIA Initiated', 1, '2023-10-24', '2024-04-21', 
    '2023-10-24',
    '2024-04-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'SIA Approved', 2, '2024-04-21', '2024-10-18', 
    '2024-04-21',
    '2024-10-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'Notification u/s 11', 3, '2024-10-18', '2025-04-16', 
    '2024-10-18',
    '2025-04-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'Objection Hearing', 4, '2025-04-16', '2025-10-13', 
    '2025-04-16',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'Award Declaration', 5, '2025-10-13', '2026-04-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'Compensation Disbursement', 6, '2026-04-11', '2026-10-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'Possession Handover', 7, '2026-10-08', '2027-04-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'Rehabilitation', 8, '2027-04-06', '2027-10-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (110, 'Completed', 9, '2027-10-03', '2028-03-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (110, CURRENT_DATE, 581, 228,
    0.3087, 0.3067, 24,
    0, false, 0,
    false, 0.4814, 96,
    6, true, false,
    0.9925, 88, 8,
    0, 0.4507);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (110, (SELECT id FROM project_data_snapshots WHERE project_id = 110 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5916, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (111, 'Railway 111 (Gandhinagar, Gujarat)', 'Railway Line', 'Gujarat', 'Gandhinagar',
    23.043055, 71.181482, 204.41, 2289,
    '2023-07-02', '2027-09-26', 'Compensation Disbursement', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'SIA Initiated', 1, '2023-07-02', '2023-12-29', 
    '2023-07-02',
    '2023-12-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'SIA Approved', 2, '2023-12-29', '2024-06-26', 
    '2023-12-29',
    '2024-06-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'Notification u/s 11', 3, '2024-06-26', '2024-12-23', 
    '2024-06-26',
    '2024-12-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'Objection Hearing', 4, '2024-12-23', '2025-06-21', 
    '2024-12-23',
    '2025-06-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'Award Declaration', 5, '2025-06-21', '2025-12-18', 
    '2025-06-21',
    '2025-12-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'Compensation Disbursement', 6, '2025-12-18', '2026-06-16', 
    '2025-12-18',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'Possession Handover', 7, '2026-06-16', '2026-12-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'Rehabilitation', 8, '2026-12-13', '2027-06-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (111, 'Completed', 9, '2027-06-11', '2027-12-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (111, CURRENT_DATE, 677, 320,
    0.5787, 0.477, 94,
    0, false, 0,
    false, 0.6728, 62,
    5, true, true,
    0.8689, 16, 46,
    0, 0.5861);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (111, (SELECT id FROM project_data_snapshots WHERE project_id = 111 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6784, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (112, 'City Infra 112 (Jaipur, Rajasthan)', 'Urban Infrastructure', 'Rajasthan', 'Jaipur',
    28.773934, 73.952435, 395.21, 406,
    '2021-01-19', '2023-11-11', 'Possession Handover', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'SIA Initiated', 1, '2021-01-19', '2021-07-18', 
    '2021-01-19',
    '2021-07-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'SIA Approved', 2, '2021-07-18', '2022-01-14', 
    '2021-07-18',
    '2022-01-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'Notification u/s 11', 3, '2022-01-14', '2022-07-13', 
    '2022-01-14',
    '2022-07-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'Objection Hearing', 4, '2022-07-13', '2023-01-09', 
    '2022-07-13',
    '2023-01-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'Award Declaration', 5, '2023-01-09', '2023-07-08', 
    '2023-01-09',
    '2023-07-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'Compensation Disbursement', 6, '2023-07-08', '2024-01-04', 
    '2023-07-08',
    '2024-01-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'Possession Handover', 7, '2024-01-04', '2024-07-02', 
    '2024-01-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'Rehabilitation', 8, '2024-07-02', '2024-12-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (112, 'Completed', 9, '2024-12-29', '2025-06-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (112, CURRENT_DATE, 320, 129,
    0.7176, 0.6267, 25,
    0, false, 0,
    false, 0.7757, 107,
    7, true, true,
    0.9294, 25, 28,
    0.4565, 0.5959);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (112, (SELECT id FROM project_data_snapshots WHERE project_id = 112 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5904, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (113, 'Railway 113 (Medchal-Malkajgiri, Telangana)', 'Railway Line', 'Telangana', 'Medchal-Malkajgiri',
    19.00638, 77.42003, 201.19, 2512,
    '2021-12-31', '2025-01-07', 'Award Declaration', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'SIA Initiated', 1, '2021-12-31', '2022-06-29', 
    '2021-12-31',
    '2022-06-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'SIA Approved', 2, '2022-06-29', '2022-12-26', 
    '2022-06-29',
    '2022-12-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'Notification u/s 11', 3, '2022-12-26', '2023-06-24', 
    '2022-12-26',
    '2023-06-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'Objection Hearing', 4, '2023-06-24', '2023-12-21', 
    '2023-06-24',
    '2023-12-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'Award Declaration', 5, '2023-12-21', '2024-06-18', 
    '2023-12-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'Compensation Disbursement', 6, '2024-06-18', '2024-12-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'Possession Handover', 7, '2024-12-15', '2025-06-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'Rehabilitation', 8, '2025-06-13', '2025-12-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (113, 'Completed', 9, '2025-12-10', '2026-06-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (113, CURRENT_DATE, 286, 0,
    0.4165, 0.3746, 179,
    0, false, 0,
    false, 0.8531, 54,
    10, true, true,
    0.0952, 32, 30,
    0, 0.139);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (113, (SELECT id FROM project_data_snapshots WHERE project_id = 113 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5123, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (114, 'Rural Road 114 (Hapur, Uttar Pradesh)', 'Rural Road', 'Uttar Pradesh', 'Hapur',
    29.311209, 84.411162, 160.11, 2461,
    '2020-09-17', '2024-01-29', 'SIA Initiated', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'SIA Initiated', 1, '2020-09-17', '2021-03-16', 
    '2020-09-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'SIA Approved', 2, '2021-03-16', '2021-09-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'Notification u/s 11', 3, '2021-09-12', '2022-03-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'Objection Hearing', 4, '2022-03-11', '2022-09-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'Award Declaration', 5, '2022-09-07', '2023-03-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'Compensation Disbursement', 6, '2023-03-06', '2023-09-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'Possession Handover', 7, '2023-09-02', '2024-02-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'Rehabilitation', 8, '2024-02-29', '2024-08-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (114, 'Completed', 9, '2024-08-27', '2025-02-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (114, CURRENT_DATE, 165, 0,
    0, 0, 97,
    50, true, 2,
    false, 0.7849, 86,
    2, false, true,
    0.5633, 83, 41,
    0, 0.1821);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (114, (SELECT id FROM project_data_snapshots WHERE project_id = 114 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2587, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (115, 'Metro Rail 115 (Sikar, Rajasthan)', 'Metro Rail', 'Rajasthan', 'Sikar',
    26.096687, 71.455202, 481.81, 2586,
    '2023-08-25', '2025-03-17', 'Notification u/s 11', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'SIA Initiated', 1, '2023-08-25', '2024-02-21', 
    '2023-08-25',
    '2024-02-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'SIA Approved', 2, '2024-02-21', '2024-08-19', 
    '2024-02-21',
    '2024-08-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'Notification u/s 11', 3, '2024-08-19', '2025-02-15', 
    '2024-08-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'Objection Hearing', 4, '2025-02-15', '2025-08-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'Award Declaration', 5, '2025-08-14', '2026-02-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'Compensation Disbursement', 6, '2026-02-10', '2026-08-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'Possession Handover', 7, '2026-08-09', '2027-02-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'Rehabilitation', 8, '2027-02-05', '2027-08-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (115, 'Completed', 9, '2027-08-04', '2028-01-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (115, CURRENT_DATE, 0, 0,
    0.178, 0.1312, 35,
    0, false, 0,
    false, 0.5487, 82,
    1, true, true,
    0.601, 82, 18,
    0, 0.4895);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (115, (SELECT id FROM project_data_snapshots WHERE project_id = 115 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3848, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (116, 'E-way 116 (Chikkaballapura, Karnataka)', 'Expressway', 'Karnataka', 'Chikkaballapura',
    12.660263, 75.76288, 60.81, 4102,
    '2023-06-24', '2028-02-06', 'Objection Hearing', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'SIA Initiated', 1, '2023-06-24', '2023-12-21', 
    '2023-06-24',
    '2023-12-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'SIA Approved', 2, '2023-12-21', '2024-06-18', 
    '2023-12-21',
    '2024-06-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'Notification u/s 11', 3, '2024-06-18', '2024-12-15', 
    '2024-06-18',
    '2024-12-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'Objection Hearing', 4, '2024-12-15', '2025-06-13', 
    '2024-12-15',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'Award Declaration', 5, '2025-06-13', '2025-12-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'Compensation Disbursement', 6, '2025-12-10', '2026-06-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'Possession Handover', 7, '2026-06-08', '2026-12-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'Rehabilitation', 8, '2026-12-05', '2027-06-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (116, 'Completed', 9, '2027-06-03', '2027-11-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (116, CURRENT_DATE, 85, 0,
    0.4318, 0.405, 152,
    0, false, 0,
    false, 0.4426, 113,
    0, true, false,
    0.9339, 21, 24,
    0, 0.5304);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (116, (SELECT id FROM project_data_snapshots WHERE project_id = 116 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5321, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (117, 'City Infra 117 (Sangareddy, Telangana)', 'Urban Infrastructure', 'Telangana', 'Sangareddy',
    18.581468, 77.075102, 255.77, 4114,
    '2021-03-11', '2022-07-27', 'Notification u/s 11', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'SIA Initiated', 1, '2021-03-11', '2021-09-07', 
    '2021-03-11',
    '2021-09-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'SIA Approved', 2, '2021-09-07', '2022-03-06', 
    '2021-09-07',
    '2022-03-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'Notification u/s 11', 3, '2022-03-06', '2022-09-02', 
    '2022-03-06',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'Objection Hearing', 4, '2022-09-02', '2023-03-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'Award Declaration', 5, '2023-03-01', '2023-08-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'Compensation Disbursement', 6, '2023-08-28', '2024-02-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'Possession Handover', 7, '2024-02-24', '2024-08-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'Rehabilitation', 8, '2024-08-22', '2025-02-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (117, 'Completed', 9, '2025-02-18', '2025-08-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (117, CURRENT_DATE, 0, 0,
    0.1528, 0.1168, 106,
    0, false, 0,
    false, 0.6541, 51,
    1, true, true,
    0.5377, 24, 17,
    0, 0.1418);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (117, (SELECT id FROM project_data_snapshots WHERE project_id = 117 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4863, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (118, 'Metro 118 (Nashik, Maharashtra)', 'Metro Rail', 'Maharashtra', 'Nashik',
    19.311842, 78.605793, 33.66, 716,
    '2022-07-21', '2027-03-12', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'SIA Initiated', 1, '2022-07-21', '2023-01-17', 
    '2022-07-21',
    '2023-01-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'SIA Approved', 2, '2023-01-17', '2023-07-16', 
    '2023-01-17',
    '2023-07-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'Notification u/s 11', 3, '2023-07-16', '2024-01-12', 
    '2023-07-16',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'Objection Hearing', 4, '2024-01-12', '2024-07-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'Award Declaration', 5, '2024-07-10', '2025-01-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'Compensation Disbursement', 6, '2025-01-06', '2025-07-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'Possession Handover', 7, '2025-07-05', '2026-01-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'Rehabilitation', 8, '2026-01-01', '2026-06-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (118, 'Completed', 9, '2026-06-30', '2026-12-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (118, CURRENT_DATE, 727, 436,
    0.2786, 0.221, 29,
    0, false, 0,
    false, 0.672, 77,
    0, true, true,
    0.7417, 27, 7,
    0, 0.1063);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (118, (SELECT id FROM project_data_snapshots WHERE project_id = 118 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.298, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (119, 'National Highway 119 (Bhavnagar, Gujarat)', 'National Highway', 'Gujarat', 'Bhavnagar',
    22.353524, 73.089416, 367.8, 977,
    '2022-06-08', '2024-11-19', 'Notification u/s 11', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'SIA Initiated', 1, '2022-06-08', '2022-12-05', 
    '2022-06-08',
    '2022-12-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'SIA Approved', 2, '2022-12-05', '2023-06-03', 
    '2022-12-05',
    '2023-06-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'Notification u/s 11', 3, '2023-06-03', '2023-11-30', 
    '2023-06-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'Objection Hearing', 4, '2023-11-30', '2024-05-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'Award Declaration', 5, '2024-05-28', '2024-11-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'Compensation Disbursement', 6, '2024-11-24', '2025-05-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'Possession Handover', 7, '2025-05-23', '2025-11-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'Rehabilitation', 8, '2025-11-19', '2026-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (119, 'Completed', 9, '2026-05-18', '2026-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (119, CURRENT_DATE, 0, 0,
    0.1834, 0.1354, 7,
    0, false, 0,
    false, 0.601, 54,
    4, true, true,
    0.2629, 78, 40,
    0, 0.1385);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (119, (SELECT id FROM project_data_snapshots WHERE project_id = 119 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4859, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (120, 'Industrial Corridor 120 (West Godavari, Andhra Pradesh)', 'Industrial Corridor', 'Andhra Pradesh', 'West Godavari',
    13.66817, 77.75848, 26.8, 110,
    '2020-08-11', '2022-03-09', 'SIA Initiated', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'SIA Initiated', 1, '2020-08-11', '2021-02-07', 
    '2020-08-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'SIA Approved', 2, '2021-02-07', '2021-08-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'Notification u/s 11', 3, '2021-08-06', '2022-02-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'Objection Hearing', 4, '2022-02-02', '2022-08-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'Award Declaration', 5, '2022-08-01', '2023-01-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'Compensation Disbursement', 6, '2023-01-28', '2023-07-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'Possession Handover', 7, '2023-07-27', '2024-01-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'Rehabilitation', 8, '2024-01-23', '2024-07-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (120, 'Completed', 9, '2024-07-21', '2025-01-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (120, CURRENT_DATE, 0, 0,
    0.0789, 0.0711, 62,
    3, true, 4,
    false, 0.6184, 117,
    2, false, true,
    0.9603, 9, 35,
    0, 0.5016);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (120, (SELECT id FROM project_data_snapshots WHERE project_id = 120 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3078, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (121, 'Industrial Corridor 121 (Medchal-Malkajgiri, Telangana)', 'Industrial Corridor', 'Telangana', 'Medchal-Malkajgiri',
    16.779741, 80.716986, 115.48, 4235,
    '2023-01-18', '2027-04-02', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'SIA Initiated', 1, '2023-01-18', '2023-07-17', 
    '2023-01-18',
    '2023-07-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'SIA Approved', 2, '2023-07-17', '2024-01-13', 
    '2023-07-17',
    '2024-01-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'Notification u/s 11', 3, '2024-01-13', '2024-07-11', 
    '2024-01-13',
    '2024-07-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'Objection Hearing', 4, '2024-07-11', '2025-01-07', 
    '2024-07-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'Award Declaration', 5, '2025-01-07', '2025-07-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'Compensation Disbursement', 6, '2025-07-06', '2026-01-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'Possession Handover', 7, '2026-01-02', '2026-07-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'Rehabilitation', 8, '2026-07-01', '2026-12-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (121, 'Completed', 9, '2026-12-28', '2027-06-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (121, CURRENT_DATE, 0, 0,
    0.3496, 0.2973, 11,
    0, false, 0,
    false, 0.9724, 8,
    7, true, false,
    0.7735, 44, 20,
    0, 0.1432);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (121, (SELECT id FROM project_data_snapshots WHERE project_id = 121 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6248, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (122, 'Industrial Corridor 122 (Visakhapatnam, Andhra Pradesh)', 'Industrial Corridor', 'Andhra Pradesh', 'Visakhapatnam',
    14.627365, 81.48174, 367.57, 4487,
    '2022-02-26', '2025-10-03', 'Objection Hearing', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'SIA Initiated', 1, '2022-02-26', '2022-08-25', 
    '2022-02-26',
    '2022-08-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'SIA Approved', 2, '2022-08-25', '2023-02-21', 
    '2022-08-25',
    '2023-02-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'Notification u/s 11', 3, '2023-02-21', '2023-08-20', 
    '2023-02-21',
    '2023-08-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'Objection Hearing', 4, '2023-08-20', '2024-02-16', 
    '2023-08-20',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'Award Declaration', 5, '2024-02-16', '2024-08-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'Compensation Disbursement', 6, '2024-08-14', '2025-02-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'Possession Handover', 7, '2025-02-10', '2025-08-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'Rehabilitation', 8, '2025-08-09', '2026-02-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (122, 'Completed', 9, '2026-02-05', '2026-08-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (122, CURRENT_DATE, 407, 165,
    0.3933, 0.3336, 38,
    0, false, 0,
    false, 0.4038, 52,
    0, true, true,
    0.3464, 6, 60,
    0, 0.2675);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (122, (SELECT id FROM project_data_snapshots WHERE project_id = 122 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5191, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (123, 'E-way 123 (Siddipet, Telangana)', 'Expressway', 'Telangana', 'Siddipet',
    16.45267, 79.21413, 351.92, 3061,
    '2023-02-10', '2024-06-11', 'SIA Approved', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'SIA Initiated', 1, '2023-02-10', '2023-08-09', 
    '2023-02-10',
    '2023-08-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'SIA Approved', 2, '2023-08-09', '2024-02-05', 
    '2023-08-09',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'Notification u/s 11', 3, '2024-02-05', '2024-08-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'Objection Hearing', 4, '2024-08-03', '2025-01-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'Award Declaration', 5, '2025-01-30', '2025-07-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'Compensation Disbursement', 6, '2025-07-29', '2026-01-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'Possession Handover', 7, '2026-01-25', '2026-07-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'Rehabilitation', 8, '2026-07-24', '2027-01-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (123, 'Completed', 9, '2027-01-20', '2027-07-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (123, CURRENT_DATE, 175, 0,
    0.1673, 0.1218, 21,
    0, false, 0,
    false, 0.7485, 64,
    2, true, true,
    0.3944, 80, 36,
    0, 0.1311);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (123, (SELECT id FROM project_data_snapshots WHERE project_id = 123 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2589, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (124, 'Expressway 124 (Gandhinagar, Gujarat)', 'Expressway', 'Gujarat', 'Gandhinagar',
    21.768287, 73.407349, 391.07, 4799,
    '2022-02-13', '2024-12-12', 'Award Declaration', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'SIA Initiated', 1, '2022-02-13', '2022-08-12', 
    '2022-02-13',
    '2022-08-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'SIA Approved', 2, '2022-08-12', '2023-02-08', 
    '2022-08-12',
    '2023-02-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'Notification u/s 11', 3, '2023-02-08', '2023-08-07', 
    '2023-02-08',
    '2023-08-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'Objection Hearing', 4, '2023-08-07', '2024-02-03', 
    '2023-08-07',
    '2024-02-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'Award Declaration', 5, '2024-02-03', '2024-08-01', 
    '2024-02-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'Compensation Disbursement', 6, '2024-08-01', '2025-01-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'Possession Handover', 7, '2025-01-28', '2025-07-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'Rehabilitation', 8, '2025-07-27', '2026-01-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (124, 'Completed', 9, '2026-01-23', '2026-07-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (124, CURRENT_DATE, 355, 148,
    0.4906, 0.3778, 39,
    0, false, 0,
    false, 0.4634, 57,
    7, true, true,
    0.1207, 50, 49,
    0, 0.2038);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (124, (SELECT id FROM project_data_snapshots WHERE project_id = 124 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5278, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (125, 'Expressway 125 (Salem, Tamil Nadu)', 'Expressway', 'Tamil Nadu', 'Salem',
    11.773302, 79.71874, 357.02, 2924,
    '2020-01-01', '2024-11-27', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'SIA Initiated', 1, '2020-01-01', '2020-06-29', 
    '2020-01-01',
    '2020-06-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'SIA Approved', 2, '2020-06-29', '2020-12-26', 
    '2020-06-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'Notification u/s 11', 3, '2020-12-26', '2021-06-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'Objection Hearing', 4, '2021-06-24', '2021-12-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'Award Declaration', 5, '2021-12-21', '2022-06-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'Compensation Disbursement', 6, '2022-06-19', '2022-12-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'Possession Handover', 7, '2022-12-16', '2023-06-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'Rehabilitation', 8, '2023-06-14', '2023-12-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (125, 'Completed', 9, '2023-12-11', '2024-06-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (125, CURRENT_DATE, 647, 366,
    0.0331, 0.0314, 131,
    0, false, 0,
    false, 0.4294, 38,
    4, true, false,
    0.1739, 56, 54,
    0, 0.3261);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (125, (SELECT id FROM project_data_snapshots WHERE project_id = 125 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1473, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (126, 'Rural Road 126 (Meerut, Uttar Pradesh)', 'Rural Road', 'Uttar Pradesh', 'Meerut',
    24.40085, 82.8572, 293.25, 2130,
    '2021-04-18', '2023-07-17', 'SIA Approved', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'SIA Initiated', 1, '2021-04-18', '2021-10-15', 
    '2021-04-18',
    '2021-10-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'SIA Approved', 2, '2021-10-15', '2022-04-13', 
    '2021-10-15',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'Notification u/s 11', 3, '2022-04-13', '2022-10-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'Objection Hearing', 4, '2022-10-10', '2023-04-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'Award Declaration', 5, '2023-04-08', '2023-10-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'Compensation Disbursement', 6, '2023-10-05', '2024-04-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'Possession Handover', 7, '2024-04-02', '2024-09-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'Rehabilitation', 8, '2024-09-29', '2025-03-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (126, 'Completed', 9, '2025-03-28', '2025-09-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (126, CURRENT_DATE, 163, 0,
    0.0646, 0.053, 5,
    0, false, 0,
    false, 0.9983, 25,
    10, true, true,
    0.1288, 47, 7,
    0, 0.1213);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (126, (SELECT id FROM project_data_snapshots WHERE project_id = 126 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1364, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (127, 'Railway 127 (Visakhapatnam, Andhra Pradesh)', 'Railway Line', 'Andhra Pradesh', 'Visakhapatnam',
    15.179106, 79.913312, 22.15, 2023,
    '2020-01-29', '2023-01-22', 'Possession Handover', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'SIA Initiated', 1, '2020-01-29', '2020-07-27', 
    '2020-01-29',
    '2020-07-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'SIA Approved', 2, '2020-07-27', '2021-01-23', 
    '2020-07-27',
    '2021-01-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'Notification u/s 11', 3, '2021-01-23', '2021-07-22', 
    '2021-01-23',
    '2021-07-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'Objection Hearing', 4, '2021-07-22', '2022-01-18', 
    '2021-07-22',
    '2022-01-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'Award Declaration', 5, '2022-01-18', '2022-07-17', 
    '2022-01-18',
    '2022-07-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'Compensation Disbursement', 6, '2022-07-17', '2023-01-13', 
    '2022-07-17',
    '2023-01-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'Possession Handover', 7, '2023-01-13', '2023-07-12', 
    '2023-01-13',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'Rehabilitation', 8, '2023-07-12', '2024-01-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (127, 'Completed', 9, '2024-01-08', '2024-07-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (127, CURRENT_DATE, 0, 0,
    0.6929, 0.524, 165,
    0, false, 0,
    false, 0.5771, 52,
    8, true, true,
    0.0877, 54, 8,
    0.4192, 0.4213);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (127, (SELECT id FROM project_data_snapshots WHERE project_id = 127 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4488, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (128, 'City Infra 128 (Baghpat, Uttar Pradesh)', 'Urban Infrastructure', 'Uttar Pradesh', 'Baghpat',
    26.334229, 81.083884, 94.01, 2622,
    '2023-09-18', '2027-06-06', 'SIA Initiated', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'SIA Initiated', 1, '2023-09-18', '2024-03-16', 
    '2023-09-18',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'SIA Approved', 2, '2024-03-16', '2024-09-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'Notification u/s 11', 3, '2024-09-12', '2025-03-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'Objection Hearing', 4, '2025-03-11', '2025-09-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'Award Declaration', 5, '2025-09-07', '2026-03-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'Compensation Disbursement', 6, '2026-03-06', '2026-09-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'Possession Handover', 7, '2026-09-02', '2027-03-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'Rehabilitation', 8, '2027-03-01', '2027-08-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (128, 'Completed', 9, '2027-08-28', '2028-02-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (128, CURRENT_DATE, 0, 0,
    0, 0, 152,
    0, false, 0,
    false, 0.5314, 114,
    4, false, true,
    0.9915, 72, 22,
    0, 0.4834);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (128, (SELECT id FROM project_data_snapshots WHERE project_id = 128 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2846, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (129, 'SH 129 (Ghaziabad, Uttar Pradesh)', 'State Highway', 'Uttar Pradesh', 'Ghaziabad',
    29.305854, 83.879446, 92.17, 4863,
    '2023-07-06', '2024-10-27', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'SIA Initiated', 1, '2023-07-06', '2024-01-02', 
    '2023-07-06',
    '2024-01-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'SIA Approved', 2, '2024-01-02', '2024-06-30', 
    '2024-01-02',
    '2024-06-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'Notification u/s 11', 3, '2024-06-30', '2024-12-27', 
    '2024-06-30',
    '2024-12-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'Objection Hearing', 4, '2024-12-27', '2025-06-25', 
    '2024-12-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'Award Declaration', 5, '2025-06-25', '2025-12-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'Compensation Disbursement', 6, '2025-12-22', '2026-06-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'Possession Handover', 7, '2026-06-20', '2026-12-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'Rehabilitation', 8, '2026-12-17', '2027-06-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (129, 'Completed', 9, '2027-06-15', '2027-12-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (129, CURRENT_DATE, 254, 0,
    0.3901, 0.3881, 178,
    0, false, 0,
    false, 0.6153, 75,
    0, true, false,
    0.3517, 77, 36,
    0, 0.1711);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (129, (SELECT id FROM project_data_snapshots WHERE project_id = 129 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.43, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (130, 'Urban Infra 130 (Bulandshahr, Uttar Pradesh)', 'Urban Infrastructure', 'Uttar Pradesh', 'Bulandshahr',
    24.586673, 78.744675, 404.19, 2801,
    '2023-04-29', '2025-07-20', 'Award Declaration', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'SIA Initiated', 1, '2023-04-29', '2023-10-26', 
    '2023-04-29',
    '2023-10-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'SIA Approved', 2, '2023-10-26', '2024-04-23', 
    '2023-10-26',
    '2024-04-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'Notification u/s 11', 3, '2024-04-23', '2024-10-20', 
    '2024-04-23',
    '2024-10-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'Objection Hearing', 4, '2024-10-20', '2025-04-18', 
    '2024-10-20',
    '2025-04-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'Award Declaration', 5, '2025-04-18', '2025-10-15', 
    '2025-04-18',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'Compensation Disbursement', 6, '2025-10-15', '2026-04-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'Possession Handover', 7, '2026-04-13', '2026-10-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'Rehabilitation', 8, '2026-10-10', '2027-04-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (130, 'Completed', 9, '2027-04-08', '2027-10-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (130, CURRENT_DATE, 50, 0,
    0.5053, 0.3538, 45,
    0, false, 0,
    false, 0.9513, 108,
    5, true, true,
    0.1477, 23, 49,
    0, 0.1555);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (130, (SELECT id FROM project_data_snapshots WHERE project_id = 130 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3971, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (131, 'Industrial Corridor 131 (Jaipur, Rajasthan)', 'Industrial Corridor', 'Rajasthan', 'Jaipur',
    25.112356, 70.728065, 355.06, 4613,
    '2021-03-24', '2023-02-09', 'Possession Handover', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'SIA Initiated', 1, '2021-03-24', '2021-09-20', 
    '2021-03-24',
    '2021-09-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'SIA Approved', 2, '2021-09-20', '2022-03-19', 
    '2021-09-20',
    '2022-03-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'Notification u/s 11', 3, '2022-03-19', '2022-09-15', 
    '2022-03-19',
    '2022-09-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'Objection Hearing', 4, '2022-09-15', '2023-03-14', 
    '2022-09-15',
    '2023-03-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'Award Declaration', 5, '2023-03-14', '2023-09-10', 
    '2023-03-14',
    '2023-09-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'Compensation Disbursement', 6, '2023-09-10', '2024-03-08', 
    '2023-09-10',
    '2024-03-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'Possession Handover', 7, '2024-03-08', '2024-09-04', 
    '2024-03-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'Rehabilitation', 8, '2024-09-04', '2025-03-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (131, 'Completed', 9, '2025-03-03', '2025-08-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (131, CURRENT_DATE, 477, 120,
    0.8084, 0.7988, 157,
    0, false, 0,
    false, 0.8722, 28,
    10, true, true,
    0.1754, 44, 46,
    0.6885, 0.1637);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (131, (SELECT id FROM project_data_snapshots WHERE project_id = 131 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3303, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (132, 'Port Link 132 (Chikkaballapura, Karnataka)', 'Port Connectivity', 'Karnataka', 'Chikkaballapura',
    14.10836, 78.144672, 373.94, 1959,
    '2020-03-25', '2024-08-28', 'Possession Handover', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'SIA Initiated', 1, '2020-03-25', '2020-09-21', 
    '2020-03-25',
    '2020-09-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'SIA Approved', 2, '2020-09-21', '2021-03-20', 
    '2020-09-21',
    '2021-03-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'Notification u/s 11', 3, '2021-03-20', '2021-09-16', 
    '2021-03-20',
    '2021-09-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'Objection Hearing', 4, '2021-09-16', '2022-03-15', 
    '2021-09-16',
    '2022-03-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'Award Declaration', 5, '2022-03-15', '2022-09-11', 
    '2022-03-15',
    '2022-09-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'Compensation Disbursement', 6, '2022-09-11', '2023-03-10', 
    '2022-09-11',
    '2023-03-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'Possession Handover', 7, '2023-03-10', '2023-09-06', 
    '2023-03-10',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'Rehabilitation', 8, '2023-09-06', '2024-03-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (132, 'Completed', 9, '2024-03-04', '2024-08-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (132, CURRENT_DATE, 256, 0,
    0.7779, 0.5688, 81,
    0, false, 0,
    false, 0.5007, 113,
    1, true, false,
    0.67, 47, 28,
    0.0114, 0.2048);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (132, (SELECT id FROM project_data_snapshots WHERE project_id = 132 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3097, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (133, 'Expressway 133 (Raigad, Maharashtra)', 'Expressway', 'Maharashtra', 'Raigad',
    18.348431, 75.857226, 415.26, 4745,
    '2023-07-05', '2025-06-09', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'SIA Initiated', 1, '2023-07-05', '2024-01-01', 
    '2023-07-05',
    '2024-01-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'SIA Approved', 2, '2024-01-01', '2024-06-29', 
    '2024-01-01',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'Notification u/s 11', 3, '2024-06-29', '2024-12-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'Objection Hearing', 4, '2024-12-26', '2025-06-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'Award Declaration', 5, '2025-06-24', '2025-12-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'Compensation Disbursement', 6, '2025-12-21', '2026-06-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'Possession Handover', 7, '2026-06-19', '2026-12-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'Rehabilitation', 8, '2026-12-16', '2027-06-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (133, 'Completed', 9, '2027-06-14', '2027-12-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (133, CURRENT_DATE, 453, 107,
    0.1236, 0.1006, 175,
    0, false, 0,
    false, 0.5353, 57,
    1, true, false,
    0.0334, 7, 20,
    0, 0.2306);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (133, (SELECT id FROM project_data_snapshots WHERE project_id = 133 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1144, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (134, 'Industrial Corridor 134 (Thane, Maharashtra)', 'Industrial Corridor', 'Maharashtra', 'Thane',
    15.987516, 80.034673, 218.51, 1361,
    '2023-10-14', '2025-04-21', 'Notification u/s 11', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'SIA Initiated', 1, '2023-10-14', '2024-04-11', 
    '2023-10-14',
    '2024-04-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'SIA Approved', 2, '2024-04-11', '2024-10-08', 
    '2024-04-11',
    '2024-10-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'Notification u/s 11', 3, '2024-10-08', '2025-04-06', 
    '2024-10-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'Objection Hearing', 4, '2025-04-06', '2025-10-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'Award Declaration', 5, '2025-10-03', '2026-04-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'Compensation Disbursement', 6, '2026-04-01', '2026-09-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'Possession Handover', 7, '2026-09-28', '2027-03-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'Rehabilitation', 8, '2027-03-27', '2027-09-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (134, 'Completed', 9, '2027-09-23', '2028-03-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (134, CURRENT_DATE, 0, 0,
    0.2176, 0.2166, 155,
    0, false, 0,
    false, 0.9339, 20,
    0, true, true,
    0.2056, 29, 26,
    0, 0.4486);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (134, (SELECT id FROM project_data_snapshots WHERE project_id = 134 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2483, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (135, 'E-way 135 (Karur, Tamil Nadu)', 'Expressway', 'Tamil Nadu', 'Karur',
    10.160962, 78.473482, 103.84, 220,
    '2020-05-05', '2024-02-04', 'Award Declaration', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'SIA Initiated', 1, '2020-05-05', '2020-11-01', 
    '2020-05-05',
    '2020-11-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'SIA Approved', 2, '2020-11-01', '2021-04-30', 
    '2020-11-01',
    '2021-04-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'Notification u/s 11', 3, '2021-04-30', '2021-10-27', 
    '2021-04-30',
    '2021-10-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'Objection Hearing', 4, '2021-10-27', '2022-04-25', 
    '2021-10-27',
    '2022-04-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'Award Declaration', 5, '2022-04-25', '2022-10-22', 
    '2022-04-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'Compensation Disbursement', 6, '2022-10-22', '2023-04-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'Possession Handover', 7, '2023-04-20', '2023-10-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'Rehabilitation', 8, '2023-10-17', '2024-04-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (135, 'Completed', 9, '2024-04-14', '2024-10-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (135, CURRENT_DATE, 187, 0,
    0.4109, 0.2881, 43,
    41, true, 3,
    false, 0.9862, 60,
    1, true, true,
    0.3975, 67, 57,
    0, 0.4305);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (135, (SELECT id FROM project_data_snapshots WHERE project_id = 135 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2788, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (136, 'Urban Infra 136 (Ahmednagar, Maharashtra)', 'Urban Infrastructure', 'Maharashtra', 'Ahmednagar',
    17.979394, 73.992664, 79.81, 802,
    '2021-12-10', '2023-03-11', 'Possession Handover', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'SIA Initiated', 1, '2021-12-10', '2022-06-08', 
    '2021-12-10',
    '2022-06-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'SIA Approved', 2, '2022-06-08', '2022-12-05', 
    '2022-06-08',
    '2022-12-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'Notification u/s 11', 3, '2022-12-05', '2023-06-03', 
    '2022-12-05',
    '2023-06-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'Objection Hearing', 4, '2023-06-03', '2023-11-30', 
    '2023-06-03',
    '2023-11-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'Award Declaration', 5, '2023-11-30', '2024-05-28', 
    '2023-11-30',
    '2024-05-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'Compensation Disbursement', 6, '2024-05-28', '2024-11-24', 
    '2024-05-28',
    '2024-11-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'Possession Handover', 7, '2024-11-24', '2025-05-23', 
    '2024-11-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'Rehabilitation', 8, '2025-05-23', '2025-11-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (136, 'Completed', 9, '2025-11-19', '2026-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (136, CURRENT_DATE, 299, 98,
    0.7379, 0.5749, 171,
    0, false, 0,
    false, 0.6063, 69,
    6, true, false,
    0.5897, 75, 3,
    0.8408, 0.5092);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (136, (SELECT id FROM project_data_snapshots WHERE project_id = 136 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4113, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (137, 'Rural Road 137 (Medak, Telangana)', 'Rural Road', 'Telangana', 'Medak',
    17.079217, 80.842729, 64.54, 3688,
    '2020-04-11', '2021-06-21', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'SIA Initiated', 1, '2020-04-11', '2020-10-08', 
    '2020-04-11',
    '2020-10-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'SIA Approved', 2, '2020-10-08', '2021-04-06', 
    '2020-10-08',
    '2021-04-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'Notification u/s 11', 3, '2021-04-06', '2021-10-03', 
    '2021-04-06',
    '2021-10-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'Objection Hearing', 4, '2021-10-03', '2022-04-01', 
    '2021-10-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'Award Declaration', 5, '2022-04-01', '2022-09-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'Compensation Disbursement', 6, '2022-09-28', '2023-03-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'Possession Handover', 7, '2023-03-27', '2023-09-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'Rehabilitation', 8, '2023-09-23', '2024-03-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (137, 'Completed', 9, '2024-03-21', '2024-09-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (137, CURRENT_DATE, 0, 0,
    0.3754, 0.3642, 44,
    0, false, 0,
    false, 0.9694, 21,
    3, true, false,
    0.1262, 59, 5,
    0, 0.5941);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (137, (SELECT id FROM project_data_snapshots WHERE project_id = 137 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4397, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (138, 'Rail Line 138 (Medchal-Malkajgiri, Telangana)', 'Railway Line', 'Telangana', 'Medchal-Malkajgiri',
    19.156696, 77.301554, 459.0, 111,
    '2023-01-15', '2026-03-19', 'Award Declaration', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'SIA Initiated', 1, '2023-01-15', '2023-07-14', 
    '2023-01-15',
    '2023-07-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'SIA Approved', 2, '2023-07-14', '2024-01-10', 
    '2023-07-14',
    '2024-01-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'Notification u/s 11', 3, '2024-01-10', '2024-07-08', 
    '2024-01-10',
    '2024-07-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'Objection Hearing', 4, '2024-07-08', '2025-01-04', 
    '2024-07-08',
    '2025-01-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'Award Declaration', 5, '2025-01-04', '2025-07-03', 
    '2025-01-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'Compensation Disbursement', 6, '2025-07-03', '2025-12-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'Possession Handover', 7, '2025-12-30', '2026-06-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'Rehabilitation', 8, '2026-06-28', '2026-12-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (138, 'Completed', 9, '2026-12-25', '2027-06-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (138, CURRENT_DATE, 599, 240,
    0.4795, 0.3825, 159,
    0, false, 0,
    false, 0.7525, 100,
    6, true, true,
    0.1496, 77, 37,
    0, 0.3913);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (138, (SELECT id FROM project_data_snapshots WHERE project_id = 138 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5232, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (139, 'Port Connectivity 139 (Thane, Maharashtra)', 'Port Connectivity', 'Maharashtra', 'Thane',
    21.220883, 79.523149, 141.33, 1188,
    '2023-01-23', '2025-07-16', 'SIA Approved', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'SIA Initiated', 1, '2023-01-23', '2023-07-22', 
    '2023-01-23',
    '2023-07-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'SIA Approved', 2, '2023-07-22', '2024-01-18', 
    '2023-07-22',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'Notification u/s 11', 3, '2024-01-18', '2024-07-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'Objection Hearing', 4, '2024-07-16', '2025-01-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'Award Declaration', 5, '2025-01-12', '2025-07-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'Compensation Disbursement', 6, '2025-07-11', '2026-01-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'Possession Handover', 7, '2026-01-07', '2026-07-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'Rehabilitation', 8, '2026-07-06', '2027-01-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (139, 'Completed', 9, '2027-01-02', '2027-07-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (139, CURRENT_DATE, 422, 84,
    0.156, 0.1359, 155,
    0, false, 0,
    false, 0.8085, 51,
    0, true, true,
    0.879, 35, 3,
    0, 0.4729);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (139, (SELECT id FROM project_data_snapshots WHERE project_id = 139 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3602, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (140, 'National Highway 140 (Erode, Tamil Nadu)', 'National Highway', 'Tamil Nadu', 'Erode',
    12.635656, 79.862057, 388.15, 2638,
    '2020-07-06', '2025-05-08', 'Compensation Disbursement', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'SIA Initiated', 1, '2020-07-06', '2021-01-02', 
    '2020-07-06',
    '2021-01-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'SIA Approved', 2, '2021-01-02', '2021-07-01', 
    '2021-01-02',
    '2021-07-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'Notification u/s 11', 3, '2021-07-01', '2021-12-28', 
    '2021-07-01',
    '2021-12-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'Objection Hearing', 4, '2021-12-28', '2022-06-26', 
    '2021-12-28',
    '2022-06-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'Award Declaration', 5, '2022-06-26', '2022-12-23', 
    '2022-06-26',
    '2022-12-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'Compensation Disbursement', 6, '2022-12-23', '2023-06-21', 
    '2022-12-23',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'Possession Handover', 7, '2023-06-21', '2023-12-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'Rehabilitation', 8, '2023-12-18', '2024-06-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (140, 'Completed', 9, '2024-06-15', '2024-12-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (140, CURRENT_DATE, 130, 0,
    0.7195, 0.5529, 106,
    0, false, 0,
    false, 0.763, 11,
    3, true, true,
    0.9134, 57, 47,
    0, 0.3422);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (140, (SELECT id FROM project_data_snapshots WHERE project_id = 140 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5433, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (141, 'Urban Infra 141 (Jaipur, Rajasthan)', 'Urban Infrastructure', 'Rajasthan', 'Jaipur',
    26.547567, 70.720848, 128.5, 3749,
    '2021-11-24', '2025-11-01', 'Notification u/s 11', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'SIA Initiated', 1, '2021-11-24', '2022-05-23', 
    '2021-11-24',
    '2022-05-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'SIA Approved', 2, '2022-05-23', '2022-11-19', 
    '2022-05-23',
    '2022-11-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'Notification u/s 11', 3, '2022-11-19', '2023-05-18', 
    '2022-11-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'Objection Hearing', 4, '2023-05-18', '2023-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'Award Declaration', 5, '2023-11-14', '2024-05-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'Compensation Disbursement', 6, '2024-05-12', '2024-11-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'Possession Handover', 7, '2024-11-08', '2025-05-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'Rehabilitation', 8, '2025-05-07', '2025-11-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (141, 'Completed', 9, '2025-11-03', '2026-05-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (141, CURRENT_DATE, 612, 420,
    0.1558, 0.1181, 92,
    0, false, 0,
    false, 0.8228, 35,
    5, true, false,
    0.5051, 86, 59,
    0, 0.1619);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (141, (SELECT id FROM project_data_snapshots WHERE project_id = 141 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2933, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (142, 'Industrial Corridor 142 (Bengaluru Urban, Karnataka)', 'Industrial Corridor', 'Karnataka', 'Bengaluru Urban',
    15.361821, 76.13562, 146.11, 3176,
    '2022-03-13', '2026-04-15', 'Rehabilitation', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'SIA Initiated', 1, '2022-03-13', '2022-09-09', 
    '2022-03-13',
    '2022-09-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'SIA Approved', 2, '2022-09-09', '2023-03-08', 
    '2022-09-09',
    '2023-03-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'Notification u/s 11', 3, '2023-03-08', '2023-09-04', 
    '2023-03-08',
    '2023-09-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'Objection Hearing', 4, '2023-09-04', '2024-03-02', 
    '2023-09-04',
    '2024-03-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'Award Declaration', 5, '2024-03-02', '2024-08-29', 
    '2024-03-02',
    '2024-08-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'Compensation Disbursement', 6, '2024-08-29', '2025-02-25', 
    '2024-08-29',
    '2025-02-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'Possession Handover', 7, '2025-02-25', '2025-08-24', 
    '2025-02-25',
    '2025-08-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'Rehabilitation', 8, '2025-08-24', '2026-02-20', 
    '2025-08-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (142, 'Completed', 9, '2026-02-20', '2026-08-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (142, CURRENT_DATE, 388, 196,
    0.8438, 0.8028, 41,
    0, false, 0,
    false, 0.9123, 99,
    3, true, false,
    0.6474, 31, 17,
    0.6516, 0.3566);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (142, (SELECT id FROM project_data_snapshots WHERE project_id = 142 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2838, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (143, 'Rail Line 143 (Mandya, Karnataka)', 'Railway Line', 'Karnataka', 'Mandya',
    12.783195, 76.737547, 129.74, 3833,
    '2021-01-21', '2023-10-08', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'SIA Initiated', 1, '2021-01-21', '2021-07-20', 
    '2021-01-21',
    '2021-07-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'SIA Approved', 2, '2021-07-20', '2022-01-16', 
    '2021-07-20',
    '2022-01-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'Notification u/s 11', 3, '2022-01-16', '2022-07-15', 
    '2022-01-16',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'Objection Hearing', 4, '2022-07-15', '2023-01-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'Award Declaration', 5, '2023-01-11', '2023-07-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'Compensation Disbursement', 6, '2023-07-10', '2024-01-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'Possession Handover', 7, '2024-01-06', '2024-07-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'Rehabilitation', 8, '2024-07-04', '2024-12-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (143, 'Completed', 9, '2024-12-31', '2025-06-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (143, CURRENT_DATE, 688, 431,
    0.2051, 0.1986, 173,
    0, false, 0,
    false, 0.7124, 79,
    6, true, true,
    0.0073, 89, 53,
    0, 0.5197);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (143, (SELECT id FROM project_data_snapshots WHERE project_id = 143 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4403, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (144, 'SH 144 (Erode, Tamil Nadu)', 'State Highway', 'Tamil Nadu', 'Erode',
    9.520658, 77.463117, 79.22, 1978,
    '2023-06-27', '2026-01-14', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'SIA Initiated', 1, '2023-06-27', '2023-12-24', 
    '2023-06-27',
    '2023-12-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'SIA Approved', 2, '2023-12-24', '2024-06-21', 
    '2023-12-24',
    '2024-06-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'Notification u/s 11', 3, '2024-06-21', '2024-12-18', 
    '2024-06-21',
    '2024-12-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'Objection Hearing', 4, '2024-12-18', '2025-06-16', 
    '2024-12-18',
    '2025-06-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'Award Declaration', 5, '2025-06-16', '2025-12-13', 
    '2025-06-16',
    '2025-12-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'Compensation Disbursement', 6, '2025-12-13', '2026-06-11', 
    '2025-12-13',
    '2026-06-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'Possession Handover', 7, '2026-06-11', '2026-12-08', 
    '2026-06-11',
    '2026-12-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'Rehabilitation', 8, '2026-12-08', '2027-06-06', 
    '2026-12-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (144, 'Completed', 9, '2027-06-06', '2027-12-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (144, CURRENT_DATE, 297, 103,
    0.9062, 0.8932, 153,
    0, false, 0,
    false, 0.6425, 40,
    10, true, true,
    0.0255, 68, 18,
    0.2594, 0.3093);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (144, (SELECT id FROM project_data_snapshots WHERE project_id = 144 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2509, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (145, 'NH 145 (Siddipet, Telangana)', 'National Highway', 'Telangana', 'Siddipet',
    16.389453, 79.405858, 150.42, 3866,
    '2021-09-09', '2025-05-10', 'Objection Hearing', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'SIA Initiated', 1, '2021-09-09', '2022-03-08', 
    '2021-09-09',
    '2022-03-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'SIA Approved', 2, '2022-03-08', '2022-09-04', 
    '2022-03-08',
    '2022-09-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'Notification u/s 11', 3, '2022-09-04', '2023-03-03', 
    '2022-09-04',
    '2023-03-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'Objection Hearing', 4, '2023-03-03', '2023-08-30', 
    '2023-03-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'Award Declaration', 5, '2023-08-30', '2024-02-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'Compensation Disbursement', 6, '2024-02-26', '2024-08-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'Possession Handover', 7, '2024-08-24', '2025-02-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'Rehabilitation', 8, '2025-02-20', '2025-08-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (145, 'Completed', 9, '2025-08-19', '2026-02-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (145, CURRENT_DATE, 717, 505,
    0.3467, 0.2739, 66,
    0, false, 0,
    false, 0.8351, 71,
    2, true, false,
    0.8996, 88, 5,
    0, 0.2111);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (145, (SELECT id FROM project_data_snapshots WHERE project_id = 145 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.568, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (146, 'Expressway 146 (Baghpat, Uttar Pradesh)', 'Expressway', 'Uttar Pradesh', 'Baghpat',
    27.80621, 80.478205, 238.75, 1603,
    '2020-11-05', '2022-07-04', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'SIA Initiated', 1, '2020-11-05', '2021-05-04', 
    '2020-11-05',
    '2021-05-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'SIA Approved', 2, '2021-05-04', '2021-10-31', 
    '2021-05-04',
    '2021-10-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'Notification u/s 11', 3, '2021-10-31', '2022-04-29', 
    '2021-10-31',
    '2022-04-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'Objection Hearing', 4, '2022-04-29', '2022-10-26', 
    '2022-04-29',
    '2022-10-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'Award Declaration', 5, '2022-10-26', '2023-04-24', 
    '2022-10-26',
    '2023-04-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'Compensation Disbursement', 6, '2023-04-24', '2023-10-21', 
    '2023-04-24',
    '2023-10-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'Possession Handover', 7, '2023-10-21', '2024-04-18', 
    '2023-10-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'Rehabilitation', 8, '2024-04-18', '2024-10-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (146, 'Completed', 9, '2024-10-15', '2025-04-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (146, CURRENT_DATE, 511, 203,
    0.6607, 0.5883, 30,
    0, false, 0,
    false, 0.9205, 48,
    8, true, true,
    0.0541, 24, 8,
    0.9923, 0.2713);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (146, (SELECT id FROM project_data_snapshots WHERE project_id = 146 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4115, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (147, 'Industrial Corridor 147 (Vizianagaram, Andhra Pradesh)', 'Industrial Corridor', 'Andhra Pradesh', 'Vizianagaram',
    16.917229, 77.914594, 290.26, 1307,
    '2022-02-26', '2026-09-17', 'Notification u/s 11', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'SIA Initiated', 1, '2022-02-26', '2022-08-25', 
    '2022-02-26',
    '2022-08-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'SIA Approved', 2, '2022-08-25', '2023-02-21', 
    '2022-08-25',
    '2023-02-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'Notification u/s 11', 3, '2023-02-21', '2023-08-20', 
    '2023-02-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'Objection Hearing', 4, '2023-08-20', '2024-02-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'Award Declaration', 5, '2024-02-16', '2024-08-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'Compensation Disbursement', 6, '2024-08-14', '2025-02-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'Possession Handover', 7, '2025-02-10', '2025-08-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'Rehabilitation', 8, '2025-08-09', '2026-02-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (147, 'Completed', 9, '2026-02-05', '2026-08-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (147, CURRENT_DATE, 89, 0,
    0.1509, 0.118, 22,
    0, false, 0,
    false, 0.4776, 55,
    10, true, true,
    0.429, 66, 24,
    0, 0.1023);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (147, (SELECT id FROM project_data_snapshots WHERE project_id = 147 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3463, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (148, 'Ind Corridor 148 (Baghpat, Uttar Pradesh)', 'Industrial Corridor', 'Uttar Pradesh', 'Baghpat',
    27.45172, 77.134371, 68.82, 3152,
    '2022-12-01', '2023-12-09', 'SIA Initiated', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'SIA Initiated', 1, '2022-12-01', '2023-05-30', 
    '2022-12-01',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'SIA Approved', 2, '2023-05-30', '2023-11-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'Notification u/s 11', 3, '2023-11-26', '2024-05-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'Objection Hearing', 4, '2024-05-24', '2024-11-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'Award Declaration', 5, '2024-11-20', '2025-05-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'Compensation Disbursement', 6, '2025-05-19', '2025-11-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'Possession Handover', 7, '2025-11-15', '2026-05-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'Rehabilitation', 8, '2026-05-14', '2026-11-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (148, 'Completed', 9, '2026-11-10', '2027-05-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (148, CURRENT_DATE, 671, 363,
    0.0467, 0.0359, 150,
    0, false, 0,
    false, 0.5837, 8,
    0, false, true,
    0.2908, 71, 38,
    0, 0.3621);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (148, (SELECT id FROM project_data_snapshots WHERE project_id = 148 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2771, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (149, 'Railway 149 (Siddipet, Telangana)', 'Railway Line', 'Telangana', 'Siddipet',
    16.253704, 81.26638, 368.37, 4840,
    '2020-10-20', '2024-01-24', 'Compensation Disbursement', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'SIA Initiated', 1, '2020-10-20', '2021-04-18', 
    '2020-10-20',
    '2021-04-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'SIA Approved', 2, '2021-04-18', '2021-10-15', 
    '2021-04-18',
    '2021-10-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'Notification u/s 11', 3, '2021-10-15', '2022-04-13', 
    '2021-10-15',
    '2022-04-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'Objection Hearing', 4, '2022-04-13', '2022-10-10', 
    '2022-04-13',
    '2022-10-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'Award Declaration', 5, '2022-10-10', '2023-04-08', 
    '2022-10-10',
    '2023-04-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'Compensation Disbursement', 6, '2023-04-08', '2023-10-05', 
    '2023-04-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'Possession Handover', 7, '2023-10-05', '2024-04-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'Rehabilitation', 8, '2024-04-02', '2024-09-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (149, 'Completed', 9, '2024-09-29', '2025-03-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (149, CURRENT_DATE, 0, 0,
    0.5288, 0.4058, 129,
    0, false, 0,
    false, 0.5014, 46,
    10, true, false,
    0.3752, 86, 16,
    0, 0.4856);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (149, (SELECT id FROM project_data_snapshots WHERE project_id = 149 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5578, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (150, 'NH 150 (Tumakuru, Karnataka)', 'National Highway', 'Karnataka', 'Tumakuru',
    12.405264, 75.999414, 154.05, 837,
    '2021-03-31', '2022-12-09', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'SIA Initiated', 1, '2021-03-31', '2021-09-27', 
    '2021-03-31',
    '2021-09-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'SIA Approved', 2, '2021-09-27', '2022-03-26', 
    '2021-09-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'Notification u/s 11', 3, '2022-03-26', '2022-09-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'Objection Hearing', 4, '2022-09-22', '2023-03-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'Award Declaration', 5, '2023-03-21', '2023-09-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'Compensation Disbursement', 6, '2023-09-17', '2024-03-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'Possession Handover', 7, '2024-03-15', '2024-09-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'Rehabilitation', 8, '2024-09-11', '2025-03-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (150, 'Completed', 9, '2025-03-10', '2025-09-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (150, CURRENT_DATE, 590, 241,
    0.0755, 0.0688, 133,
    0, false, 0,
    false, 0.562, 77,
    2, true, true,
    0.8986, 70, 46,
    0, 0.4088);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (150, (SELECT id FROM project_data_snapshots WHERE project_id = 150 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1145, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (151, 'SH 151 (Coimbatore, Tamil Nadu)', 'State Highway', 'Tamil Nadu', 'Coimbatore',
    12.278774, 79.741745, 345.66, 3947,
    '2023-12-23', '2026-02-08', 'Rehabilitation', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'SIA Initiated', 1, '2023-12-23', '2024-06-20', 
    '2023-12-23',
    '2024-06-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'SIA Approved', 2, '2024-06-20', '2024-12-17', 
    '2024-06-20',
    '2024-12-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'Notification u/s 11', 3, '2024-12-17', '2025-06-15', 
    '2024-12-17',
    '2025-06-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'Objection Hearing', 4, '2025-06-15', '2025-12-12', 
    '2025-06-15',
    '2025-12-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'Award Declaration', 5, '2025-12-12', '2026-06-10', 
    '2025-12-12',
    '2026-06-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'Compensation Disbursement', 6, '2026-06-10', '2026-12-07', 
    '2026-06-10',
    '2026-12-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'Possession Handover', 7, '2026-12-07', '2027-06-05', 
    '2026-12-07',
    '2027-06-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'Rehabilitation', 8, '2027-06-05', '2027-12-02', 
    '2027-06-05',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (151, 'Completed', 9, '2027-12-02', '2028-05-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (151, CURRENT_DATE, 396, 132,
    0.9157, 0.7221, 60,
    1, true, 1,
    false, 0.803, 116,
    1, true, false,
    0.669, 24, 60,
    0.0901, 0.3559);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (151, (SELECT id FROM project_data_snapshots WHERE project_id = 151 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3327, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (152, 'Metro 152 (Raigad, Maharashtra)', 'Metro Rail', 'Maharashtra', 'Raigad',
    15.825521, 79.005427, 52.02, 385,
    '2022-08-06', '2023-10-25', 'Rehabilitation', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'SIA Initiated', 1, '2022-08-06', '2023-02-02', 
    '2022-08-06',
    '2023-02-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'SIA Approved', 2, '2023-02-02', '2023-08-01', 
    '2023-02-02',
    '2023-08-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'Notification u/s 11', 3, '2023-08-01', '2024-01-28', 
    '2023-08-01',
    '2024-01-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'Objection Hearing', 4, '2024-01-28', '2024-07-26', 
    '2024-01-28',
    '2024-07-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'Award Declaration', 5, '2024-07-26', '2025-01-22', 
    '2024-07-26',
    '2025-01-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'Compensation Disbursement', 6, '2025-01-22', '2025-07-21', 
    '2025-01-22',
    '2025-07-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'Possession Handover', 7, '2025-07-21', '2026-01-17', 
    '2025-07-21',
    '2026-01-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'Rehabilitation', 8, '2026-01-17', '2026-07-16', 
    '2026-01-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (152, 'Completed', 9, '2026-07-16', '2027-01-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (152, CURRENT_DATE, 327, 145,
    0.847, 0.7649, 35,
    0, false, 0,
    false, 0.798, 21,
    5, true, true,
    0.4377, 84, 17,
    0.8785, 0.1465);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (152, (SELECT id FROM project_data_snapshots WHERE project_id = 152 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2292, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (153, 'SH 153 (Alwar, Rajasthan)', 'State Highway', 'Rajasthan', 'Alwar',
    24.902832, 72.971439, 70.59, 490,
    '2021-10-01', '2025-06-06', 'Possession Handover', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'SIA Initiated', 1, '2021-10-01', '2022-03-30', 
    '2021-10-01',
    '2022-03-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'SIA Approved', 2, '2022-03-30', '2022-09-26', 
    '2022-03-30',
    '2022-09-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'Notification u/s 11', 3, '2022-09-26', '2023-03-25', 
    '2022-09-26',
    '2023-03-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'Objection Hearing', 4, '2023-03-25', '2023-09-21', 
    '2023-03-25',
    '2023-09-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'Award Declaration', 5, '2023-09-21', '2024-03-19', 
    '2023-09-21',
    '2024-03-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'Compensation Disbursement', 6, '2024-03-19', '2024-09-15', 
    '2024-03-19',
    '2024-09-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'Possession Handover', 7, '2024-09-15', '2025-03-14', 
    '2024-09-15',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'Rehabilitation', 8, '2025-03-14', '2025-09-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (153, 'Completed', 9, '2025-09-10', '2026-03-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (153, CURRENT_DATE, 0, 0,
    0.81, 0.7247, 40,
    0, false, 0,
    false, 0.4622, 116,
    9, true, true,
    0.5689, 61, 11,
    0.6113, 0.4896);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (153, (SELECT id FROM project_data_snapshots WHERE project_id = 153 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5887, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (154, 'Railway 154 (Chikkaballapura, Karnataka)', 'Railway Line', 'Karnataka', 'Chikkaballapura',
    13.439495, 74.206875, 489.06, 2781,
    '2022-01-25', '2024-07-13', 'Rehabilitation', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'SIA Initiated', 1, '2022-01-25', '2022-07-24', 
    '2022-01-25',
    '2022-07-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'SIA Approved', 2, '2022-07-24', '2023-01-20', 
    '2022-07-24',
    '2023-01-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'Notification u/s 11', 3, '2023-01-20', '2023-07-19', 
    '2023-01-20',
    '2023-07-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'Objection Hearing', 4, '2023-07-19', '2024-01-15', 
    '2023-07-19',
    '2024-01-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'Award Declaration', 5, '2024-01-15', '2024-07-13', 
    '2024-01-15',
    '2024-07-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'Compensation Disbursement', 6, '2024-07-13', '2025-01-09', 
    '2024-07-13',
    '2025-01-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'Possession Handover', 7, '2025-01-09', '2025-07-08', 
    '2025-01-09',
    '2025-07-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'Rehabilitation', 8, '2025-07-08', '2026-01-04', 
    '2025-07-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (154, 'Completed', 9, '2026-01-04', '2026-07-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (154, CURRENT_DATE, 0, 0,
    0.906, 0.6376, 132,
    0, false, 0,
    false, 0.7139, 89,
    9, true, true,
    0.6617, 36, 30,
    0.3457, 0.4381);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (154, (SELECT id FROM project_data_snapshots WHERE project_id = 154 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1839, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (155, 'City Infra 155 (Medchal-Malkajgiri, Telangana)', 'Urban Infrastructure', 'Telangana', 'Medchal-Malkajgiri',
    16.127709, 80.819805, 29.92, 1834,
    '2020-06-25', '2024-04-05', 'SIA Initiated', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'SIA Initiated', 1, '2020-06-25', '2020-12-22', 
    '2020-06-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'SIA Approved', 2, '2020-12-22', '2021-06-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'Notification u/s 11', 3, '2021-06-20', '2021-12-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'Objection Hearing', 4, '2021-12-17', '2022-06-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'Award Declaration', 5, '2022-06-15', '2022-12-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'Compensation Disbursement', 6, '2022-12-12', '2023-06-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'Possession Handover', 7, '2023-06-10', '2023-12-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'Rehabilitation', 8, '2023-12-07', '2024-06-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (155, 'Completed', 9, '2024-06-04', '2024-12-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (155, CURRENT_DATE, 199, 0,
    0, 0, 164,
    0, false, 0,
    false, 0.6272, 104,
    3, false, true,
    0.4442, 78, 28,
    0, 0.144);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (155, (SELECT id FROM project_data_snapshots WHERE project_id = 155 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.243, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (156, 'Ind Corridor 156 (East Godavari, Andhra Pradesh)', 'Industrial Corridor', 'Andhra Pradesh', 'East Godavari',
    12.624384, 79.727517, 445.6, 4616,
    '2020-11-24', '2022-02-05', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'SIA Initiated', 1, '2020-11-24', '2021-05-23', 
    '2020-11-24',
    '2021-05-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'SIA Approved', 2, '2021-05-23', '2021-11-19', 
    '2021-05-23',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'Notification u/s 11', 3, '2021-11-19', '2022-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'Objection Hearing', 4, '2022-05-18', '2022-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'Award Declaration', 5, '2022-11-14', '2023-05-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'Compensation Disbursement', 6, '2023-05-13', '2023-11-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'Possession Handover', 7, '2023-11-09', '2024-05-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'Rehabilitation', 8, '2024-05-07', '2024-11-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (156, 'Completed', 9, '2024-11-03', '2025-05-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (156, CURRENT_DATE, 0, 0,
    0.1364, 0.0955, 52,
    42, true, 4,
    false, 0.9702, 46,
    0, true, false,
    0.8443, 47, 35,
    0, 0.4837);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (156, (SELECT id FROM project_data_snapshots WHERE project_id = 156 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3236, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (157, 'Industrial Corridor 157 (Krishna, Andhra Pradesh)', 'Industrial Corridor', 'Andhra Pradesh', 'Krishna',
    17.112372, 76.517576, 27.66, 1354,
    '2021-05-08', '2024-05-04', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'SIA Initiated', 1, '2021-05-08', '2021-11-04', 
    '2021-05-08',
    '2021-11-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'SIA Approved', 2, '2021-11-04', '2022-05-03', 
    '2021-11-04',
    '2022-05-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'Notification u/s 11', 3, '2022-05-03', '2022-10-30', 
    '2022-05-03',
    '2022-10-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'Objection Hearing', 4, '2022-10-30', '2023-04-28', 
    '2022-10-30',
    '2023-04-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'Award Declaration', 5, '2023-04-28', '2023-10-25', 
    '2023-04-28',
    '2023-10-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'Compensation Disbursement', 6, '2023-10-25', '2024-04-22', 
    '2023-10-25',
    '2024-04-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'Possession Handover', 7, '2024-04-22', '2024-10-19', 
    '2024-04-22',
    '2024-10-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'Rehabilitation', 8, '2024-10-19', '2025-04-17', 
    '2024-10-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (157, 'Completed', 9, '2025-04-17', '2025-10-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (157, CURRENT_DATE, 678, 372,
    0.9679, 0.7623, 35,
    0, false, 0,
    false, 0.8931, 95,
    6, true, true,
    0.6109, 29, 7,
    0.9302, 0.2964);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (157, (SELECT id FROM project_data_snapshots WHERE project_id = 157 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1792, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (158, 'Industrial Corridor 158 (Vizianagaram, Andhra Pradesh)', 'Industrial Corridor', 'Andhra Pradesh', 'Vizianagaram',
    16.932683, 81.877134, 482.11, 45,
    '2022-05-08', '2024-01-15', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'SIA Initiated', 1, '2022-05-08', '2022-11-04', 
    '2022-05-08',
    '2022-11-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'SIA Approved', 2, '2022-11-04', '2023-05-03', 
    '2022-11-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'Notification u/s 11', 3, '2023-05-03', '2023-10-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'Objection Hearing', 4, '2023-10-30', '2024-04-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'Award Declaration', 5, '2024-04-27', '2024-10-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'Compensation Disbursement', 6, '2024-10-24', '2025-04-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'Possession Handover', 7, '2025-04-22', '2025-10-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'Rehabilitation', 8, '2025-10-19', '2026-04-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (158, 'Completed', 9, '2026-04-17', '2026-10-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (158, CURRENT_DATE, 0, 0,
    0.1794, 0.1499, 135,
    0, false, 0,
    false, 0.8417, 70,
    6, true, false,
    0.4829, 70, 49,
    0, 0.5606);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (158, (SELECT id FROM project_data_snapshots WHERE project_id = 158 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.114, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (159, 'Port Connectivity 159 (Bhavnagar, Gujarat)', 'Port Connectivity', 'Gujarat', 'Bhavnagar',
    22.958848, 71.940045, 140.43, 2818,
    '2020-12-01', '2023-09-21', 'Notification u/s 11', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'SIA Initiated', 1, '2020-12-01', '2021-05-30', 
    '2020-12-01',
    '2021-05-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'SIA Approved', 2, '2021-05-30', '2021-11-26', 
    '2021-05-30',
    '2021-11-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'Notification u/s 11', 3, '2021-11-26', '2022-05-25', 
    '2021-11-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'Objection Hearing', 4, '2022-05-25', '2022-11-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'Award Declaration', 5, '2022-11-21', '2023-05-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'Compensation Disbursement', 6, '2023-05-20', '2023-11-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'Possession Handover', 7, '2023-11-16', '2024-05-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'Rehabilitation', 8, '2024-05-14', '2024-11-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (159, 'Completed', 9, '2024-11-10', '2025-05-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (159, CURRENT_DATE, 546, 291,
    0.3263, 0.2694, 115,
    0, false, 0,
    false, 0.8829, 17,
    6, true, true,
    0.8864, 70, 19,
    0, 0.5215);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (159, (SELECT id FROM project_data_snapshots WHERE project_id = 159 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2311, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (160, 'City Infra 160 (Sikar, Rajasthan)', 'Urban Infrastructure', 'Rajasthan', 'Sikar',
    28.000692, 75.679502, 356.62, 2895,
    '2020-11-17', '2025-08-25', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'SIA Initiated', 1, '2020-11-17', '2021-05-16', 
    '2020-11-17',
    '2021-05-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'SIA Approved', 2, '2021-05-16', '2021-11-12', 
    '2021-05-16',
    '2021-11-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'Notification u/s 11', 3, '2021-11-12', '2022-05-11', 
    '2021-11-12',
    '2022-05-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'Objection Hearing', 4, '2022-05-11', '2022-11-07', 
    '2022-05-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'Award Declaration', 5, '2022-11-07', '2023-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'Compensation Disbursement', 6, '2023-05-06', '2023-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'Possession Handover', 7, '2023-11-02', '2024-04-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'Rehabilitation', 8, '2024-04-30', '2024-10-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (160, 'Completed', 9, '2024-10-27', '2025-04-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (160, CURRENT_DATE, 165, 0,
    0.4713, 0.4218, 122,
    0, false, 0,
    false, 0.7497, 120,
    10, true, false,
    0.6742, 73, 18,
    0, 0.5387);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (160, (SELECT id FROM project_data_snapshots WHERE project_id = 160 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4129, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (161, 'City Infra 161 (Rangareddy, Telangana)', 'Urban Infrastructure', 'Telangana', 'Rangareddy',
    15.71226, 77.254721, 105.98, 4443,
    '2020-04-13', '2022-10-11', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'SIA Initiated', 1, '2020-04-13', '2020-10-10', 
    '2020-04-13',
    '2020-10-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'SIA Approved', 2, '2020-10-10', '2021-04-08', 
    '2020-10-10',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'Notification u/s 11', 3, '2021-04-08', '2021-10-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'Objection Hearing', 4, '2021-10-05', '2022-04-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'Award Declaration', 5, '2022-04-03', '2022-09-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'Compensation Disbursement', 6, '2022-09-30', '2023-03-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'Possession Handover', 7, '2023-03-29', '2023-09-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'Rehabilitation', 8, '2023-09-25', '2024-03-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (161, 'Completed', 9, '2024-03-23', '2024-09-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (161, CURRENT_DATE, 194, 6,
    0.2217, 0.2006, 91,
    29, true, 1,
    true, 0.7697, 86,
    8, true, false,
    0.7424, 76, 24,
    0, 0.2188);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (161, (SELECT id FROM project_data_snapshots WHERE project_id = 161 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2143, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (162, 'National Highway 162 (Karur, Tamil Nadu)', 'National Highway', 'Tamil Nadu', 'Karur',
    12.334613, 79.083169, 415.84, 3022,
    '2022-07-10', '2026-08-13', 'Possession Handover', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'SIA Initiated', 1, '2022-07-10', '2023-01-06', 
    '2022-07-10',
    '2023-01-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'SIA Approved', 2, '2023-01-06', '2023-07-05', 
    '2023-01-06',
    '2023-07-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'Notification u/s 11', 3, '2023-07-05', '2024-01-01', 
    '2023-07-05',
    '2024-01-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'Objection Hearing', 4, '2024-01-01', '2024-06-29', 
    '2024-01-01',
    '2024-06-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'Award Declaration', 5, '2024-06-29', '2024-12-26', 
    '2024-06-29',
    '2024-12-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'Compensation Disbursement', 6, '2024-12-26', '2025-06-24', 
    '2024-12-26',
    '2025-06-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'Possession Handover', 7, '2025-06-24', '2025-12-21', 
    '2025-06-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'Rehabilitation', 8, '2025-12-21', '2026-06-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (162, 'Completed', 9, '2026-06-19', '2026-12-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (162, CURRENT_DATE, 0, 0,
    0.6608, 0.6099, 150,
    0, false, 0,
    false, 0.728, 77,
    3, true, false,
    0.9643, 42, 28,
    0.1774, 0.4413);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (162, (SELECT id FROM project_data_snapshots WHERE project_id = 162 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.425, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (163, 'Urban Infra 163 (Gandhinagar, Gujarat)', 'Urban Infrastructure', 'Gujarat', 'Gandhinagar',
    21.256005, 69.717557, 24.77, 2652,
    '2020-11-30', '2022-10-25', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'SIA Initiated', 1, '2020-11-30', '2021-05-29', 
    '2020-11-30',
    '2021-05-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'SIA Approved', 2, '2021-05-29', '2021-11-25', 
    '2021-05-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'Notification u/s 11', 3, '2021-11-25', '2022-05-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'Objection Hearing', 4, '2022-05-24', '2022-11-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'Award Declaration', 5, '2022-11-20', '2023-05-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'Compensation Disbursement', 6, '2023-05-19', '2023-11-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'Possession Handover', 7, '2023-11-15', '2024-05-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'Rehabilitation', 8, '2024-05-13', '2024-11-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (163, 'Completed', 9, '2024-11-09', '2025-05-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (163, CURRENT_DATE, 0, 0,
    0.1418, 0.1101, 152,
    0, false, 0,
    false, 0.4305, 119,
    10, true, true,
    0.6619, 67, 50,
    0, 0.3863);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (163, (SELECT id FROM project_data_snapshots WHERE project_id = 163 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1122, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (164, 'Industrial Corridor 164 (Jaipur, Rajasthan)', 'Industrial Corridor', 'Rajasthan', 'Jaipur',
    26.644244, 76.576324, 333.35, 2722,
    '2023-08-14', '2025-07-05', 'Completed', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'SIA Initiated', 1, '2023-08-14', '2024-02-10', 
    '2023-08-14',
    '2024-02-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'SIA Approved', 2, '2024-02-10', '2024-08-08', 
    '2024-02-10',
    '2024-08-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'Notification u/s 11', 3, '2024-08-08', '2025-02-04', 
    '2024-08-08',
    '2025-02-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'Objection Hearing', 4, '2025-02-04', '2025-08-03', 
    '2025-02-04',
    '2025-08-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'Award Declaration', 5, '2025-08-03', '2026-01-30', 
    '2025-08-03',
    '2026-01-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'Compensation Disbursement', 6, '2026-01-30', '2026-07-29', 
    '2026-01-30',
    '2026-07-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'Possession Handover', 7, '2026-07-29', '2027-01-25', 
    '2026-07-29',
    '2027-01-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'Rehabilitation', 8, '2027-01-25', '2027-07-24', 
    '2027-01-25',
    '2027-07-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (164, 'Completed', 9, '2027-07-24', '2028-01-20', 
    '2027-07-24',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (164, CURRENT_DATE, 455, 183,
    1, 0.821, 75,
    0, false, 0,
    false, 0.5311, 96,
    9, true, true,
    0.9966, 88, 0,
    0.1147, 0.273);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (164, (SELECT id FROM project_data_snapshots WHERE project_id = 164 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1871, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (165, 'Port Link 165 (Baghpat, Uttar Pradesh)', 'Port Connectivity', 'Uttar Pradesh', 'Baghpat',
    26.086091, 83.869493, 259.58, 4177,
    '2023-06-09', '2025-01-26', 'Objection Hearing', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'SIA Initiated', 1, '2023-06-09', '2023-12-06', 
    '2023-06-09',
    '2023-12-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'SIA Approved', 2, '2023-12-06', '2024-06-03', 
    '2023-12-06',
    '2024-06-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'Notification u/s 11', 3, '2024-06-03', '2024-11-30', 
    '2024-06-03',
    '2024-11-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'Objection Hearing', 4, '2024-11-30', '2025-05-29', 
    '2024-11-30',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'Award Declaration', 5, '2025-05-29', '2025-11-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'Compensation Disbursement', 6, '2025-11-25', '2026-05-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'Possession Handover', 7, '2026-05-24', '2026-11-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'Rehabilitation', 8, '2026-11-20', '2027-05-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (165, 'Completed', 9, '2027-05-19', '2027-11-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (165, CURRENT_DATE, 425, 131,
    0.3263, 0.2993, 124,
    3, true, 3,
    false, 0.939, 24,
    5, true, true,
    0.9482, 26, 49,
    0, 0.369);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (165, (SELECT id FROM project_data_snapshots WHERE project_id = 165 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5548, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (166, 'SH 166 (Chikkaballapura, Karnataka)', 'State Highway', 'Karnataka', 'Chikkaballapura',
    13.484733, 74.467671, 16.76, 2727,
    '2020-04-13', '2024-04-18', 'Objection Hearing', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'SIA Initiated', 1, '2020-04-13', '2020-10-10', 
    '2020-04-13',
    '2020-10-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'SIA Approved', 2, '2020-10-10', '2021-04-08', 
    '2020-10-10',
    '2021-04-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'Notification u/s 11', 3, '2021-04-08', '2021-10-05', 
    '2021-04-08',
    '2021-10-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'Objection Hearing', 4, '2021-10-05', '2022-04-03', 
    '2021-10-05',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'Award Declaration', 5, '2022-04-03', '2022-09-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'Compensation Disbursement', 6, '2022-09-30', '2023-03-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'Possession Handover', 7, '2023-03-29', '2023-09-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'Rehabilitation', 8, '2023-09-25', '2024-03-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (166, 'Completed', 9, '2024-03-23', '2024-09-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (166, CURRENT_DATE, 475, 286,
    0.4043, 0.397, 22,
    0, false, 0,
    false, 0.4439, 22,
    4, true, true,
    0.575, 34, 58,
    0, 0.2293);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (166, (SELECT id FROM project_data_snapshots WHERE project_id = 166 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6095, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (167, 'SC Mission 167 (Yadadri Bhuvanagiri, Telangana)', 'Smart City', 'Telangana', 'Yadadri Bhuvanagiri',
    18.193195, 79.406755, 464.38, 879,
    '2020-12-13', '2025-07-18', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'SIA Initiated', 1, '2020-12-13', '2021-06-11', 
    '2020-12-13',
    '2021-06-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'SIA Approved', 2, '2021-06-11', '2021-12-08', 
    '2021-06-11',
    '2021-12-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'Notification u/s 11', 3, '2021-12-08', '2022-06-06', 
    '2021-12-08',
    '2022-06-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'Objection Hearing', 4, '2022-06-06', '2022-12-03', 
    '2022-06-06',
    '2022-12-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'Award Declaration', 5, '2022-12-03', '2023-06-01', 
    '2022-12-03',
    '2023-06-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'Compensation Disbursement', 6, '2023-06-01', '2023-11-28', 
    '2023-06-01',
    '2023-11-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'Possession Handover', 7, '2023-11-28', '2024-05-26', 
    '2023-11-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'Rehabilitation', 8, '2024-05-26', '2024-11-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (167, 'Completed', 9, '2024-11-22', '2025-05-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (167, CURRENT_DATE, 663, 409,
    0.6626, 0.6121, 175,
    20, true, 5,
    false, 0.4519, 97,
    7, true, true,
    0.8221, 8, 30,
    0.1563, 0.2099);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (167, (SELECT id FROM project_data_snapshots WHERE project_id = 167 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3051, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (168, 'Expressway 168 (Medak, Telangana)', 'Expressway', 'Telangana', 'Medak',
    19.156676, 80.577577, 66.0, 51,
    '2022-09-03', '2027-04-21', 'Notification u/s 11', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'SIA Initiated', 1, '2022-09-03', '2023-03-02', 
    '2022-09-03',
    '2023-03-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'SIA Approved', 2, '2023-03-02', '2023-08-29', 
    '2023-03-02',
    '2023-08-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'Notification u/s 11', 3, '2023-08-29', '2024-02-25', 
    '2023-08-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'Objection Hearing', 4, '2024-02-25', '2024-08-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'Award Declaration', 5, '2024-08-23', '2025-02-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'Compensation Disbursement', 6, '2025-02-19', '2025-08-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'Possession Handover', 7, '2025-08-18', '2026-02-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'Rehabilitation', 8, '2026-02-14', '2026-08-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (168, 'Completed', 9, '2026-08-13', '2027-02-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (168, CURRENT_DATE, 412, 86,
    0.3415, 0.2402, 152,
    0, false, 0,
    false, 0.6364, 70,
    1, true, true,
    0.7483, 49, 13,
    0, 0.3063);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (168, (SELECT id FROM project_data_snapshots WHERE project_id = 168 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4032, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (169, 'Rail Line 169 (Gandhinagar, Gujarat)', 'Railway Line', 'Gujarat', 'Gandhinagar',
    20.874468, 69.178827, 324.11, 609,
    '2020-11-08', '2025-01-12', 'Objection Hearing', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'SIA Initiated', 1, '2020-11-08', '2021-05-07', 
    '2020-11-08',
    '2021-05-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'SIA Approved', 2, '2021-05-07', '2021-11-03', 
    '2021-05-07',
    '2021-11-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'Notification u/s 11', 3, '2021-11-03', '2022-05-02', 
    '2021-11-03',
    '2022-05-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'Objection Hearing', 4, '2022-05-02', '2022-10-29', 
    '2022-05-02',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'Award Declaration', 5, '2022-10-29', '2023-04-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'Compensation Disbursement', 6, '2023-04-27', '2023-10-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'Possession Handover', 7, '2023-10-24', '2024-04-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'Rehabilitation', 8, '2024-04-21', '2024-10-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (169, 'Completed', 9, '2024-10-18', '2025-04-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (169, CURRENT_DATE, 85, 0,
    0.4453, 0.4362, 171,
    0, false, 0,
    false, 0.4404, 12,
    3, true, false,
    0.4872, 47, 22,
    0, 0.1641);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (169, (SELECT id FROM project_data_snapshots WHERE project_id = 169 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6004, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (170, 'E-way 170 (Meerut, Uttar Pradesh)', 'Expressway', 'Uttar Pradesh', 'Meerut',
    26.929199, 81.622568, 88.48, 2575,
    '2020-07-12', '2023-03-30', 'SIA Approved', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'SIA Initiated', 1, '2020-07-12', '2021-01-08', 
    '2020-07-12',
    '2021-01-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'SIA Approved', 2, '2021-01-08', '2021-07-07', 
    '2021-01-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'Notification u/s 11', 3, '2021-07-07', '2022-01-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'Objection Hearing', 4, '2022-01-03', '2022-07-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'Award Declaration', 5, '2022-07-02', '2022-12-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'Compensation Disbursement', 6, '2022-12-29', '2023-06-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'Possession Handover', 7, '2023-06-27', '2023-12-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'Rehabilitation', 8, '2023-12-24', '2024-06-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (170, 'Completed', 9, '2024-06-21', '2024-12-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (170, CURRENT_DATE, 628, 385,
    0.0555, 0.0483, 56,
    0, false, 0,
    false, 0.8273, 82,
    6, true, true,
    0.3595, 47, 56,
    0, 0.34);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (170, (SELECT id FROM project_data_snapshots WHERE project_id = 170 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1953, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (171, 'Expressway 171 (Srikakulam, Andhra Pradesh)', 'Expressway', 'Andhra Pradesh', 'Srikakulam',
    17.018861, 77.15579, 365.08, 162,
    '2023-09-27', '2026-04-23', 'Rehabilitation', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'SIA Initiated', 1, '2023-09-27', '2024-03-25', 
    '2023-09-27',
    '2024-03-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'SIA Approved', 2, '2024-03-25', '2024-09-21', 
    '2024-03-25',
    '2024-09-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'Notification u/s 11', 3, '2024-09-21', '2025-03-20', 
    '2024-09-21',
    '2025-03-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'Objection Hearing', 4, '2025-03-20', '2025-09-16', 
    '2025-03-20',
    '2025-09-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'Award Declaration', 5, '2025-09-16', '2026-03-15', 
    '2025-09-16',
    '2026-03-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'Compensation Disbursement', 6, '2026-03-15', '2026-09-11', 
    '2026-03-15',
    '2026-09-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'Possession Handover', 7, '2026-09-11', '2027-03-10', 
    '2026-09-11',
    '2027-03-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'Rehabilitation', 8, '2027-03-10', '2027-09-06', 
    '2027-03-10',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (171, 'Completed', 9, '2027-09-06', '2028-03-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (171, CURRENT_DATE, 173, 0,
    0.9533, 0.7235, 161,
    0, false, 0,
    false, 0.4187, 74,
    9, true, true,
    0.59, 9, 35,
    0.2606, 0.547);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (171, (SELECT id FROM project_data_snapshots WHERE project_id = 171 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1826, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (172, 'Railway 172 (Krishna, Andhra Pradesh)', 'Railway Line', 'Andhra Pradesh', 'Krishna',
    17.905014, 82.365815, 333.03, 1368,
    '2022-04-13', '2024-11-28', 'Compensation Disbursement', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'SIA Initiated', 1, '2022-04-13', '2022-10-10', 
    '2022-04-13',
    '2022-10-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'SIA Approved', 2, '2022-10-10', '2023-04-08', 
    '2022-10-10',
    '2023-04-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'Notification u/s 11', 3, '2023-04-08', '2023-10-05', 
    '2023-04-08',
    '2023-10-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'Objection Hearing', 4, '2023-10-05', '2024-04-02', 
    '2023-10-05',
    '2024-04-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'Award Declaration', 5, '2024-04-02', '2024-09-29', 
    '2024-04-02',
    '2024-09-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'Compensation Disbursement', 6, '2024-09-29', '2025-03-28', 
    '2024-09-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'Possession Handover', 7, '2025-03-28', '2025-09-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'Rehabilitation', 8, '2025-09-24', '2026-03-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (172, 'Completed', 9, '2026-03-23', '2026-09-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (172, CURRENT_DATE, 0, 0,
    0.5518, 0.4692, 131,
    9, true, 4,
    false, 0.4955, 72,
    9, true, true,
    0.9677, 66, 60,
    0, 0.2794);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (172, (SELECT id FROM project_data_snapshots WHERE project_id = 172 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.517, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (173, 'Metro Rail 173 (Bulandshahr, Uttar Pradesh)', 'Metro Rail', 'Uttar Pradesh', 'Bulandshahr',
    24.278255, 78.550806, 56.1, 4281,
    '2021-11-21', '2024-11-29', 'SIA Approved', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'SIA Initiated', 1, '2021-11-21', '2022-05-20', 
    '2021-11-21',
    '2022-05-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'SIA Approved', 2, '2022-05-20', '2022-11-16', 
    '2022-05-20',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'Notification u/s 11', 3, '2022-11-16', '2023-05-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'Objection Hearing', 4, '2023-05-15', '2023-11-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'Award Declaration', 5, '2023-11-11', '2024-05-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'Compensation Disbursement', 6, '2024-05-09', '2024-11-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'Possession Handover', 7, '2024-11-05', '2025-05-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'Rehabilitation', 8, '2025-05-04', '2025-10-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (173, 'Completed', 9, '2025-10-31', '2026-04-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (173, CURRENT_DATE, 427, 85,
    0.1189, 0.0995, 70,
    48, true, 3,
    false, 0.7472, 72,
    2, true, true,
    0.3785, 80, 41,
    0, 0.5491);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (173, (SELECT id FROM project_data_snapshots WHERE project_id = 173 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2108, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (174, 'E-way 174 (Nashik, Maharashtra)', 'Expressway', 'Maharashtra', 'Nashik',
    17.793837, 79.441755, 86.97, 641,
    '2023-02-19', '2026-11-12', 'Possession Handover', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'SIA Initiated', 1, '2023-02-19', '2023-08-18', 
    '2023-02-19',
    '2023-08-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'SIA Approved', 2, '2023-08-18', '2024-02-14', 
    '2023-08-18',
    '2024-02-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'Notification u/s 11', 3, '2024-02-14', '2024-08-12', 
    '2024-02-14',
    '2024-08-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'Objection Hearing', 4, '2024-08-12', '2025-02-08', 
    '2024-08-12',
    '2025-02-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'Award Declaration', 5, '2025-02-08', '2025-08-07', 
    '2025-02-08',
    '2025-08-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'Compensation Disbursement', 6, '2025-08-07', '2026-02-03', 
    '2025-08-07',
    '2026-02-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'Possession Handover', 7, '2026-02-03', '2026-08-02', 
    '2026-02-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'Rehabilitation', 8, '2026-08-02', '2027-01-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (174, 'Completed', 9, '2027-01-29', '2027-07-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (174, CURRENT_DATE, 523, 212,
    0.8274, 0.5808, 164,
    0, false, 0,
    false, 0.5685, 19,
    2, true, true,
    0.602, 20, 42,
    0.2303, 0.5056);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (174, (SELECT id FROM project_data_snapshots WHERE project_id = 174 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4549, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (175, 'Rural Road 175 (Pune, Maharashtra)', 'Rural Road', 'Maharashtra', 'Pune',
    19.707185, 75.787194, 32.68, 2125,
    '2023-03-24', '2025-08-04', 'Rehabilitation', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'SIA Initiated', 1, '2023-03-24', '2023-09-20', 
    '2023-03-24',
    '2023-09-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'SIA Approved', 2, '2023-09-20', '2024-03-18', 
    '2023-09-20',
    '2024-03-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'Notification u/s 11', 3, '2024-03-18', '2024-09-14', 
    '2024-03-18',
    '2024-09-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'Objection Hearing', 4, '2024-09-14', '2025-03-13', 
    '2024-09-14',
    '2025-03-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'Award Declaration', 5, '2025-03-13', '2025-09-09', 
    '2025-03-13',
    '2025-09-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'Compensation Disbursement', 6, '2025-09-09', '2026-03-08', 
    '2025-09-09',
    '2026-03-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'Possession Handover', 7, '2026-03-08', '2026-09-04', 
    '2026-03-08',
    '2026-09-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'Rehabilitation', 8, '2026-09-04', '2027-03-03', 
    '2026-09-04',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (175, 'Completed', 9, '2027-03-03', '2027-08-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (175, CURRENT_DATE, 74, 0,
    0.8006, 0.7027, 132,
    26, true, 5,
    false, 0.9815, 81,
    0, true, false,
    0.728, 41, 60,
    0.0857, 0.3246);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (175, (SELECT id FROM project_data_snapshots WHERE project_id = 175 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3272, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (176, 'Rail Line 176 (East Godavari, Andhra Pradesh)', 'Railway Line', 'Andhra Pradesh', 'East Godavari',
    18.062312, 83.063625, 461.56, 4896,
    '2020-10-04', '2022-10-11', 'Objection Hearing', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'SIA Initiated', 1, '2020-10-04', '2021-04-02', 
    '2020-10-04',
    '2021-04-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'SIA Approved', 2, '2021-04-02', '2021-09-29', 
    '2021-04-02',
    '2021-09-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'Notification u/s 11', 3, '2021-09-29', '2022-03-28', 
    '2021-09-29',
    '2022-03-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'Objection Hearing', 4, '2022-03-28', '2022-09-24', 
    '2022-03-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'Award Declaration', 5, '2022-09-24', '2023-03-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'Compensation Disbursement', 6, '2023-03-23', '2023-09-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'Possession Handover', 7, '2023-09-19', '2024-03-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'Rehabilitation', 8, '2024-03-17', '2024-09-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (176, 'Completed', 9, '2024-09-13', '2025-03-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (176, CURRENT_DATE, 0, 0,
    0.3996, 0.341, 151,
    0, false, 0,
    false, 0.4413, 48,
    6, true, true,
    0.0166, 71, 55,
    0, 0.5547);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (176, (SELECT id FROM project_data_snapshots WHERE project_id = 176 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5303, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (177, 'Port Connectivity 177 (Medchal-Malkajgiri, Telangana)', 'Port Connectivity', 'Telangana', 'Medchal-Malkajgiri',
    17.958993, 77.175665, 449.0, 3544,
    '2020-05-21', '2024-05-13', 'SIA Approved', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'SIA Initiated', 1, '2020-05-21', '2020-11-17', 
    '2020-05-21',
    '2020-11-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'SIA Approved', 2, '2020-11-17', '2021-05-16', 
    '2020-11-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'Notification u/s 11', 3, '2021-05-16', '2021-11-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'Objection Hearing', 4, '2021-11-12', '2022-05-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'Award Declaration', 5, '2022-05-11', '2022-11-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'Compensation Disbursement', 6, '2022-11-07', '2023-05-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'Possession Handover', 7, '2023-05-06', '2023-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'Rehabilitation', 8, '2023-11-02', '2024-04-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (177, 'Completed', 9, '2024-04-30', '2024-10-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (177, CURRENT_DATE, 545, 232,
    0.1755, 0.1277, 107,
    0, false, 0,
    false, 0.6222, 5,
    8, true, true,
    0.9384, 66, 50,
    0, 0.4843);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (177, (SELECT id FROM project_data_snapshots WHERE project_id = 177 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2428, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (178, 'Port Connectivity 178 (Dausa, Rajasthan)', 'Port Connectivity', 'Rajasthan', 'Dausa',
    26.339989, 71.592616, 7.71, 68,
    '2021-09-21', '2023-03-11', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'SIA Initiated', 1, '2021-09-21', '2022-03-20', 
    '2021-09-21',
    '2022-03-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'SIA Approved', 2, '2022-03-20', '2022-09-16', 
    '2022-03-20',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'Notification u/s 11', 3, '2022-09-16', '2023-03-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'Objection Hearing', 4, '2023-03-15', '2023-09-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'Award Declaration', 5, '2023-09-11', '2024-03-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'Compensation Disbursement', 6, '2024-03-09', '2024-09-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'Possession Handover', 7, '2024-09-05', '2025-03-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'Rehabilitation', 8, '2025-03-04', '2025-08-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (178, 'Completed', 9, '2025-08-31', '2026-02-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (178, CURRENT_DATE, 0, 0,
    0.0817, 0.0786, 147,
    0, false, 0,
    false, 0.7135, 66,
    0, true, true,
    0.2054, 45, 26,
    0, 0.2811);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (178, (SELECT id FROM project_data_snapshots WHERE project_id = 178 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1402, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (179, 'Port Link 179 (Vadodara, Gujarat)', 'Port Connectivity', 'Gujarat', 'Vadodara',
    21.906027, 70.376687, 93.47, 4590,
    '2021-09-10', '2024-03-27', 'Award Declaration', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'SIA Initiated', 1, '2021-09-10', '2022-03-09', 
    '2021-09-10',
    '2022-03-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'SIA Approved', 2, '2022-03-09', '2022-09-05', 
    '2022-03-09',
    '2022-09-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'Notification u/s 11', 3, '2022-09-05', '2023-03-04', 
    '2022-09-05',
    '2023-03-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'Objection Hearing', 4, '2023-03-04', '2023-08-31', 
    '2023-03-04',
    '2023-08-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'Award Declaration', 5, '2023-08-31', '2024-02-27', 
    '2023-08-31',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'Compensation Disbursement', 6, '2024-02-27', '2024-08-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'Possession Handover', 7, '2024-08-25', '2025-02-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'Rehabilitation', 8, '2025-02-21', '2025-08-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (179, 'Completed', 9, '2025-08-20', '2026-02-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (179, CURRENT_DATE, 726, 404,
    0.4795, 0.3649, 123,
    0, false, 0,
    false, 0.5523, 39,
    9, true, true,
    0.7055, 22, 54,
    0, 0.5319);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (179, (SELECT id FROM project_data_snapshots WHERE project_id = 179 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5065, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (180, 'Metro 180 (Ahmednagar, Maharashtra)', 'Metro Rail', 'Maharashtra', 'Ahmednagar',
    18.804233, 78.788649, 403.16, 1200,
    '2021-11-12', '2025-12-13', 'Rehabilitation', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'SIA Initiated', 1, '2021-11-12', '2022-05-11', 
    '2021-11-12',
    '2022-05-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'SIA Approved', 2, '2022-05-11', '2022-11-07', 
    '2022-05-11',
    '2022-11-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'Notification u/s 11', 3, '2022-11-07', '2023-05-06', 
    '2022-11-07',
    '2023-05-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'Objection Hearing', 4, '2023-05-06', '2023-11-02', 
    '2023-05-06',
    '2023-11-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'Award Declaration', 5, '2023-11-02', '2024-04-30', 
    '2023-11-02',
    '2024-04-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'Compensation Disbursement', 6, '2024-04-30', '2024-10-27', 
    '2024-04-30',
    '2024-10-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'Possession Handover', 7, '2024-10-27', '2025-04-25', 
    '2024-10-27',
    '2025-04-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'Rehabilitation', 8, '2025-04-25', '2025-10-22', 
    '2025-04-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (180, 'Completed', 9, '2025-10-22', '2026-04-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (180, CURRENT_DATE, 658, 358,
    0.9144, 0.834, 153,
    0, false, 0,
    false, 0.6612, 8,
    4, true, true,
    0.08, 9, 46,
    0.3843, 0.5922);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (180, (SELECT id FROM project_data_snapshots WHERE project_id = 180 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1801, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (181, 'Port Connectivity 181 (Karur, Tamil Nadu)', 'Port Connectivity', 'Tamil Nadu', 'Karur',
    10.414346, 76.907683, 309.52, 305,
    '2022-11-30', '2027-08-06', 'SIA Initiated', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'SIA Initiated', 1, '2022-11-30', '2023-05-29', 
    '2022-11-30',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'SIA Approved', 2, '2023-05-29', '2023-11-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'Notification u/s 11', 3, '2023-11-25', '2024-05-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'Objection Hearing', 4, '2024-05-23', '2024-11-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'Award Declaration', 5, '2024-11-19', '2025-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'Compensation Disbursement', 6, '2025-05-18', '2025-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'Possession Handover', 7, '2025-11-14', '2026-05-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'Rehabilitation', 8, '2026-05-13', '2026-11-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (181, 'Completed', 9, '2026-11-09', '2027-05-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (181, CURRENT_DATE, 560, 288,
    0, 0, 61,
    0, false, 0,
    false, 0.793, 20,
    1, false, false,
    0.7797, 50, 42,
    0, 0.2976);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (181, (SELECT id FROM project_data_snapshots WHERE project_id = 181 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2421, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (182, 'NH 182 (Hapur, Uttar Pradesh)', 'National Highway', 'Uttar Pradesh', 'Hapur',
    28.719902, 81.193354, 230.11, 3319,
    '2022-09-10', '2026-12-16', 'SIA Approved', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'SIA Initiated', 1, '2022-09-10', '2023-03-09', 
    '2022-09-10',
    '2023-03-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'SIA Approved', 2, '2023-03-09', '2023-09-05', 
    '2023-03-09',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'Notification u/s 11', 3, '2023-09-05', '2024-03-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'Objection Hearing', 4, '2024-03-03', '2024-08-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'Award Declaration', 5, '2024-08-30', '2025-02-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'Compensation Disbursement', 6, '2025-02-26', '2025-08-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'Possession Handover', 7, '2025-08-25', '2026-02-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'Rehabilitation', 8, '2026-02-21', '2026-08-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (182, 'Completed', 9, '2026-08-20', '2027-02-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (182, CURRENT_DATE, 386, 59,
    0.0945, 0.0893, 1,
    0, false, 0,
    false, 0.5567, 52,
    8, true, true,
    0.0724, 42, 21,
    0, 0.5735);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (182, (SELECT id FROM project_data_snapshots WHERE project_id = 182 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2649, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (183, 'Port Connectivity 183 (Namakkal, Tamil Nadu)', 'Port Connectivity', 'Tamil Nadu', 'Namakkal',
    11.097427, 79.464852, 243.58, 2122,
    '2023-12-07', '2026-11-01', 'Award Declaration', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'SIA Initiated', 1, '2023-12-07', '2024-06-04', 
    '2023-12-07',
    '2024-06-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'SIA Approved', 2, '2024-06-04', '2024-12-01', 
    '2024-06-04',
    '2024-12-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'Notification u/s 11', 3, '2024-12-01', '2025-05-30', 
    '2024-12-01',
    '2025-05-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'Objection Hearing', 4, '2025-05-30', '2025-11-26', 
    '2025-05-30',
    '2025-11-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'Award Declaration', 5, '2025-11-26', '2026-05-25', 
    '2025-11-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'Compensation Disbursement', 6, '2026-05-25', '2026-11-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'Possession Handover', 7, '2026-11-21', '2027-05-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'Rehabilitation', 8, '2027-05-20', '2027-11-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (183, 'Completed', 9, '2027-11-16', '2028-05-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (183, CURRENT_DATE, 0, 0,
    0.5922, 0.4961, 17,
    0, false, 0,
    false, 0.6296, 100,
    3, true, true,
    0.2299, 45, 26,
    0, 0.5777);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (183, (SELECT id FROM project_data_snapshots WHERE project_id = 183 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5398, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (184, 'E-way 184 (Chikkaballapura, Karnataka)', 'Expressway', 'Karnataka', 'Chikkaballapura',
    14.357943, 77.694836, 95.48, 1567,
    '2020-05-23', '2021-10-25', 'Objection Hearing', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'SIA Initiated', 1, '2020-05-23', '2020-11-19', 
    '2020-05-23',
    '2020-11-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'SIA Approved', 2, '2020-11-19', '2021-05-18', 
    '2020-11-19',
    '2021-05-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'Notification u/s 11', 3, '2021-05-18', '2021-11-14', 
    '2021-05-18',
    '2021-11-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'Objection Hearing', 4, '2021-11-14', '2022-05-13', 
    '2021-11-14',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'Award Declaration', 5, '2022-05-13', '2022-11-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'Compensation Disbursement', 6, '2022-11-09', '2023-05-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'Possession Handover', 7, '2023-05-08', '2023-11-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'Rehabilitation', 8, '2023-11-04', '2024-05-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (184, 'Completed', 9, '2024-05-02', '2024-10-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (184, CURRENT_DATE, 597, 290,
    0.4613, 0.3888, 51,
    0, false, 0,
    false, 0.5409, 30,
    4, true, true,
    0.2028, 36, 53,
    0, 0.4093);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (184, (SELECT id FROM project_data_snapshots WHERE project_id = 184 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3779, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (185, 'State Highway 185 (Ahmedabad, Gujarat)', 'State Highway', 'Gujarat', 'Ahmedabad',
    23.439099, 71.519581, 247.95, 4197,
    '2021-08-10', '2022-11-04', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'SIA Initiated', 1, '2021-08-10', '2022-02-06', 
    '2021-08-10',
    '2022-02-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'SIA Approved', 2, '2022-02-06', '2022-08-05', 
    '2022-02-06',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'Notification u/s 11', 3, '2022-08-05', '2023-02-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'Objection Hearing', 4, '2023-02-01', '2023-07-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'Award Declaration', 5, '2023-07-31', '2024-01-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'Compensation Disbursement', 6, '2024-01-27', '2024-07-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'Possession Handover', 7, '2024-07-25', '2025-01-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'Rehabilitation', 8, '2025-01-21', '2025-07-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (185, 'Completed', 9, '2025-07-20', '2026-01-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (185, CURRENT_DATE, 0, 0,
    0.1946, 0.1579, 71,
    0, false, 0,
    false, 0.6387, 96,
    9, true, true,
    0.5257, 59, 30,
    0, 0.5698);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (185, (SELECT id FROM project_data_snapshots WHERE project_id = 185 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2841, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (186, 'Ind Corridor 186 (Tumakuru, Karnataka)', 'Industrial Corridor', 'Karnataka', 'Tumakuru',
    12.421289, 76.331923, 183.99, 2137,
    '2021-05-10', '2024-02-15', 'Possession Handover', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'SIA Initiated', 1, '2021-05-10', '2021-11-06', 
    '2021-05-10',
    '2021-11-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'SIA Approved', 2, '2021-11-06', '2022-05-05', 
    '2021-11-06',
    '2022-05-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'Notification u/s 11', 3, '2022-05-05', '2022-11-01', 
    '2022-05-05',
    '2022-11-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'Objection Hearing', 4, '2022-11-01', '2023-04-30', 
    '2022-11-01',
    '2023-04-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'Award Declaration', 5, '2023-04-30', '2023-10-27', 
    '2023-04-30',
    '2023-10-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'Compensation Disbursement', 6, '2023-10-27', '2024-04-24', 
    '2023-10-27',
    '2024-04-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'Possession Handover', 7, '2024-04-24', '2024-10-21', 
    '2024-04-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'Rehabilitation', 8, '2024-10-21', '2025-04-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (186, 'Completed', 9, '2025-04-19', '2025-10-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (186, CURRENT_DATE, 38, 0,
    0.6524, 0.4979, 140,
    0, false, 0,
    false, 0.5577, 34,
    7, true, false,
    0.3431, 28, 31,
    0.4239, 0.3095);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (186, (SELECT id FROM project_data_snapshots WHERE project_id = 186 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4372, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (187, 'SC Mission 187 (Ajmer, Rajasthan)', 'Smart City', 'Rajasthan', 'Ajmer',
    23.917974, 74.683035, 428.87, 1616,
    '2023-06-12', '2025-09-22', 'Award Declaration', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'SIA Initiated', 1, '2023-06-12', '2023-12-09', 
    '2023-06-12',
    '2023-12-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'SIA Approved', 2, '2023-12-09', '2024-06-06', 
    '2023-12-09',
    '2024-06-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'Notification u/s 11', 3, '2024-06-06', '2024-12-03', 
    '2024-06-06',
    '2024-12-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'Objection Hearing', 4, '2024-12-03', '2025-06-01', 
    '2024-12-03',
    '2025-06-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'Award Declaration', 5, '2025-06-01', '2025-11-28', 
    '2025-06-01',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'Compensation Disbursement', 6, '2025-11-28', '2026-05-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'Possession Handover', 7, '2026-05-27', '2026-11-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'Rehabilitation', 8, '2026-11-23', '2027-05-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (187, 'Completed', 9, '2027-05-22', '2027-11-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (187, CURRENT_DATE, 0, 0,
    0.5628, 0.5157, 37,
    0, false, 0,
    false, 0.88, 94,
    2, true, true,
    0.0097, 58, 31,
    0, 0.1672);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (187, (SELECT id FROM project_data_snapshots WHERE project_id = 187 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.304, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (188, 'Expressway 188 (Bharatpur, Rajasthan)', 'Expressway', 'Rajasthan', 'Bharatpur',
    23.333965, 70.390773, 227.68, 2751,
    '2020-12-29', '2022-11-28', 'Award Declaration', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'SIA Initiated', 1, '2020-12-29', '2021-06-27', 
    '2020-12-29',
    '2021-06-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'SIA Approved', 2, '2021-06-27', '2021-12-24', 
    '2021-06-27',
    '2021-12-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'Notification u/s 11', 3, '2021-12-24', '2022-06-22', 
    '2021-12-24',
    '2022-06-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'Objection Hearing', 4, '2022-06-22', '2022-12-19', 
    '2022-06-22',
    '2022-12-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'Award Declaration', 5, '2022-12-19', '2023-06-17', 
    '2022-12-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'Compensation Disbursement', 6, '2023-06-17', '2023-12-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'Possession Handover', 7, '2023-12-14', '2024-06-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'Rehabilitation', 8, '2024-06-11', '2024-12-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (188, 'Completed', 9, '2024-12-08', '2025-06-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (188, CURRENT_DATE, 91, 0,
    0.4431, 0.344, 92,
    0, false, 0,
    false, 0.6162, 71,
    4, true, true,
    0.4118, 49, 55,
    0, 0.4398);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (188, (SELECT id FROM project_data_snapshots WHERE project_id = 188 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5076, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (189, 'Port Link 189 (Hapur, Uttar Pradesh)', 'Port Connectivity', 'Uttar Pradesh', 'Hapur',
    25.849957, 79.438177, 317.7, 1196,
    '2020-10-04', '2024-08-14', 'Completed', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'SIA Initiated', 1, '2020-10-04', '2021-04-02', 
    '2020-10-04',
    '2021-04-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'SIA Approved', 2, '2021-04-02', '2021-09-29', 
    '2021-04-02',
    '2021-09-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'Notification u/s 11', 3, '2021-09-29', '2022-03-28', 
    '2021-09-29',
    '2022-03-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'Objection Hearing', 4, '2022-03-28', '2022-09-24', 
    '2022-03-28',
    '2022-09-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'Award Declaration', 5, '2022-09-24', '2023-03-23', 
    '2022-09-24',
    '2023-03-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'Compensation Disbursement', 6, '2023-03-23', '2023-09-19', 
    '2023-03-23',
    '2023-09-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'Possession Handover', 7, '2023-09-19', '2024-03-17', 
    '2023-09-19',
    '2024-03-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'Rehabilitation', 8, '2024-03-17', '2024-09-13', 
    '2024-03-17',
    '2024-09-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (189, 'Completed', 9, '2024-09-13', '2025-03-12', 
    '2024-09-13',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (189, CURRENT_DATE, 529, 307,
    1, 0.8341, 163,
    22, true, 4,
    false, 0.7788, 73,
    6, true, false,
    0.0713, 25, 21,
    0.2282, 0.2584);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (189, (SELECT id FROM project_data_snapshots WHERE project_id = 189 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1938, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (190, 'Expressway 190 (Karur, Tamil Nadu)', 'Expressway', 'Tamil Nadu', 'Karur',
    12.295357, 80.224464, 66.89, 1932,
    '2021-10-16', '2026-01-30', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'SIA Initiated', 1, '2021-10-16', '2022-04-14', 
    '2021-10-16',
    '2022-04-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'SIA Approved', 2, '2022-04-14', '2022-10-11', 
    '2022-04-14',
    '2022-10-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'Notification u/s 11', 3, '2022-10-11', '2023-04-09', 
    '2022-10-11',
    '2023-04-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'Objection Hearing', 4, '2023-04-09', '2023-10-06', 
    '2023-04-09',
    '2023-10-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'Award Declaration', 5, '2023-10-06', '2024-04-03', 
    '2023-10-06',
    '2024-04-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'Compensation Disbursement', 6, '2024-04-03', '2024-09-30', 
    '2024-04-03',
    '2024-09-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'Possession Handover', 7, '2024-09-30', '2025-03-29', 
    '2024-09-30',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'Rehabilitation', 8, '2025-03-29', '2025-09-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (190, 'Completed', 9, '2025-09-25', '2026-03-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (190, CURRENT_DATE, 563, 214,
    0.8431, 0.6949, 64,
    0, false, 0,
    false, 0.9643, 89,
    1, true, true,
    0.397, 17, 4,
    0.9368, 0.3366);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (190, (SELECT id FROM project_data_snapshots WHERE project_id = 190 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5663, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (191, 'Smart City 191 (Bengaluru Rural, Karnataka)', 'Smart City', 'Karnataka', 'Bengaluru Rural',
    14.163358, 74.379401, 69.98, 1407,
    '2021-09-07', '2024-11-13', 'Completed', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'SIA Initiated', 1, '2021-09-07', '2022-03-06', 
    '2021-09-07',
    '2022-03-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'SIA Approved', 2, '2022-03-06', '2022-09-02', 
    '2022-03-06',
    '2022-09-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'Notification u/s 11', 3, '2022-09-02', '2023-03-01', 
    '2022-09-02',
    '2023-03-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'Objection Hearing', 4, '2023-03-01', '2023-08-28', 
    '2023-03-01',
    '2023-08-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'Award Declaration', 5, '2023-08-28', '2024-02-24', 
    '2023-08-28',
    '2024-02-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'Compensation Disbursement', 6, '2024-02-24', '2024-08-22', 
    '2024-02-24',
    '2024-08-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'Possession Handover', 7, '2024-08-22', '2025-02-18', 
    '2024-08-22',
    '2025-02-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'Rehabilitation', 8, '2025-02-18', '2025-08-17', 
    '2025-02-18',
    '2025-08-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (191, 'Completed', 9, '2025-08-17', '2026-02-13', 
    '2025-08-17',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (191, CURRENT_DATE, 346, 159,
    0.9459, 0.8714, 8,
    0, false, 0,
    false, 0.7981, 110,
    5, true, false,
    0.4672, 74, 59,
    0.2724, 0.3224);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (191, (SELECT id FROM project_data_snapshots WHERE project_id = 191 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (192, 'Port Link 192 (Rajkot, Gujarat)', 'Port Connectivity', 'Gujarat', 'Rajkot',
    22.879039, 71.469597, 209.04, 1285,
    '2021-02-10', '2024-01-22', 'Rehabilitation', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'SIA Initiated', 1, '2021-02-10', '2021-08-09', 
    '2021-02-10',
    '2021-08-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'SIA Approved', 2, '2021-08-09', '2022-02-05', 
    '2021-08-09',
    '2022-02-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'Notification u/s 11', 3, '2022-02-05', '2022-08-04', 
    '2022-02-05',
    '2022-08-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'Objection Hearing', 4, '2022-08-04', '2023-01-31', 
    '2022-08-04',
    '2023-01-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'Award Declaration', 5, '2023-01-31', '2023-07-30', 
    '2023-01-31',
    '2023-07-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'Compensation Disbursement', 6, '2023-07-30', '2024-01-26', 
    '2023-07-30',
    '2024-01-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'Possession Handover', 7, '2024-01-26', '2024-07-24', 
    '2024-01-26',
    '2024-07-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'Rehabilitation', 8, '2024-07-24', '2025-01-20', 
    '2024-07-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (192, 'Completed', 9, '2025-01-20', '2025-07-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (192, CURRENT_DATE, 523, 266,
    0.8829, 0.8312, 2,
    0, false, 0,
    false, 0.4001, 104,
    2, true, true,
    0.4692, 6, 44,
    0.9221, 0.5735);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (192, (SELECT id FROM project_data_snapshots WHERE project_id = 192 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2805, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (193, 'National Highway 193 (Srikakulam, Andhra Pradesh)', 'National Highway', 'Andhra Pradesh', 'Srikakulam',
    18.077372, 80.885698, 415.07, 1817,
    '2020-12-30', '2023-01-20', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'SIA Initiated', 1, '2020-12-30', '2021-06-28', 
    '2020-12-30',
    '2021-06-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'SIA Approved', 2, '2021-06-28', '2021-12-25', 
    '2021-06-28',
    '2021-12-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'Notification u/s 11', 3, '2021-12-25', '2022-06-23', 
    '2021-12-25',
    '2022-06-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'Objection Hearing', 4, '2022-06-23', '2022-12-20', 
    '2022-06-23',
    '2022-12-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'Award Declaration', 5, '2022-12-20', '2023-06-18', 
    '2022-12-20',
    '2023-06-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'Compensation Disbursement', 6, '2023-06-18', '2023-12-15', 
    '2023-06-18',
    '2023-12-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'Possession Handover', 7, '2023-12-15', '2024-06-12', 
    '2023-12-15',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'Rehabilitation', 8, '2024-06-12', '2024-12-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (193, 'Completed', 9, '2024-12-09', '2025-06-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (193, CURRENT_DATE, 451, 204,
    0.8264, 0.6869, 20,
    0, false, 0,
    false, 0.6533, 30,
    8, true, false,
    0.91, 39, 18,
    0.6485, 0.366);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (193, (SELECT id FROM project_data_snapshots WHERE project_id = 193 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4791, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (194, 'Metro 194 (Salem, Tamil Nadu)', 'Metro Rail', 'Tamil Nadu', 'Salem',
    8.60696, 78.049044, 29.57, 4392,
    '2023-09-09', '2027-03-24', 'SIA Approved', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'SIA Initiated', 1, '2023-09-09', '2024-03-07', 
    '2023-09-09',
    '2024-03-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'SIA Approved', 2, '2024-03-07', '2024-09-03', 
    '2024-03-07',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'Notification u/s 11', 3, '2024-09-03', '2025-03-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'Objection Hearing', 4, '2025-03-02', '2025-08-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'Award Declaration', 5, '2025-08-29', '2026-02-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'Compensation Disbursement', 6, '2026-02-25', '2026-08-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'Possession Handover', 7, '2026-08-24', '2027-02-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'Rehabilitation', 8, '2027-02-20', '2027-08-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (194, 'Completed', 9, '2027-08-19', '2028-02-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (194, CURRENT_DATE, 308, 123,
    0.1651, 0.1399, 47,
    0, false, 0,
    false, 0.9834, 36,
    4, true, true,
    0.4384, 6, 14,
    0, 0.1451);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (194, (SELECT id FROM project_data_snapshots WHERE project_id = 194 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.141, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (195, 'Metro 195 (Mandya, Karnataka)', 'Metro Rail', 'Karnataka', 'Mandya',
    14.798118, 78.490836, 32.74, 3224,
    '2021-10-08', '2025-05-14', 'Compensation Disbursement', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'SIA Initiated', 1, '2021-10-08', '2022-04-06', 
    '2021-10-08',
    '2022-04-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'SIA Approved', 2, '2022-04-06', '2022-10-03', 
    '2022-04-06',
    '2022-10-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'Notification u/s 11', 3, '2022-10-03', '2023-04-01', 
    '2022-10-03',
    '2023-04-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'Objection Hearing', 4, '2023-04-01', '2023-09-28', 
    '2023-04-01',
    '2023-09-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'Award Declaration', 5, '2023-09-28', '2024-03-26', 
    '2023-09-28',
    '2024-03-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'Compensation Disbursement', 6, '2024-03-26', '2024-09-22', 
    '2024-03-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'Possession Handover', 7, '2024-09-22', '2025-03-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'Rehabilitation', 8, '2025-03-21', '2025-09-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (195, 'Completed', 9, '2025-09-17', '2026-03-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (195, CURRENT_DATE, 0, 0,
    0.6644, 0.4714, 18,
    35, true, 4,
    false, 0.509, 114,
    4, true, false,
    0.8283, 20, 49,
    0, 0.4573);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (195, (SELECT id FROM project_data_snapshots WHERE project_id = 195 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5435, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (196, 'Metro 196 (Yadadri Bhuvanagiri, Telangana)', 'Metro Rail', 'Telangana', 'Yadadri Bhuvanagiri',
    18.583984, 79.345126, 316.44, 355,
    '2023-06-11', '2025-08-10', 'SIA Initiated', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'SIA Initiated', 1, '2023-06-11', '2023-12-08', 
    '2023-06-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'SIA Approved', 2, '2023-12-08', '2024-06-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'Notification u/s 11', 3, '2024-06-05', '2024-12-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'Objection Hearing', 4, '2024-12-02', '2025-05-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'Award Declaration', 5, '2025-05-31', '2025-11-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'Compensation Disbursement', 6, '2025-11-27', '2026-05-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'Possession Handover', 7, '2026-05-26', '2026-11-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'Rehabilitation', 8, '2026-11-22', '2027-05-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (196, 'Completed', 9, '2027-05-21', '2027-11-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (196, CURRENT_DATE, 514, 194,
    0, 0, 133,
    0, false, 0,
    false, 0.4733, 61,
    10, false, true,
    0.3604, 11, 55,
    0, 0.4333);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (196, (SELECT id FROM project_data_snapshots WHERE project_id = 196 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1883, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (197, 'Smart City 197 (Palghar, Maharashtra)', 'Smart City', 'Maharashtra', 'Palghar',
    17.29465, 73.457197, 188.84, 743,
    '2022-03-14', '2024-07-23', 'Compensation Disbursement', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'SIA Initiated', 1, '2022-03-14', '2022-09-10', 
    '2022-03-14',
    '2022-09-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'SIA Approved', 2, '2022-09-10', '2023-03-09', 
    '2022-09-10',
    '2023-03-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'Notification u/s 11', 3, '2023-03-09', '2023-09-05', 
    '2023-03-09',
    '2023-09-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'Objection Hearing', 4, '2023-09-05', '2024-03-03', 
    '2023-09-05',
    '2024-03-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'Award Declaration', 5, '2024-03-03', '2024-08-30', 
    '2024-03-03',
    '2024-08-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'Compensation Disbursement', 6, '2024-08-30', '2025-02-26', 
    '2024-08-30',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'Possession Handover', 7, '2025-02-26', '2025-08-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'Rehabilitation', 8, '2025-08-25', '2026-02-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (197, 'Completed', 9, '2026-02-21', '2026-08-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (197, CURRENT_DATE, 39, 0,
    0.7188, 0.6284, 40,
    0, false, 0,
    false, 0.7, 87,
    9, true, true,
    0.9697, 85, 3,
    0, 0.1299);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (197, (SELECT id FROM project_data_snapshots WHERE project_id = 197 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5002, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (198, 'City Infra 198 (Bhavnagar, Gujarat)', 'Urban Infrastructure', 'Gujarat', 'Bhavnagar',
    21.425328, 71.629278, 182.29, 1113,
    '2020-03-14', '2024-10-24', 'SIA Approved', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'SIA Initiated', 1, '2020-03-14', '2020-09-10', 
    '2020-03-14',
    '2020-09-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'SIA Approved', 2, '2020-09-10', '2021-03-09', 
    '2020-09-10',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'Notification u/s 11', 3, '2021-03-09', '2021-09-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'Objection Hearing', 4, '2021-09-05', '2022-03-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'Award Declaration', 5, '2022-03-04', '2022-08-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'Compensation Disbursement', 6, '2022-08-31', '2023-02-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'Possession Handover', 7, '2023-02-27', '2023-08-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'Rehabilitation', 8, '2023-08-26', '2024-02-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (198, 'Completed', 9, '2024-02-22', '2024-08-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (198, CURRENT_DATE, 385, 141,
    0.1861, 0.1548, 10,
    0, false, 0,
    false, 0.6912, 56,
    8, true, true,
    0.697, 29, 36,
    0, 0.1933);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (198, (SELECT id FROM project_data_snapshots WHERE project_id = 198 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2464, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (199, 'Rural Road 199 (Ajmer, Rajasthan)', 'Rural Road', 'Rajasthan', 'Ajmer',
    26.881642, 70.119889, 389.08, 4154,
    '2023-12-29', '2025-11-10', 'Award Declaration', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'SIA Initiated', 1, '2023-12-29', '2024-06-26', 
    '2023-12-29',
    '2024-06-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'SIA Approved', 2, '2024-06-26', '2024-12-23', 
    '2024-06-26',
    '2024-12-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'Notification u/s 11', 3, '2024-12-23', '2025-06-21', 
    '2024-12-23',
    '2025-06-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'Objection Hearing', 4, '2025-06-21', '2025-12-18', 
    '2025-06-21',
    '2025-12-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'Award Declaration', 5, '2025-12-18', '2026-06-16', 
    '2025-12-18',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'Compensation Disbursement', 6, '2026-06-16', '2026-12-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'Possession Handover', 7, '2026-12-13', '2027-06-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'Rehabilitation', 8, '2027-06-11', '2027-12-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (199, 'Completed', 9, '2027-12-08', '2028-06-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (199, CURRENT_DATE, 490, 213,
    0.4591, 0.3577, 47,
    0, false, 0,
    false, 0.9298, 79,
    5, true, false,
    0.2388, 13, 42,
    0, 0.5836);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (199, (SELECT id FROM project_data_snapshots WHERE project_id = 199 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5243, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (200, 'Urban Infra 200 (Medchal-Malkajgiri, Telangana)', 'Urban Infrastructure', 'Telangana', 'Medchal-Malkajgiri',
    16.632516, 78.84412, 437.38, 1665,
    '2023-05-05', '2026-02-22', 'Rehabilitation', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'SIA Initiated', 1, '2023-05-05', '2023-11-01', 
    '2023-05-05',
    '2023-11-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'SIA Approved', 2, '2023-11-01', '2024-04-29', 
    '2023-11-01',
    '2024-04-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'Notification u/s 11', 3, '2024-04-29', '2024-10-26', 
    '2024-04-29',
    '2024-10-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'Objection Hearing', 4, '2024-10-26', '2025-04-24', 
    '2024-10-26',
    '2025-04-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'Award Declaration', 5, '2025-04-24', '2025-10-21', 
    '2025-04-24',
    '2025-10-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'Compensation Disbursement', 6, '2025-10-21', '2026-04-19', 
    '2025-10-21',
    '2026-04-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'Possession Handover', 7, '2026-04-19', '2026-10-16', 
    '2026-04-19',
    '2026-10-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'Rehabilitation', 8, '2026-10-16', '2027-04-14', 
    '2026-10-16',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (200, 'Completed', 9, '2027-04-14', '2027-10-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (200, CURRENT_DATE, 143, 0,
    0.7943, 0.713, 124,
    13, true, 1,
    false, 0.4191, 82,
    6, true, true,
    0.5258, 80, 16,
    0.0491, 0.2104);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (200, (SELECT id FROM project_data_snapshots WHERE project_id = 200 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1962, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (201, 'Metro 201 (Thane, Maharashtra)', 'Metro Rail', 'Maharashtra', 'Thane',
    19.652959, 75.387408, 368.48, 2499,
    '2023-11-15', '2027-03-15', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'SIA Initiated', 1, '2023-11-15', '2024-05-13', 
    '2023-11-15',
    '2024-05-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'SIA Approved', 2, '2024-05-13', '2024-11-09', 
    '2024-05-13',
    '2024-11-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'Notification u/s 11', 3, '2024-11-09', '2025-05-08', 
    '2024-11-09',
    '2025-05-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'Objection Hearing', 4, '2025-05-08', '2025-11-04', 
    '2025-05-08',
    '2025-11-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'Award Declaration', 5, '2025-11-04', '2026-05-03', 
    '2025-11-04',
    '2026-05-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'Compensation Disbursement', 6, '2026-05-03', '2026-10-30', 
    '2026-05-03',
    '2026-10-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'Possession Handover', 7, '2026-10-30', '2027-04-28', 
    '2026-10-30',
    '2027-04-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'Rehabilitation', 8, '2027-04-28', '2027-10-25', 
    '2027-04-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (201, 'Completed', 9, '2027-10-25', '2028-04-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (201, CURRENT_DATE, 407, 208,
    0.9338, 0.67, 55,
    0, false, 0,
    false, 0.9764, 12,
    1, true, false,
    0.5317, 29, 12,
    0.5262, 0.2244);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (201, (SELECT id FROM project_data_snapshots WHERE project_id = 201 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2904, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (202, 'City Infra 202 (Rajkot, Gujarat)', 'Urban Infrastructure', 'Gujarat', 'Rajkot',
    22.594536, 72.384202, 254.82, 1305,
    '2023-09-14', '2028-08-21', 'Possession Handover', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'SIA Initiated', 1, '2023-09-14', '2024-03-12', 
    '2023-09-14',
    '2024-03-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'SIA Approved', 2, '2024-03-12', '2024-09-08', 
    '2024-03-12',
    '2024-09-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'Notification u/s 11', 3, '2024-09-08', '2025-03-07', 
    '2024-09-08',
    '2025-03-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'Objection Hearing', 4, '2025-03-07', '2025-09-03', 
    '2025-03-07',
    '2025-09-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'Award Declaration', 5, '2025-09-03', '2026-03-02', 
    '2025-09-03',
    '2026-03-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'Compensation Disbursement', 6, '2026-03-02', '2026-08-29', 
    '2026-03-02',
    '2026-08-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'Possession Handover', 7, '2026-08-29', '2027-02-25', 
    '2026-08-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'Rehabilitation', 8, '2027-02-25', '2027-08-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (202, 'Completed', 9, '2027-08-24', '2028-02-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (202, CURRENT_DATE, 711, 395,
    0.7354, 0.5378, 153,
    0, false, 0,
    false, 0.6658, 45,
    5, true, true,
    0.9969, 52, 26,
    0.7642, 0.3153);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (202, (SELECT id FROM project_data_snapshots WHERE project_id = 202 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5299, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (203, 'Metro Rail 203 (Dausa, Rajasthan)', 'Metro Rail', 'Rajasthan', 'Dausa',
    26.851671, 76.201205, 299.9, 4250,
    '2023-05-24', '2026-05-30', 'Completed', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'SIA Initiated', 1, '2023-05-24', '2023-11-20', 
    '2023-05-24',
    '2023-11-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'SIA Approved', 2, '2023-11-20', '2024-05-18', 
    '2023-11-20',
    '2024-05-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'Notification u/s 11', 3, '2024-05-18', '2024-11-14', 
    '2024-05-18',
    '2024-11-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'Objection Hearing', 4, '2024-11-14', '2025-05-13', 
    '2024-11-14',
    '2025-05-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'Award Declaration', 5, '2025-05-13', '2025-11-09', 
    '2025-05-13',
    '2025-11-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'Compensation Disbursement', 6, '2025-11-09', '2026-05-08', 
    '2025-11-09',
    '2026-05-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'Possession Handover', 7, '2026-05-08', '2026-11-04', 
    '2026-05-08',
    '2026-11-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'Rehabilitation', 8, '2026-11-04', '2027-05-03', 
    '2026-11-04',
    '2027-05-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (203, 'Completed', 9, '2027-05-03', '2027-10-30', 
    '2027-05-03',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (203, CURRENT_DATE, 493, 279,
    0.9895, 0.8105, 77,
    0, false, 0,
    false, 0.4039, 28,
    3, true, false,
    0.0217, 40, 58,
    0.5537, 0.3782);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (203, (SELECT id FROM project_data_snapshots WHERE project_id = 203 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0125, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (204, 'NH 204 (Ahmedabad, Gujarat)', 'National Highway', 'Gujarat', 'Ahmedabad',
    21.192447, 73.782565, 368.46, 2669,
    '2020-08-30', '2023-01-23', 'Rehabilitation', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'SIA Initiated', 1, '2020-08-30', '2021-02-26', 
    '2020-08-30',
    '2021-02-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'SIA Approved', 2, '2021-02-26', '2021-08-25', 
    '2021-02-26',
    '2021-08-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'Notification u/s 11', 3, '2021-08-25', '2022-02-21', 
    '2021-08-25',
    '2022-02-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'Objection Hearing', 4, '2022-02-21', '2022-08-20', 
    '2022-02-21',
    '2022-08-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'Award Declaration', 5, '2022-08-20', '2023-02-16', 
    '2022-08-20',
    '2023-02-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'Compensation Disbursement', 6, '2023-02-16', '2023-08-15', 
    '2023-02-16',
    '2023-08-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'Possession Handover', 7, '2023-08-15', '2024-02-11', 
    '2023-08-15',
    '2024-02-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'Rehabilitation', 8, '2024-02-11', '2024-08-09', 
    '2024-02-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (204, 'Completed', 9, '2024-08-09', '2025-02-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (204, CURRENT_DATE, 268, 0,
    0.8262, 0.6528, 44,
    0, false, 0,
    false, 0.693, 115,
    9, true, false,
    0.0954, 87, 19,
    0.0374, 0.5042);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (204, (SELECT id FROM project_data_snapshots WHERE project_id = 204 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1968, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (205, 'National Highway 205 (Rangareddy, Telangana)', 'National Highway', 'Telangana', 'Rangareddy',
    17.237218, 81.186107, 31.79, 4305,
    '2021-12-10', '2023-08-13', 'Compensation Disbursement', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'SIA Initiated', 1, '2021-12-10', '2022-06-08', 
    '2021-12-10',
    '2022-06-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'SIA Approved', 2, '2022-06-08', '2022-12-05', 
    '2022-06-08',
    '2022-12-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'Notification u/s 11', 3, '2022-12-05', '2023-06-03', 
    '2022-12-05',
    '2023-06-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'Objection Hearing', 4, '2023-06-03', '2023-11-30', 
    '2023-06-03',
    '2023-11-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'Award Declaration', 5, '2023-11-30', '2024-05-28', 
    '2023-11-30',
    '2024-05-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'Compensation Disbursement', 6, '2024-05-28', '2024-11-24', 
    '2024-05-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'Possession Handover', 7, '2024-11-24', '2025-05-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'Rehabilitation', 8, '2025-05-23', '2025-11-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (205, 'Completed', 9, '2025-11-19', '2026-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (205, CURRENT_DATE, 262, 72,
    0.6745, 0.6441, 81,
    0, false, 0,
    false, 0.724, 19,
    5, true, true,
    0.2208, 11, 43,
    0, 0.4658);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (205, (SELECT id FROM project_data_snapshots WHERE project_id = 205 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.7139, 'high', 'success');
INSERT INTO alerts (project_id, prediction_id, alert_type, risk_category, probability_at_trigger)
VALUES (205, (SELECT id FROM risk_predictions WHERE project_id = 205 ORDER BY id DESC LIMIT 1),
    'High Risk', 'high', 0.7139);
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (206, 'Port Connectivity 206 (Yadadri Bhuvanagiri, Telangana)', 'Port Connectivity', 'Telangana', 'Yadadri Bhuvanagiri',
    16.659132, 78.774451, 202.27, 3569,
    '2020-11-08', '2022-08-05', 'Completed', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'SIA Initiated', 1, '2020-11-08', '2021-05-07', 
    '2020-11-08',
    '2021-05-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'SIA Approved', 2, '2021-05-07', '2021-11-03', 
    '2021-05-07',
    '2021-11-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'Notification u/s 11', 3, '2021-11-03', '2022-05-02', 
    '2021-11-03',
    '2022-05-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'Objection Hearing', 4, '2022-05-02', '2022-10-29', 
    '2022-05-02',
    '2022-10-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'Award Declaration', 5, '2022-10-29', '2023-04-27', 
    '2022-10-29',
    '2023-04-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'Compensation Disbursement', 6, '2023-04-27', '2023-10-24', 
    '2023-04-27',
    '2023-10-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'Possession Handover', 7, '2023-10-24', '2024-04-21', 
    '2023-10-24',
    '2024-04-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'Rehabilitation', 8, '2024-04-21', '2024-10-18', 
    '2024-04-21',
    '2024-10-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (206, 'Completed', 9, '2024-10-18', '2025-04-16', 
    '2024-10-18',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (206, CURRENT_DATE, 374, 16,
    0.9165, 0.7987, 33,
    49, true, 2,
    false, 0.6886, 25,
    7, true, true,
    0.5713, 76, 39,
    0.9971, 0.3621);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (206, (SELECT id FROM project_data_snapshots WHERE project_id = 206 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (207, 'Expressway 207 (Meerut, Uttar Pradesh)', 'Expressway', 'Uttar Pradesh', 'Meerut',
    27.744119, 77.843974, 385.99, 1396,
    '2021-08-08', '2024-12-02', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'SIA Initiated', 1, '2021-08-08', '2022-02-04', 
    '2021-08-08',
    '2022-02-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'SIA Approved', 2, '2022-02-04', '2022-08-03', 
    '2022-02-04',
    '2022-08-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'Notification u/s 11', 3, '2022-08-03', '2023-01-30', 
    '2022-08-03',
    '2023-01-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'Objection Hearing', 4, '2023-01-30', '2023-07-29', 
    '2023-01-30',
    '2023-07-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'Award Declaration', 5, '2023-07-29', '2024-01-25', 
    '2023-07-29',
    '2024-01-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'Compensation Disbursement', 6, '2024-01-25', '2024-07-23', 
    '2024-01-25',
    '2024-07-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'Possession Handover', 7, '2024-07-23', '2025-01-19', 
    '2024-07-23',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'Rehabilitation', 8, '2025-01-19', '2025-07-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (207, 'Completed', 9, '2025-07-18', '2026-01-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (207, CURRENT_DATE, 463, 194,
    0.7231, 0.5475, 157,
    0, false, 0,
    false, 0.893, 102,
    7, true, true,
    0.4405, 34, 12,
    0.6854, 0.178);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (207, (SELECT id FROM project_data_snapshots WHERE project_id = 207 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5054, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (208, 'NH 208 (Thane, Maharashtra)', 'National Highway', 'Maharashtra', 'Thane',
    21.14689, 79.061072, 169.28, 4417,
    '2020-03-26', '2021-04-23', 'Objection Hearing', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'SIA Initiated', 1, '2020-03-26', '2020-09-22', 
    '2020-03-26',
    '2020-09-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'SIA Approved', 2, '2020-09-22', '2021-03-21', 
    '2020-09-22',
    '2021-03-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'Notification u/s 11', 3, '2021-03-21', '2021-09-17', 
    '2021-03-21',
    '2021-09-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'Objection Hearing', 4, '2021-09-17', '2022-03-16', 
    '2021-09-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'Award Declaration', 5, '2022-03-16', '2022-09-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'Compensation Disbursement', 6, '2022-09-12', '2023-03-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'Possession Handover', 7, '2023-03-11', '2023-09-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'Rehabilitation', 8, '2023-09-07', '2024-03-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (208, 'Completed', 9, '2024-03-05', '2024-09-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (208, CURRENT_DATE, 381, 147,
    0.4138, 0.3034, 52,
    0, false, 0,
    false, 0.7279, 96,
    4, true, true,
    0.623, 23, 44,
    0, 0.4494);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (208, (SELECT id FROM project_data_snapshots WHERE project_id = 208 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.628, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (209, 'Port Connectivity 209 (Mandya, Karnataka)', 'Port Connectivity', 'Karnataka', 'Mandya',
    12.210385, 74.903132, 197.38, 2232,
    '2021-07-07', '2026-06-02', 'Completed', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'SIA Initiated', 1, '2021-07-07', '2022-01-03', 
    '2021-07-07',
    '2022-01-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'SIA Approved', 2, '2022-01-03', '2022-07-02', 
    '2022-01-03',
    '2022-07-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'Notification u/s 11', 3, '2022-07-02', '2022-12-29', 
    '2022-07-02',
    '2022-12-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'Objection Hearing', 4, '2022-12-29', '2023-06-27', 
    '2022-12-29',
    '2023-06-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'Award Declaration', 5, '2023-06-27', '2023-12-24', 
    '2023-06-27',
    '2023-12-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'Compensation Disbursement', 6, '2023-12-24', '2024-06-21', 
    '2023-12-24',
    '2024-06-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'Possession Handover', 7, '2024-06-21', '2024-12-18', 
    '2024-06-21',
    '2024-12-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'Rehabilitation', 8, '2024-12-18', '2025-06-16', 
    '2024-12-18',
    '2025-06-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (209, 'Completed', 9, '2025-06-16', '2025-12-13', 
    '2025-06-16',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (209, CURRENT_DATE, 662, 313,
    0.9543, 0.8011, 168,
    0, false, 0,
    false, 0.6161, 13,
    0, true, true,
    0.8834, 54, 14,
    0.9798, 0.3543);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (209, (SELECT id FROM project_data_snapshots WHERE project_id = 209 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (210, 'PMGSY 210 (Raigad, Maharashtra)', 'Rural Road', 'Maharashtra', 'Raigad',
    18.75423, 76.16389, 199.73, 1296,
    '2023-12-09', '2028-12-06', 'Completed', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'SIA Initiated', 1, '2023-12-09', '2024-06-06', 
    '2023-12-09',
    '2024-06-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'SIA Approved', 2, '2024-06-06', '2024-12-03', 
    '2024-06-06',
    '2024-12-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'Notification u/s 11', 3, '2024-12-03', '2025-06-01', 
    '2024-12-03',
    '2025-06-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'Objection Hearing', 4, '2025-06-01', '2025-11-28', 
    '2025-06-01',
    '2025-11-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'Award Declaration', 5, '2025-11-28', '2026-05-27', 
    '2025-11-28',
    '2026-05-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'Compensation Disbursement', 6, '2026-05-27', '2026-11-23', 
    '2026-05-27',
    '2026-11-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'Possession Handover', 7, '2026-11-23', '2027-05-22', 
    '2026-11-23',
    '2027-05-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'Rehabilitation', 8, '2027-05-22', '2027-11-18', 
    '2027-05-22',
    '2027-11-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (210, 'Completed', 9, '2027-11-18', '2028-05-16', 
    '2027-11-18',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (210, CURRENT_DATE, 52, 0,
    0.908, 0.8868, 88,
    0, false, 0,
    false, 0.8106, 45,
    10, true, true,
    0.996, 69, 17,
    0.8119, 0.4129);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (210, (SELECT id FROM project_data_snapshots WHERE project_id = 210 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (211, 'Urban Infra 211 (Rangareddy, Telangana)', 'Urban Infrastructure', 'Telangana', 'Rangareddy',
    19.088701, 79.956193, 211.58, 4703,
    '2021-01-22', '2022-07-20', 'Award Declaration', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'SIA Initiated', 1, '2021-01-22', '2021-07-21', 
    '2021-01-22',
    '2021-07-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'SIA Approved', 2, '2021-07-21', '2022-01-17', 
    '2021-07-21',
    '2022-01-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'Notification u/s 11', 3, '2022-01-17', '2022-07-16', 
    '2022-01-17',
    '2022-07-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'Objection Hearing', 4, '2022-07-16', '2023-01-12', 
    '2022-07-16',
    '2023-01-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'Award Declaration', 5, '2023-01-12', '2023-07-11', 
    '2023-01-12',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'Compensation Disbursement', 6, '2023-07-11', '2024-01-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'Possession Handover', 7, '2024-01-07', '2024-07-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'Rehabilitation', 8, '2024-07-05', '2025-01-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (211, 'Completed', 9, '2025-01-01', '2025-06-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (211, CURRENT_DATE, 421, 202,
    0.5041, 0.4554, 109,
    0, false, 0,
    false, 0.9823, 116,
    9, true, true,
    0.5422, 31, 41,
    0, 0.1693);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (211, (SELECT id FROM project_data_snapshots WHERE project_id = 211 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2955, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (212, 'Expressway 212 (Ghaziabad, Uttar Pradesh)', 'Expressway', 'Uttar Pradesh', 'Ghaziabad',
    29.908514, 82.775375, 96.15, 1202,
    '2023-02-18', '2027-10-23', 'Completed', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'SIA Initiated', 1, '2023-02-18', '2023-08-17', 
    '2023-02-18',
    '2023-08-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'SIA Approved', 2, '2023-08-17', '2024-02-13', 
    '2023-08-17',
    '2024-02-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'Notification u/s 11', 3, '2024-02-13', '2024-08-11', 
    '2024-02-13',
    '2024-08-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'Objection Hearing', 4, '2024-08-11', '2025-02-07', 
    '2024-08-11',
    '2025-02-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'Award Declaration', 5, '2025-02-07', '2025-08-06', 
    '2025-02-07',
    '2025-08-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'Compensation Disbursement', 6, '2025-08-06', '2026-02-02', 
    '2025-08-06',
    '2026-02-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'Possession Handover', 7, '2026-02-02', '2026-08-01', 
    '2026-02-02',
    '2026-08-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'Rehabilitation', 8, '2026-08-01', '2027-01-28', 
    '2026-08-01',
    '2027-01-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (212, 'Completed', 9, '2027-01-28', '2027-07-27', 
    '2027-01-28',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (212, CURRENT_DATE, 608, 421,
    1, 0.7952, 81,
    0, false, 0,
    false, 0.9281, 52,
    6, true, true,
    0.7456, 86, 59,
    0.7383, 0.176);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (212, (SELECT id FROM project_data_snapshots WHERE project_id = 212 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.029, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (213, 'Rail Line 213 (Meerut, Uttar Pradesh)', 'Railway Line', 'Uttar Pradesh', 'Meerut',
    27.97788, 79.00147, 44.34, 3914,
    '2021-10-26', '2025-12-30', 'Notification u/s 11', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'SIA Initiated', 1, '2021-10-26', '2022-04-24', 
    '2021-10-26',
    '2022-04-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'SIA Approved', 2, '2022-04-24', '2022-10-21', 
    '2022-04-24',
    '2022-10-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'Notification u/s 11', 3, '2022-10-21', '2023-04-19', 
    '2022-10-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'Objection Hearing', 4, '2023-04-19', '2023-10-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'Award Declaration', 5, '2023-10-16', '2024-04-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'Compensation Disbursement', 6, '2024-04-13', '2024-10-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'Possession Handover', 7, '2024-10-10', '2025-04-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'Rehabilitation', 8, '2025-04-08', '2025-10-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (213, 'Completed', 9, '2025-10-05', '2026-04-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (213, CURRENT_DATE, 657, 443,
    0.1962, 0.151, 128,
    0, false, 0,
    false, 0.9077, 60,
    10, true, true,
    0.8521, 67, 30,
    0, 0.1688);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (213, (SELECT id FROM project_data_snapshots WHERE project_id = 213 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4287, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (214, 'National Highway 214 (Ghaziabad, Uttar Pradesh)', 'National Highway', 'Uttar Pradesh', 'Ghaziabad',
    30.176287, 78.669157, 434.23, 4023,
    '2021-09-09', '2026-06-14', 'Possession Handover', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'SIA Initiated', 1, '2021-09-09', '2022-03-08', 
    '2021-09-09',
    '2022-03-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'SIA Approved', 2, '2022-03-08', '2022-09-04', 
    '2022-03-08',
    '2022-09-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'Notification u/s 11', 3, '2022-09-04', '2023-03-03', 
    '2022-09-04',
    '2023-03-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'Objection Hearing', 4, '2023-03-03', '2023-08-30', 
    '2023-03-03',
    '2023-08-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'Award Declaration', 5, '2023-08-30', '2024-02-26', 
    '2023-08-30',
    '2024-02-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'Compensation Disbursement', 6, '2024-02-26', '2024-08-24', 
    '2024-02-26',
    '2024-08-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'Possession Handover', 7, '2024-08-24', '2025-02-20', 
    '2024-08-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'Rehabilitation', 8, '2025-02-20', '2025-08-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (214, 'Completed', 9, '2025-08-19', '2026-02-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (214, CURRENT_DATE, 237, 0,
    0.8016, 0.577, 83,
    0, false, 0,
    false, 0.9201, 113,
    3, true, true,
    0.7762, 82, 47,
    0.8243, 0.4601);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (214, (SELECT id FROM project_data_snapshots WHERE project_id = 214 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5776, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (215, 'Port Connectivity 215 (Medak, Telangana)', 'Port Connectivity', 'Telangana', 'Medak',
    18.31645, 77.173304, 261.76, 3250,
    '2023-10-29', '2025-06-08', 'Completed', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'SIA Initiated', 1, '2023-10-29', '2024-04-26', 
    '2023-10-29',
    '2024-04-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'SIA Approved', 2, '2024-04-26', '2024-10-23', 
    '2024-04-26',
    '2024-10-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'Notification u/s 11', 3, '2024-10-23', '2025-04-21', 
    '2024-10-23',
    '2025-04-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'Objection Hearing', 4, '2025-04-21', '2025-10-18', 
    '2025-04-21',
    '2025-10-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'Award Declaration', 5, '2025-10-18', '2026-04-16', 
    '2025-10-18',
    '2026-04-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'Compensation Disbursement', 6, '2026-04-16', '2026-10-13', 
    '2026-04-16',
    '2026-10-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'Possession Handover', 7, '2026-10-13', '2027-04-11', 
    '2026-10-13',
    '2027-04-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'Rehabilitation', 8, '2027-04-11', '2027-10-08', 
    '2027-04-11',
    '2027-10-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (215, 'Completed', 9, '2027-10-08', '2028-04-05', 
    '2027-10-08',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (215, CURRENT_DATE, 492, 302,
    0.9914, 0.955, 142,
    0, false, 0,
    false, 0.6324, 97,
    10, true, false,
    0.1899, 61, 25,
    0.8844, 0.4868);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (215, (SELECT id FROM project_data_snapshots WHERE project_id = 215 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0924, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (216, 'Railway 216 (Salem, Tamil Nadu)', 'Railway Line', 'Tamil Nadu', 'Salem',
    8.300007, 78.326363, 93.99, 4805,
    '2023-12-24', '2025-10-10', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'SIA Initiated', 1, '2023-12-24', '2024-06-21', 
    '2023-12-24',
    '2024-06-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'SIA Approved', 2, '2024-06-21', '2024-12-18', 
    '2024-06-21',
    '2024-12-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'Notification u/s 11', 3, '2024-12-18', '2025-06-16', 
    '2024-12-18',
    '2025-06-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'Objection Hearing', 4, '2025-06-16', '2025-12-13', 
    '2025-06-16',
    '2025-12-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'Award Declaration', 5, '2025-12-13', '2026-06-11', 
    '2025-12-13',
    '2026-06-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'Compensation Disbursement', 6, '2026-06-11', '2026-12-08', 
    '2026-06-11',
    '2026-12-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'Possession Handover', 7, '2026-12-08', '2027-06-06', 
    '2026-12-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'Rehabilitation', 8, '2027-06-06', '2027-12-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (216, 'Completed', 9, '2027-12-03', '2028-05-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (216, CURRENT_DATE, 504, 146,
    0.816, 0.6818, 139,
    0, false, 0,
    false, 0.4812, 52,
    5, true, true,
    0.1789, 80, 57,
    0.7126, 0.201);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (216, (SELECT id FROM project_data_snapshots WHERE project_id = 216 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4839, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (217, 'Expressway 217 (Visakhapatnam, Andhra Pradesh)', 'Expressway', 'Andhra Pradesh', 'Visakhapatnam',
    13.36481, 77.41332, 192.45, 3127,
    '2022-03-22', '2025-09-27', 'Compensation Disbursement', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'SIA Initiated', 1, '2022-03-22', '2022-09-18', 
    '2022-03-22',
    '2022-09-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'SIA Approved', 2, '2022-09-18', '2023-03-17', 
    '2022-09-18',
    '2023-03-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'Notification u/s 11', 3, '2023-03-17', '2023-09-13', 
    '2023-03-17',
    '2023-09-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'Objection Hearing', 4, '2023-09-13', '2024-03-11', 
    '2023-09-13',
    '2024-03-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'Award Declaration', 5, '2024-03-11', '2024-09-07', 
    '2024-03-11',
    '2024-09-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'Compensation Disbursement', 6, '2024-09-07', '2025-03-06', 
    '2024-09-07',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'Possession Handover', 7, '2025-03-06', '2025-09-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'Rehabilitation', 8, '2025-09-02', '2026-03-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (217, 'Completed', 9, '2026-03-01', '2026-08-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (217, CURRENT_DATE, 679, 488,
    0.5976, 0.5122, 43,
    0, false, 0,
    false, 0.9474, 72,
    10, true, false,
    0.1621, 23, 11,
    0, 0.4846);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (217, (SELECT id FROM project_data_snapshots WHERE project_id = 217 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6655, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (218, 'E-way 218 (Mandya, Karnataka)', 'Expressway', 'Karnataka', 'Mandya',
    12.632436, 78.043439, 274.03, 57,
    '2022-11-14', '2025-01-02', 'Award Declaration', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'SIA Initiated', 1, '2022-11-14', '2023-05-13', 
    '2022-11-14',
    '2023-05-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'SIA Approved', 2, '2023-05-13', '2023-11-09', 
    '2023-05-13',
    '2023-11-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'Notification u/s 11', 3, '2023-11-09', '2024-05-07', 
    '2023-11-09',
    '2024-05-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'Objection Hearing', 4, '2024-05-07', '2024-11-03', 
    '2024-05-07',
    '2024-11-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'Award Declaration', 5, '2024-11-03', '2025-05-02', 
    '2024-11-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'Compensation Disbursement', 6, '2025-05-02', '2025-10-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'Possession Handover', 7, '2025-10-29', '2026-04-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'Rehabilitation', 8, '2026-04-27', '2026-10-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (218, 'Completed', 9, '2026-10-24', '2027-04-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (218, CURRENT_DATE, 0, 0,
    0.4007, 0.3725, 155,
    32, true, 2,
    false, 0.5301, 84,
    7, true, true,
    0.4419, 81, 38,
    0, 0.1033);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (218, (SELECT id FROM project_data_snapshots WHERE project_id = 218 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3366, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (219, 'Urban Infra 219 (Namakkal, Tamil Nadu)', 'Urban Infrastructure', 'Tamil Nadu', 'Namakkal',
    8.302852, 77.570589, 29.27, 3425,
    '2020-08-14', '2022-06-07', 'Objection Hearing', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'SIA Initiated', 1, '2020-08-14', '2021-02-10', 
    '2020-08-14',
    '2021-02-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'SIA Approved', 2, '2021-02-10', '2021-08-09', 
    '2021-02-10',
    '2021-08-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'Notification u/s 11', 3, '2021-08-09', '2022-02-05', 
    '2021-08-09',
    '2022-02-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'Objection Hearing', 4, '2022-02-05', '2022-08-04', 
    '2022-02-05',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'Award Declaration', 5, '2022-08-04', '2023-01-31', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'Compensation Disbursement', 6, '2023-01-31', '2023-07-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'Possession Handover', 7, '2023-07-30', '2024-01-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'Rehabilitation', 8, '2024-01-26', '2024-07-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (219, 'Completed', 9, '2024-07-24', '2025-01-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (219, CURRENT_DATE, 63, 0,
    0.4084, 0.3886, 41,
    0, false, 0,
    false, 0.8033, 78,
    10, true, true,
    0.595, 76, 11,
    0, 0.5831);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (219, (SELECT id FROM project_data_snapshots WHERE project_id = 219 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4055, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (220, 'State Highway 220 (Jaipur, Rajasthan)', 'State Highway', 'Rajasthan', 'Jaipur',
    25.652575, 70.109, 265.89, 4307,
    '2021-03-09', '2024-07-31', 'Award Declaration', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'SIA Initiated', 1, '2021-03-09', '2021-09-05', 
    '2021-03-09',
    '2021-09-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'SIA Approved', 2, '2021-09-05', '2022-03-04', 
    '2021-09-05',
    '2022-03-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'Notification u/s 11', 3, '2022-03-04', '2022-08-31', 
    '2022-03-04',
    '2022-08-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'Objection Hearing', 4, '2022-08-31', '2023-02-27', 
    '2022-08-31',
    '2023-02-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'Award Declaration', 5, '2023-02-27', '2023-08-26', 
    '2023-02-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'Compensation Disbursement', 6, '2023-08-26', '2024-02-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'Possession Handover', 7, '2024-02-22', '2024-08-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'Rehabilitation', 8, '2024-08-20', '2025-02-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (220, 'Completed', 9, '2025-02-16', '2025-08-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (220, CURRENT_DATE, 593, 360,
    0.413, 0.3474, 178,
    14, true, 5,
    false, 0.4349, 73,
    10, true, true,
    0.0877, 82, 59,
    0, 0.4941);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (220, (SELECT id FROM project_data_snapshots WHERE project_id = 220 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3606, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (221, 'Port Link 221 (Salem, Tamil Nadu)', 'Port Connectivity', 'Tamil Nadu', 'Salem',
    13.472634, 77.59234, 404.95, 1916,
    '2023-11-15', '2025-08-06', 'Compensation Disbursement', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'SIA Initiated', 1, '2023-11-15', '2024-05-13', 
    '2023-11-15',
    '2024-05-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'SIA Approved', 2, '2024-05-13', '2024-11-09', 
    '2024-05-13',
    '2024-11-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'Notification u/s 11', 3, '2024-11-09', '2025-05-08', 
    '2024-11-09',
    '2025-05-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'Objection Hearing', 4, '2025-05-08', '2025-11-04', 
    '2025-05-08',
    '2025-11-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'Award Declaration', 5, '2025-11-04', '2026-05-03', 
    '2025-11-04',
    '2026-05-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'Compensation Disbursement', 6, '2026-05-03', '2026-10-30', 
    '2026-05-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'Possession Handover', 7, '2026-10-30', '2027-04-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'Rehabilitation', 8, '2027-04-28', '2027-10-25', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (221, 'Completed', 9, '2027-10-25', '2028-04-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (221, CURRENT_DATE, 659, 298,
    0.6375, 0.5457, 74,
    0, false, 0,
    false, 0.9876, 0,
    1, true, true,
    0.6255, 20, 47,
    0, 0.524);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (221, (SELECT id FROM project_data_snapshots WHERE project_id = 221 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6076, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (222, 'National Highway 222 (Yadadri Bhuvanagiri, Telangana)', 'National Highway', 'Telangana', 'Yadadri Bhuvanagiri',
    18.050014, 77.050838, 384.68, 942,
    '2022-04-25', '2024-06-10', 'Compensation Disbursement', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'SIA Initiated', 1, '2022-04-25', '2022-10-22', 
    '2022-04-25',
    '2022-10-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'SIA Approved', 2, '2022-10-22', '2023-04-20', 
    '2022-10-22',
    '2023-04-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'Notification u/s 11', 3, '2023-04-20', '2023-10-17', 
    '2023-04-20',
    '2023-10-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'Objection Hearing', 4, '2023-10-17', '2024-04-14', 
    '2023-10-17',
    '2024-04-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'Award Declaration', 5, '2024-04-14', '2024-10-11', 
    '2024-04-14',
    '2024-10-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'Compensation Disbursement', 6, '2024-10-11', '2025-04-09', 
    '2024-10-11',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'Possession Handover', 7, '2025-04-09', '2025-10-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'Rehabilitation', 8, '2025-10-06', '2026-04-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (222, 'Completed', 9, '2026-04-04', '2026-10-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (222, CURRENT_DATE, 318, 0,
    0.5759, 0.4148, 85,
    0, false, 0,
    false, 0.6048, 92,
    9, true, true,
    0.0291, 27, 12,
    0, 0.2653);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (222, (SELECT id FROM project_data_snapshots WHERE project_id = 222 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6181, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (223, 'Rural Road 223 (Sikar, Rajasthan)', 'Rural Road', 'Rajasthan', 'Sikar',
    26.370469, 75.144804, 418.38, 2462,
    '2022-03-02', '2026-03-05', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'SIA Initiated', 1, '2022-03-02', '2022-08-29', 
    '2022-03-02',
    '2022-08-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'SIA Approved', 2, '2022-08-29', '2023-02-25', 
    '2022-08-29',
    '2023-02-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'Notification u/s 11', 3, '2023-02-25', '2023-08-24', 
    '2023-02-25',
    '2023-08-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'Objection Hearing', 4, '2023-08-24', '2024-02-20', 
    '2023-08-24',
    '2024-02-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'Award Declaration', 5, '2024-02-20', '2024-08-18', 
    '2024-02-20',
    '2024-08-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'Compensation Disbursement', 6, '2024-08-18', '2025-02-14', 
    '2024-08-18',
    '2025-02-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'Possession Handover', 7, '2025-02-14', '2025-08-13', 
    '2025-02-14',
    '2025-08-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'Rehabilitation', 8, '2025-08-13', '2026-02-09', 
    '2025-08-13',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (223, 'Completed', 9, '2026-02-09', '2026-08-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (223, CURRENT_DATE, 373, 49,
    0.8675, 0.8191, 173,
    0, false, 0,
    false, 0.5893, 68,
    0, true, true,
    0.6855, 50, 4,
    0.9696, 0.2402);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (223, (SELECT id FROM project_data_snapshots WHERE project_id = 223 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3437, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (224, 'SC Mission 224 (Mysuru, Karnataka)', 'Smart City', 'Karnataka', 'Mysuru',
    13.363482, 76.678363, 228.69, 2489,
    '2022-12-28', '2025-09-19', 'Completed', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'SIA Initiated', 1, '2022-12-28', '2023-06-26', 
    '2022-12-28',
    '2023-06-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'SIA Approved', 2, '2023-06-26', '2023-12-23', 
    '2023-06-26',
    '2023-12-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'Notification u/s 11', 3, '2023-12-23', '2024-06-20', 
    '2023-12-23',
    '2024-06-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'Objection Hearing', 4, '2024-06-20', '2024-12-17', 
    '2024-06-20',
    '2024-12-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'Award Declaration', 5, '2024-12-17', '2025-06-15', 
    '2024-12-17',
    '2025-06-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'Compensation Disbursement', 6, '2025-06-15', '2025-12-12', 
    '2025-06-15',
    '2025-12-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'Possession Handover', 7, '2025-12-12', '2026-06-10', 
    '2025-12-12',
    '2026-06-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'Rehabilitation', 8, '2026-06-10', '2026-12-07', 
    '2026-06-10',
    '2026-12-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (224, 'Completed', 9, '2026-12-07', '2027-06-05', 
    '2026-12-07',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (224, CURRENT_DATE, 352, 117,
    1, 0.7814, 134,
    20, true, 2,
    false, 0.4673, 100,
    0, true, false,
    0.9134, 61, 32,
    0.0249, 0.3413);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (224, (SELECT id FROM project_data_snapshots WHERE project_id = 224 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0713, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (225, 'Ind Corridor 225 (Gandhinagar, Gujarat)', 'Industrial Corridor', 'Gujarat', 'Gandhinagar',
    21.473021, 73.001629, 196.86, 4289,
    '2020-03-24', '2021-10-11', 'Rehabilitation', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'SIA Initiated', 1, '2020-03-24', '2020-09-20', 
    '2020-03-24',
    '2020-09-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'SIA Approved', 2, '2020-09-20', '2021-03-19', 
    '2020-09-20',
    '2021-03-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'Notification u/s 11', 3, '2021-03-19', '2021-09-15', 
    '2021-03-19',
    '2021-09-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'Objection Hearing', 4, '2021-09-15', '2022-03-14', 
    '2021-09-15',
    '2022-03-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'Award Declaration', 5, '2022-03-14', '2022-09-10', 
    '2022-03-14',
    '2022-09-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'Compensation Disbursement', 6, '2022-09-10', '2023-03-09', 
    '2022-09-10',
    '2023-03-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'Possession Handover', 7, '2023-03-09', '2023-09-05', 
    '2023-03-09',
    '2023-09-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'Rehabilitation', 8, '2023-09-05', '2024-03-03', 
    '2023-09-05',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (225, 'Completed', 9, '2024-03-03', '2024-08-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (225, CURRENT_DATE, 558, 349,
    0.9103, 0.6735, 1,
    0, false, 0,
    false, 0.5866, 5,
    10, true, false,
    0.8719, 47, 29,
    0.8892, 0.1516);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (225, (SELECT id FROM project_data_snapshots WHERE project_id = 225 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2431, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (226, 'Port Connectivity 226 (Coimbatore, Tamil Nadu)', 'Port Connectivity', 'Tamil Nadu', 'Coimbatore',
    9.059001, 77.244923, 12.55, 4594,
    '2022-05-02', '2025-02-13', 'Award Declaration', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'SIA Initiated', 1, '2022-05-02', '2022-10-29', 
    '2022-05-02',
    '2022-10-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'SIA Approved', 2, '2022-10-29', '2023-04-27', 
    '2022-10-29',
    '2023-04-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'Notification u/s 11', 3, '2023-04-27', '2023-10-24', 
    '2023-04-27',
    '2023-10-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'Objection Hearing', 4, '2023-10-24', '2024-04-21', 
    '2023-10-24',
    '2024-04-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'Award Declaration', 5, '2024-04-21', '2024-10-18', 
    '2024-04-21',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'Compensation Disbursement', 6, '2024-10-18', '2025-04-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'Possession Handover', 7, '2025-04-16', '2025-10-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'Rehabilitation', 8, '2025-10-13', '2026-04-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (226, 'Completed', 9, '2026-04-11', '2026-10-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (226, CURRENT_DATE, 481, 170,
    0.5342, 0.4177, 26,
    0, false, 0,
    false, 0.5239, 44,
    8, true, true,
    0.1416, 41, 36,
    0, 0.2224);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (226, (SELECT id FROM project_data_snapshots WHERE project_id = 226 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3463, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (227, 'Port Connectivity 227 (Raigad, Maharashtra)', 'Port Connectivity', 'Maharashtra', 'Raigad',
    16.345481, 76.265885, 353.82, 4865,
    '2022-01-04', '2026-10-18', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'SIA Initiated', 1, '2022-01-04', '2022-07-03', 
    '2022-01-04',
    '2022-07-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'SIA Approved', 2, '2022-07-03', '2022-12-30', 
    '2022-07-03',
    '2022-12-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'Notification u/s 11', 3, '2022-12-30', '2023-06-28', 
    '2022-12-30',
    '2023-06-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'Objection Hearing', 4, '2023-06-28', '2023-12-25', 
    '2023-06-28',
    '2023-12-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'Award Declaration', 5, '2023-12-25', '2024-06-22', 
    '2023-12-25',
    '2024-06-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'Compensation Disbursement', 6, '2024-06-22', '2024-12-19', 
    '2024-06-22',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'Possession Handover', 7, '2024-12-19', '2025-06-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'Rehabilitation', 8, '2025-06-17', '2025-12-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (227, 'Completed', 9, '2025-12-14', '2026-06-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (227, CURRENT_DATE, 81, 0,
    0.5462, 0.3911, 176,
    0, false, 0,
    false, 0.8196, 78,
    5, true, true,
    0.8174, 90, 51,
    0, 0.3667);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (227, (SELECT id FROM project_data_snapshots WHERE project_id = 227 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5831, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (228, 'Rail Line 228 (West Godavari, Andhra Pradesh)', 'Railway Line', 'Andhra Pradesh', 'West Godavari',
    14.672742, 81.655349, 456.87, 3221,
    '2023-05-29', '2027-01-06', 'SIA Approved', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'SIA Initiated', 1, '2023-05-29', '2023-11-25', 
    '2023-05-29',
    '2023-11-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'SIA Approved', 2, '2023-11-25', '2024-05-23', 
    '2023-11-25',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'Notification u/s 11', 3, '2024-05-23', '2024-11-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'Objection Hearing', 4, '2024-11-19', '2025-05-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'Award Declaration', 5, '2025-05-18', '2025-11-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'Compensation Disbursement', 6, '2025-11-14', '2026-05-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'Possession Handover', 7, '2026-05-13', '2026-11-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'Rehabilitation', 8, '2026-11-09', '2027-05-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (228, 'Completed', 9, '2027-05-08', '2027-11-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (228, CURRENT_DATE, 0, 0,
    0.1191, 0.1172, 46,
    45, true, 3,
    false, 0.8733, 112,
    5, true, true,
    0.0303, 65, 7,
    0, 0.2757);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (228, (SELECT id FROM project_data_snapshots WHERE project_id = 228 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1292, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (229, 'E-way 229 (Vizianagaram, Andhra Pradesh)', 'Expressway', 'Andhra Pradesh', 'Vizianagaram',
    16.055648, 79.745488, 203.4, 3396,
    '2020-08-17', '2022-03-24', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'SIA Initiated', 1, '2020-08-17', '2021-02-13', 
    '2020-08-17',
    '2021-02-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'SIA Approved', 2, '2021-02-13', '2021-08-12', 
    '2021-02-13',
    '2021-08-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'Notification u/s 11', 3, '2021-08-12', '2022-02-08', 
    '2021-08-12',
    '2022-02-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'Objection Hearing', 4, '2022-02-08', '2022-08-07', 
    '2022-02-08',
    '2022-08-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'Award Declaration', 5, '2022-08-07', '2023-02-03', 
    '2022-08-07',
    '2023-02-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'Compensation Disbursement', 6, '2023-02-03', '2023-08-02', 
    '2023-02-03',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'Possession Handover', 7, '2023-08-02', '2024-01-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'Rehabilitation', 8, '2024-01-29', '2024-07-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (229, 'Completed', 9, '2024-07-27', '2025-01-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (229, CURRENT_DATE, 363, 122,
    0.6362, 0.4589, 158,
    0, false, 0,
    false, 0.5462, 20,
    7, true, true,
    0.3407, 80, 27,
    0, 0.4922);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (229, (SELECT id FROM project_data_snapshots WHERE project_id = 229 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6224, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (230, 'Ind Corridor 230 (Medak, Telangana)', 'Industrial Corridor', 'Telangana', 'Medak',
    18.178421, 80.327152, 279.77, 3657,
    '2023-11-03', '2028-10-29', 'Completed', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'SIA Initiated', 1, '2023-11-03', '2024-05-01', 
    '2023-11-03',
    '2024-05-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'SIA Approved', 2, '2024-05-01', '2024-10-28', 
    '2024-05-01',
    '2024-10-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'Notification u/s 11', 3, '2024-10-28', '2025-04-26', 
    '2024-10-28',
    '2025-04-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'Objection Hearing', 4, '2025-04-26', '2025-10-23', 
    '2025-04-26',
    '2025-10-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'Award Declaration', 5, '2025-10-23', '2026-04-21', 
    '2025-10-23',
    '2026-04-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'Compensation Disbursement', 6, '2026-04-21', '2026-10-18', 
    '2026-04-21',
    '2026-10-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'Possession Handover', 7, '2026-10-18', '2027-04-16', 
    '2026-10-18',
    '2027-04-16', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'Rehabilitation', 8, '2027-04-16', '2027-10-13', 
    '2027-04-16',
    '2027-10-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (230, 'Completed', 9, '2027-10-13', '2028-04-10', 
    '2027-10-13',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (230, CURRENT_DATE, 617, 392,
    1, 0.7343, 78,
    0, false, 0,
    false, 0.9735, 8,
    9, true, true,
    0.8141, 53, 20,
    0.4943, 0.4301);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (230, (SELECT id FROM project_data_snapshots WHERE project_id = 230 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.01, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (231, 'Rail Line 231 (Palghar, Maharashtra)', 'Railway Line', 'Maharashtra', 'Palghar',
    18.444334, 74.832026, 287.29, 2504,
    '2020-04-26', '2024-10-07', 'SIA Initiated', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'SIA Initiated', 1, '2020-04-26', '2020-10-23', 
    '2020-04-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'SIA Approved', 2, '2020-10-23', '2021-04-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'Notification u/s 11', 3, '2021-04-21', '2021-10-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'Objection Hearing', 4, '2021-10-18', '2022-04-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'Award Declaration', 5, '2022-04-16', '2022-10-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'Compensation Disbursement', 6, '2022-10-13', '2023-04-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'Possession Handover', 7, '2023-04-11', '2023-10-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'Rehabilitation', 8, '2023-10-08', '2024-04-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (231, 'Completed', 9, '2024-04-05', '2024-10-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (231, CURRENT_DATE, 621, 330,
    0, 0, 88,
    0, false, 0,
    false, 0.9942, 74,
    0, false, true,
    0.5104, 21, 54,
    0, 0.2471);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (231, (SELECT id FROM project_data_snapshots WHERE project_id = 231 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2483, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (232, 'National Highway 232 (Dausa, Rajasthan)', 'National Highway', 'Rajasthan', 'Dausa',
    25.514712, 77.251231, 205.99, 3575,
    '2020-09-28', '2021-11-30', 'SIA Initiated', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'SIA Initiated', 1, '2020-09-28', '2021-03-27', 
    '2020-09-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'SIA Approved', 2, '2021-03-27', '2021-09-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'Notification u/s 11', 3, '2021-09-23', '2022-03-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'Objection Hearing', 4, '2022-03-22', '2022-09-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'Award Declaration', 5, '2022-09-18', '2023-03-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'Compensation Disbursement', 6, '2023-03-17', '2023-09-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'Possession Handover', 7, '2023-09-13', '2024-03-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'Rehabilitation', 8, '2024-03-11', '2024-09-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (232, 'Completed', 9, '2024-09-07', '2025-03-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (232, CURRENT_DATE, 270, 0,
    0, 0, 54,
    0, false, 0,
    false, 0.7975, 60,
    2, false, true,
    0.3846, 51, 53,
    0, 0.3086);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (232, (SELECT id FROM project_data_snapshots WHERE project_id = 232 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2962, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (233, 'Rail Line 233 (Karur, Tamil Nadu)', 'Railway Line', 'Tamil Nadu', 'Karur',
    8.086393, 79.246027, 430.78, 4961,
    '2022-05-18', '2026-02-07', 'Notification u/s 11', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'SIA Initiated', 1, '2022-05-18', '2022-11-14', 
    '2022-05-18',
    '2022-11-14', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'SIA Approved', 2, '2022-11-14', '2023-05-13', 
    '2022-11-14',
    '2023-05-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'Notification u/s 11', 3, '2023-05-13', '2023-11-09', 
    '2023-05-13',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'Objection Hearing', 4, '2023-11-09', '2024-05-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'Award Declaration', 5, '2024-05-07', '2024-11-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'Compensation Disbursement', 6, '2024-11-03', '2025-05-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'Possession Handover', 7, '2025-05-02', '2025-10-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'Rehabilitation', 8, '2025-10-29', '2026-04-27', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (233, 'Completed', 9, '2026-04-27', '2026-10-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (233, CURRENT_DATE, 703, 415,
    0.2373, 0.2367, 159,
    12, true, 4,
    false, 0.7056, 70,
    7, true, true,
    0.2257, 59, 38,
    0, 0.1037);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (233, (SELECT id FROM project_data_snapshots WHERE project_id = 233 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.2215, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (234, 'Metro 234 (Krishna, Andhra Pradesh)', 'Metro Rail', 'Andhra Pradesh', 'Krishna',
    16.323164, 79.43576, 75.33, 4322,
    '2022-09-12', '2023-11-28', 'Completed', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'SIA Initiated', 1, '2022-09-12', '2023-03-11', 
    '2022-09-12',
    '2023-03-11', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'SIA Approved', 2, '2023-03-11', '2023-09-07', 
    '2023-03-11',
    '2023-09-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'Notification u/s 11', 3, '2023-09-07', '2024-03-05', 
    '2023-09-07',
    '2024-03-05', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'Objection Hearing', 4, '2024-03-05', '2024-09-01', 
    '2024-03-05',
    '2024-09-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'Award Declaration', 5, '2024-09-01', '2025-02-28', 
    '2024-09-01',
    '2025-02-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'Compensation Disbursement', 6, '2025-02-28', '2025-08-27', 
    '2025-02-28',
    '2025-08-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'Possession Handover', 7, '2025-08-27', '2026-02-23', 
    '2025-08-27',
    '2026-02-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'Rehabilitation', 8, '2026-02-23', '2026-08-22', 
    '2026-02-23',
    '2026-08-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (234, 'Completed', 9, '2026-08-22', '2027-02-18', 
    '2026-08-22',
    NULL, 'in_progress');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (234, CURRENT_DATE, 611, 360,
    0.9967, 0.8079, 119,
    0, false, 0,
    false, 0.7102, 66,
    9, true, true,
    0.4725, 89, 42,
    0.0781, 0.4168);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (234, (SELECT id FROM project_data_snapshots WHERE project_id = 234 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.0233, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (235, 'National Highway 235 (Namakkal, Tamil Nadu)', 'National Highway', 'Tamil Nadu', 'Namakkal',
    10.578778, 78.306984, 148.16, 299,
    '2020-12-09', '2024-07-26', 'Compensation Disbursement', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'SIA Initiated', 1, '2020-12-09', '2021-06-07', 
    '2020-12-09',
    '2021-06-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'SIA Approved', 2, '2021-06-07', '2021-12-04', 
    '2021-06-07',
    '2021-12-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'Notification u/s 11', 3, '2021-12-04', '2022-06-02', 
    '2021-12-04',
    '2022-06-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'Objection Hearing', 4, '2022-06-02', '2022-11-29', 
    '2022-06-02',
    '2022-11-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'Award Declaration', 5, '2022-11-29', '2023-05-28', 
    '2022-11-29',
    '2023-05-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'Compensation Disbursement', 6, '2023-05-28', '2023-11-24', 
    '2023-05-28',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'Possession Handover', 7, '2023-11-24', '2024-05-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'Rehabilitation', 8, '2024-05-22', '2024-11-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (235, 'Completed', 9, '2024-11-18', '2025-05-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (235, CURRENT_DATE, 617, 260,
    0.6718, 0.5551, 152,
    0, false, 0,
    false, 0.8497, 93,
    9, true, true,
    0.6293, 79, 10,
    0, 0.3864);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (235, (SELECT id FROM project_data_snapshots WHERE project_id = 235 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.6836, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (236, 'Port Connectivity 236 (Karur, Tamil Nadu)', 'Port Connectivity', 'Tamil Nadu', 'Karur',
    8.697517, 76.34588, 372.01, 4956,
    '2020-06-24', '2023-01-14', 'SIA Initiated', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'SIA Initiated', 1, '2020-06-24', '2020-12-21', 
    '2020-06-24',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'SIA Approved', 2, '2020-12-21', '2021-06-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'Notification u/s 11', 3, '2021-06-19', '2021-12-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'Objection Hearing', 4, '2021-12-16', '2022-06-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'Award Declaration', 5, '2022-06-14', '2022-12-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'Compensation Disbursement', 6, '2022-12-11', '2023-06-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'Possession Handover', 7, '2023-06-09', '2023-12-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'Rehabilitation', 8, '2023-12-06', '2024-06-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (236, 'Completed', 9, '2024-06-03', '2024-11-30', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (236, CURRENT_DATE, 288, 64,
    0, 0, 151,
    0, false, 0,
    false, 0.8434, 84,
    7, false, true,
    0.1754, 35, 31,
    0, 0.1904);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (236, (SELECT id FROM project_data_snapshots WHERE project_id = 236 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1954, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (237, 'SH 237 (Mysuru, Karnataka)', 'State Highway', 'Karnataka', 'Mysuru',
    12.539526, 76.231767, 290.99, 2836,
    '2023-07-23', '2026-11-14', 'Notification u/s 11', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'SIA Initiated', 1, '2023-07-23', '2024-01-19', 
    '2023-07-23',
    '2024-01-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'SIA Approved', 2, '2024-01-19', '2024-07-17', 
    '2024-01-19',
    '2024-07-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'Notification u/s 11', 3, '2024-07-17', '2025-01-13', 
    '2024-07-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'Objection Hearing', 4, '2025-01-13', '2025-07-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'Award Declaration', 5, '2025-07-12', '2026-01-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'Compensation Disbursement', 6, '2026-01-08', '2026-07-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'Possession Handover', 7, '2026-07-07', '2027-01-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'Rehabilitation', 8, '2027-01-03', '2027-07-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (237, 'Completed', 9, '2027-07-02', '2027-12-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (237, CURRENT_DATE, 422, 229,
    0.1976, 0.1644, 164,
    0, false, 0,
    false, 0.5586, 104,
    1, true, true,
    0.464, 65, 19,
    0, 0.3381);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (237, (SELECT id FROM project_data_snapshots WHERE project_id = 237 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4802, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (238, 'Smart City 238 (Bulandshahr, Uttar Pradesh)', 'Smart City', 'Uttar Pradesh', 'Bulandshahr',
    29.656805, 77.088973, 53.2, 4362,
    '2020-12-25', '2024-07-01', 'Rehabilitation', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'SIA Initiated', 1, '2020-12-25', '2021-06-23', 
    '2020-12-25',
    '2021-06-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'SIA Approved', 2, '2021-06-23', '2021-12-20', 
    '2021-06-23',
    '2021-12-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'Notification u/s 11', 3, '2021-12-20', '2022-06-18', 
    '2021-12-20',
    '2022-06-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'Objection Hearing', 4, '2022-06-18', '2022-12-15', 
    '2022-06-18',
    '2022-12-15', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'Award Declaration', 5, '2022-12-15', '2023-06-13', 
    '2022-12-15',
    '2023-06-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'Compensation Disbursement', 6, '2023-06-13', '2023-12-10', 
    '2023-06-13',
    '2023-12-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'Possession Handover', 7, '2023-12-10', '2024-06-07', 
    '2023-12-10',
    '2024-06-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'Rehabilitation', 8, '2024-06-07', '2024-12-04', 
    '2024-06-07',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (238, 'Completed', 9, '2024-12-04', '2025-06-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (238, CURRENT_DATE, 421, 78,
    0.9107, 0.9003, 90,
    0, false, 0,
    false, 0.9737, 55,
    9, true, false,
    0.8584, 47, 17,
    0.2671, 0.1491);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (238, (SELECT id FROM project_data_snapshots WHERE project_id = 238 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1935, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (239, 'Metro 239 (Yadadri Bhuvanagiri, Telangana)', 'Metro Rail', 'Telangana', 'Yadadri Bhuvanagiri',
    18.261113, 77.809625, 344.32, 2889,
    '2022-05-17', '2026-06-11', 'Objection Hearing', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'SIA Initiated', 1, '2022-05-17', '2022-11-13', 
    '2022-05-17',
    '2022-11-13', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'SIA Approved', 2, '2022-11-13', '2023-05-12', 
    '2022-11-13',
    '2023-05-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'Notification u/s 11', 3, '2023-05-12', '2023-11-08', 
    '2023-05-12',
    '2023-11-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'Objection Hearing', 4, '2023-11-08', '2024-05-06', 
    '2023-11-08',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'Award Declaration', 5, '2024-05-06', '2024-11-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'Compensation Disbursement', 6, '2024-11-02', '2025-05-01', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'Possession Handover', 7, '2025-05-01', '2025-10-28', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'Rehabilitation', 8, '2025-10-28', '2026-04-26', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (239, 'Completed', 9, '2026-04-26', '2026-10-23', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (239, CURRENT_DATE, 40, 0,
    0.4096, 0.3889, 72,
    17, true, 2,
    true, 0.4204, 79,
    1, true, true,
    0.5941, 32, 60,
    0, 0.3997);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (239, (SELECT id FROM project_data_snapshots WHERE project_id = 239 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4512, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (240, 'State Highway 240 (Ahmednagar, Maharashtra)', 'State Highway', 'Maharashtra', 'Ahmednagar',
    19.766565, 79.699178, 331.94, 630,
    '2022-06-23', '2026-08-25', 'SIA Approved', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'SIA Initiated', 1, '2022-06-23', '2022-12-20', 
    '2022-06-23',
    '2022-12-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'SIA Approved', 2, '2022-12-20', '2023-06-18', 
    '2022-12-20',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'Notification u/s 11', 3, '2023-06-18', '2023-12-15', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'Objection Hearing', 4, '2023-12-15', '2024-06-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'Award Declaration', 5, '2024-06-12', '2024-12-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'Compensation Disbursement', 6, '2024-12-09', '2025-06-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'Possession Handover', 7, '2025-06-07', '2025-12-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'Rehabilitation', 8, '2025-12-04', '2026-06-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (240, 'Completed', 9, '2026-06-02', '2026-11-29', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (240, CURRENT_DATE, 219, 0,
    0.2042, 0.1856, 116,
    0, false, 0,
    false, 0.9536, 35,
    6, true, true,
    0.6676, 46, 16,
    0, 0.181);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (240, (SELECT id FROM project_data_snapshots WHERE project_id = 240 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.139, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (241, 'NH 241 (Raigad, Maharashtra)', 'National Highway', 'Maharashtra', 'Raigad',
    15.890381, 80.144846, 307.1, 1471,
    '2021-09-04', '2024-02-28', 'Possession Handover', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'SIA Initiated', 1, '2021-09-04', '2022-03-03', 
    '2021-09-04',
    '2022-03-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'SIA Approved', 2, '2022-03-03', '2022-08-30', 
    '2022-03-03',
    '2022-08-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'Notification u/s 11', 3, '2022-08-30', '2023-02-26', 
    '2022-08-30',
    '2023-02-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'Objection Hearing', 4, '2023-02-26', '2023-08-25', 
    '2023-02-26',
    '2023-08-25', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'Award Declaration', 5, '2023-08-25', '2024-02-21', 
    '2023-08-25',
    '2024-02-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'Compensation Disbursement', 6, '2024-02-21', '2024-08-19', 
    '2024-02-21',
    '2024-08-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'Possession Handover', 7, '2024-08-19', '2025-02-15', 
    '2024-08-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'Rehabilitation', 8, '2025-02-15', '2025-08-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (241, 'Completed', 9, '2025-08-14', '2026-02-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (241, CURRENT_DATE, 0, 0,
    0.6856, 0.4942, 165,
    0, false, 0,
    false, 0.6952, 18,
    8, true, false,
    0.2184, 87, 6,
    0.9126, 0.4577);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (241, (SELECT id FROM project_data_snapshots WHERE project_id = 241 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3998, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (242, 'SH 242 (Thane, Maharashtra)', 'State Highway', 'Maharashtra', 'Thane',
    20.552042, 72.650118, 351.53, 3215,
    '2022-05-02', '2026-02-14', 'SIA Approved', 'Cancelled', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'SIA Initiated', 1, '2022-05-02', '2022-10-29', 
    '2022-05-02',
    '2022-10-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'SIA Approved', 2, '2022-10-29', '2023-04-27', 
    '2022-10-29',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'Notification u/s 11', 3, '2023-04-27', '2023-10-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'Objection Hearing', 4, '2023-10-24', '2024-04-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'Award Declaration', 5, '2024-04-21', '2024-10-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'Compensation Disbursement', 6, '2024-10-18', '2025-04-16', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'Possession Handover', 7, '2025-04-16', '2025-10-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'Rehabilitation', 8, '2025-10-13', '2026-04-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (242, 'Completed', 9, '2026-04-11', '2026-10-08', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (242, CURRENT_DATE, 182, 0,
    0.1556, 0.1089, 0,
    33, true, 4,
    false, 0.6869, 51,
    1, true, true,
    0.0033, 66, 7,
    0, 0.3836);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (242, (SELECT id FROM project_data_snapshots WHERE project_id = 242 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3183, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (243, 'Expressway 243 (Ajmer, Rajasthan)', 'Expressway', 'Rajasthan', 'Ajmer',
    29.711767, 70.316003, 92.43, 332,
    '2022-02-02', '2026-01-31', 'Possession Handover', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'SIA Initiated', 1, '2022-02-02', '2022-08-01', 
    '2022-02-02',
    '2022-08-01', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'SIA Approved', 2, '2022-08-01', '2023-01-28', 
    '2022-08-01',
    '2023-01-28', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'Notification u/s 11', 3, '2023-01-28', '2023-07-27', 
    '2023-01-28',
    '2023-07-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'Objection Hearing', 4, '2023-07-27', '2024-01-23', 
    '2023-07-27',
    '2024-01-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'Award Declaration', 5, '2024-01-23', '2024-07-21', 
    '2024-01-23',
    '2024-07-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'Compensation Disbursement', 6, '2024-07-21', '2025-01-17', 
    '2024-07-21',
    '2025-01-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'Possession Handover', 7, '2025-01-17', '2025-07-16', 
    '2025-01-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'Rehabilitation', 8, '2025-07-16', '2026-01-12', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (243, 'Completed', 9, '2026-01-12', '2026-07-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (243, CURRENT_DATE, 378, 100,
    0.6661, 0.5581, 169,
    0, false, 0,
    false, 0.5146, 89,
    6, true, false,
    0.6306, 50, 31,
    0.0849, 0.4164);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (243, (SELECT id FROM project_data_snapshots WHERE project_id = 243 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4897, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (244, 'National Highway 244 (Ghaziabad, Uttar Pradesh)', 'National Highway', 'Uttar Pradesh', 'Ghaziabad',
    27.854145, 80.669244, 483.45, 144,
    '2023-09-26', '2025-02-01', 'Objection Hearing', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'SIA Initiated', 1, '2023-09-26', '2024-03-24', 
    '2023-09-26',
    '2024-03-24', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'SIA Approved', 2, '2024-03-24', '2024-09-20', 
    '2024-03-24',
    '2024-09-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'Notification u/s 11', 3, '2024-09-20', '2025-03-19', 
    '2024-09-20',
    '2025-03-19', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'Objection Hearing', 4, '2025-03-19', '2025-09-15', 
    '2025-03-19',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'Award Declaration', 5, '2025-09-15', '2026-03-14', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'Compensation Disbursement', 6, '2026-03-14', '2026-09-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'Possession Handover', 7, '2026-09-10', '2027-03-09', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'Rehabilitation', 8, '2027-03-09', '2027-09-05', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (244, 'Completed', 9, '2027-09-05', '2028-03-03', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (244, CURRENT_DATE, 583, 394,
    0.4037, 0.3431, 86,
    0, false, 0,
    false, 0.4336, 100,
    0, true, true,
    0.2117, 88, 42,
    0, 0.3616);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (244, (SELECT id FROM project_data_snapshots WHERE project_id = 244 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.5659, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (245, 'Port Connectivity 245 (Bhavnagar, Gujarat)', 'Port Connectivity', 'Gujarat', 'Bhavnagar',
    20.637157, 72.249905, 452.81, 807,
    '2020-10-25', '2024-06-16', 'Objection Hearing', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'SIA Initiated', 1, '2020-10-25', '2021-04-23', 
    '2020-10-25',
    '2021-04-23', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'SIA Approved', 2, '2021-04-23', '2021-10-20', 
    '2021-04-23',
    '2021-10-20', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'Notification u/s 11', 3, '2021-10-20', '2022-04-18', 
    '2021-10-20',
    '2022-04-18', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'Objection Hearing', 4, '2022-04-18', '2022-10-15', 
    '2022-04-18',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'Award Declaration', 5, '2022-10-15', '2023-04-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'Compensation Disbursement', 6, '2023-04-13', '2023-10-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'Possession Handover', 7, '2023-10-10', '2024-04-07', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'Rehabilitation', 8, '2024-04-07', '2024-10-04', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (245, 'Completed', 9, '2024-10-04', '2025-04-02', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (245, CURRENT_DATE, 663, 367,
    0.2842, 0.2587, 156,
    11, true, 5,
    true, 0.4384, 104,
    1, true, true,
    0.595, 83, 14,
    0, 0.1316);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (245, (SELECT id FROM project_data_snapshots WHERE project_id = 245 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3611, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (246, 'Industrial Corridor 246 (Bulandshahr, Uttar Pradesh)', 'Industrial Corridor', 'Uttar Pradesh', 'Bulandshahr',
    28.446574, 81.094136, 140.58, 3410,
    '2022-11-11', '2025-08-30', 'Possession Handover', 'On Hold', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'SIA Initiated', 1, '2022-11-11', '2023-05-10', 
    '2022-11-11',
    '2023-05-10', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'SIA Approved', 2, '2023-05-10', '2023-11-06', 
    '2023-05-10',
    '2023-11-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'Notification u/s 11', 3, '2023-11-06', '2024-05-04', 
    '2023-11-06',
    '2024-05-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'Objection Hearing', 4, '2024-05-04', '2024-10-31', 
    '2024-05-04',
    '2024-10-31', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'Award Declaration', 5, '2024-10-31', '2025-04-29', 
    '2024-10-31',
    '2025-04-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'Compensation Disbursement', 6, '2025-04-29', '2025-10-26', 
    '2025-04-29',
    '2025-10-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'Possession Handover', 7, '2025-10-26', '2026-04-24', 
    '2025-10-26',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'Rehabilitation', 8, '2026-04-24', '2026-10-21', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (246, 'Completed', 9, '2026-10-21', '2027-04-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (246, CURRENT_DATE, 248, 25,
    0.8028, 0.7048, 178,
    0, false, 0,
    false, 0.622, 21,
    7, true, true,
    0.582, 22, 6,
    0.7911, 0.4161);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (246, (SELECT id FROM project_data_snapshots WHERE project_id = 246 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3362, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (247, 'National Highway 247 (Medchal-Malkajgiri, Telangana)', 'National Highway', 'Telangana', 'Medchal-Malkajgiri',
    16.217651, 77.401136, 347.72, 1698,
    '2020-12-14', '2025-08-09', 'Rehabilitation', 'Planning', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'SIA Initiated', 1, '2020-12-14', '2021-06-12', 
    '2020-12-14',
    '2021-06-12', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'SIA Approved', 2, '2021-06-12', '2021-12-09', 
    '2021-06-12',
    '2021-12-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'Notification u/s 11', 3, '2021-12-09', '2022-06-07', 
    '2021-12-09',
    '2022-06-07', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'Objection Hearing', 4, '2022-06-07', '2022-12-04', 
    '2022-06-07',
    '2022-12-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'Award Declaration', 5, '2022-12-04', '2023-06-02', 
    '2022-12-04',
    '2023-06-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'Compensation Disbursement', 6, '2023-06-02', '2023-11-29', 
    '2023-06-02',
    '2023-11-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'Possession Handover', 7, '2023-11-29', '2024-05-27', 
    '2023-11-29',
    '2024-05-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'Rehabilitation', 8, '2024-05-27', '2024-11-23', 
    '2024-05-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (247, 'Completed', 9, '2024-11-23', '2025-05-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (247, CURRENT_DATE, 637, 421,
    0.9524, 0.7856, 163,
    0, false, 0,
    false, 0.5626, 57,
    6, true, true,
    0.1745, 9, 38,
    0.18, 0.3499);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (247, (SELECT id FROM project_data_snapshots WHERE project_id = 247 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.1519, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (248, 'Expressway 248 (Ahmednagar, Maharashtra)', 'Expressway', 'Maharashtra', 'Ahmednagar',
    17.031654, 73.440063, 234.79, 1714,
    '2021-07-31', '2025-07-20', 'Compensation Disbursement', 'Completed', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'SIA Initiated', 1, '2021-07-31', '2022-01-27', 
    '2021-07-31',
    '2022-01-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'SIA Approved', 2, '2022-01-27', '2022-07-26', 
    '2022-01-27',
    '2022-07-26', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'Notification u/s 11', 3, '2022-07-26', '2023-01-22', 
    '2022-07-26',
    '2023-01-22', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'Objection Hearing', 4, '2023-01-22', '2023-07-21', 
    '2023-01-22',
    '2023-07-21', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'Award Declaration', 5, '2023-07-21', '2024-01-17', 
    '2023-07-21',
    '2024-01-17', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'Compensation Disbursement', 6, '2024-01-17', '2024-07-15', 
    '2024-01-17',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'Possession Handover', 7, '2024-07-15', '2025-01-11', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'Rehabilitation', 8, '2025-01-11', '2025-07-10', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (248, 'Completed', 9, '2025-07-10', '2026-01-06', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (248, CURRENT_DATE, 0, 0,
    0.7204, 0.638, 70,
    0, false, 0,
    false, 0.4318, 14,
    2, true, true,
    0.9686, 65, 31,
    0, 0.1882);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (248, (SELECT id FROM project_data_snapshots WHERE project_id = 248 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4514, 'medium', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (249, 'Industrial Corridor 249 (Bengaluru Rural, Karnataka)', 'Industrial Corridor', 'Karnataka', 'Bengaluru Rural',
    13.170031, 77.623192, 393.82, 3983,
    '2022-09-07', '2026-03-23', 'Award Declaration', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'SIA Initiated', 1, '2022-09-07', '2023-03-06', 
    '2022-09-07',
    '2023-03-06', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'SIA Approved', 2, '2023-03-06', '2023-09-02', 
    '2023-03-06',
    '2023-09-02', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'Notification u/s 11', 3, '2023-09-02', '2024-02-29', 
    '2023-09-02',
    '2024-02-29', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'Objection Hearing', 4, '2024-02-29', '2024-08-27', 
    '2024-02-29',
    '2024-08-27', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'Award Declaration', 5, '2024-08-27', '2025-02-23', 
    '2024-08-27',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'Compensation Disbursement', 6, '2025-02-23', '2025-08-22', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'Possession Handover', 7, '2025-08-22', '2026-02-18', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'Rehabilitation', 8, '2026-02-18', '2026-08-17', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (249, 'Completed', 9, '2026-08-17', '2027-02-13', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (249, CURRENT_DATE, 74, 0,
    0.4209, 0.3012, 29,
    0, false, 0,
    false, 0.4425, 30,
    7, true, true,
    0.326, 30, 47,
    0, 0.4384);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (249, (SELECT id FROM project_data_snapshots WHERE project_id = 249 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.3804, 'low', 'success');
INSERT INTO projects (id, name, project_type, state, district, latitude, longitude, 
    land_area_ha, affected_families, start_date, target_end_date, current_stage, status, data_source)
VALUES (250, 'SH 250 (Alwar, Rajasthan)', 'State Highway', 'Rajasthan', 'Alwar',
    28.164235, 77.328977, 464.3, 3737,
    '2021-03-13', '2024-04-20', 'Compensation Disbursement', 'In Progress', 'SYNTHETIC_DEMO');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'SIA Initiated', 1, '2021-03-13', '2021-09-09', 
    '2021-03-13',
    '2021-09-09', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'SIA Approved', 2, '2021-09-09', '2022-03-08', 
    '2021-09-09',
    '2022-03-08', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'Notification u/s 11', 3, '2022-03-08', '2022-09-04', 
    '2022-03-08',
    '2022-09-04', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'Objection Hearing', 4, '2022-09-04', '2023-03-03', 
    '2022-09-04',
    '2023-03-03', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'Award Declaration', 5, '2023-03-03', '2023-08-30', 
    '2023-03-03',
    '2023-08-30', 'completed');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'Compensation Disbursement', 6, '2023-08-30', '2024-02-26', 
    '2023-08-30',
    NULL, 'in_progress');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'Possession Handover', 7, '2024-02-26', '2024-08-24', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'Rehabilitation', 8, '2024-08-24', '2025-02-20', 
    NULL,
    NULL, 'pending');
INSERT INTO project_stages (project_id, stage_name, sequence_no, planned_start, planned_end, actual_start, actual_end, status)
VALUES (250, 'Completed', 9, '2025-02-20', '2025-08-19', 
    NULL,
    NULL, 'pending');
INSERT INTO project_data_snapshots (project_id, snapshot_date, days_in_current_stage, stage_overdue_days,
    pct_stages_completed, compensation_paid_pct, avg_compensation_pending_days, num_disputed_claims,
    legal_dispute_flag, num_active_legal_cases, has_court_stay, doc_complete_pct,
    approval_pending_days, num_approvals_pending, sia_approved, env_clearance_obtained,
    rehab_progress_pct, stakeholder_response_days, notification_delay_days,
    possession_completion_pct, district_historical_delay_rate)
VALUES (250, CURRENT_DATE, 255, 30,
    0.5397, 0.4725, 99,
    24, true, 2,
    false, 0.6746, 24,
    10, true, true,
    0.2697, 47, 8,
    0, 0.116);
INSERT INTO risk_predictions (project_id, snapshot_id, requested_at, responded_at, model_version,
    is_mock, delay_probability, risk_category, status)
VALUES (250, (SELECT id FROM project_data_snapshots WHERE project_id = 250 ORDER BY id DESC LIMIT 1),
    NOW(), NOW(), 'demo-v1.0', true, 0.4794, 'medium', 'success');
