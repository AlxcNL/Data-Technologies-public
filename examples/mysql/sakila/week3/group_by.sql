SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating;
