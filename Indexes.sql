use ecom;

-- index increases select (read speed) decrease update insert delete (writespeed) 

select * from orders;

create index idx_orders_test_city
on orders(test_city);  

-- composite multiple columns 
create index idx_orders_test_city_quantity
on orders(test_city,quantity);  

-- removing index 
drop index idx_orders_test_city_quantity
on orders;