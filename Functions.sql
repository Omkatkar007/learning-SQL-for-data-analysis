use ecom;
select sum(lobby_id*match_id) 
from test;


-- Aggregate Functions
-- These work on multiple rows and return a single value.

SELECT COUNT(*) 
FROM orders;

-- Returns the total number of orders.

SELECT SUM(quantity * price_per_unit) AS total_revenue
FROM orders;

-- Calculates total revenue.

SELECT AVG(price_per_unit)
FROM orders;

-- Returns the average product price.

SELECT AVG(price_per_unit)
FROM orders;

-- Returns the average product price.

SELECT MIN(price_per_unit), MAX(price_per_unit)
FROM orders;

-- Finds the cheapest and most expensive products.

-- Scalar Functions
-- These work on each row individually.


SELECT customer_name, ROUND(price_per_unit, 0)
FROM orders;

-- Rounds the price to the nearest whole number.

SELECT UPPER(customer_name), LOWER(city)
FROM orders;

-- Converts text to uppercase or lowercase.

SELECT customer_name, LENGTH(customer_name)
FROM orders;

-- Returns the number of characters in a string.

-- Date Functions

SELECT CURRENT_DATE;

-- Returns today’s date.

-- DATEDIFF
SELECT order_id, DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

-- Calculates delivery time in days.

-- Using Functions with WHERE
SELECT *
FROM orders
WHERE YEAR(order_date) = 2025;

-- Filters orders placed in 2025.












