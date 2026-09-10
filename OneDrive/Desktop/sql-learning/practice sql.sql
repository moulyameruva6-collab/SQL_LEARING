USE school;
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    department VARCHAR(50),
    city VARCHAR(50)
);

insert into Employee(emp_id,emp_name,salary,department,city)
values
(101,'moulya',25000,'IT','Andhrapradesh'),
(102, 'Priya', 22000, 'HR', 'Hyderabad'),
(103, 'Arun', 28000, 'IT', 'Chennai'),
(104, 'Sneha', 24000, 'Sales', 'Bangalore'),
(105, 'Kiran', 20000, 'IT', 'Chennai');

SELECT * FROM Employee;

-- add email column
alter table Employee add column email varchar(100);
select * from Employee;

-- update salary od emp_id 
update Employee
set salary = 35000
where emp_id=101;
select * from Employee;

SET SQL_SAFE_UPDATES = 0;

-- update salary for it department +5000
UPDATE Employee
SET salary = salary + 5000
WHERE department = 'IT';
select * from Employee;
SET SQL_SAFE_UPDATES = 1;

-- total salary  using sum()
select sum(salary) as total_salary
from Employee;

-- average salary using avg()
select avg(salary) as average_salary
from Employee

-- highest salary using max()
select max(salary) as highest_salary
from Employee;

-- lowest salary using min()
select min(salary) as lowest_salary
from Employee;

-- no of employees using count()
select count(*) as employee_count
from Employee;

-- total salary department_wise using group by
select department,sum(salary) as total_salary
from Employee
group by department;

-- avereage department
select department ,avg(salary) as average_salary
from Employee
group by department;

-- highest salary in each department
select department , max(salary) as highest_salary
from Employee
group by department;

-- lowest salary in each department
select department , min(salary) as lowest_salary
from Employee
group by department;

-- number of employee in each department
select department,count(*) as employee_count
from Employee
group by department;

-- department having more than 3 employees:
select department,count(*) as employee_count
from Employee
group by department
having count(*) > 3;

-- department whose average salary is greaterthan 20,000
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 20000;

-- department having the highest total salary
select department,sum(salary) as total_salary
from Employee
group by department
order by total_salary desc
limit 1;

-- department having the lowest average salary
select department,Avg(salary) as average_salary
from Employee
group by department
order by average_salary desc
limit 1;

-- write a query to display the first 3 characters of each employee's name
SELECT name, LEFT(name, 3) AS first_3_characters
FROM employees;

SELECT emp_name, LEFT(emp_name, 3) AS first_3_characters
FROM Employee;

-- write a query to display employee names to uppercase and lowercase
SELECT emp_name,
       UPPER(emp_name) AS uppercase_name,
       LOWER(emp_name) AS lowercase_name
FROM Employee;

-- write a query to find the length of each employee name.
SELECT emp_name, LENGTH(emp_name) AS name_length
FROM Employee;

-- write a query to display employee names after removing leading and traiiling spaces
SELECT emp_name, TRIM(emp_name) AS trimmed_name
FROM Employee;

-- write a query to replace the word Manager  with Developer in the job title
ALTER TABLE Employee
ADD job_title VARCHAR(50);
SELECT job_title,
       REPLACE(job_title, 'Manager', 'Developer') AS new_job_title
FROM Employee;

-- update employee names
UPDATE Employee
SET emp_name = CASE emp_id
    WHEN 101 THEN 'Ravi Kumar'
    WHEN 102 THEN 'Priya Sharma'
    WHEN 103 THEN 'Arun Kumar'
    WHEN 104 THEN 'Sneha Reddy'
    WHEN 106 THEN 'Anjali Rao'
    WHEN 107 THEN 'Rahul Verma'
END
WHERE emp_id IN (101, 102, 103, 104, 106, 107);

SELECT emp_id, emp_name
FROM Employee;

-- write a query to display the first name and lastname seperatly when employee's fullname is stored in a single column
SELECT emp_name,
       SUBSTRING_INDEX(emp_name, ' ', 1) AS first_name,
       SUBSTRING_INDEX(emp_name, ' ', -1) AS last_name
FROM Employee;



