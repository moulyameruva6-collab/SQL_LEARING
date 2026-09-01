create database tips_analysis;
use tips_analysis;
select * from tips;
desc tips;

-- change sex column name as gender
ALTER TABLE tips RENAME COLUMN sex TO gender;
select * from tips;

-- 1. Get female records
-- 2. get male records
-- 3. find dinner time in female records
-- 4. find the size 2 records
-- 5. find male smoker records
-- 6. get the non-smoker female records
-- 7. get the dinner time male records
-- 8. get the female records in descending order as per the total_bill
-- 9. get the top 5 male total_bills
-- 10. get both size 2 and 3 records
-- 11. get the records whose total bill in the range of 10-20
-- 12. get size 2,3 and 4 records
select * from tips
where gender = "female";

select * from tips
where gender = "male";

select * from tips
where gender = "female" and time = "dinner";

select * from tips 
where size = 2;

select * from tips
where gender="male" and smoker="yes";

select * from tips
where gender ="female" and smoker="no";

select * from tips
where gender="male" and time ="dinner";


select * from tips
where gender="female"
order by total_bill desc;

select * from tips 
where gender="male"
order by total_bill desc
Limit  5;

select * from tips
where size = 2 or size = 3;

select * from tips
where size in (2,3);

select * from tips
where total_bill between 10 and 20;

select * from tips
where size=2 or size =3 or size =4;

select * from tips
where size in (2,3,4);

select * from tips 
order by total_bill desc
Limit 1 offset 1; 

-- return total records in tips table
select count(*) from tips;

-- return total male smokers count
select count(*) from tips
where gender = "male" and smoker="yes";

-- return total tip
select sum(tip) from tips;

-- return female non-smoker count
select count(*) from tips
where gender="female" and smoker ="No";


select gender,smoker , count(*) from tips
where gender = "female" and smoker= "no";

-- return min bill and max bill
select min(total_bill) , max(total_bill) from tips;

select * from  tips;

-- 19. group by queries
-- 20. get the gender column unique values
-- 21.get the dinner time records count
-- 22.get the total records count as per the gender column
-- 23.get the smoker and non-smoker count
-- 24.get the sunday total records as per the gender
-- 25. get the each size count in descending order
-- 26.get the size2,3,and 4 smoker and non-smoker count
-- 27.get the each size count as per the gender
-- 28. find the each size maximum and minimum total_bill
-- 29. find the male total records as per the day in descending order

-- 20. get the gender column unique values
select distinct gender
from tips;

SELECT gender
FROM tips
GROUP BY gender;

-- 21. Get the dinner time records count
SELECT time, COUNT(*) AS total_records
FROM tips
WHERE time = 'Dinner'
GROUP BY time

-- 22. Get the total records count as per the gender column
SELECT gender, COUNT(*) AS total_records
FROM tips
GROUP BY gender;

-- 22. Get the total records count as per the gender column
SELECT gender, COUNT(*) AS total_records
FROM tips
GROUP BY gender;

-- 23. Get the smoker and non-smoker count
SELECT smoker, COUNT(*) AS total_records
FROM tips
GROUP BY smoker;

-- 24. Get the Sunday total records as per the gender
SELECT day , gender, COUNT(*) AS total_records
FROM tips
WHERE day = 'Sun'
GROUP BY day ,gender;

-- 24. Get the Sunday total records as per the gender
SELECT  gender, COUNT(*) AS total_records
FROM tips
WHERE day = 'Sun'
GROUP BY gender;


-- 25. get the each size count in descending order
SELECT size, COUNT(*) AS total_records
FROM tips
GROUP BY size
ORDER BY total_records DESC;

-- 26.get the size2,3,and 4 smoker and non-smoker count
SELECT size, smoker, COUNT(*) AS total_records
FROM tips
WHERE size IN (2, 3, 4)
GROUP BY size, smoker;

-- 26.get the size2,3,and 4 smoker and non-smoker count
SELECT smoker, COUNT(*) AS total_records
FROM tips
WHERE size IN (2, 3, 4)
GROUP BY  smoker;

-- 27. Get each size count as per the gender
SELECT size, gender, COUNT(*) AS total_records
FROM tips
GROUP BY size, gender
order by size ASC, total_records DESC;

-- 28. Find each size maximum and minimum total_bill
SELECT size,
       MAX(total_bill) AS maximum_total_bill,
       MIN(total_bill) AS minimum_total_bill
FROM tips
GROUP BY size;

-- 28. Find each size maximum and minimum total_bill
select size, min(total_bill),max(total_bill)
FROM tips
group by size;



-- 29. Find the male total records as per the day in descending order
SELECT day, COUNT(*) AS total_records
FROM tips
WHERE gender = 'Male'
GROUP BY day
ORDER BY total_records DESC;

-- 30. get the size 2's totalcount as per gender
select size,gender,count(*) as total_records
FROM tips
WHERE size=  2
GROUP BY gender;

-- 31. find the total records as per the size
select size , count(*) as total_records
from tips
group by size;

-- return the size which one total count is morethan 50
SELECT size, COUNT(*) AS total_records
FROM tips
WHERE total_bill > 50
GROUP BY size;

-- return the size which one total count is morethan 50
SELECT size, COUNT(*) AS total_records
FROM tips
group by size
having count(*) > 30;

-- get the each size gender count which is morethan 20
SELECT size,gender, COUNT(*) AS total_records
FROM tips
group by size,gender
having count(*) > 20;

-- get the sizes which is maximum total_bill and minimum total_bill difference is lesserthan 10
SELECT size,
       MAX(total_bill) AS max_bill,
       MIN(total_bill) AS min_bill
FROM tips
GROUP BY size
HAVING (MAX(total_bill) - MIN(total_bill)) < 10;

SELECT size,
       MAX(total_bill) AS max_bill,
       MIN(total_bill) AS min_bill
FROM tips
GROUP BY size
HAVING (MAX(total_bill) - MIN(total_bill)) < 15;

SELECT size,
       MAX(total_bill) AS max_bill,
       MIN(total_bill) AS min_bill,
       MAX(total_bill) - MIN(total_bill)
FROM tips
GROUP BY size
HAVING (MAX(total_bill) - MIN(total_bill)) < 30;
























