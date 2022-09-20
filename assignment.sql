use sakila;

#Write a query to display for each store its store ID, city, and country.
select * from store;
select * from address;
select * from country;

select store.store_id,city.city,country.country,address.address_id
from store
inner join city on city.city= city
inner join country  on country.country = country
inner join address on store.store_id = address.address_id;

# Write a query to display how much business, in dollars, each store brought in.
select * from payment;
select * from store;

select store.store_id, sum(payment.amount) as amount_in_dollar
from store
join payment
on payment.staff_id = store.manager_staff_id
group by store.store_id;

#What is the average running time of films by category?
select * from film;
select * from category;
select * from film_category;

select category.category_id,category.name,avg(film.length) as average_running_time
from film_category
inner join film on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
group by category.category_id
order by avg(film.length) desc;
#the longest categories is sport.

#Display the most frequently rented movies in descending order.
select * from rental;
select * from film;
select * from inventory;

select film.film_id, film.title,count(rental.inventory_id)
from film
join rental on rental.inventory_id = rental.inventory_id
join inventory on film.film_id = inventory.film_id
group by film.film_id 
order by count(rental.inventory_id);

#List the top five genres in gross revenue in descending order
select * from payment;
select * from rental;
select * from inventory;
select * from film,film_category;


select category.category_id,category.name,avg(payment.amount) as gross 
from film_category
inner join film on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
join payment on payment.rental_id = payment.rental_id
group by category.name
order by avg(payment.amount) desc;
#the five top genres are travel,sport,sci-fi,new and music.

#Is "Academy Dinosaur" available for rent from Store 1?
select * from rental;
select * from film;
select * from inventory;

select film.title,inventory.store_id, count(inventory.film_id)
from film
join rental on rental.rental_id = rental.rental_id
join inventory on inventory.film_id = film.film_id
where inventory.film_id = 1 and inventory.inventory_id = 1;
# yes academy dinosaur is avaliable in store 2 too. i cant say it is available in store 1 alone.