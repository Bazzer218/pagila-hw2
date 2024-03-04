/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
SELECT DISTINCT f.title
FROM film AS f
JOIN inventory AS i USING (film_id)
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id
LEFT JOIN customer AS c ON r.customer_id = c.customer_id
LEFT JOIN address AS a ON c.address_id = a.address_id
LEFT JOIN city AS ct ON a.city_id = ct.city_id
LEFT JOIN country AS cn ON ct.country_id = cn.country_id
WHERE cn.country IS NULL OR cn.country != 'United States' AND 
f.film_id in (select distinct i.film_id from inventory as i)
ORDER BY f.title;
