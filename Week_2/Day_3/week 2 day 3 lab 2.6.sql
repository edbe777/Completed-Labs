-- Instructions
use sakila;
--    In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
select * from sakila.actor;
select last_name,count(*)
from sakila.actor
group by last_name 
having count(last_name)=1            
order by last_name asc;

--    Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
select * from sakila.actor;
select last_name,count(*)
from sakila.actor
group by last_name 
having count(last_name)>1            
order by last_name asc;

--    Using the rental table, find out how many rentals were processed by each employee.
select * from sakila.rental;
select staff_id,count(*)
from sakila.rental
group by staff_id;
           
--    Using the film table, find out how many films were released each year.
select * from sakila.film;
select release_year,count(*)
from sakila.film
group by release_year;

--    Using the film table, find out for each rating how many films were there.
select * from sakila.film;
select rating,count(*)
from sakila.film
group by rating;

--    What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, AVG(length) 
from sakila.film
group by rating 
having AVG(length); 
--    Which kind of movies (rating) have a mean duration of more than two hours?
select rating, AVG(length) 
from sakila.film
group by rating 
having AVG(length) > 120; 

--    Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select * from sakila.film;
select title, length from sakila.film 
where length > 0 and length is not null
order by length desc;

