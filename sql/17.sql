/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */
select rank, title, revenue, sum(revenue) over (order by rank) as "total revenue"

from (
    select rank() over (order by round(coalesce(sum(p.amount),0),2) desc) as rank, title, round(coalesce(sum(p.amount),0),2) as revenue
from film
left join inventory as i using(film_id)
left join rental as r using(inventory_id)
left join payment as p using(rental_id)
GROUP BY
    ROLLUP (
title
    )
    having title is not null
    ) as sq order by revenue desc, title;
