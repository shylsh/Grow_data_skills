create database Grow_data_Skills;
use Grow_data_skills;
create table if not exists students(
SudentID int,
FirstName varchar(20),
LastName varchar(20),
Age int
);
select * from students;

alter table students rename column SudentID to StudentID;
alter table students modify column StudentID int primary key;

insert into students (StudentID,FirstName,LastName,Age) values
(1, 'John', 'Doe', 20),
(2, 'Jane', 'Smith', 22),
(3, 'Robert', 'Johnson', 21),
(4, 'Emily', 'Williams', 23),
(5, 'Michael', 'Brown', 22),
(6, 'Emma', 'Jones', 21),
(7, 'Daniel', 'Garcia', 23),
(8, 'Olivia', 'Martinez', 20),
(9, 'William', 'Miller', 21),
(10, 'Sophia', 'Davis', 22),
(11, 'Alexander', 'Rodriguez', 23),
(12, 'Ava', 'Hernandez', 20),
(13, 'David', 'Jackson', 21),
(14, 'Ella', 'Taylor', 22),
(15, 'Matthew', 'Anderson', 23),
(16, 'Amelia', 'White', 20),
(17, 'Henry', 'Thomas', 21),
(18, 'Sofia', 'Moore', 22),
(19, 'Joseph', 'Lee', 23),
(20, 'Grace', 'Harris', 20),
(21, 'Benjamin', 'Clark', 21);

delete from students where studentID = 3;

select `FirstName`,`Age` from students
where Age > 20;

delete from students where age<20;

create table if not exists Customers (
CustomerID int primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Email varchar(50) unique,
Age int check (`Age`> 18) not null);

describe Customers;

-- Q. You have a table named "Orders" with columns: OrderID (int), CustomerID (int),
 -- OrderDate (date), and TotalAmount (decimal). Create a foreign key constraint on the
-- "CustomerID" column referencing the "Customers" table.

create table if not exists Orders(
OrderID int primary key,
CustomerID int,
OrderDate date,
TotalAmount decimal(10,2),
foreign key (CustomerID) references `customers`(`CustomerID`));

describe Orders;

-- Q. Create a table named "Employees" with columns:
-- EmployeeID (int) as the primary key.
-- FirstName (varchar) not null.
-- LastName (varchar) not null.
-- Salary (decimal) check constraint to ensure salary is between 20000 and 100000.

create table if not exists `Employees` (
EmployeeID int primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Salary decimal(10,2) check (Salary between 20000 and 100000));

describe Employees;

create table if not exists Books (
BookId int primary key,
title varchar(20) not null,
ISBN varchar(50) unique not null
);

describe books;

select * from employees;

alter table employees add column age int;

insert into employees(age) values(
(23),(35),(34),(26),(23),(35),(57),(78),(19),(34),(56),(28),(23),(25)
);

select FirstName,LastName
from employees
where age > 30;

select FirstName,LastName,age
from employees
where age between 20 and 30;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    InStock INT NOT NULL CHECK (InStock IN (0, 1))
);

INSERT INTO Products (ProductID, ProductName, Price, InStock)
VALUES
    (1, 'Laptop', 899.99, 1),
    (2, 'Smartphone', 599.99, 1),
    (3, 'Headphones', 79.99, 1),
    (4, 'Tablet', 299.99, 0),
    (5, 'Camera', 499.99, 1),
    (6, 'Printer', 199.99, 0),
    (7, 'External Hard Drive', 129.99, 1),
    (8, 'Wireless Mouse', 19.99, 1),
    (9, 'Keyboard', 29.99, 0),
    (10, 'Monitor', 249.99, 1);

select ProductName,Price
from products
where Price > 100 or InStock = 0;

select ProductName,Price
from products
where Price between 50 and 150 and InStock = 1;

-- Create Orders table
CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CustomerID INT
);

-- Insert sample values
INSERT INTO Orders1 (OrderID, OrderDate, TotalAmount, CustomerID)
VALUES
    (1, '2023-05-10', 150.75, 101),
    (2, '2023-05-11', 299.99, 102),
    (3, '2023-05-12', 45.50, 103),
    (4, '2023-05-13', 500.00, 104),
    (5, '2023-05-14', 99.95, 105),
    (6, '2023-05-15', 199.99, 106),
    (7, '2023-05-16', 29.99, 107),
    (8, '2023-05-17', 799.50, 108),
    (9, '2023-05-18', 89.00, 109),
    (10, '2023-05-19', 349.99, 110);
    
select OrderID , TotalAmount
from Orders1
where customerID = 101 and OrderDate > '2023-01-01' or TotalAmount > 50;

select ProductName
from products
where products.Price between 50 and 100;

select FirstName 
from employees
where department = 'Sales' and age> 25 or department = 'Marketing';

select FirstName 
from customers
where City not in ('New York','Los Angeles');

select FirstName 
from employees
where department = 'HR' and age < 35 or department = 'Finance' and age >= 35;

select *
from customers
where City not in ('London') and Country not in('USA') and PostalCode like '1%';















