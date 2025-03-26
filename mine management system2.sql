-- Insert Data into Mining_Sites
INSERT INTO Mining_Sites (site_name, location, site_type, owner, region, start_date, status)
VALUES 
('Site A', 'Region 1', 'Surface', 'Company X', 'North', '2015-01-01', 'Active'),
('Site B', 'Region 2', 'Underground', 'Company Y', 'South', '2018-05-01', 'Active');

-- Insert Data into Mineral_Production
INSERT INTO Mineral_Production (site_id, mineral_type, quantity_extracted, extraction_date, quality, extraction_method)
VALUES 
(1, 'Coal', 1500.5, '2025-03-01', 'High', 'Surface'),
(2, 'Gold', 300.75, '2025-03-05', 'Medium', 'Underground');

-- Insert Data into Equipment
INSERT INTO Equipment (equipment_type, status, last_maintenance_date, next_maintenance_date, hours_of_use, failure_date)
VALUES 
('Excavator', 'Operational', '2025-01-15', '2025-06-01', 1500, NULL),
('Drilling Rig', 'Under Maintenance', '2025-02-10', '2025-03-15', 1000, '2025-02-20');

-- Insert Data into Maintenance_Logs
INSERT INTO Maintenance_Logs (equipment_id, maintenance_type, maintenance_date, maintenance_duration, notes)
VALUES 
(1, 'Routine', '2025-01-15', 5, 'Routine maintenance'),
(2, 'Repair', '2025-02-20', 8, 'Fixed hydraulic issue');

-- Insert Data into Workers
INSERT INTO Workers (name, role, certifications, shift, site_id, contact_info, work_experience)
VALUES 
('John Doe', 'Miner', 'Mine Safety, First Aid', 'Morning', 1, '555-1234', 5),
('Jane Smith', 'Supervisor', 'Leadership, Safety', 'Night', 2, '555-5678', 8);

-- Insert Data into Worker_Certifications
INSERT INTO Worker_Certifications (worker_id, certification_type, certification_date, expiry_date)
VALUES 
(1, 'Mine Safety', '2024-05-01', '2026-05-01'),
(2, 'First Aid', '2023-08-15', '2025-08-15');

-- Insert Data into Safety_Incidents
INSERT INTO Safety_Incidents (worker_id, incident_date, incident_type, severity, incident_details, incident_report_file)
VALUES 
(1, '2025-03-01', 'Injury', 'High', 'Minor injury during drilling operation', 'report123.pdf');

-- Insert Data into Safety_Inspections
INSERT INTO Safety_Inspections (site_id, inspection_date, inspector_name, inspection_results, notes)
VALUES 
(1, '2025-02-20', 'Mike Johnson', 'Pass', 'No major safety issues identified'),
(2, '2025-03-01', 'Sarah Lee', 'Fail', 'Some hazards in underground tunnels');

-- Insert Data into Shift_Schedules
INSERT INTO Shift_Schedules (worker_id, shift_date, shift_start_time, shift_end_time, assigned_task)
VALUES 
(1, '2025-03-01', '08:00:00', '16:00:00', 'Coal extraction'),
(2, '2025-03-02', '22:00:00', '06:00:00', 'Supervising underground operations');

-- Insert Data into Equipment_Tracking
INSERT INTO Equipment_Tracking (equipment_id, location, status)
VALUES 
(1, 'Area 1 - North Section', 'Operational'),
(2, 'Area 2 - South Section', 'Under Repair');

-- Insert Data into Production_Forecasting
INSERT INTO Production_Forecasting (site_id, forecast_date, forecasted_quantity, actual_quantity, variance)
VALUES 
(1, '2025-03-01', 1600, 1500.5, -99.5),
(2, '2025-03-05', 320, 300.75, -19.25);

