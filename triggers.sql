use ecom;
CREATE TABLE order_cancellations (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    cancelled_on DATETIME,
    reason VARCHAR(100)
);

delimiter //
create trigger cancel_log 
after update on orders 
for each row 
begin 
 if new.order_status = 'cancelled'
  and old.order_status <> 'cancelled' then 
  
  insert into order_cancellations(order_id,cancelled_on,reason)
  values(new.order_id,now(),'order cancelled by user');
 end if;
end // 
delimiter ; 

-- test 
use ecom;
update orders
set order_status = 'cancelled'
where order_id = 2;

select * from order_cancellations;








