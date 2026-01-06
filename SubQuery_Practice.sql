-- single row subquery 
-- return => 1 Row 
select * from payment ;

-- nested query return more than one row  then we can use comparision operator with single row subquery but we can't use with multirowsubquery 
select * from payment where amount in (select amount from payment where payment_id=3 or payment_id=2);

-- Any with comparison operator 
select * from payment where amount >=any (select amount from payment where payment_id=3 or payment_id=2);

select * from payment where amount <=any (select amount from payment where payment_id=3 or payment_id=2);

-- All with comaprision operator 
-- greatrer then maximum or subquery 
select * from payment where amount >all (select amount from payment where payment_id=3 or payment_id=2);

select * from payment where amount <all (select amount from payment where payment_id=3 or payment_id=2);
-- ========================================================================================================
-- Q 
-- Get all the payment info where the month of payment should be same as of payment id 2 or 3 

select * from payment where month(payment_date) =any (select month(payment_date) from payment where payment_id=3 or payment_id=2);

-- get all the payment info whose amount is larger then among all the amount from the payment id 2 to 8 

select * from payment where amount >all (select amount from payment where amount between 2 and 8 );

-- 

