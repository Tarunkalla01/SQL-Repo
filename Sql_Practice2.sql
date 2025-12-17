SELECT * FROM sakila.payment;
select customer_id , sum(amount) from payment where amount >3 group by customer_id;
select customer_id , count(amount) from payment where month(payment_date) =5 group by customer_id;

-- Q) you need to find out the max. amount of transaction and the average trans. amount and total trans. amount done by each staff
select max(amount) , avg(amount) , sum(amount) from payment group by staff_id  ;

-- Q)
select  max(amount) , avg(amount) , sum(amount) from payment where customer_id%2=0 group by staff_id;




-- Q) get the amount and total transaction done for each amount  only for the payment done though the staff id= 1 and the total transaction should be greater then 30
-- 
select amount,  count(*) from payment where staff_id=1 group by amount having count(amount)>30;



-- Q) find out avg the number of customer served and the total amount spend in each month for staff id =1 and 2 
select avg( amount), count(customer_id) , sum(amount) ,extract(month from payment_date) from payment where staff_id=1 or staff_id=2 group by extract(month from payment_date);



select * from payment order by customer_id desc, amount;