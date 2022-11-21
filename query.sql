-- THe comments above each query highlight the MAIN TOPIC in uppercase letters.
# Begin with the correct DATABASE.
USE sakila;

# REGEX: Selecting all films with titles ending in APOLLO.
SELECT TITLE FROM FILM WHERE TITLE REGEXP "APOLLO$";

# REGEX: Selecting all films with word DATE in the title.
SELECT TITLE FROM FILM WHERE TITLE REGEXP '\\bDATE\\b';

# CHECKING LENGTH: Selecting the 10 films with the longest title.
SELECT TITLE, LENGTH(TITLE) FROM FILM order by LENGTH(title) DESC limit 10;

# INSERT INTO: Updating database to insert customer TAMMY SANDERS as an employee, who now helps Jon.
SELECT * FROM STAFF WHERE FIRST_NAME='JON';
SELECT * FROM CUSTOMER WHERE FIRST_NAME='TAMMY';
INSERT INTO STAFF (STAFF_ID, FIRST_NAME, LAST_NAME, ADDRESS_ID, EMAIL, STORE_ID, ACTIVE, USERNAME, PASSWORD, LAST_UPDATE) VALUES (3,'TAMMY', 'SANDERS', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'TAMMY', NULL, '2006-02-15 04:57:20');

# DELETING non-active users from the table customer.
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM customer WHERE active = 0;
SET FOREIGN_KEY_CHECKS=1;

# JOIN + WHERE: Counting how many copies of the film _Hunchback Impossible_ exist in the inventory system.
SELECT  film.title, count(inventory.film_id)
	FROM inventory
	JOIN film
	ON film.film_id = inventory.film_id
	WHERE film.title = "Hunchback Impossible";
    
# LENGTH ABOVE AVERAGE: Selecting all films with a length longer than the average film length.
SELECT title, length
	FROM film
	HAVING length > (SELECT AVG(length) FROM film);
    
# SUBQUERY: Displaying all actors in the film "Alone Trip".
SELECT * FROM (
		SELECT  actor.first_name, actor.last_name
		FROM film
		JOIN film_actor
		ON film.film_id = film_actor.film_id
		JOIN actor
		ON actor.actor_id = film_actor.actor_id
		WHERE film.title = "Alone Trip") as table2;
        
# JOIN WHERE: Selecting all family films.
SELECT title
	FROM film
	JOIN film_category
	ON film.film_id = film_category.film_id
		JOIN category
		ON film_category.category_id = category.category_id
		WHERE category.name = "Family";
        
# SUBQUERY + JOIN: Selecting customers from Canada.
SELECT *
	FROM (Select concat_ws(" ",customer.first_name, customer.last_name) as `name`, customer.email as email, country.country
		FROM customer
        JOIN address
        ON customer.address_id = address.address_id
			JOIN city
			ON city.city_id = address.city_id
				JOIN country
				ON city.country_id = country.country_id
				WHERE country = "Canada") as table3;

# MULTIPLE JOINS + SORT: Selecting all films starred by the most prolific actor (who has acted in the most number of films). 
SELECT actor.first_name, actor.last_name, film.title
	FROM film
	JOIN film_actor
	ON film_actor.film_id = film.film_id
		JOIN actor
		ON actor.actor_id = film_actor.actor_id
			JOIN (SELECT actor_id, film_id, count(actor_id) as `value_occurrence`
			FROM film_actor
			GROUP BY actor_id
			ORDER BY `value_occurrence` DESC
			LIMIT 1) as table4
			ON table4.actor_id = film_actor.actor_id;
            
# JOINS: Selecting films rented by the most profitable customer. 
SELECT  customer_id, sum(amount) as amount
		FROM payment
		GROUP BY customer_id
        order by amount desc;
        
SELECT customer.customer_id, first_name, last_name, film.title
	from customer
    join rental
	on customer.customer_id = rental.customer_id
    join inventory
	on rental.inventory_id = inventory.inventory_id
	join film
	on inventory.film_id = film.film_id
    where customer.customer_id = "526";
    
# HAVING: Selecting the `client_id` and the `total_amount_spent` of those clients who spent more than the average of the `total_amount` spent by each client.
SELECT customer_id, avg(total_amount)
	from (SELECT customer_id, sum(amount) as total_amount
	FROM payment
	Group by customer_id) as rowas;
    
SELECT customer_id, sum(amount) as total_amount
	FROM payment
	Group by customer_id
	HAVING total_amount > 112.54;
    
-- OTHER QUERY FUNCTIONS I WOULD LIKE TO FIND A REASON TO USE:
-- WINDOW
-- EXISTS https://www.codewars.com/kata/58113a64e10b53ec36000293
-- POSITION https://www.codewars.com/kata/59401e0e54a655a298000040
-- JOIN and RANK https://www.codewars.com/kata/58094559c47d323ebd000035
-- UNION ALL https://www.codewars.com/kata/58112f8004adbbdb500004fe
-- IN
SELECT id, name
FROM departments
WHERE id IN (
  SELECT department_id
  FROM sales
  WHERE price > 98
);