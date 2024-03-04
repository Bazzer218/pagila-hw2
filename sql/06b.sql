/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select f.title from film as f left join inventory as i on f.film_id = i.film_id where i.film_id is null;
