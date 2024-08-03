use sakila;
-- 1) drop column picture from staff
describe staff;
alter table staff
drop column picture ;
describe staff;

Select * from staff
## cant drop picture as it doesnt exsit 

-- 2) A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff (staff_id, first_name, last_name, email, store_id, address_id, active, username, password, last_update)
VALUES (10, 'TAMMY', 'SANDERS', 'tammy.sanders@sakila.com',2, 5, 1, 'tom', null, NOW())

Select* from staff;

-- 3) Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

SELECT inventory_id FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = 'Academy Dinosaur') AND store_id = 1;

SELECT staff_id FROM staff WHERE first_name = 'MIKE' AND last_name = 'HILLYER';

INSERT INTO rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
VALUES (NOW(), 1, 3, NULL, 2, NOW());

-- 4) Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
SELECT customer_id, email FROM customer WHERE active = 0;

Create table deleted_users (cutomer_id Int, email varchar(50),delating_date Datetime);

INSERT INTO deleted_users (customer_id, email, delating_date)
SELECT customer_id, email, NOW() FROM customer WHERE active = 0;
DELETE FROM customer WHERE active = 0;
