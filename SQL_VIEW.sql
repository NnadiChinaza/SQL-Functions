-- List of Actors (ID, First_name, Last_name) that acted in movies where language is English
-- From the list, only show movies that includes the word Home in the title


-- USING CONNECTORS TO JOIN 4 DIFFERENT TABLES
USE sakila;
SELECT a.actor_id, first_name, last_name, title, l.language_id, `name`
FROM actor a,
	film_actor fa,
    film f,
    `language` l
    WHERE a.actor_id = fa.actor_id
    AND fa.film_id = f.film_id
    AND f.language_id = l.language_id
    ORDER BY a.actor_id;
    
    
    
SELECT * FROM sakila.english_movies;
SELECT *
FROM english_movies
WHERE title LIKE ("%HOME%")