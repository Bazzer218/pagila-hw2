/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
select special_features,count(special_features) 
from (select unnest(special_features) as special_features from film) 
as f group by special_features order by special_features ;  
