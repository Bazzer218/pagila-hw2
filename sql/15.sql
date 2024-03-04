/*
 * Compute the total revenue for each film.
 */
select title, round(coalesce(sum(p.amount),0),2) as revenue
from film
left join inventory as i using(film_id)
left join rental as r using(inventory_id)
left join payment as p using(rental_id)
GROUP BY
    ROLLUP (
title
    ) 
    having title is not null
    order by revenue DESC
    ;
