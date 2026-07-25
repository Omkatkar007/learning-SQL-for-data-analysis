# MySQL Notes & Practice Repository

## Overview

This repository contains beginner-to-advanced MySQL notes, syntax,
examples, and practice queries.

## Topics

-   Database & Tables
-   CRUD Operations
-   Constraints
-   Keys
-   Joins
-   Aggregate Functions
-   GROUP BY / HAVING
-   Subqueries
-   Views
-   Indexes
-   Transactions
-   Stored Procedures
-   Triggers

## Requirements

-   MySQL 8.x (recommended)
-   MySQL Workbench or any SQL client

## Basic Commands

``` sql
CREATE DATABASE demo;
USE demo;

CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

INSERT INTO students VALUES (1,'Alice',20);

SELECT * FROM students;

UPDATE students SET age=21 WHERE id=1;

DELETE FROM students WHERE id=1;
```

## Learning Roadmap

1.  SQL Basics
2.  Table Design
3.  Filtering & Sorting
4.  Joins
5.  Aggregations
6.  Subqueries
7.  Views
8.  Indexes
9.  Transactions
10. Procedures & Triggers

## Practice

Solve at least 10 SQL problems daily and build small databases.

## License

Free to use for learning.
