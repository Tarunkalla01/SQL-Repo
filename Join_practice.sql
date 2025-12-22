select * from actor;  -- actor_id is primary key 
select * from film_actor;  -- actor_id is foreign  key
select count(film_id) , count(distinct film_id) from film_actor; 

select a.first_name,a.actor_id from  actor as a join film_actor as fa where a.actor_id=fa.actor_id;

-- =============================================================================================================
select * from film;  -- film_id is a primary key
select * from film_actor; 
desc film_actor;

select  fa.film_id , fa.actor_id,f.film_id,f.title from film_actor as fa
join film as f
where fa.film_id=f.film_id;

-- ============================================================================================================================
-- Q ) 
select * from film_actor;
select * from actor;
select * from film;
select a.first_name , a.last_name ,f.title from actor as a join film_actor as fa join film as f  where a.actor_id=fa.actor_id and fa.film_id=f.film_id;









