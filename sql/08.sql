/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
SELECT title
FROM (select title, rating, unnest(special_features) as special_features from film)
as t
WHERE rating = 'G'
and special_features = 'Trailers'
ORDER BY title;
