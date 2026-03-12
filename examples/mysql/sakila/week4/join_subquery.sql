SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer AS c
INNER JOIN address AS a
ON c.address_id = a.address_id
INNER JOIN city AS ct
ON a.city_id = ct.city_id;

-- can also be written as

SELECT c.first_name, c.last_name, addr.address, addr.city
FROM customer AS c
    INNER JOIN (
        SELECT a.address_id, a.address, ct.city
        FROM address AS a
        INNER JOIN city AS ct
        ON a.city_id = ct.city_id
    ) AS addr
    ON c.address_id = addr.address_id;
