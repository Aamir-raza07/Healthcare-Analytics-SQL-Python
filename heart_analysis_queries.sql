-- ---------------------------------------------------------
-- HEART DISEASE DATA ANALYSIS - SQL WORKFLOW
-- ---------------------------------------------------------

-- 1. Database and Table Setup
CREATE DATABASE IF NOT EXISTS heart_disease_db;
USE heart_disease_db;

-- 2. Initial Data Check
-- Taaki confirm ho sake ki data sahi se load hua hai
SELECT * FROM patients LIMIT 20;

-- 3. Gender-wise Patient Count
-- Kyun: Male (1) aur Female (0) ka distribution dekhne ke liye
SELECT sex, COUNT(*) as total_patients
FROM patients
GROUP BY sex;

-- 4. Invalid Data Identification
-- Kyun: Medical records mein BP aur Cholesterol 0 hona technical error hai
-- Isse humein pata chalta hai ki cleaning ki kitni zaroorat hai
SELECT COUNT(*) as invalid_records 
FROM patients 
WHERE `resting bp s` = 0 OR cholesterol = 0;

-- 5. Statistical Insight: Average Metrics for Heart Disease
-- Kyun: Heart disease (Target 1) vs Healthy (Target 0) ke beech difference dekhna
SELECT target, AVG(age) as avg_age, AVG(cholesterol) as avg_chol
FROM patients
GROUP BY target;

-- 6. High Risk Patient Filtering
-- Kyun: Un logo ko identify karna jinka Cholesterol aur BP dono high hai aur disease bhi hai
SELECT * FROM patients 
WHERE cholesterol > 240 AND `resting bp s` > 140 AND target = 1;

-- 7. Insight: Chest Pain Type vs Disease Presence
-- Kyun: Ye check karne ke liye ki kis type ka chest pain sabse khatarnak hai
SELECT `chest pain type`, COUNT(*) as total, SUM(target) as disease_cases
FROM patients
GROUP BY `chest pain type`;

-- 8. Final Cleaning & View Creation for Python
-- Kyun: Hamare 'India Salary Analysis' workflow ki tarah, pehle raw data ko clean karte hain
-- Is view ko hum Python mein export karenge bina kisi invalid (0) values ke.
DROP VIEW IF EXISTS cleaned_patients_data;

CREATE VIEW cleaned_patients_data AS
SELECT * FROM patients 
WHERE `resting bp s` > 0 AND cholesterol > 0;

-- 9. Verification of Cleaned Data
-- Is step ke baad results ko CSV mein export karein
SELECT * FROM cleaned_patients_data;