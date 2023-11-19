-- 1. List all customers who live in Texas (use JOINs)

SELECT first_name, last_name, address.address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';



-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, payment.amount
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;



-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT first_name, last_name
FROM customer
INNER JOIN customer_id IN (
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
);


-- 4. List all customers that live in Nepal (use the city table)

SELECT first_name, last_name, customer.address_id, country.country
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON country.country_id = city.country_id AND country = 'Nepal';



-- 5. Which staff member had the most transactions?

SELECT staff.staff_id, first_name, last_name,
COUNT(rental.rental_id) 
AS transaction_count
FROM staff
INNER JOIN rental 
ON rental.staff_id = staff.staff_id
GROUP BY staff.staff_id, first_name, last_name
ORDER BY transaction_count
LIMIT 1;



-- 6. How many movies of each rating are there? 

SELECT rating,
COUNT(*) AS movie_count
FROM film
GROUP BY rating;
 

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT customer.customer_id, first_name, customer.last_name, payment.amount
FROM customer
INNER JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
AND payment.customer_id IN (
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) = 1
 );


-- 8. How many free rentals did our stores give away?

SELECT COUNT AS free_rental_count
FROM rental
COUNT rentals_count
WHERE rental_count = 0;


