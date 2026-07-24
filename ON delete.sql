-- on delete 
use ecom;
alter table orders
drop foreign key fk_orders_sellers;

select * from orders;

-- cascade 

alter table orders
add constraint fk_on
foreign key(seller_id)
references sellers(seller_id)
on delete cascade;

-- null
alter table orders
add constraint fk_on
foreign key(seller_id)
references sellers(seller_id)
on delete set null;

-- restrict
alter table orders
add constraint fk_on
foreign key(seller_id)
references sellers(seller_id)
on delete restrict;

