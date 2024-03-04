/*
 * Compute the total revenue for each film.
 * The output should include a new column "rank" that shows the numerical rank
 *
 * HINT:
 * You should use the `rank` window function to complete this task.
 * Window functions are conceptually simple,
 * but have an unfortunately clunky syntax.
 * You can find examples of how to use the `rank` function at
 * <https://www.postgresqltutorial.com/postgresql-window-function/postgresql-rank-function/>.
 */
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
    order by revenue DESC
    ;
