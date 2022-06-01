use sakila;

-- 1. List each pair of actors that have worked together.

SELECT title, actor1,actor2
FROM film f
JOIN 
(SELECT fac.actor_id as actor1, fa.actor_id as actor2,film_id
FROM film_actor fac
JOIN film_actor fa
USING(film_id)) as sub1 using(film_id)
WHERE actor1<>actor2;

-- 2. For each film, list actor that has acted in more films.
SELECT film_id, actor_id, MAX(amount_films_actor) as most_appeared_actor
FROM(
SELECT actor_id,COUNT(actor_id) as amount_films_actor
FROM film_actor
GROUP BY actor_id)sub1
JOIN film_actor USING(actor_id)
GROUP BY film_id
ORDER BY film_id;


