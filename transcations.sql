use ecom;
create table test( 
 gamer_id int primary key auto_increment,
 name varchar(10),
 lobby_id int,
 match_id decimal(4,2));
 
 insert into test ( gamer_id, name, lobby_id, match_id)
 values
 (100, 'apex', 569, 45.32);
 
 select * from test;
 
 -- transactions  (commit,savepoint,start transactions,rollback)
 
 START TRANSACTION;
 
 insert into test (name) values ('transac');
 
 savepoint name_created;
 
 insert into test (gamer_id) values (103);
 
 rollback to name_created;
 commit;
 
 