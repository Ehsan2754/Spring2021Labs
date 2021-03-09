-- Creating the function get_addr
CREATE OR REPLACE FUNCTION get_addr()
RETURNS TABLE(
    address_id INTEGER,
    address VARCHAR(50),
    address2 VARCHAR(50),
    district VARCHAR(20),
    city VARCHAR(50)
) 
AS
$$
BEGIN
 RETURN QUERY
SELECT A.address_id,A.address,A.address2,A.district,B.city
FROM address AS A 
INNER JOIN city AS B 
USING(city_id)
WHERE A.address_id<=400
and A.address_id>=200
and A.address LIKE '%11%';
END
$$
LANGUAGE plpgsql;
-- ADDING COLUMNS TO TABLE ADDRESS
ALTER TABLE address 
ADD COLUMN LO FLOAT,
ADD COLUMN LA FLOAT;


