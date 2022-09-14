-- 1. In the table actor, which are the actors whose last names are not repeated? 
SELECT DISTINCT(last_name), actor_id, first_name FROM sakila.actor;

-- 2. Which last names appear more than once?
SELECT last_name, COUNT(last_name) AS '#', actor_id, first_name FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT COUNT(rental_id), staff_id FROM sakila.rental
group by staff_id;

-- 4. Using the film table, find out how many films were released each year.
SELECT count(release_year) FROM sakila.film;
-- the only release year is 2006

-- 5. Using the film table, find out for each rating how many films were there.
SELECT rating, count(film_id) FROM sakila.film
Group by rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, round(AVG(length),2) as 'average_legnth' FROM sakila.film
Group by rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, round(AVG(length),2) as 'average_legnth' FROM sakila.film
Group by rating
HAVING AVG(length) > 120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column).
-- In your output, only select the columns title, length, and the rank.
SELECT * FROM sakila.film;
SELECT title, rating, length FROM sakila.film
WHERE length <> '' OR null
ORDER BY length DESC;