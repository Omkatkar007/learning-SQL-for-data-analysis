SELECT order_id, customer_name AS name, city, product, price_per_unit
FROM orders

UNION

SELECT order_id, name, city, product, price_per_unit
FROM employee_orders; 








SELECT order_id, customer_name AS name, city, product, price_per_unit
FROM orders

UNION ALL

SELECT order_id, name, city, product, price_per_unit
FROM employee_orders;