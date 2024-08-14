USE sakila;
--  Find all customers and the titles of films they have rented, including customers who have not rented any films.
SELECT 
c.first_name, c.last_name, f.title
FROM customer AS c
LEFT JOIN rental AS r ON c.customer_id = r.customer_id
LEFT JOIN inventory AS i ON r.inventory_id = i.inventory_id
LEFT JOIN film AS f ON i.film_id = f.film_id;


-- List all films and their rental details, including films that have never been rented.

SELECT 
f.title, r.rental_id, r.rental_date
FROM film AS f
LEFT JOIN inventory AS i ON f.film_id = i.film_id
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id;

-- Retrieve the first names, last names of all actors and the films they have acted in, including actors who have not acted in any films.

SELECT 
a.first_name, a.last_name, f.title
FROM actor AS a
LEFT JOIN film_actor AS fa ON a.actor_id = fa.actor_id
LEFT JOIN film AS f ON fa.film_id = f.film_id;

-- List all films and their categories, including films that do not belong to any category.

SELECT 
f.title, c.name AS category
FROM film AS f
LEFT JOIN film_category AS fc ON f.film_id = fc.film_id
LEFT JOIN category AS c ON fc.category_id = c.category_id;

-- List all customers and the payments they have made, including customers who have not made any payments.

SELECT 
c.first_name, c.last_name, p.amount, p.payment_date
FROM customer AS c
LEFT JOIN payment AS p ON c.customer_id = p.customer_id;

-- Find all films and the languages they are in, including films with no specified language.

SELECT f.title, l.name AS language
FROM film AS f
LEFT JOIN language AS l ON f.language_id = l.language_id;

--  Bring out the id, date of  rental records and the first name and last named of staff members who processed them, including rentals with no associated staff.

SELECT 
r.rental_id, 
r.rental_date, s.first_name, s.last_name
FROM rental AS r
LEFT JOIN staff AS s ON r.staff_id = s.staff_id;


USE sql_invoicing;
SELECT* 
FROM payments p
JOIN clients c
USING (client_id);

SELECT p.date, pm.name,p.amount, pm.payment_method_id
FROM payments p
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id;


-- Natural and Cross Joins
USE sql_store;
SELECT *
FROM orders o
NATURAL JOIN customers c;

-- cross join
SELECT *
FROM customers c
CROSS JOIN products p;

-- UNIONS
SELECT  order_date, order_id, 'Active' AS Status
FROM orders
WHERE order_date >= '2019-01-01'
UNION
SELECT order_date, order_id, 'Archive' AS Status
FROM orders
WHERE order_date < '2019-01-01';


SELECT first_name
FROM customers
UNION
SELECT `name`
FROM shippers;

SELECT customer_id, first_name, points, 'Bronze'AS Type
FROM customers
WHERE points <2000
UNION
SELECT customer_id, first_name, points, 'Silver' AS Type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id, first_name, points, 'Gold' AS Type
FROM customers
WHERE points> 3000
ORDER BY first_name;

CREATE TABLE order_2 
SELECT*
FROM orders;
TRUNCATE order_2;

USE sql_invoicing;
UPDATE invoices
SET payment_total = 15,
	payment_date = '2019-01-01'
    WHERE invoice_id = 1;
    
UPDATE invoices
SET payment_total = invoice_total * 0.75,
payment_date = due_date
WHERE client_id = 5;
SELECT * 
FROM invoices;
UPDATE invoices
SET payment_total = invoice_total * 0.75
WHERE client_id IN (1,2)

