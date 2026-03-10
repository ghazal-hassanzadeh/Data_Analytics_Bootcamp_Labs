-- challenge 1: Write SQL queries to perform the following tasks using the Sakila database:
USE sakila;

-- challenge 2: Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT COUNT(*) AS copies_of_hunchback_impossible
FROM inventory AS i
JOIN film AS f
    ON i.film_id = f.film_id
WHERE f.title = 'Hunchback Impossible';
-- challenge 3: List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
);
-- challenge 4: Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT a.first_name, a.last_name FROM actor AS a
WHERE a.actor_id IN (
    SELECT fa.actor_id
    FROM film_actor AS fa
    JOIN film AS f
        ON fa.film_id = f.film_id
    WHERE f.title = 'Alone Trip'
);
