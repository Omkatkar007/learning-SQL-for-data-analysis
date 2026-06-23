use ecom;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(150) UNIQUE,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    department VARCHAR(50) DEFAULT 'General',
    salary DECIMAL(10,2) CHECK (salary > 0),
    joining_date DATE DEFAULT (CURRENT_DATE)
);
INSERT INTO employees (email, name, age, salary)
VALUES ('amit@company.com', 'Amit Sharma', 25, 45000);

-- Trying to insert the same email again will fail.

INSERT INTO employees (email, age, salary)
VALUES ('neha@company.com', 24, 40000);

-- This will fail because name cannot be NULL.

INSERT INTO employees (email, name, age, salary)
VALUES ('rahul@company.com', 'Rahul Khan', 16, 30000);

-- This will fail because age must be 18 or above.

INSERT INTO employees (email, name, age, salary)
VALUES ('pooja@company.com', 'Pooja Nair', 26, 50000);

-- department will be set to General
-- joining_date will be set to today’s date

SELECT * FROM employees;





