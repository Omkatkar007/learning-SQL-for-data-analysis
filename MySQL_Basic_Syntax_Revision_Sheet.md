# MySQL Basic Syntax Revision Sheet

``` sql
-- Show databases
SHOW DATABASES;

-- Create database
CREATE DATABASE company;

-- Use database
USE company;

-- Show tables
SHOW TABLES;

-- Create table
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2)
);

-- Insert
INSERT INTO employees (name, age, salary)
VALUES ('Om', 21, 50000);

-- View data
SELECT * FROM employees;

-- Select columns
SELECT name, salary FROM employees;

-- Filter
SELECT * FROM employees WHERE age > 20;

-- AND / OR
SELECT * FROM employees
WHERE age > 20 AND salary > 40000;

-- Sort
SELECT * FROM employees ORDER BY salary DESC;

-- Limit
SELECT * FROM employees LIMIT 5;

-- Update
UPDATE employees
SET salary = 55000
WHERE id = 1;

-- Delete row
DELETE FROM employees WHERE id = 1;

-- Count
SELECT COUNT(*) FROM employees;

-- Average
SELECT AVG(salary) FROM employees;

-- Sum
SELECT SUM(salary) FROM employees;

-- Max / Min
SELECT MAX(salary), MIN(salary) FROM employees;

-- Group By
SELECT age, COUNT(*)
FROM employees
GROUP BY age;

-- Having
SELECT age, COUNT(*)
FROM employees
GROUP BY age
HAVING COUNT(*) > 1;

-- LIKE
SELECT * FROM employees
WHERE name LIKE 'O%';

-- IN
SELECT * FROM employees
WHERE age IN (20,21,22);

-- BETWEEN
SELECT * FROM employees
WHERE salary BETWEEN 30000 AND 60000;

-- Inner Join
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id;

-- Create View
CREATE VIEW emp_view AS
SELECT name, salary FROM employees;

-- Drop table
DROP TABLE employees;
```
