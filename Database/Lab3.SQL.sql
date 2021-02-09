--->> TASK1

--> TASK1.1
---$ select * 
---$ from address as a
---$ inner join city as c on a.city_id = c.city_id;

--> TASK1.2
---$ select * 
---$ from address as a
---$ inner join city as c on a.city_id = c.city_id
---$ where upper(city) like 'A%';

--> TASK1.3
---$ select first_name,last_name,city.city 
---$ from customer as cus
---$ inner join address as addr on cus.address_id = addr.address_id
---$ inner join city on addr.address_id = city.city_id;

--> TASK1.4
---$ select c.* 
---$ from customer as c
---$ inner join payment as p on p.amount > 11 and p.customer_id = c.customer_id

--> TASK1.5
---$ select * from customer  ou
---$ where (select count(*) from customer inr
---$ where inr.first_name = ou.first_name) > 1
---$ ;

--->> TASK2

--> TASK2.1
---$ create view members as select first_name , last_name, email from customer
---$ create view movies as select title , description, rating from film

--> Task2.2
---$ select * from movies
---$ select * from members

--> Task2.3

---$ create trigger safety on postgres
---$ for DROP_TABLE, ALTER_TABLE
---$ as
---$ /qecho 'You must disable Trigger "safety" to drop or alter tables!'
---$ rollback;
