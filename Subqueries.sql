-- subqueries -- query inside a query 

select * from orders            -- in where
where price_per_unit > (select avg(price_per_unit) from orders);

select * from orders  -- with in    -- little inreliable 
where test_city in (select test_city from orders where category = "electronics");

select order_id,customer_name,test_city,price_per_unit,(select avg(price_per_unit) from orders) as avg_price_per from orders; -- in select

-- exists 