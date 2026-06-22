-- update
use ecom;
select * from orders;
update orders
set quantity = 1 
where customer_name = 'priya singh';

-- to avoid same names use primary key to avoiding duplicate adding of data 

update orders
set quantity = 1 
where customer_name = 'priya singh' and  order_id = 4;

-- delete 
select * from orders;
 delete from orders
 where order_id = 1;
