

use ecom;

-- task 1  create
create table tasks( 
  order_id int primary key auto_increment,
  customer_name varchar(100),
  bean_type varchar(100),
  quantity_lbs int,
  total_price decimal(5,2),
  order_date date
  );
  
-- task 2  insert 
insert into tasks(order_id, customer_name, bean_type, quantity_lbs, total_price, order_date)
values
(1000,'alicesmith', 'ethoricpen bean', 2, 34.50, '2023-10-24');

-- task 3 
select * from tasks;
select customer_name, bean_type from tasks; 
select * from tasks where total_price > 30.00;
select * from tasks where total_price > 1 and quantity = 2; 
select * from tasks where order_id = 1000 or quantity > 1;

