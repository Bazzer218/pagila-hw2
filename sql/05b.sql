/*
 * This problem is the same as 05.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select a.last_name, a.first_name from actor as a left join customer as c on a.last_name = c.last_name and a.first_name = c.first_name where c.last_name is null and c.first_name is null order by a.last_name, a.first_name;
