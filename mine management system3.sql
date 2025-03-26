SELECT equipment_type, 
       SUM(CASE WHEN status = 'Under Maintenance' THEN 1 ELSE 0 END) AS downtime_hours
FROM Equipment
JOIN Maintenance_Logs ON Equipment.equipment_id = Maintenance_Logs.equipment_id
WHERE maintenance_logs.maintenance_type = 'Repair'
GROUP BY equipment_type;
 
 SELECT site_name, mineral_type, SUM(quantity_extracted) AS total_production
FROM Mineral_Production
JOIN Mining_Sites ON Mineral_Production.site_id = Mining_Sites.site_id
GROUP BY site_name, mineral_type;


SELECT Workers.name, Worker_Certifications.certification_type, 
       Worker_Certifications.expiry_date
FROM Workers
JOIN Worker_Certifications ON Workers.worker_id = Worker_Certifications.worker_id
WHERE Worker_Certifications.expiry_date < CURDATE();
  
  SELECT incident_type, COUNT(*) AS incident_count
FROM Safety_Incidents
WHERE incident_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY incident_type
ORDER BY incident_count DESC;


SELECT equipment_type, hours_of_use, next_maintenance_date
FROM Equipment
WHERE DATEDIFF(next_maintenance_date, CURDATE()) <= 7
ORDER BY next_maintenance_date;

 SELECT Workers.name, COUNT(*) AS total_shifts
FROM Shift_Schedules
JOIN Workers ON Shift_Schedules.worker_id = Workers.worker_id
GROUP BY Workers.name
HAVING total_shifts > 30;  -- Workers with more than 30 shifts

 SELECT site_name, mineral_type, AVG(quantity_extracted) AS avg_daily_extraction
FROM Mineral_Production
JOIN Mining_Sites ON Mineral_Production.site_id = Mining_Sites.site_id
GROUP BY site_name, mineral_type;
 
 SELECT site_name, COUNT(*) AS failed_inspections
FROM Safety_Inspections
JOIN Mining_Sites ON Safety_Inspections.site_id = Mining_Sites.site_id
WHERE inspection_results = 'Fail'
GROUP BY site_name;
