USE sakila;

-- Total number of films 
SELECT count(*) AS Total_films
FROM film;

-- Highest rental rate for any file
SELECT max(rental_rate) AS Highest_rental_rate
FROM film;

-- Lowest rental rate for any film
SELECT min(rental_rate) AS Lowest_renatl_rate
FROM film;

-- Total amount of payment made by customers
SELECT sum(amount) AS Total_payment
FROM payment;

-- Average rental durations of film
SELECT avg(rental_duration) AS Average_rental_duration
FROM film;

-- Total Number of Customers
SELECT sum(customer_id) AS Total_customers
FROM customer;

-- Maximum length of any film
SELECT max(length) AS Maximum_length_film
FROM film;

-- MInimum length of film
SELECT min(length) AS Minimum_length_film
FROM film;

-- Total Number of rental made
SELECT count(*) AS Total_rental_made
FROM rental;

-- Average payment amount
SELECT avg(amount) AS Average_payment
FROM payment;

-- Total inventory of film in all the stores
SELECT count(*) AS Total_inventory
FROM inventory;

-- Average replacement cost
SELECT avg(replacement_cost) AS Average_replacement_cost
FROM film;

-- Total staff members
SELECT count(*) AS Total_staff_members
FROM staff;