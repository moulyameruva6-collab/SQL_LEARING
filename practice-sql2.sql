-- in employee table:
-- emp_id,emp_name,,dep_id,manager_id,salary,city

-- department table
-- dep_id,dep_name,loc_id

-- location table
-- loc_id,loc_name

-- project table
-- pro_id,pro_name,dep_id

-- employee project
-- emp_id,pro_id
use classicmodels;
SELECT * FROM employees;

-- employee,department,location
SELECT e.emp_id,e.emp_name,d.dep_name,l.loc_name
FROM employee e
LEFT JOIN department d
ON e.dep_id = d.dep_id
RIGHT JOIN location l
ON d.loc_id = l.loc_id;
