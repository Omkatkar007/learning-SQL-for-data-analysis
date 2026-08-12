# SQL Learning & Practice

A collection of SQL concepts, queries, and practice exercises for learning and placement preparation.

## 📚 Topics Covered

- SQL Basics
- Database and Table Creation
- INSERT, UPDATE, DELETE
- SELECT and WHERE
- ORDER BY and GROUP BY
- Aggregate Functions
- HAVING
- DISTINCT
- LIMIT
- LIKE and Wildcards
- BETWEEN
- IN / NOT IN
- NULL Handling
- CASE Statements
- Joins
  - INNER JOIN
  - LEFT JOIN
  - RIGHT JOIN
  - FULL OUTER JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Views
- Constraints
- Indexes
- String Functions
- Date and Time Functions

## 🛠️ SQL Dialects

The examples are primarily written for **MySQL**. Some syntax may differ in Oracle, PostgreSQL, SQL Server, or other databases.

## 📁 Suggested Repository Structure

```text
SQL/
├── README.md
├── 01_basics.sql
├── 02_crud_operations.sql
├── 03_filtering_sorting.sql
├── 04_aggregate_functions.sql
├── 05_group_by_having.sql
├── 06_joins.sql
├── 07_subqueries.sql
├── 08_cte.sql
├── 09_window_functions.sql
├── 10_string_functions.sql
├── 11_date_functions.sql
└── practice/
    ├── beginner.sql
    ├── intermediate.sql
    └── advanced.sql
```

## 🎯 Purpose

This repository is created to:

- Build strong SQL fundamentals
- Practice writing queries
- Prepare for Data Analyst interviews
- Improve problem-solving skills
- Maintain a GitHub SQL portfolio

## 💡 Example Query

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;
```

## 🚀 How to Use

1. Install MySQL or use an online SQL editor.
2. Create a database.
3. Run the SQL files in order.
4. Modify the queries and experiment with different conditions.
5. Add your own practice questions and solutions.

## 📌 Placement Preparation

For Data Analyst roles, focus especially on:

- SELECT
- WHERE
- GROUP BY
- HAVING
- JOINs
- Subqueries
- CTEs
- Window Functions
- CASE WHEN
- Date Functions
- Aggregate Functions

## 👨‍💻 Author

**Om Katkar**

---

⭐ If this repository helped you practice SQL, consider giving it a star!
