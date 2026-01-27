-- CTE -> common table expression 
-- temporary name of your sql query 
-- exist upto semicolon (;)
with Tarun_cte as
 (Select * from sakila.actor where actor_id between 5 and 99 )
 
 select count(*) from Tarun_cte;
 
 -- store data on temporary basis 
 -- complex query into reagble format 
 
 
 with cte as (select * from sakila.payment)
 
 select month(payment_date) , count(*) from cte group by month(payment_date);
 
 select * from sakila.payment where salary =(select max(amount) <(select max(amount)));
 
 with cte as
 (select * , dense_rank() over(partition by customer_id order by amount desc) as ranking from sakila.payment)
 
 select * from cte where ranking =2; 
 -- =================================================================================================================
create database test90;
use test90;

CREATE TABLE employee (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50),
    department VARCHAR(30),
    salary     INT,
    manager_id INT
);

INSERT INTO employee (emp_id, emp_name, department, salary, manager_id) VALUES
(1, 'Alice',   'HR',      50000, NULL),
(2, 'Bob',     'HR',      45000, 1),
(3, 'Charlie', 'HR',      55000, 1),

(4, 'David',   'IT',      70000, NULL),
(5, 'Eva',     'IT',      65000, 4),
(6, 'Frank',   'IT',      72000, 4),
(7, 'Grace',   'IT',      68000, 4),

(8, 'Henry',   'Sales',   60000, NULL),
(9, 'Irene',   'Sales',   58000, 8),
(10,'Jack',    'Sales',   62000, 8);


select * from employee;

select department, avg(salary) from employee group by department;
-- correlated
select emp_id, emp_name,department,salary from employee as e
where salary>( select avg(salary) from employee where department=e.department);

-- cte
with cte as (
select department as dept, avg(salary) as deptsalary from employee group by department)

select  emp_id, emp_name,department,salary, dept, deptsalary
from employee as e join cte where e.department=cte.dept
and salary>deptsalary;


-- ================================================================================================










