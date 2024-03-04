/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * NOTE:
 * This can be solved by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 * For this problem, you should use the NOT IN clause;
 * in problem 07b you will use the LEFT JOIN clause.
 *
 * NOTE:
 * This is the last problem that will require you to use a particular method to solve the query.
 * In future problems, you may choose whether to use the LEFT JOIN or NOT IN clause if they are more applicable.
 */
SELECT distinct f.title
FROM film AS f
JOIN inventory AS i USING (film_id)
WHERE 
f.film_id in (select distinct i.film_id from inventory as i) and

f.film_id NOT IN
    (SELECT distinct i.film_id
     FROM inventory as i
    JOIN rental as r using (inventory_id)
     JOIN customer AS c using (customer_id)
     JOIN address AS a using (address_id)
     JOIN city AS ct using(city_id)
     JOIN country AS cn using(country_id)
     WHERE cn.country = 'United States')
ORDER BY f.title;

