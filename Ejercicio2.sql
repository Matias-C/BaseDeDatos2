#1

SELECT title, special_features, rating
FROM film
WHERE rating = 'PG-13';

#2

SELECT title, length
FROM film;

#3

SELECT title, rental_rate, replacement_cost
FROM film
WHERE replacement_cost BETWEEN '20' AND '24'
ORDER BY replacement_cost;

#4

SELECT f.title, c.name, f.rating, f.special_features
FROM film f, category c 
WHERE special_features = 'Behind the Scenes';

#5

SELECT f.title, a.first_name, a.last_name
FROM film_actor fa 
JOIN film f ON fa.film_id = f.film_id
JOIN actor a ON fa.actor_id = a.actor_id 
WHERE f.title = 'ZOOLANDER FICTION'

#6

SELECT s.store_id, a.address, ci.city, co.country
FROM store s
JOIN address a ON s.address_id = a.address_id 
JOIN city ci ON a.city_id = ci.city_id 
JOIN country co ON ci.country_id = co.country_id 
WHERE s.store_id IN (1);

#7

SELECT f1.title, f2.title, f1.rating 
FROM film f1, film f2
WHERE f1.rating = f2.rating

#8

SELECT DISTINCT s.store_id, st.first_name, st.last_name, (f.title)
FROM store s 
JOIN staff st ON s.manager_staff_id = st.staff_id 
JOIN inventory i ON s.store_id = i.store_id 
JOIN film f ON i.film_id = f.film_id 
WHERE s.store_id IN (2);