create database assignments;
use assignments;
-- Create Employees table
CREATE TABLE Employees (
    EMPLOYEE_ID INT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    EMAIL VARCHAR(100),
    PHONE_NUMBER VARCHAR(20),
    HIRE_DATE DATE,
    JOB_ID VARCHAR(20),
    SALARY DECIMAL(10, 2),
    COMMISSION_PCT DECIMAL(5, 2),
    MANAGER_ID INT,
    DEPARTMENT_ID INT
);

-- Insert sample data
INSERT INTO Employees (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID) VALUES
(1001, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2023-01-15', 'IT_PROG', 50000.00, 0.05, NULL, 10),
(1002, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '2023-02-20', 'SA_MAN', 80000.00, 0.10, 1001, 20),
(1003, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', '2023-03-10', 'SA_REP', 60000.00, 0.08, 1002, 20),
(1004, 'Michael', 'Brown', 'michael.brown@example.com', '111-222-3333', '2023-04-05', 'ST_MAN', 70000.00, 0.07, 1001, 30),
(1005, 'Emily', 'Davis', 'emily.davis@example.com', '444-555-6666', '2023-05-15', 'IT_PROG', 55000.00, 0.06, NULL, 10),
(1006, 'Robert', 'Wilson', 'robert.wilson@example.com', '777-888-9999', '2023-06-20', 'SA_MAN', 75000.00, 0.09, 1001, 20),
(1007, 'Jessica', 'Martinez', 'jessica.martinez@example.com', '333-444-5555', '2023-07-10', 'SA_REP', 62000.00, 0.08, 1006, 20),
(1008, 'David', 'Taylor', 'david.taylor@example.com', '666-777-8888', '2023-08-05', 'ST_MAN', 72000.00, 0.07, 1001, 30),
(1009, 'Sarah', 'Anderson', 'sarah.anderson@example.com', '222-333-4444', '2023-09-15', 'IT_PROG', 56000.00, 0.06, NULL, 10),
(1010, 'William', 'Brown', 'william.brown@example.com', '999-888-7777', '2023-10-20', 'SA_MAN', 80000.00, 0.10, 1001, 20),
(1011, 'Jennifer', 'Garcia', 'jennifer.garcia@example.com', '111-222-3333', '2023-11-05', 'ST_MAN', 73000.00, 0.07, 1001, 30),
(1012, 'Daniel', 'Rodriguez', 'daniel.rodriguez@example.com', '444-555-6666', '2023-12-15', 'IT_PROG', 57000.00, 0.06, NULL, 10),
(1013, 'Elizabeth', 'Martinez', 'elizabeth.martinez@example.com', '777-888-9999', '2024-01-20', 'SA_MAN', 76000.00, 0.09, 1001, 20),
(1014, 'Michael', 'Hernandez', 'michael.hernandez@example.com', '333-444-5555', '2024-02-10', 'SA_REP', 63000.00, 0.08, 1013, 20),
(1015, 'Jessica', 'Lopez', 'jessica.lopez@example.com', '666-777-8888', '2024-03-05', 'ST_MAN', 74000.00, 0.07, 1001, 30),
(1016, 'Christopher', 'Gonzalez', 'christopher.gonzalez@example.com', '222-333-4444', '2024-04-15', 'IT_PROG', 58000.00, 0.06, NULL, 10),
(1017, 'Mary', 'Perez', 'mary.perez@example.com', '999-888-7777', '2024-05-20', 'SA_MAN', 81000.00, 0.10, 1001, 20),
(1018, 'David', 'Sanchez', 'david.sanchez@example.com', '555-666-7777', '2024-06-10', 'SA_REP', 64000.00, 0.08, 1017, 20),
(1019, 'Patricia', 'Rivera', 'patricia.rivera@example.com', '888-999-0000', '2024-07-05', 'ST_MAN', 75000.00, 0.07, 1001, 30),
(1020, 'James', 'Young', 'james.young@example.com', '777-999-8888', '2024-08-15', 'IT_PROG', 59000.00, 0.06, NULL, 10),
(1021, 'Linda', 'Turner', 'linda.turner@example.com', '222-333-4444', '2024-09-20', 'SA_MAN', 77000.00, 0.09, 1001, 20),
(1022, 'Richard', 'Adams', 'richard.adams@example.com', '444-555-6666', '2024-10-05', 'SA_REP', 65000.00, 0.08, 1021, 20),
(1023, 'Barbara', 'Scott', 'barbara.scott@example.com', '777-888-9999', '2024-11-15', 'ST_MAN', 76000.00, 0.07, 1001, 30),
(1024, 'Joseph', 'Collins', 'joseph.collins@example.com', '111-222-3333', '2024-12-10', 'IT_PROG', 60000.00, 0.06, NULL, 10),
(1025, 'Margaret', 'Stewart', 'margaret.stewart@example.com', '333-444-5555', '2025-01-05', 'SA_MAN', 82000.00, 0.10, 1001, 20),
(1026, 'Robert', 'Ross', 'robert.ross@example.com', '666-777-8888', '2025-02-15', 'SA_REP', 67000.00, 0.08, 1025, 20),
(1027, 'Dorothy', 'Morris', 'dorothy.morris@example.com', '222-333-4444', '2025-03-20', 'ST_MAN', 78000.00, 0.07, 1001, 30),
(1028, 'Michael', 'Ward', 'michael.ward@example.com', '555-666-7777', '2025-04-10', 'IT_PROG', 61000.00, 0.06, NULL, 10),
(1029, 'Sarah', 'Cooper', 'sarah.cooper@example.com', '888-999-0000', '2025-05-05', 'SA_MAN', 84000.00, 0.10, 1001, 20),
(1030, 'William', 'King', 'william.king@example.com', '777-999-8888', '2025-06-15', 'SA_REP', 68000.00, 0.08, 1029, 20),
(1031, 'Karen', 'Torres', 'karen.torres@example.com', '222-333-4444', '2025-07-20', 'ST_MAN', 79000.00, 0.07, 1001, 30),
(1032, 'Edward', 'Peterson', 'edward.peterson@example.com', '555-666-7777', '2025-08-10', 'IT_PROG', 62000.00, 0.06, NULL, 10),
(1033, 'Donna', 'Bailey', 'donna.bailey@example.com', '888-999-0000', '2025-09-05', 'SA_MAN', 86000.00, 0.10, 1001, 20),
(1034, 'Ronald', 'Griffin', 'ronald.griffin@example.com', '777-999-8888', '2025-10-15', 'SA_REP', 69000.00, 0.08, 1033, 20),
(1035, 'Carol', 'Russell', 'carol.russell@example.com', '222-333-4444', '2025-11-20', 'ST_MAN', 80000.00, 0.07, 1001, 30),
(1036, 'Scott', 'Diaz', 'scott.diaz@example.com', '555-666-7777', '2025-12-10', 'IT_PROG', 63000.00, 0.06, NULL, 10),
(1037, 'Amanda', 'Gomez', 'amanda.gomez@example.com', '888-999-0000', '2026-01-05', 'SA_MAN', 88000.00, 0.10, 1001, 20),
(1038, 'Eric', 'Murray', 'eric.murray@example.com', '777-999-8888', '2026-02-15', 'SA_REP', 70000.00, 0.08, 1037, 20);

-- Create Departments table
CREATE TABLE Departments (
    DEPARTMENT_ID INT,
    DEPARTMENT_NAME VARCHAR(255),
    MANAGER_ID INT,
    LOCATION_ID INT,
    PRIMARY KEY (DEPARTMENT_ID)
);

-- Insert 40 entries
INSERT INTO Departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID) VALUES
(10, 'Administration', 1001, 1700),
(20, 'Sales', 1002, 1800),
(30, 'Marketing', 1003, 1900),
(40, 'Human Resources', 1004, 2000),
(50, 'Finance', 1005, 2100),
(60, 'Accounting', 1006, 2200),
(70, 'Research and Development', 1007, 2300),
(80, 'Production', 1008, 2400),
(90, 'Quality Management', 1009, 2500),
(100, 'Shipping', 1010, 2600),
(110, 'IT', 1011, 2700),
(120, 'Customer Service', 1012, 2800),
(130, 'Legal', 1013, 2900),
(140, 'Purchasing', 1014, 3000),
(150, 'Executive', 1015, 3100),
(160, 'Facilities', 1016, 3200),
(170, 'Maintenance', 1017, 3300),
(180, 'Security', 1018, 3400),
(190, 'Training', 1019, 3500),
(200, 'Consulting', 1020, 3600),
(210, 'Operations', 1021, 3700),
(220, 'Logistics', 1022, 3800),
(230, 'Engineering', 1023, 3900),
(240, 'Customer Support', 1024, 4000),
(250, 'Information Technology', 1025, 4100),
(260, 'Product Management', 1026, 4200),
(270, 'Quality Assurance', 1027, 4300),
(280, 'Public Relations', 1028, 4400),
(290, 'Legal Affairs', 1029, 4500),
(300, 'Research', 1030, 4600),
(310, 'Business Development', 1031, 4700),
(320, 'Finance and Accounting', 1032, 4800),
(330, 'Marketing and Sales', 1033, 4900),
(340, 'Human Resources and Training', 1034, 5000),
(350, 'Supply Chain Management', 1035, 5100),
(360, 'Strategic Planning', 1036, 5200),
(370, 'Internal Audit', 1037, 5300),
(380, 'Facility Management', 1038, 5400),
(390, 'Customer Relations', 1039, 5500),
(400, 'Corporate Communications', 1040, 5600);

/*Q. Write a SQL query to find those employees who receive a higher salary than the employee
with ID 1018. Return first name, last name. */

select *
from employees
where salary >(select salary from employees where employee_id = 1018);

/* write a SQL query to find out which employees have the same designation as the employee
whose ID is 1018. Return first name, last name, department ID and job ID. */

select *
from employees
where Job_id = (select job_id from employees where employee_id = 1018);

/* Write a SQL query to find those employees whose salary matches the lowest salary of any of
the departments. Return first name, last name and department ID. */

select first_name, last_name, department_id
from employees where salary in(
select min(salary) from employees
group by department_id);


/* Q. write a SQL query to find those employees who report to that manager whose first name is
'Linda'. Return first name, last name, employee ID and salary. */
select * from employees;
select employee_id, first_name,last_name, salary
from employees
where manager_id =
(select MANAGER_ID
from employees where first_name = 'Linda');


/* write a SQL query to find those employees whose ID matches any of the numbers 1018, 1029
and 1035. Return all the fields. */

select * 
from employees where 
employee_id in( 1018,1029,1035);

/* write a SQL query to find those employees whose salary is in the range of 60000, and 80000
(Begin and end values have included.). Return all the fields. */

select *
from employees 
where salary between 60000 and 80000;

/* write a SQL query to find those employees whose salary falls within the range of the smallest
salary and 60000. Return all the fields */

select *
from employees
where salary between (select min(salary) from employees) and 60000;

/* write a SQL query to find those employees who do not work in the departments where
managers’ IDs are between 1021 and 1031 (Begin and end values are included.). Return all the
fields of the employeess. */

select *
from employees where department_id not in
(select department_id from departments
where manager_id between 1021 and 1031);

/* write a SQL query to find those employees who work in the same department as 'Linda'.
Exclude all those records where first name is 'Linda'. Return first name, last name and hire date. */

select first_name,last_name, hire_date
from employees where department_id  in(
select department_id from employees
where first_name = 'Linda')
and first_name <> 'Linda';

/* write a SQL query to find those employees who work in a department where the employee’s
first name contains the letter 'T'. Return employee ID, first name and last name. */

select employee_id , first_name, last_name 
from employees 
where department_id in
(select department_id from employees where first_name like '%T%');

/* write a SQL query to find those employees who earn more than the average salary and work
in the same department as an employee whose first name contains the letter 'J'. Return
employee ID, first name and salary. */

select employee_id, first_name, salary from employees
where salary >
(select avg(salary) from employees) and department_id in
(select department_id from employees where first_name like '%J%');

/* Q. write a SQL query to find those employees whose department is located at ‘Toronto’. Return
first name, last name, employee ID, job ID. */

select first_name , last_name , employee_id , job_id
from employees 
where department_id in(
select department_id 
from departments 
where location_id = (
select location_id from
location where city  = 'Toranto'));

/* write a SQL query to find those employees whose salaries are higher than the average for all
departments. Return employee ID, first name, last name, job ID. */

select employee_id , first_name, last_name 
from employees where salary > ALL(
SELECT AVG(salary)
FROM employees
GROUP BY department_id);

/* Write a query to display the employee id, name ( first name and last name ) and the job id
column with a modified title SALESMAN for those employees whose job title is ST_MAN and
DEVELOPER for whose job title is IT_PROG. */

select * from employees;
select employee_id, concat(first_name , ' ' , last_name) as `Name`,
case job_id
when 'ST_MAN' then 'Salesman'
when 'IT_PROG' then 'Developer'
else job_id
end as Designation , Salary
from employees;

/* Write a query to display the employee id, name ( first name and last name ), salary and the
SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary
is more than and less than the average salary of all employees. */

select avg(salary) from employees;

select employee_id, concat(first_name, ' ' , last_name) as `Name`, Salary,
Case
when Salary >= (select avg(salary) from employees) then 'High'
else 'Low'
end as Salary_Status
from employees;

/* write a SQL query to find those employees whose salaries exceed 50% of their department's
total salary bill. Return first name, last name. */

select department_id, avg(salary) from employees
group by department_id;

select sum(salary)/2 from employees
group by department_id;

select first_name , last_name
from employees 
where salary > all(select sum(salary)/2 from employees
group by department_id);

/* write a SQL query to find those employees who are managers. Return all the fields of
employees table. */

SELECT *
FROM employees
WHERE employee_id IN
(SELECT DISTINCT manager_id FROM employees);

# Find duplicate values in 1 column

select employee_id , count(employee_id) as total_count
from employees
group by 1
having total_count >1 ;

# Find duplicate values on 2 columns combination

select first_name, last_name , count(*) as total_count
from employees
group by 1,2
having total_count > 1;

-- Write a SQL query to find the most frequent value in a column, along with its frequency

select department_name,count
from (
select department_name, count(*) as count
from departments
group by department_name
) as subquery
order by 2 desc
limit 1;

-- Write a SQL query to find the names of all employees who earn more than the
-- average salary in their department using a correlated subquery.

select first_name,salary
from employees e
where salary >= (
select avg(salary)
from employees e
where DEPARTMENT_ID = e.department_id)
order by 2 desc;

--  Create a SQL query to find the top 3 products with the highest sales within each
-- category using a correlated subquery










