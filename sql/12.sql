/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
SELECT b1.title
FROM (SELECT unnest(special_features) AS s_f, title
      FROM film) AS b1
JOIN (SELECT unnest(special_features) AS s_f, title
      FROM film) AS b2
ON b1.title = b2.title
WHERE b1.s_f = 'Behind the Scenes'
AND b2.s_f = 'Trailers' order by title;
