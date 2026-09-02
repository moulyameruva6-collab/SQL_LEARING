--
use classicmodels;

-- 1.get the current date,and current time
select now();

-- 2.get the current timestamp
select current_timestamp();

-- 3.get the current timestamp format as(Day-month-year 12h format time)

SELECT DATE_FORMAT(CURRENT_TIMESTAMP(), '%d-%m-%Y %h:%i:%s %p') AS format_time;

-- 4.how old are you (interms of years)
SELECT floor(DATEDIFF(now(), "2025-09-01")/365);

select * from orders;
-- 5.get the order details which order comments is not null
SELECT *
FROM orders
WHERE comments IS NOT NULL;

-- 6.get the order details which order is not able deliver within required date
select * from orders
where shippeddate >requireddate;

-- 7.find the how many days taken for every delivery (in descending order) 
select ordernumber , orderdate , shippeddate , datediff(shippeddate , orderdate) as deleviry_time
from orders
order by deleviry_time desc;

-- 8.find the each year total  successful deleviries count

select * from orders;
select year(orderdate), count(*) as total_count from orders
where status = "shipped"
group by year(orderdate);