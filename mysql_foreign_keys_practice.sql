/*
MySQL Practice - Foreign Keys
*/
CREATE DATABASE IF NOT EXISTS mysql_practice;
USE mysql_practice;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

INSERT INTO departments VALUES
(101,'HR'),(102,'IT'),(103,'Finance');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(1,'Rahul',45000,101),
(2,'Priya',55000,102),
(3,'Amit',60000,103);

-- Invalid example
-- INSERT INTO employees VALUES (4,'John',50000,999);

SELECT * FROM employees e JOIN departments d
ON e.dept_id=d.dept_id;

CREATE TABLE students(
 student_id INT PRIMARY KEY,
 student_name VARCHAR(50)
);

CREATE TABLE marks(
 mark_id INT PRIMARY KEY,
 subject VARCHAR(30),
 marks INT,
 student_id INT,
 FOREIGN KEY(student_id) REFERENCES students(student_id)
 ON DELETE CASCADE
);

CREATE TABLE categories(
 category_id INT PRIMARY KEY,
 category_name VARCHAR(30)
);

CREATE TABLE products(
 product_id INT PRIMARY KEY,
 product_name VARCHAR(50),
 category_id INT,
 FOREIGN KEY(category_id) REFERENCES categories(category_id)
 ON DELETE SET NULL
);
