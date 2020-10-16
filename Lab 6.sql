use sakila;

-- drop table film_20

/*
CREATE TABLE film_2020
(title VARCHAR(128),
description text,
release_year year,
language_id INT,
rental_rate decimal,
length INT,
rating enum('G','PG','PG-13','R','NC-17'),
special_features set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes'),
film_id int auto_increment,
constraint primary key (film_id));
*/


/*
all will be placed in store 2. 
All other movies will be moved to store 1. 
The rental duration will be 3 days, 
with an offer price of 2.99€ 
and a replacement cost of 8.99€. 
*/

-- All other movies will be moved to store 1. 

UPDATE inventory
SET store_id = 1;


-- film 2020 will be placed in store 2. 

insert into inventory(film_id,store_id)
select film_id, 2 from film where release_year=2020; 



-- The rental duration will be 3 days, 

UPDATE film
SET rental_duration = 3 where release_year=2020;



-- offer price of 2.99€ 

UPDATE film
SET rental_rate = 2.99 where release_year=2020;

-- replacement cost of 8.99€

UPDATE film_2020
SET replacement_cost = 8.99 where release_year=2020;



select * from film; 