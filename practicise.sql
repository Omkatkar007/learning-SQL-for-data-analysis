use ecom; 
create table demo_prac (
    name varchar(40) primary key,
    gmail varchar(40),
    phone_no varchar(40),
    sign_up date,
    amount_spend decimal 
);

insert into demo_prac (name, gmail, phone_no, sign_up, amount_spend)
values
('om', 'omk@gmail.com', '975403030', '6-10-26', 12460.45);

select * from demo_prac 