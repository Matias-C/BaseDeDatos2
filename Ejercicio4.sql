#1

SELECT title, rating
FROM film
WHERE length <= ALL(SELECT length FROM film);

#2

SELECT title
FROM film
WHERE 1 = (SELECT COUNT(*)
         FROM film 
         WHERE length <= ALL(SELECT length FROM film));

#3

SELECT customer_id, first_name, last_name,
	(SELECT MIN(amount) 
	 FROM payment p
	 WHERE p.customer_id = c.customer_id) AS min_amount,
	(SELECT address 
	 FROM address a 
	 WHERE c.address_id = a.address_id) AS address
FROM customer c;

#4

SELECT customer_id, first_name, last_name,
	CONCAT(
		(SELECT MIN(amount) 
         FROM payment p
         WHERE p.customer_id = c.customer_id),
            " - ",
         (SELECT MAX(amount) 
          FROM payment p
          WHERE p.customer_id = c.customer_id)
        ) AS min_max_payment
    FROM customer c;
