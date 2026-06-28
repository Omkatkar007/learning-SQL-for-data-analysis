-- MySQL Basics Practice
-- =====================
-- THEORY
-- MySQL is a relational database.
-- SQL categories:
-- DDL: CREATE, ALTER, DROP, TRUNCATE
-- DML: INSERT, UPDATE, DELETE
-- DQL: SELECT
-- DCL: GRANT, REVOKE
-- TCL: COMMIT, ROLLBACK, SAVEPOINT

-- Create database
CREATE DATABASE IF NOT EXISTS practice_db;
USE practice_db;

-- Create table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    city VARCHAR(100)
);

-- Insert
INSERT INTO students(name, age, city)
VALUES ('Alice',20,'Mumbai'),
       ('Bob',22,'Pune');

-- Select
SELECT * FROM students;
SELECT name, city FROM students;
SELECT * FROM students WHERE age > 20;
SELECT * FROM students ORDER BY age DESC;
SELECT COUNT(*) FROM students;

-- Update
UPDATE students
SET city='Nashik'
WHERE id=1;

-- Delete
DELETE FROM students
WHERE id=2;

-- Alter table
ALTER TABLE students ADD email VARCHAR(100);

-- Drop examples (be careful)
-- DROP TABLE students;
-- DROP DATABASE practice_db;
