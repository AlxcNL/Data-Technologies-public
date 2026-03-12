SELECT f.title
FROM film AS f
INNER JOIN film_actor AS fa1
ON f.film_id = fa1.film_id
INNER JOIN actor AS a1
ON fa1.actor_id = a1.actor_id
INNER JOIN film_actor AS fa2
ON f.film_id = fa2.film_id
INNER JOIN actor AS a2
ON fa2.actor_id = a2.actor_id
WHERE ( 
    (a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN') AND
    (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH')        
);
