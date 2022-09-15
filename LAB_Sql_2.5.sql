-- Lab | SQL Queries - Lesson 2.5--
-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * from sakila.actor where first_name = 'scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT * from sakila.inventory
select * from sakila.rental;
-- SELECT * from sakila.inventory;
-- SELECT COUNT(film_id) FROM sakila.film
-- where rental_rate > 0;
-- SELECT COUNT(rental_id) FROM sakila.rental
-- where rental_rate > 0;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as min_duration, max(length) as max_duration from sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
select sec_to_time(sum(length)/count(distinct(title))) as average_movie_duration
from sakila.film;

-- 5. How many distinct (different) actors' last names are there?
select count(distinct(actor_id)) from sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
select DATEDIFF( max(payment_date), min(payment_date) )AS DateDiff from sakila.payment;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
select *, month(rental_date) as month, dayname(rental_date) as weekday from sakila.rental;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_id,
case 
when dayname(rental_date) = 'Monday' then 'Workday'
when dayname(rental_date) = 'Tuesday' then 'Workday'
when dayname(rental_date) = 'Wednesday' then 'Workday'
when dayname(rental_date) = 'Thursday' then 'Workday'
when dayname(rental_date) = 'Friday' then 'Workday'
when dayname(rental_date) = 'Saturday' then 'Weekend'
when dayname(rental_date) = 'Sunday' then 'Weekend'
else 'Unknown'
end as 'Day_type', dayname(rental_date) as weekday
from sakila.rental;

-- 9. Get release years.
select release_year from sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
select title from sakila.film
where title like 'ARMAGEDDON%'; 

-- 11. Get all films which title ends with APOLLO.
select title from sakila.film
where title like '%APOLLO'; 


-- 12. Get 10 the longest films.
select title, length from sakila.film
order by length desc
limit 10;

-- 13. How many films include Behind the Scenes content?
select count(special_features) from sakila.film
where special_features like 'behind the scenes';

