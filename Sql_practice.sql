SELECT * FROM world.country;
--  Q)  you need to get govtForm and the total number of country for each govtform where the total countries is greater than 20
select GovernmentForm , count(name) from country group by GovernmentForm having count(name)>20;

select GovernmentForm , count(name) from country where Capital>30 group by GovernmentForm;
select count(name) , count(Region) ,sum(Population) from country where LifeExpectancy>38 group by continent having sum(Population)>300000;