use sakila;

-- lab 2.8

--    1 Write a query to display for each store its store ID, city, and country.
-- connect address to store and then connect address to city and then connect city to country and display store id(store),city(city) and country(country)
SELECT a.store_id, c.city, d.country, a.store_id FROM store a
join address b
on a.address_id = b.address_id
join city c
on b.city_id = c.city_id
join country d
on c.country_id = d.country_id;

--    2 Write a query to display how much business, in dollars, each store brought in.
-- store to staff (store_id) and staff to payment (staff_id)
SELECT a.store_id, sum(amount) FROM store a
join staff b
on a.store_id = b.store_id
join payment c
on b.staff_id = c.staff_id
group by a.store_id;

--    3 Which film categories are longest? -- length in film?
-- category to film_category (category_id) and film_category to film (film_id) and take average of film length
SELECT a.name, avg(length) FROM  category a
join film_category b
on a.category_id = b.category_id
join film c
on b.film_id = c.film_id
group by a.name
having avg(length)
order by avg(length) desc;

--    4 Display the most frequently rented movies in descending order.
-- rental to inventory (inventory_id) and inventory to film(film_id) order by count(rental_id) desc order
select c.title, count(rental_id) from rental a
left join inventory b
on a.inventory_id = b.inventory_id
left join film c
on b.film_id = c.film_id
group by c.title
order by count(rental_id) desc;

--    5 List the top five genres in gross revenue in descending order.
-- payment to rental (rental_id) and rental to inventory (inventory_id) and inventory to film (film_id) and film to film_category (film_id) and film_cat to category (category ID) order by sum(amount) desc order
select f.name, sum(amount) as gross_revenue from payment a
left join rental b
on a.rental_id = b.rental_id
left join inventory c
on b.inventory_id = c.inventory_id
left join film d
on c.film_id = d.film_id
left join film_category e
on d.film_id = e.film_id
left join category f
on e.category_id= f.category_id
group by f.name 
order by sum(amount) desc
limit 5;

--    6 Is "Academy Dinosaur" available for rent from Store 1?
select * from film;
select * from inventory;
select * from store;
-- film to inventory and inventory to store
SELECT c.title, b.store_id FROM inventory a
JOIN store b
ON a.store_id = b.store_id
JOIN film c
ON a.film_id = c.film_id
WHERE c.title = 'Academy Dinosaur' AND b.store_id = '1';

--    7 Get all pairs of actors that worked together.
-- do a self join
select a1.actor_id, a2.actor_id from film_actor a1
join film_actor a2
on a1.film_id = a2.film_id and a1.actor_id <> a2.actor_id;


--    8 Get all pairs of customers that have rented the same film more than 3 times.
-- right join customer to rental (customer_id) and right join rental to inventory (inventory_id) and inventory to film (film_id) using inventory_id, group by film_id
select customer_id, last_name, first_name, film_id from customer 
right join rental  using (customer_id)
right join inventory using (inventory_id)
group by film_id;


select a1.customer_id as A1_cust, a2.customer_id as A2_cust, a2.inventory_id from rental a1
join rental a2
on a1.inventory_id = a2.inventory_id and a1.customer_id <> a2.customer_id;


--    9 For each film, list actor that has acted in more films.
-- join film_actor a1 to film_ actor a2 (actor_id) and count actor_id group by film_id
SELECT a1.film_id, count(a1.actor_id) as actor_id_in_multiple_films FROM film_actor a1
JOIN film_actor a2
ON a1.actor_id = a2.actor_id AND a1.film_id <> a2.film_id
group by a1.film_id
ORDER BY a1.film_id asc;

