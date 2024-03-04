/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */
select rank, title, revenue, sum(revenue) over (order by rank) as "total revenue"
, 
case when revenue > 160 then to_char(100 * (sum(revenue) over (order by rank))/(67416.51),'09.99')
else to_char(100 * (sum(revenue) over (order by rank))/(67416.51),'9990.99') end as "revenue percent"
    
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
