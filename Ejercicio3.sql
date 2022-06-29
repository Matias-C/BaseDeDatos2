#1

SELECT first_name, last_name
FROM actor a1
WHERE EXISTS (
	SELECT * 
	FROM actor a2
	WHERE a1.last_name = a2.last_name  
    AND a1.actor_id  <> a2.actor_id 
	)
ORDER BY last_name;

#2

SELECT first_name, last_name
FROM actor a
WHERE NOT EXISTS(
    SELECT *
    FROM film_actor fa
    WHERE a.actor_id != fa.actor_id
	);
	
#3

SELECT first_name, last_name
FROM customer c
WHERE 1 = (
	SELECT COUNT(*)
	FROM rental r
	WHERE c.customer_id = r.customer_id
);

#4

SELECT first_name, last_name
FROM customer c
WHERE 1 < (
	SELECT COUNT(*)
	FROM rental r
	WHERE c.customer_id = r.customer_id
);

#5

SELECT first_name, last_name
FROM actor a 
WHERE actor_id IN (
	SELECT actor_id 
	FROM film_actor fa 
	WHERE film_id IN (
		SELECT f.film_id 
		FROM film f 
		WHERE f.title LIKE 'BETRAYED REAR'
		OR f.title LIKE 'CATCH AMISTAD'
));

#6

SELECT first_name, last_name
FROM actor a 
WHERE actor_id IN (
	SELECT actor_id 
	FROM film_actor fa 
	WHERE film_id IN (
		SELECT f.film_id 
		FROM film f 
		WHERE f.title LIKE 'BETRAYED REAR'
		AND f.title NOT LIKE 'CATCH AMISTAD'
));

#7

SELECT first_name, last_name
FROM actor a 
WHERE actor_id IN (
	SELECT actor_id 
	FROM film_actor fa 
	WHERE film_id IN (
		SELECT f.film_id 
		FROM film f 
		WHERE f.title LIKE 'BETRAYED REAR'
		AND f.title LIKE 'CATCH AMISTAD'
));

#8

SELECT first_name, last_name
FROM actor a 
WHERE actor_id IN (
	SELECT actor_id 
	FROM film_actor fa 
	WHERE film_id NOT IN (
		SELECT f.film_id 
		FROM film f 
		WHERE f.title LIKE 'BETRAYED REAR'
		OR f.title LIKE 'CATCH AMISTAD'
));
