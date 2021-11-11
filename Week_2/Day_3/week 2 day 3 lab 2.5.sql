-- Instructions
use sakila;
--    Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor 
where first_name = 'Scarlett';
--    How many films (movies) are available for rent and how many films have been rented?
select * from sakila.rental;
select count(*) from sakila.film 
where rental_rate > 0;
select count(distinct(inventory_id)) from sakila.rental;
--    What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT * FROM sakila.film;
SELECT MAX(film.length) as max_duration, MIN(film.length) as min_duration FROM sakila.film;
--    What's the average movie duration expressed in format (hours, minutes)?
SELECT floor(AVG(film.length)/60) as hours, floor(AVG(film.length)%60) as minutes FROM sakila.film ;
--    How many distinct (different) actors' last names are there?
select * from sakila.actor;
select count(distinct(last_name)) from sakila.actor;
--    Since how many days has the company been operating (check DATEDIFF() function)?
select * from sakila.rental;
-- select payment_date from sakila.payment where 
select datediff(max(convert(payment_date, DATE)), min(convert(payment_date, DATE))) as days_of_operation from sakila.payment;  -- this one worked 
-- select max(convert(payment_date, date)) from sakila.payment;
-- select min(convert(payment_date, date)) from sakila.payment;
-- select datediff(max(payment_date, DATE), min(payment_date, DATE)) as days_of_operation from sakila.payment;
--    Show rental info with additional columns month and weekday. Get 20 results.
select *, extract(month from rental_date) as month, dayofweek(rental_date) as week_day from rental limit 20;
--    Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN dayofweek(rental_date) <= 5 then 'weekday'
ELSE 'weekend'
END AS 'ERROR'
FROM sakila.rental;
--   Get release years.
select * from sakila.film;
select title, release_year from sakila.film;
--    Get all films with ARMAGEDDON in the title.
select title from sakila.film where title like '%ARMAGEDDON%';
--    Get all films which title ends with APOLLO.
select title from sakila.film where title like '%APOLLO';
--    Get 10 the longest films.
select * from sakila.film;
select title, length from sakila.film ORDER BY length DESC LIMIT 10;
--    How many films include Behind the Scenes content?
select * from sakila.film;
select count(*) as 'Films with Behind the Scenes Content'  from sakila.film 
where special_features like '%Behind the Scenes%';

SELECT rating, AVG(length) as Average_Length FROM sakila.film
GROUP BY rating
HAVING Average_Length >= 120;

select* from film;
SELECT title, length, rank () over (ORDER BY length DESC) as 'Rank', row_number() over (order by length desc) as 'Row number' FROM sakila.film
WHERE length <> '0'
ORDER BY length;
