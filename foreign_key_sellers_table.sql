use ecom;
create table sellers(
 seller_id INT primary key auto_increment,
 seller_name varchar(50) unique not null,
 city varchar(50));
 
 insert into sellers 
 values(1, "amazon", "pune");
 
 delete from sellers
 where seller_id = 1;
 
 select * from sellers;