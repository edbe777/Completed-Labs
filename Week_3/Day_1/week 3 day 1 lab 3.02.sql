use sakila;

-- lab 3.03
-- 1 How many copies of the film Hunchback Impossible exist in the inventory system?
select title, (select count(*) from sakila.inventory
where film.film_id = inventory.film_id) as 'Number of Copies' from sakila.film
where title = 'Hunchback Impossible';

SELECT *,
    (SELECT Count(*) FROM inventory 
    WHERE film.film_id = inventory.film_id) as 'Number of Copies' FROM film
    WHERE title = 'Hunchback Impossible';

-- best colution using subquery
SELECT COUNT(*) AS 'Number of Copies' FROM inventory
WHERE inventory.film_id = (
SELECT film.film_id FROM film
WHERE film.title = 'HUNCHBACK IMPOSSIBLE');


-- 2 List all films whose length is longer than the average of all the films.
-- subquery, better code
select film_id, title, description, length as average_length from sakila.film 
where length > (SELECT avg(length)
                FROM sakila.film)
ORDER BY length desc;

-- ignore code below
SELECT fl.title, fl.length, ct.name FROM film fl 
JOIN film_category fc 
ON fl.film_id=fc.film_id
JOIN category ct 
ON ct.category_id=fc.category_id
WHERE fl.length > (SELECT AVG(fl.length) FROM film fl 
JOIN film_category fc 
ON fl.film_id = fc.film_id
JOIN category cat 
ON cat.category_id=fc.category_id
WHERE cat.name=ct.name)
limit 50;

select avg(length) as average_film_length from sakila.film;
select film_id, title, description, length as average_length from sakila.film where length>115.2720;

-- 3 Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name from sakila.actor
where actor_id in (Select actor_id from sakila.film_actor
where film_id in (select film_id from sakila.film
where title = 'Alone Trip'))
order by last_name asc;



-- 4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title, description from film 
where film_id in (select film_id from film_category
where category_id in (select category_id from category
where name = 'Family'));

select name from category;
select film_id from film_category;

-- 5 Get name and email from customers from Canada using subqueries. Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
-- with joins
select c.first_name, c.last_name, c.email from sakila.customer c
inner join address a 
on (c.address_id = a.address_id)
inner join city b
on (b.city_id = a.city_id)
inner join country e
on (e.country_id = b.country_id)
where e.country= 'Canada'
order by last_name;

-- with subquery
select first_name, last_name, email from customer where address_id in
(select address_id from address where city_id in
(select city_id from city where country_id in
(select country_id from country where country = 'Canada'))); 

-- 6 Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as number_of_films from sakila.actor 
join film_actor using (actor_id)
group by actor_id
order by number_of_films desc;  -- GINA DEGENERES, actor_id 107, number_of_films 42
select title from sakila.film a
join sakila.film_actor b
on a.film_id = b.film_id
where actor_id = 107
group by title;

-- to find out the most prolific actor and actor_id and film_count
SELECT a.actor_id, actor.first_name, actor.last_name, a.film_count FROM actor
LEFT JOIN(SELECT count(film_id) AS film_count, actor_id FROM film_actor
GROUP BY actor_id)AS a 
ON (actor.actor_id=a.actor_id)
ORDER BY film_count DESC
limit 1;

-- with subquery to find the 42 film titles
select title from film where film_id in
(select film_id from film where film_id in
(select film_id from film_actor where actor_id = 107)); 

-- 7 Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer 
-- ie the customer that has made the largest sum of payments
-- this code also works
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_paid from sakila.customer c
join payment p 
on c.customer_id= p.customer_id
group by c.customer_id
order by sum(p.amount) desc
limit 5;

-- with subquery to find the films rented
select customer_id, sum(amount) from payment where customer_id in
(select customer_id from payment where customer_id in
(select customer_id from customer where customer_id = 526)); 

-- can also use joins customer, rental, inventory, film

-- 8 Customers who spent more than the average payments.
-- subquery
SELECT SUM(amount), first_name,last_name FROM customer
JOIN sakila.payment USING (customer_id)
GROUP BY customer_id
HAVING sum(amount) > (SELECT avg(total_payment) FROM (SELECT customer_id, SUM(amount) as total_payment FROM payment
GROUP BY customer_id) eddie_is_cool)
ORDER BY SUM(amount) DESC;

-- ignore code below ------------------------
SELECT * FROM sakila.payment
WHERE amount > (SELECT avg(amount)
                FROM payment)
ORDER BY amount desc
LIMIT 100;
select avg(amount) as average_amount_paid from payment;
select payment_id, payment_date, amount from sakila.payment
where amount>4.20067
order by amount;

select * from customer;
select * from payment;
select cu.customer_id, cu.first_name, cu.last_name from sakila.customer cu
join payment p 
on cu.customer_id= p.customer_id
group by p.amount
limit 10;

SELECT customer.first_name, customer.last_name, a.total_spend FROM sakila.customer 
LEFT JOIN(SELECT payment.customer_id, SUM(payment.amount) AS total_spend FROM payment
LEFT JOIN customer 
ON (payment.customer_id=customer.customer_id)
GROUP BY 1) AS a ON(customer.customer_id=a.customer_id)
ORDER BY a.total_spend DESC
LIMIT 5;

