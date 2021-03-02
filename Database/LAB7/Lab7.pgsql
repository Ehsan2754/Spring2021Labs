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
