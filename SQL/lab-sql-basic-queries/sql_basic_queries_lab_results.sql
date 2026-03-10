-- challenge 1: Display all available tables in the Sakila database.
USE sakila;
SHOW TABLES;

-- challenge 2: Retrieve all the data from the tables actor, film and customer.
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;
SELECT * FROM sakila.customer;

-- I combined all the 3 tables together and I got a lack of memory error. so I had to run them seperately.

-- challenge 3.1: Titles of all films from the film table
SELECT title FROM film;

-- challenge 3.2: List of languages used in films, with the column aliased as language from the language table.
SELECT name FROM language AS language;

-- challenge 3.3: List of first names of all employees from the staff table
SELECT first_name FROM staff;

-- challenge 4: Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- challenge 5.1: Determine the number of stores that the company has.
SELECT COUNT(DISTINCT store_id) AS number_of_stores FROM store;

-- challenge 5.2: Determine the number of employees that the company has.
SELECT COUNT(DISTINCT staff_id) AS number_of_employees FROM staff;

-- challenge 5.3: Determine how many films are available for rent and how many have been rented.
SELECT (SELECT COUNT(*) FROM inventory) AS available_for_rent,
(SELECT COUNT(*) FROM rental) AS rented;

-- challenge 5.4: Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS distinct_last_names FROM actor;

-- challenge 6: Retrieve the 10 longest films.
SELECT title, length FROM film
order by length DESC
LIMIT 10;

-- challenge 7.1: Retrieve all actors with the first name "SCARLETT".
SELECT * FROM actor
WHERE first_name = "SCARLETT";

-- challenge 7.2: Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title, length FROM film
where title like "%ARMAGEDDON%" AND length > 100;

-- challenge 7.3: Determine the number of films that include Behind the Scenes content
SELECT count(*) AS films_with_behind_the_scenes FROM film
where special_features like "%Behind the Scenes%";
