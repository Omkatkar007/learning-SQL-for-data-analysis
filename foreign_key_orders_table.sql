use ecom; 
select * from orders; 

alter table orders
add column seller_id int;

alter table orders 
add constraint fk_orders_sellers
foreign key(seller_id)
references sellers(seller_id); 

insert into orders(customer_name, product, seller_id)
values("om", "mobile",1);

select * from orders;