-- VIEWS:
use classicmodels;
select * from  customers;
select * from orders;

-- get thecustomer details  who placed an order by using subquery
select * from customers
where customernumber in (select customernumber from orders);

-- create a view,order placed customer  details
create view order_placed_customers as 
select * from customers
where customernumber  in (select customernumber from orders);

-- selecting view data
select * from order_placed_customers;

-- select school database
use school;
select * from students;

-- create view with 6thclass students

CREATE VIEW sixth_class_students AS
SELECT *
FROM students
WHERE class = 6;

select * from sixth_class_students;

-- update the 6th class students name
UPDATE sixth_class_students
SET Name = 'Mounika'
WHERE ID = 101;

select * from sixth_class_students;

select * from students;


