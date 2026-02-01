-- View -----------------------------------------------------------------------------

use regex1;

-- =============================================================================================================
create table newactor as 
select actor_id ,first_name from sakila.actor where actor_id between 1 and 5;

select * from newactor;

create view actor_v as 
select * from newactor where actor_id in (1,2);  -- view created  -- simple view  -- changes are allowed 

select * from actor_v;

-- -------------------------------------------------------------------------------------------------------------

-- inset in view 

insert into actor_v values (6 ,'newdata');