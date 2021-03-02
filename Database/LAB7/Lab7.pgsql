--TASK1
select distinct film.title, film.rating, category.name 
from film 
JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    JOIN inventory ON film.film_id = inventory.film_id 
    JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE (film.rating = 'R' OR film.rating = 'PG-13') 
    AND (category.name = 'Horror' OR category.name = 'Sci-Fi') 
    AND rental.return_date is not null;

explain analyze 
select distinct film.title, film.rating, category.name 
from film 
    JOIN film_category ON film.film_id = film_category.film_id 
    JOIN category ON film_category.category_id = category.category_id 
    JOIN inventory ON film.film_id = inventory.film_id 
    JOIN rental ON inventory.inventory_id = rental.inventory_id  
WHERE (film.rating = 'R' OR film.rating = 'PG-13') 
AND (category.name = 'Horror' OR category.name = 'Sci-Fi') 
AND rental.return_date is not null;

--TASK2
select staff.store_id, SUM(payment.amount) as sum
from payment
    JOIN staff ON staff.staff_id = payment.staff_id
WHERE payment.payment_date > (SELECT MAX(payment_date) FROM payment) - INTERVAL '30 days' 
GROUP BY staff.store_id;
explain analyze
select staff.store_id, SUM(payment.amount) as sum
from payment
    JOIN staff ON staff.staff_id = payment.staff_id
WHERE payment.payment_date > (SELECT MAX(payment_date) FROM payment) - INTERVAL '30 days' 
GROUP BY staff.store_id ;

-- in both tasks JOIN operation is costly expensive an can be 
-- creating an INDEX on NULL_DATE for RETURN_DATE and PAYMENT_SUM on 
-- AMOUNT coulumn. 