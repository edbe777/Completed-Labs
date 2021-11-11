use sakila;

-- lab 3.01
-- Activity 1
-- 1 Drop column picture from staff.
select * from staff;
alter table staff drop column picture;
select * from staff;
 
 -- 2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
 select * from customer;
 select * from staff;
-- add TAMMY SANDERS to customer table with addresss ID 4 and store ID 2
-- insert into sakila.customer (store_id,first_name,last_name,address_id,active) 
-- values (2, 'TAMMY', 'SANDERS', 4, 1); 
-- select * from customer;
 
 insert into sakila.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
 values (3, 'TAMMY', 'SANDERS', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy');
  select * from customer;
   select * from staff;
   
 -- 3 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
 -- You can use current date for the rental_date column in the rental table. 
 -- Hint: Check the columns in the table rental and see what information you would need to add there. 
 -- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 

select * from rental;
select * from staff;  -- Mike Hillyer staff_id 1, store_id 1
select * from customer; -- Charlotte Hunter customer_id 130, store_id 1
select * from inventory; -- store ID 1, film_id 1
select * from film;  -- academy dinosaur has film_id 1

select customer_id from customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- returns customer_id 130
select inventory_id from inventory where film_id = 1 and store_id = 1; -- returns inventory_id 1,2,3,4
select film_id from film where title = 'Academy Dinosaur';  -- returns film_id 1
select staff_id from staff where first_name = 'Mike' and last_name = 'Hillyer'; -- returns staff_id 1
insert into sakila.rental (inventory_id, customer_id, staff_id) 
values (1, 130, 1);
select (customer_id) from sakila.rental order by last_update desc;
 

