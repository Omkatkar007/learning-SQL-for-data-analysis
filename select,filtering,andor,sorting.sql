use ecom;
select * from orders;

--   selecting specific column 
--   selecting specific column 
select quantity, order_id from orders;

-- filtering 
select * from orders where city = 'delhi';
select * from orders where quantity > 10;

-- and or 
select * from orders where city = 'punr' and quantity > 11;
select * from orders where city = 'pune' and quantity = 1;

select * from orders where category = 'electronics' or category = 'furniture';

-- sorting  
select * from orders order by quantity desc; 
