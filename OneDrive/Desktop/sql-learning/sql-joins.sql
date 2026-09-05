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





