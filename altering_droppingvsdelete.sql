use ecom;
-- altering and droping 

-- altering 

select * from orders;
alter table orders
add column demo varchar(40),
modify customer_name varchar(1000),
rename column city to test_city;

alter table orders
drop column demo;


