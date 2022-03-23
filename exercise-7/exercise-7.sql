-- customer ranking by total film time watched
-- similar to exercise 6
SELECT
    customer.email,
    RANK () OVER (ORDER BY SUM (film.length) DESC)
FROM
    film
INNER JOIN
    inventory
ON
    film.film_id = inventory.film_id
INNER JOIN
    rental
ON
    inventory.inventory_id = rental.inventory_id
INNER JOIN
    customer
ON
    rental.customer_id = customer.customer_id
GROUP BY
    customer.email
ORDER BY
    rank


