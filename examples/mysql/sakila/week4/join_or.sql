SELECT f.title, CONCAT(a.first_name, ' ', a.last_name) AS fullname
FROM film AS f
INNER JOIN film_actor AS fa
ON f.film_id = fa.film_id
INNER JOIN actor AS a
ON fa.actor_id = a.actor_id
WHERE ( 
    (a.first_name = 'CATE' AND a.last_name = 'MCQUEEN') OR
    (a.first_name = 'CUBA' AND a.last_name = 'BIRCH')        
);

