select * from orders;

select city,category,sum(price_per_unit) from orders
group by city,category with ROLLUP;

--	alter table orders
--	rename column test_city to city;

SELECT category,
       COUNT(*) AS total_orders
FROM orders
GROUP BY category WITH ROLLUP;

SELECT
    city,
    category,
    SUM(quantity * price_per_unit) AS total_sales
FROM orders
GROUP BY city, category WITH ROLLUP;