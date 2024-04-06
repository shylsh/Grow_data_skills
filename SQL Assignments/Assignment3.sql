select * from employees;
# Question 1: How can you select all employees whose names start with the letter 'A'?
select concat(firstName, ' ', lastName) as full_name 
from employees
having full_name like 'A%';

select * from employees where firstName like 'A%';

-- Question 2: How do you find all products whose names contain the word 'phone' regardless of case?

-- Question 3: How can you retrieve all email addresses from a table that end with '.com'?

select * from 
employees 
where email like '%.com';

-- Question 4: How do you find all phone numbers that start with the area code '555'?

select * from 
customers
where phone like '555%';

-- Question 5: How can you select all cities that start with 'New' followed by any characters?
select * from 
customers 
where city like 'new%';

/* Question 6: How do you find all records where the value in the 'description' column
contains either 'apple' or 'orange'? */

select * from products
where productDescription like '%apple%' or productDescription like '%orange%';

/*Question 7:How can you retrieve all email addresses that follow the pattern of
"user@domain.com"?*/

select count(*) from employees
where email regexp '^[A-Za-z0-9.%_-]+@[A-Za-z]+\\.[A-Za-z]{2,4}$';

/*Question 8:How do you find all records where the 'product_code' is exactly four
characters long and consists of letters and digits? */

select * from products
where productCode regexp '^[A-Za-Z0-9]{4}$';

/*Question 9:How can you retrieve all phone numbers that match the pattern
'###-###-####'?*/

select * from customers
where phone regexp '^[0-9]{3}-[0-9]{3}-[0-9]{4}]$';

/*Question 10:How do you find all records where the 'text' column contains two
consecutive digits?*/

select productName from products
where productName regexp '[0-9]{2}';

/*Find all employees whose birthdates are not recorded (NULL).*/

select * from employee
where bdate is not null;

/*: List all orders that don't have a customer assigned (NULL customerID).*/

select * from customers
where `customerNumber` is null;

/*
Consider a table named Sales with the following columns:
SaleID (integer): The unique identifier for each sale.
Product (string): The name of the product sold.
Quantity (integer): The quantity of the product sold.
Price (decimal): The price per unit of the product.
*/

create table if not exists Sales(
SaleID int not null unique,
Product varchar(60),
Quantity int,
price float
);

insert into Sales values
(1,'car',10,'35.5'),
(2,'bus',35,'40'),
(3,'bike',20,'49'),
(4,'excavator',27,'50'),
(5,'roadroller',10,'75.75')
;
select * from Sales;

/*Find the total quantity sold for each product*/

select sum(Quantity) as Total_Quantity from Sales;

select Product, sum(Quantity) as Total_quantity from Sales
group by Product;

/* Calculate the total revenue generated from each product (Total Revenue =
Quantity * Price). */

select Product, Quantity * price as Total_Revenue
from Sales;
select Product, Quantity * price as Total_Revenue
from Sales
having Total_Revenue > 900;

/*Determine the average price of each product.*/
select Product, avg(Price) as Average_price
from Sales
group by Product;

select productName,avg(buyPrice)as Average_price from products
group by productName;

/* Find the product with the highest total revenue (Quantity * Price)*/

select * from products;
select quantityInStock * buyPrice from products;
describe products;
select productName , sum(quantityInStock * buyPrice) as Total_revenue
from products
group by 1
order by 2 desc limit 1;

/*Calculate the total quantity sold across all products.*/

select sum(quantityInStock) as Total_Stock from products;

/* Determine the average price of all products */

select avg(buyPrice)as average_price from products;

/* Determine the square root of the price for each product */

select productCode,productName, round(sqrt(buyPrice) ,2)as price_square_root
from products;

# Find the ceiling (smallest integer greater than or equal to) of the prices

select productCode, productName, buyPrice, ceil(buyPrice) as ceiling_price
from products;

# Calculate the floor (largest integer less than or equal to) of the prices

select productCode, productName, buyPrice, floor(buyPrice) as floor_price
from products;

select * from orders;

/* Find the difference in days between the order date and delivery date for each
order.*/

select orderNumber, orderDate,shippedDate, datediff(shippedDate,orderDate) as days_to_deliver
from orders;

# Calculate the total delivery time in hours for all orders

select orderNumber, sum(timestampdiff(HOUR,orderDate,shippedDate)) as total_delivery_time,datediff(shippedDate,orderDate) as days_to_deliver
from orders
group by 1;

# Determine the day of the week when each order was placed

select orderNumber, orderDate,dayofweek(orderDate) as week_day,# sunday 1 to saturday 7
weekday(orderDate) # monday -0 to sunday -6 
from orders;

# Find the orders that were placed on a Saturday (DayOfWeek = 7)

select orderNumber, orderDate
from orders
where dayofweek(orderDate) = 7;

# Calculate the average delivery time in days for all orders

select avg(datediff(shippedDate,orderDate)) as average_delivery_days
from orders;

#: Find the orders that were delivered on the same day they were placed.

select orderNumber
from orders
where datediff(shippedDate,orderDate) = 1;

select orderNumber, orderDate, shippedDate ,timestampdiff(hour,orderDate,shippedDate) as total_delivery_time
from orders
having total_delivery_time < 25;

select orderNumber, orderDate, shippedDate
from orders
where date(orderDate) = date(shippedDate);

# Group by , Having , Order By

select * from payments;

/* Write an SQL query to find the customer IDs of customers who have placed orders with
a total amount greater than $5,000 */

select customerNumber,count(customerNumber)
from payments
group by customerNumber
having sum(amount) > 5000;


/* Write an SQL query to find the product IDs of products that have been sold in quantities
greater than 100 on at least three different sale dates. */

select * from sales_data_sample;

select PRODUCTCODE
from sales_data_sample
group by PRODUCTCODE
having sum(QUANTITYORDERED) > 100 and count(distinct ORDERDATE)> 3;

select * from `companydb`.`employee`;

/* Write an SQL query to find the average salary of employees in each department, but
only for departments where the average salary is greater than $30,000 */

select fname, dno, salary
from `companydb`.`employee`
group by 1,2,3
having avg(salary) > 30000
order by 3 desc;

select * from `grow_data_skills`.`students`;

/* Write an SQL query to find the course names in which the average score of all students
is greater than or equal to 80.*/

select course
from `grow_data_skills`.`students`
group by course
having avg(scores) > 80;


/* Write an SQL query to find the department with the highest average salary */

select dno
from `companydb`.`employee`
group by dno
having max(salary)
order by 1 desc
limit 1;

# Write an SQL query to find the product with the highest total quantity sold

select * from `grow_data_skills`.`sales`;

select product, sum(quantity) as Total_quantity
from `grow_data_skills`.`sales`
group by product
order by 2 desc limit 1;

/* Write an SQL query to find the top three students with the highest average score across
all courses */

select student_name, sum(scores) as total_score
from students
group by 1
order by 3 desc limit 3;

/* Write an SQL query to find the total amount of orders placed by each customer, ordered
in descending order of total amount. */

select * from sales_data_sample;

select CUSTOMERNAME, sum(QUANTITYORDERED) as total_quantity
from sales_data_sample
group by 1
order by 2 desc;

/* Write an SQL query to find the number of books published by each author in
descending order of the count */
select * from `grow_data_skills`.`books`; 

-- Create the Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Author VARCHAR(255),
    PublicationYear INT
);

-- Populate the Books table with 50 entries
INSERT INTO Books (Author, PublicationYear) VALUES
('John Smith', 2005),
('Jane Doe', 2010),
('Alice Johnson', 2015),
('Michael Brown', 2008),
('Emily White', 2019),
('David Clark', 2012),
('Sarah Lee', 2003),
('Chris Taylor', 2018),
('Jessica Martinez', 2016),
('Matthew Wilson', 2011),
('Laura Anderson', 2006),
('Daniel Thomas', 2017),
('Megan Harris', 2009),
('Ryan King', 2014),
('Amanda Scott', 2007),
('Kevin Carter', 2013),
('Michelle Turner', 2004),
('Jason Hall', 2020),
('Stephanie Wright', 2002),
('Mark Robinson', 2021),
('Rebecca Brown', 2001),
('Brian Martinez', 2022),
('Patricia Davis', 2000),
('Thomas Miller', 2023),
('Kimberly Nelson', 1999),
('Joseph Garcia', 2024),
('Jennifer Wilson', 1998),
('James Thompson', 2025),
('Elizabeth Perez', 1997),
('Christopher Taylor', 2026),
('Ashley Jackson', 1996),
('William White', 2027),
('Nicole Moore', 1995),
('Steven Gonzalez', 2028),
('Heather Evans', 1994),
('Timothy Martinez', 2029),
('Samantha Anderson', 1993),
('Charles Lopez', 2030),
('Danielle Hall', 1992),
('Andrew Harris', 2031),
('Rachel Phillips', 1991),
('Joshua King', 2032),
('Katherine Murphy', 1990),
('Jonathan Wright', 2033),
('Melissa Lee', 1989),
('Robert Rodriguez', 2034),
('Lauren Taylor', 1988),
('Eric Scott', 2035),
('Kimberly Harris', 1987),
('Brandon Martinez', 2036);

/* Write an SQL query to find the number of books published by each author in
descending order of the count */

select * from books;

select author, count(bookID) as total_books_published
from books
group by 1
order by 2 desc;


-- Create the Orders1 table
CREATE TABLE Orders1 (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Populate the Orders1 table with 50 entries
INSERT INTO Orders1 (CustomerID, OrderDate, TotalAmount) VALUES
(101, '2023-10-01', 100.00),
(102, '2023-10-02', 150.50),
(103, '2023-10-03', 75.25),
(104, '2023-10-04', 200.75),
(105, '2023-10-05', 50.00),
(106, '2023-10-06', 300.00),
(107, '2023-10-07', 125.80),
(108, '2023-10-08', 180.60),
(109, '2023-10-09', 90.45),
(110, '2023-10-10', 220.30),
(111, '2023-10-11', 75.20),
(112, '2023-10-12', 150.75),
(113, '2023-10-13', 400.25),
(114, '2023-10-14', 85.00),
(115, '2023-10-15', 175.50),
(116, '2023-10-16', 120.75),
(117, '2023-10-17', 250.00),
(118, '2023-10-18', 95.30),
(119, '2023-10-19', 180.60),
(120, '2023-10-20', 300.45),
(121, '2023-10-21', 120.20),
(122, '2023-10-22', 200.75),
(123, '2023-10-23', 450.25),
(124, '2023-10-24', 105.00),
(125, '2023-10-25', 250.50),
(126, '2023-10-26', 80.25),
(127, '2023-10-27', 320.00),
(128, '2023-10-28', 150.80),
(129, '2023-10-29', 200.60),
(130, '2023-10-30', 110.45),
(131, '2023-10-31', 180.30),
(132, '2023-11-01', 95.20),
(133, '2023-11-02', 140.75),
(134, '2023-11-03', 420.25),
(135, '2023-11-04', 105.00),
(136, '2023-11-05', 230.50),
(137, '2023-11-06', 70.25),
(138, '2023-11-07', 280.00),
(139, '2023-11-08', 160.80),
(140, '2023-11-09', 220.60),
(141, '2023-11-10', 130.45),
(142, '2023-11-11', 190.30),
(143, '2023-11-12', 85.20),
(144, '2023-11-13', 100.75),
(145, '2023-11-14', 390.25),
(146, '2023-11-15', 95.00),
(147, '2023-11-16', 270.50),
(148, '2023-11-17', 60.25),
(149, '2023-11-18', 240.00),
(150, '2023-11-19', 180.80);

select * from orders1;

/* Write an SQL query to find the customer IDs of customers who have placed orders with
a total amount greater than $1,000 and have placed at least two orders. */

select customerid
from orders1
group by 1
having sum(totalamount) > 1000 and count(orderid) > 2;

select * from products1;

/* Write an SQL query to find the average price of products in each category, ordered by
category name in ascending order. */

select Category, avg(price) as average_price
from products1
group by 1
order by 2 desc;

-- Create the Employees table
CREATE TABLE Employees1 (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Department VARCHAR(255),
    Salary DECIMAL(10, 2)
);

-- Populate the Employees table with 50 entries
INSERT INTO Employees1 (Department, Salary) VALUES
('Engineering', 60000.00),
('Sales', 50000.00),
('Marketing', 55000.00),
('Finance', 65000.00),
('Engineering', 62000.00),
('Sales', 52000.00),
('Marketing', 57000.00),
('Finance', 68000.00),
('Engineering', 63000.00),
('Sales', 51000.00),
('Marketing', 56000.00),
('Finance', 67000.00),
('Engineering', 64000.00),
('Sales', 53000.00),
('Marketing', 58000.00),
('Finance', 69000.00),
('Engineering', 65000.00),
('Sales', 54000.00),
('Marketing', 59000.00),
('Finance', 70000.00),
('Engineering', 66000.00),
('Sales', 55000.00),
('Marketing', 60000.00),
('Finance', 71000.00),
('Engineering', 67000.00),
('Sales', 56000.00),
('Marketing', 61000.00),
('Finance', 72000.00),
('Engineering', 68000.00),
('Sales', 57000.00),
('Marketing', 62000.00),
('Finance', 73000.00),
('Engineering', 69000.00),
('Sales', 58000.00),
('Marketing', 63000.00),
('Finance', 74000.00),
('Engineering', 70000.00),
('Sales', 59000.00),
('Marketing', 64000.00),
('Finance', 75000.00),
('Engineering', 71000.00),
('Sales', 60000.00),
('Marketing', 65000.00),
('Finance', 76000.00),
('Engineering', 72000.00),
('Sales', 61000.00),
('Marketing', 66000.00),
('Finance', 77000.00),
('Engineering', 73000.00),
('Sales', 62000.00),
('Marketing', 67000.00),
('Finance', 78000.00);

select * from employees1;

# Write an SQL query to find the department(s) with the lowest average salary

select department, round(avg(Salary) ,0)as average_salary
from employees1
group by 1
order by 2 limit 1;

/* Write an SQL query to find the customer IDs of customers who have placed orders with
a total amount greater than $200 in the year 2023, ordered by customer ID in ascending
order. */

select * from orders1;

select CustomerID
from orders1
where extract(year from orderDate) = 2023
group by 1
having sum(TotalAmount) > 200
order by 1;

-- Create the Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Course VARCHAR(255),
    Score INT
);

-- Populate the Students table with 50 entries
INSERT INTO Students (Course, Score) VALUES
('Mathematics', 85),
('English', 92),
('Science', 78),
('History', 88),
('Mathematics', 90),
('English', 85),
('Science', 82),
('History', 75),
('Mathematics', 88),
('English', 95),
('Science', 80),
('History', 82),
('Mathematics', 92),
('English', 90),
('Science', 85),
('History', 78),
('Mathematics', 86),
('English', 88),
('Science', 83),
('History', 92),
('Mathematics', 95),
('English', 82),
('Science', 90),
('History', 85),
('Mathematics', 80),
('English', 78),
('Science', 88),
('History', 90),
('Mathematics', 75),
('English', 92),
('Science', 86),
('History', 78),
('Mathematics', 88),
('English', 85),
('Science', 82),
('History', 75),
('Mathematics', 90),
('English', 95),
('Science', 80),
('History', 82),
('Mathematics', 92),
('English', 90),
('Science', 85),
('History', 78),
('Mathematics', 86),
('English', 88),
('Science', 83),
('History', 92),
('Mathematics', 95),
('English', 82),
('Science', 90),
('History', 85);

/* Write an SQL query to find the course names in which the highest score achieved by
any student is greater than or equal to 90, ordered by course name in ascending order */

select Course
from students
where Score > 90
group by 1
order by 1;

select Course
from students
group by 1
having max(Score) > 90
order by 1;

/* Write an SQL query to find the customer IDs of customers who have placed orders with
a total amount greater than $500 in the year 2023 and have placed at least two orders
in that year */

select CustomerID 
from orders1
where extract(year from orderdate) = 2023
group by 1
having sum(TotalAmount) > 200 
and  count(case when OrderID < 2 then 1 else null end) > 0;

/* Write an SQL query to find the course names where the average score of students who
scored less than 70 in at least one course is greater than or equal to 80. */

SELECT Course
FROM Students
GROUP BY Course
HAVING AVG(Score) >= 80
AND COUNT(CASE WHEN Score < 70 THEN 1 ELSE NULL END) > 0;


/* Write an SQL query to find the departments where the highest salary is greater than
$70,000 and the total number of employees in that department is at least 5 */

select Department
 from employees1
 group by 1
 having max(Salary)> 70000
 and count(EmployeeID) >5;
 
 
 /* Write an SQL query to find the categories where the average price of products is
greater than or equal to $50, and the maximum price within that category is greater than
$100 */
 
select * from products1;

select category, avg(Price) as average_price
from products1
group by category
having avg(Price) >= 50 and max(price) >100;

/* Write an SQL query to find the customer IDs of customers who have placed orders with
a total amount greater than $1,000 in any single order and have placed orders on at
least three different dates */

select * from orders1;

select CustomerID
from orders1
group by 1
having sum(TotalAmount) > 1000 and count(distinct orderDate) >=3;


















