-- Active: 1772533108931@@127.0.0.1@3306@sakila
SELECT c.first_name, c.last_name, ct.city
FROM customer AS c
INNER JOIN address AS a
ON c.address_id = a.address_id
INNER JOIN city AS ct
ON a.city_id = ct.city_id;

-- can be broken down into

SELECT c.first_name, c.last_name, a.address_id
FROM customer AS c
INNER JOIN address AS a
ON c.address_id = a.address_id

SELECT a.address_id, ct.city
FROM address AS a
INNER JOIN city AS ct
ON a.city_id = ct.city_id;

