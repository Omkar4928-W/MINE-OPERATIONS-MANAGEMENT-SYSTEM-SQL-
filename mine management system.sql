
CREATE DATABASE MiningOperations;

USE MiningOperations;

CREATE TABLE Mining_Sites (
    site_id INT PRIMARY KEY AUTO_INCREMENT,
    site_name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    site_type ENUM('Surface', 'Underground') NOT NULL,
    owner VARCHAR(100),
    region VARCHAR(100),
    start_date DATE,
    status ENUM('Active', 'Inactive', 'Closed') NOT NULL
);

-- Table 2: Mineral_Production
CREATE TABLE Mineral_Production (
    production_id INT PRIMARY KEY AUTO_INCREMENT,
    site_id INT,
    mineral_type VARCHAR(50),
    quantity_extracted DECIMAL(10,2), -- Quantity in tons or kilograms
    extraction_date DATE,
    quality VARCHAR(50),
    extraction_method ENUM('Surface', 'Underground'),
    FOREIGN KEY (site_id) REFERENCES Mining_Sites(site_id)
);

-- Table 3: Equipment
CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_type VARCHAR(100),
    status ENUM('Operational', 'Under Maintenance', 'Out of Service') NOT NULL,
    last_maintenance_date DATE,
    next_maintenance_date DATE,
    hours_of_use INT, -- Number of hours used
    failure_date DATE
);

-- Table 4: Maintenance_Logs
CREATE TABLE Maintenance_Logs (
    maintenance_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_id INT,
    maintenance_type ENUM('Routine', 'Repair', 'Emergency'),
    maintenance_date DATE,
    maintenance_duration INT, -- Duration of the maintenance in hours
    notes TEXT,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

-- Table 5: Workers
CREATE TABLE Workers (
    worker_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    role VARCHAR(50), -- e.g., Miner, Safety Officer, Supervisor
    certifications TEXT,
    shift ENUM('Morning', 'Evening', 'Night'),
    site_id INT,
    contact_info VARCHAR(255),
    work_experience INT, -- Years of experience
    FOREIGN KEY (site_id) REFERENCES Mining_Sites(site_id)
);

-- Table 6: Worker_Certifications
CREATE TABLE Worker_Certifications (
    certification_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    certification_type VARCHAR(100),
    certification_date DATE,
    expiry_date DATE,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

-- Table 7: Safety_Incidents
CREATE TABLE Safety_Incidents (
    incident_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    incident_date DATE,
    incident_type VARCHAR(100), -- e.g., Injury, Equipment Failure, Hazard
    severity ENUM('Low', 'Medium', 'High'),
    incident_details TEXT,
    incident_report_file VARCHAR(255),
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

-- Table 8: Safety_Inspections
CREATE TABLE Safety_Inspections (
    inspection_id INT PRIMARY KEY AUTO_INCREMENT,
    site_id INT,
    inspection_date DATE,
    inspector_name VARCHAR(100),
    inspection_results ENUM('Pass', 'Fail', 'Needs Improvement'),
    notes TEXT,
    FOREIGN KEY (site_id) REFERENCES Mining_Sites(site_id)
);

-- Table 9: Shift_Schedules
CREATE TABLE Shift_Schedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    worker_id INT,
    shift_date DATE,
    shift_start_time TIME,
    shift_end_time TIME,
    assigned_task TEXT,
    FOREIGN KEY (worker_id) REFERENCES Workers(worker_id)
);

-- Table 10: Real-Time Equipment Tracking (Optional: IoT integration)
CREATE TABLE Equipment_Tracking (
    equipment_tracking_id INT PRIMARY KEY AUTO_INCREMENT,
    equipment_id INT,
    location VARCHAR(100), -- GPS coordinates or area in the mine
    status ENUM('Operational', 'Idle', 'Under Repair'),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);

-- Table 11: Production Forecasting and Analytics
CREATE TABLE Production_Forecasting (
    forecast_id INT PRIMARY KEY AUTO_INCREMENT,
    site_id INT,
    forecast_date DATE,
    forecasted_quantity DECIMAL(10, 2), -- Predicted quantity in tons or kilograms
    actual_quantity DECIMAL(10, 2), -- Actual quantity produced
    variance DECIMAL(10, 2), -- Difference between forecast and actual
    FOREIGN KEY (site_id) REFERENCES Mining_Sites(site_id)
);

