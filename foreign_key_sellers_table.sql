use ecom;
create table sellers(
 seller_id INT primary key auto_increment,
 seller_name varchar(50) unique not null,
 city varchar(50));
 
 select * from sellers;