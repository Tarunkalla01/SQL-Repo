use world;
select * from city;
-- city(pk = id) , countrycode is the foreign key 
describe city; 
select * from country;
select count(code),count(distinct code) from country; -- country code may be primary key 
-- code (primary key) 

-- join : it is used to connect two or more tables 
 -- as : use to create alias name 
 
select cy.name, cy.id , cy.countrycode from city as cy ;

select cy.name, cy.id , cy.countrycode,cnt.name,cnt.continent from city as cy join country as cnt where cy.countrycode = cnt.code;

-- Q  find the city name , population ,the country name along with the govt. form for each city ?
select ct.name , ct.population, cntr.governmentform,cntr.name  from city as ct  join country as cntr where ct.countrycode = cntr.code;


-- Q get the country name , population and the language spoken with the % of each language 
select cntr.name , cntr.population ,cl.language,cl.percentage  from country as cl join country as cntr where cl.countrycode= cntr.code;
 


