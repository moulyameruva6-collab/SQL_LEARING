-- set operators

use  classicmodels;

select * from employees;
select * from orders;
select * from customers;

-- get the customernumbers who placed an order
desc customers;
desc orders;

(select customernumber from customers)
intersect
(select customernumber from orders);

-- get the customer_id how didn't place any order
(select customernumber from customers)
except
(select customernumber from orders);

select * from orders
where customernumber=124;

SELECT manager_id
FROM employees
WHERE manager_id IS NOT NULL

INTERSECT

SELECT employee_id
FROM employees;
desc employees;

SELECT reportsTo
FROM employees
WHERE reportsTo IS NOT NULL

INTERSECT

SELECT employeeNumber
FROM employees;