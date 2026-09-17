create database  it_company;

use it_company;

create table employees(
id int auto_increment primary key,
name varchar(30),
dept varchar(20),
salary int  unsigned
);

-- insert data into table
insert into employees(name,dept,salary)
values("moulya","IT",50000),
("dinnu","IT",40000),
("shannu","sales",55000),
("swathi","IT",45000),
("divya","hr",38000),
("sana","IT",35000),
("mounika","hr",32000),
("charan","IT",20000),
("seetha","sales",65000),
("kumar","IT",42000);
desc employees;
select * from employees;

-- 1.single row sub query:

--  find the average salary  of employees
select avg(salary) as Avg_salary from employees;

-- find the employee details whose salary is morethan average salary of employees
select * from employees
where salary >40727.775;

select * from employees
where salary > (select avg(salary) as Avg_salary from employees);

-- get the maximum salary  employee details
select max(salary) as max_salary from employees
order by max_salary;

select * from employees
where salary = (select max(salary) as max_salary from employees);

select * from employees
where salary = (select min(salary) as min_salary from employees);

-- get the employee details belongs to 'moulya's dept
SELECT name, dept
FROM employees
WHERE name = 'moulya';
select * from employees
WHERE dept in (SELECT dept FROM employees WHERE name = 'moulya')AND name != 'moulya';

-- 2.MULTI ROW SUB QUERY:
-- get the maximum and minimum salary employees details
select * from employees
where salary = (select distinct max(salary) from employees)
or
salary=(select min(salary) from employees);

SELECT DISTINCT name, dept, salary
FROM employees;

SELECT MIN(id) AS id, name, dept, salary
FROM employees
GROUP BY name, dept, salary;

-- return the employee details either they belongs to shannu's or seetha's dept
select * from employees
where dept in (select dept from employees where name in ('shannu','seetha'));

-- get the employees details whose salary is greaterthan any one's sales dept salary
select * from employees
where salary > any(select salary from employees where dept='sales');

SELECT *
FROM employees;

-- subquery in select clause
select 10 as total;
select (select max(salary) from employees);

-- sub query in having
-- find the each dept total salary
select dept,sum(salary) as total_salary from employees
group by dept;

-- return thedept whose dept avg salry greatrethan  the average employee salary
select dept,avg(salary) as total_salary from employees
group by dept;

select dept,sum(salary) as total_salary from employees
group by dept
having avg(Salary) > (select avg(salary) from employees);

-- sub query in from class
-- derived tables
select * from (select dept, count(*) as Total_count from employees group by dept)
as Employees_count_table ;

select * from (select dept, count(*) as Total_count from employees group by dept)
as Employees_count_table
where Total_count > 2;

-- 3.CO-RELATED SUDUERY:
-- gettheemployee details whose salary isgreaterthan their dept's average salary
select * from employees e1 
where salary > (select avg(salary) from employees e2
where e1.dept = e2.dept);

-- get the eachdept maximum salaryemployee details
select * from employees e1
where salary = (select max(salary) from employees e2
where e1.dept = e2.dept);

select * from employees e1
where salary = (select min(salary) from employees e2
where e1.dept = e2.dept);







