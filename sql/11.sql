/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select distinct first_name ||' '|| last_name as "Actor Name" from 

(select unnest(f.special_features) as special_features, a.first_name, a.last_name from film as f join film_actor using(film_id) join actor as a using(actor_id)) as t 
where special_features = 'Behind the Scenes' 
order by "Actor Name"
;  
