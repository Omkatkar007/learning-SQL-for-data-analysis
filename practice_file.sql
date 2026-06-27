-- =========================================================================
-- SYSTEM: Campus Placement Preparation 2026
-- COURSE: Code With Harry SQL Complete Roadmap
-- TOPIC: Foundational Database Operations & Data Manipulation (CRUD)
-- FILE NAME: practice_file.sql
-- TARGET ROLE: Data Analyst / Business Analyst Trainee
-- =========================================================================

-- -------------------------------------------------------------------------
-- 1. DATABASE & SCHEMA CREATION
-- -------------------------------------------------------------------------
-- Ensuring a clean slate by dropping the database if it already exists, 
-- then initializing a fresh schema for employee records.
DROP DATABASE IF EXISTS TechCorp_Analytics;
CREATE DATABASE TechCorp_Analytics;
USE TechCorp_Analytics;

-- -------------------------------------------------------------------------
-- 2. TABLE ARCHITECTURE WITH CONSTRAINTS
-- -------------------------------------------------------------------------
-- Implementing structural integrity using Key constraints (PRIMARY KEY),
-- Nullability rules (NOT NULL), and operational default conditions (DEFAULT).
CREATE TABLE employee_records (
    emp_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) DEFAULT 'General Operations',
    salary DECIMAL(10, 2) NOT NULL,
    joining_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (emp_id)
);

-- -------------------------------------------------------------------------
-- 3. DATA INSERTION OPERATIONS (C in CRUD)
-- -------------------------------------------------------------------------
-- Populating the table with core test cases, including an edge case scenario
-- where the 'department' field relies entirely on the system's DEFAULT constraint.
INSERT INTO employee_records (first_name, last_name, department, salary, joining_date)
VALUES 
('Aarav', 'Sharma', 'Data Analytics', 65000.00, '2025-01-15'),
('Ananya', 'Patil', 'Business Intelligence', 72000.00, '2025-03-22'),
('Vihaan', 'Joshi', 'Data Engineering', 85000.00, '2024-11-01'),
('Diya', 'Iyer', 'Data Analytics', 61000.00, '2026-02-10'),
('Kabir', 'Deshmukh', DEFAULT, 45000.00, '2026-05-18');

-- -------------------------------------------------------------------------
-- 4. DATA RETRIEVAL & ADVANCED FILTERING (R in CRUD)
-- -------------------------------------------------------------------------

-- Query 4.1: Fetch complete dataset to verify system state
SELECT * FROM employee_records;

-- Query 4.2: Filter dataset using conditional operators (WHERE clause)
-- Isolation of high-earning assets within the Data Analytics workspace.
SELECT first_name, last_name, salary 
FROM employee_records
WHERE department = 'Data Analytics' AND salary >= 65000.00;

-- Query 4.3: Pattern matching using Wildcards (LIKE operator)
-- Extracting personnel whose surnames match regional identifiers ('shmukh', 'sharma', etc.)
SELECT emp_id, first_name, last_name 
FROM employee_records
WHERE last_name LIKE '%sh%';

-- -------------------------------------------------------------------------
-- 5. DATA MODIFICATION & RECORD PURGING (U & D in CRUD)
-- -------------------------------------------------------------------------

-- Query 5.1: Executing conditional data updates
-- Appraising compensation structures based on role performance metrics.
UPDATE employee_records
SET salary = 68000.00
WHERE first_name = 'Aarav' AND last_name = 'Sharma';

-- Query 5.2: Executing safe record purging
-- Removing probationary/inactive records based on operational parameters.
DELETE FROM employee_records
WHERE emp_id = 5;

-- Final Verification Check
SELECT * FROM employee_records;
