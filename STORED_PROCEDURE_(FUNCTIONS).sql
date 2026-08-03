-- stored procedure  = functions in python 
use ecom;

delimiter // 
create procedure get_delivered_orders()
begin 
  select * from orders
  where order_status = 'delivered';
end //
delimiter ;

call get_delivered_orders();

-- stored_procedures with parameter 

delimiter //
create procedure get_orders_by_citys(in city_name varchar(50))
begin 
 select * from orders 
 where city = city_name;
end //
delimiter ; 

call get_orders_by_citys('delhi');