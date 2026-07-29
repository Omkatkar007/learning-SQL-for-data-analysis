-- view 
-- view is like virtual table which stores querys and it is like functons in pyhton 

select * from orders; 

create view delivered_orders as 
select order_id,customer_name,test_city,product,category,quantity
from orders where order_status = "delivered";

select * from delivered_orders; 

-- changes made in virtual (view) and physical (table) gets  updated on both and affects both for ex.
update orders set 
customer_name = "dr amit" where order_id = 1;
-- gets upated on both view and table 

-- dropping a view 
drop view delivered_orders; 
