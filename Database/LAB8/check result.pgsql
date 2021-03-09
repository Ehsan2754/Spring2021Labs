SELECT A.address_id,LA,LO
FROM address AS A 
INNER JOIN city AS B 
USING(city_id)
WHERE 
A.address_id<=400
and A.address_id>=200
and A.address LIKE '%11%'
ORDER BY address_id;
