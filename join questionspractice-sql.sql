CREATE DATABASE company;
USE company;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    job_id INT
);

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE job (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(50),
    min_salary INT,
    max_salary INT
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT
);

CREATE TABLE employee_project(
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id)
);

INSERT INTO employee
(emp_id, emp_name, salary, dept_id, manager_id, job_id)
VALUES
(1, 'Moulya', 60000, 1, 5, 101),
(2, 'Shannu', 40000, 1, 5, 101),
(3, 'Seetha', 30000, 2, 6, 103),
(4, 'Charan', 35000, 3, 7, 104),
(5, 'Priya', 90000, 1, NULL, 105),
(6, 'Kiran', 55000, 2, NULL, 105),
(7, 'Ravi', 70000, 3, NULL, 105),
(8, 'Anu', 25000, 4, 9, 101),
(9, 'Suresh', 65000, 4, NULL, 105),
(10, 'Divya', 45000, NULL, NULL, 102),
(11, 'Lalitha', 30000, 1, 5, 102),
(12, 'Swathi', 28000, 2, 6, 103);

select *  from employee;

INSERT INTO department
VALUES
(1, 'IT', 'Hyderabad'),
(2, 'HR', 'Vijayawada'),
(3, 'Sales', 'Hyderabad'),
(4, 'Finance', 'Chennai'),
(5, 'Marketing', 'Bangalore'),
(6, 'Testing', 'Hyderabad');
select * from department;

INSERT INTO job
VALUES
(101, 'Developer', 25000, 80000),
(102, 'Tester', 20000, 60000),
(103, 'HR Executive', 20000, 50000),
(104, 'Sales Executive', 18000, 55000),
(105, 'Manager', 50000, 120000);
select * from job;

INSERT INTO project
VALUES
(201, 'E-Commerce', 1),
(202, 'Banking App', 1),
(203, 'Recruitment System', 2),
(204, 'Sales Dashboard', 3),
(205, 'Payroll System', 4),
(206, 'Website Testing', 1);

select * from project;

INSERT INTO employee_project
VALUES
(1, 201),
(1, 202),
(1, 206),
(2, 201),
(2, 202),
(3, 203),
(4, 204),
(5, 201),
(5, 202),
(8, 205),
(9, 205),
(11, 206);

select * from employee_project;

-- 1. Display the employee name and department name
-- JOIN: INNER JOIN

SELECT e.emp_name, d.dept_name
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;

-- 2. Display all employees along with department names
-- JOIN: LEFT JOIN

SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d
ON e.dept_id = d.dept_id;

-- 3. Display all departments with employees
-- JOIN: LEFT JOIN

SELECT d.dept_name, e.emp_name
FROM department d
LEFT JOIN employee e
ON d.dept_id = e.dept_id;

-- 4. Display employee name, salary, department name and location
-- JOIN: INNER JOIN

SELECT e.emp_name, e.salary, d.dept_name, d.location
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id;

-- 5. Display employees working in Hyderabad department
-- JOIN: INNER JOIN

SELECT e.emp_name, d.dept_name, d.location
FROM employee e
INNER JOIN department d
ON e.dept_id = d.dept_id
WHERE d.location = 'Hyderabad';

-- 7. Display employee name and job title
-- JOIN: INNER JOIN

SELECT e.emp_name, j.job_title
FROM employee e
INNER JOIN job j
ON e.job_id = j.job_id;

-- 8.Display employees whose salary falls between the minimum and maximum salary defined for their job
-- 8. Display employees whose salary is between job min and max salary
-- JOIN: INNER JOIN

SELECT e.emp_name, e.salary,
       j.job_title, j.min_salary, j.max_salary
FROM employee e
INNER JOIN job j
ON e.job_id = j.job_id
WHERE e.salary BETWEEN j.min_salary AND j.max_salary;

-- 9. Find the highest-paid employee
-- JOIN: INNER JOIN + Subquery

-- 11. Display employee and manager name
-- JOIN: SELF JOIN

SELECT e.emp_name AS employee,
       m.emp_name AS manager
FROM employee e
LEFT JOIN employee m
ON e.manager_id = m.emp_id;

-- 12. Display employees earning more than their managers
-- JOIN: SELF JOIN

SELECT e.emp_name AS employee,
       e.salary AS employee_salary,
       m.emp_name AS manager,
       m.salary AS manager_salary
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- 12. Display employees earning more than their managers
-- JOIN: SELF JOIN

SELECT e.emp_name AS employee,
       e.salary AS employee_salary,
       m.emp_name AS manager,
       m.salary AS manager_salary
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;
