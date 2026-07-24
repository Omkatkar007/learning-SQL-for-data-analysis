-- =========================================================
-- STEP 1: CREATE AND USE A NEW DATABASE
-- =========================================================
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- =========================================================
-- STEP 2: CREATE TABLES (Parent & Child)
-- =========================================================

-- Parent Table: 'departments'
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

-- Child Table: 'employees'
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- =========================================================
-- STEP 3: INSERT SAMPLE DATA
-- =========================================================

-- Populate departments
INSERT INTO departments (department_name) VALUES 
('Logistics'),
('Data Analytics'),
('Human Resources'),
('Marketing'); -- Marketing has NO employees assigned

-- Populate employees
INSERT INTO employees (first_name, salary, department_id) VALUES 
('Rahul', 60000.00, 1),  -- Belongs to Logistics
('Priya', 85000.00, 2),  -- Belongs to Data Analytics
('Amit',  55000.00, 1),  -- Belongs to Logistics
('Neha',  72000.00, 2),  -- Belongs to Data Analytics
('Suresh', 50000.00, 3), -- Belongs to HR
('Vikram', 45000.00, NULL); -- Unassigned (NULL department_id)

-- =========================================================
-- STEP 4: RUN YOUR FIRST INNER JOIN PRACTICE QUERY
-- =========================================================

select * from employees;
select * from departments;

select a.first_name, a.salary, b.department_name
from employees as a
inner join  departments as b
on a.department_id = b.department_id;

select a.first_name, a.salary, b.department_name
from employees as a
left join  departments as b
on a.department_id = b.department_id;



SELECT e.first_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d ON e.department_id = d.department_id

UNION

SELECT e.first_name, d.department_name
FROM employees AS e
RIGHT JOIN departments AS d ON e.department_id = d.department_id;

SELECT e.first_name, d.department_name
FROM employees AS e
CROSS JOIN departments AS d;
-- No "ON" clause needed! It just multiplies the rows (6 employees x 4 depts = 24 total rows).


