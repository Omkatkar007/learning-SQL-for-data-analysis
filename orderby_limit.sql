use ecom; 
SELECT *
FROM orders
ORDER BY price_per_unit;  -- by default arranges in increasing order 

SELECT *
FROM orders
ORDER BY price_per_unit DESC; -- for ddecreasing order 

SELECT *
FROM orders
ORDER BY city ASC, price_per_unit DESC; -- multiple columns 

SELECT *
FROM orders
LIMIT 5;

-- Returns only the first 5 rows.

SELECT customer_name, product, price_per_unit
FROM orders
ORDER BY price_per_unit DESC
LIMIT 3;

-- Returns the top 3 most expensive orders.

SELECT *
FROM orders
ORDER BY order_date
LIMIT 5 OFFSET 5;

-- Skips the first 5 rows and returns the next 5.



