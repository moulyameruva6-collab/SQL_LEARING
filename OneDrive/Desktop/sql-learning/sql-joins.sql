use classicmodels;

select * from customers;
select * from orders;

-- get the  customer details  who placed  and order
select c.customernumber,customername,ordernumber  from customers c
inner join orders o
on c.customernumber = o.customernumber;

-- get the  customer details  who placed  and order
select c.customernumber,customername from customers c
inner join orders o
on c.customernumber = o.customernumber;

-- get the  customer details  who placed  and order
select DISTINCT c.customernumber,customername  from customers c
inner join orders o
on c.customernumber = o.customernumber;

-- get the customer details whose order is shipped

select distinct c.customernumber,customername,ordernumber  from customers c
inner join orders o
on c.customernumber = o.customernumber
where O.status = "SHIPPED";


select distinct c.customernumber,customername from customers c
inner join orders o
on c.customernumber = o.customernumber
where o.status = "SHIPPED";

select * from orders;
-- get the customer details whose order is cancled

select c.customernumber,customername from customers c
inner join orders o
on c.customernumber = o.customernumber
where o.status ="CANCELLED";

-- EQUIE JOIN
select c.customernumber,customername from customers c,orders o
where c.customernumber = o.customernumber and o.status = "CANCELLED";

-- get the each customer total order count
select c.customernumber,customername, count(*) total_orders from customers c
inner join orders o
on c.customernumber = o.customernumber
group by c.customernumber
order by total_orders desc;

-- get the each customer total  orders count
select c.customernumber,customername, count(*) total_orders from customers c
inner join orders o
on c.customernumber = o.customernumber
where o.status = "SHIPPED"
group by c.customernumber
order by total_orders desc;

select c.customernumber,customername, count(*) total_orders from customers c
inner join orders o
on c.customernumber = o.customernumber
where o.status = "SHIPPED"
group by c.customernumber
having count(*) > 3
order by total_orders desc;

-- NATURAL JOIN
-- get the order placed customer details
select c.customernumber,customername from customers c
natural join orders o;

SELECT DISTINCT
    c.customernumber,
    c.customername
FROM customers c
NATURAL JOIN orders o;
 
select * from employees;
select distinct c.customernumber,customername,employeenumber from customers c
natural join employees;

-- CROSS JOIN
select distinct c.customernumber,customername,employeenumber from customers c
cross join employees;

select distinct c.customernumber,customername from customers c
cross join employees;

-- left join
SELECT c.customernumber,
       c.customername,
       COUNT(*) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customernumber = o.customernumber
GROUP BY c.customernumber, c.customername
ORDER BY total_orders;

select * from orders;
select * from orders
where customernumber=169;

SELECT c.customernumber,
       c.customername,
       COUNT(*) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customernumber = o.customernumber
GROUP BY c.customernumber, c.customername
ORDER BY total_orders;

-- right join
SELECT c.customernumber,
       c.customername,
       COUNT(*) AS total_orders
FROM customers c
right JOIN orders o
ON c.customernumber = o.customernumber
GROUP BY c.customernumber, c.customername
ORDER BY total_orders;

SELECT c.customernumber,
       c.customername,
       COUNT(o.ordernumber) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customernumber = o.customernumber
GROUP BY c.customernumber, c.customername;

-- for each order get the number
SELECT o.ordernumber,
       c.customername
FROM customers c
LEFT JOIN orders o
ON c.customernumber = o.customernumber;

SELECT o.ordernumber,
       c.customername
FROM customers c
RIGHT JOIN orders o
ON c.customernumber = o.customernumber;

select * from orderdetails;

-- get the every order productcodes with customername
SELECT o.ordernumber,c.customername,od.productcode
FROM orders o
INNER JOIN customers c
ON o.customernumber = c.customernumber
INNER JOIN orderdetails od
ON o.ordernumber = od.orderNumber;

-- get the each customers total spendings on orders

DESC orderdetails;
desc orders;
desc customers;

SELECT c.customernumber,c.customername,SUM(o.amount) AS total_spending
FROM customers c
JOIN orders o
ON c.customernumber = o.customernumber
GROUP BY c.customernumber, c.customername;

SELECT c.customernumber,c.customername,COUNT(od.quantityOrdered * od.priceEach) AS total_spending
FROM customers c
LEFT JOIN orders o
ON c.customernumber = o.customernumber
INNER JOIN orderdetails od
ON o.ordernumber = od.orderNumber
GROUP BY c.customernumber,c.customername;


SELECT c.customernumber,c.customername,sum(od.quantityOrdered * od.priceEach) AS total_spending
FROM customers c
LEFT JOIN orders o
ON c.customernumber = o.customernumber
RIGHT JOIN orderdetails od
ON o.ordernumber = od.orderNumber
GROUP BY c.customernumber, c.customername;

(SELECT c.customernumber,c.customername
FROM customers c
LEFT JOIN orders o
ON c.customernumber = o.customernumber)
UNION
(SELECT c.customernumber,c.customername
FROM customers c
RIGHT JOIN orders o
ON c.customernumber = o.customernumber);
 
-- self join:
select * from employees;

SELECT e.employeeNumber,e.firstName AS employee_name,m.firstName AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.reportsTo = m.employeeNumber;

-- get the each employee managername
select e.employeenumber,concat(e.lastname,e.firstname) as employeename,e.reportsto,
concat(m.lastname,m.firstname) as managername
from employees e
inner join employees m
on e.reportsto=m.employeenumber;






