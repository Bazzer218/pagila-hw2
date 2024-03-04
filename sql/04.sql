/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
select f.title from film as f join inventory using(film_id) join rental using(inventory_id) join customer using(customer_id) where customer_id=1 group by f.title having count(rental_id) > 1;
