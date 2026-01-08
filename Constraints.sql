-- Constraints
-- constraints are the rule that we apply on the table to restrict the invalid data entry 
-- it maintain the data accuracy and consistancy
-- if the data is invalid so the complete operation will be aborded 

-- table -> DDl (Data Degination Language )
   --  create , alter , drop , truncate 
   
create database ddl;
create table test1 ( sno int ); -- table created 
describe test1;


-- =====================================================
-- DML (Data manipulation language ) 
insert into test1 values(10);
Select * from test1;

insert into test1(sno) values(20);

insert into test1(sno) values(20),(null),(30); -- 3 rows inserted 

Select count(sno) , count(*) from test1;
-- count(*) count the null values also 

-- =====================================================================================================================
create table test2 (sno int not null , salary int );
insert into test2(sno,salary) values (20,10000);
insert into test2(sno,salary) values (20,null);
insert into test2(sno,salary) values (null,10000); -- erroe becoz sno has constraint as not null 
insert into test2(salary) values (20000); -- erroe becoz sno has constraint as not null and no default set 
select * from test2;

-- =========================================================================================================================

create table test3(sno int not null default 10, salary int );
insert into test3(salary) values(25000);
select * from test3;

-- ==========================================================================================================================

create table test4(sno int not null default 10, salary int unique default 99999 );
select * from test4;
insert into test4(sno,salary) values (2,10000);
insert into test4(sno,salary) values (3,10000); -- error because salary has unique constraint 
insert into test4(sno) values (4);
insert into test4(sno) values (5); -- not working because default value is used in above query and salary has unique constraints 
insert into test4(sno,salary) values (6,null);
insert into test4(sno,salary) values (7,null); -- unique key have multiple null values 

-- =================================================================================================================================

-- conditions 
-- check (column_name range )

create table test5(sno int , salary int ,
check (sno between 1 and 100) ,
check (salary in (1000,2000)));
select * from test5;
insert into test5(sno,salary) values (2,1000);
insert into test5(sno,salary) values (150,1000); -- error because of check constraint is not follow 
insert into test5(sno,salary) values (10,1500); -- error

-- ===================================================================================================================================

create table test6(sno int , salary int ,
constraint regex_test6_sno_chk check (sno between 1 and 100) ,
constraint regex_test6_salary_chk check (salary in (1000,2000)));

insert into test6(sno,salary) values (2,1000);
insert into test6(sno,salary) values (150,1000); -- error 	insert into test6(sno,salary) values (150,1000)	Error Code: 3819. Check constraint 'regex_test6_sno_chk' is violated.	0.000 sec

-- ==================================================================================================================================

create table employee(
empid int primary key ,
empname varchar(20),
email varchar(20) unique ,
college varchar(20) default "CET" ,
age int , constraint employee_age_chk check (age >18) , 
guardianName varchar(20) , constraint employee_guardianName_chk check ( guardianName = reverse(guardianName))
);
insert into employee values(1 , "Ram" , "Ram0125" ,"Ram0125" ,20 , "bob");
select * from employee ; 














