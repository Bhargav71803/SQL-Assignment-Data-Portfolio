-- Assignment 1

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS users;

CREATE TABLE employees (
	Emloyee_id SERIAL PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary DECIMAL(10,2) CHECK (salary>0),
	joining_date DATE NOT NULL,
	age INT CHECK (age>0)
);

INSERT INTO employees (firstname, lastname, department,  salary,joining_date, age)
VALUES 
('Amit','Sharma','IT' , 60000.00 ,'2022-05-01',29),
('Neha', 'Patel', 'HR', 55000.00,'2021-08-15',32),
('Ravi', 'Kumar', 'Finance',75000.00,'2020-03-10', 35),
('Anjali','Varma', 'IT', '65000.00','2019-11-22',28),
('Suresh','Reddy', 'Operations',50000.00,'2023-01-10',26);

select * from employees
SELECT FIRSTNAME, DEPARTMENT FROM EMPLOYEES;

UPDATE employees
SET salary = salary * 11/10
WHERE department = 'IT'

ALTER TABLE employees
ADD COLUMN email VARCHAR(50);

ALTER TABLE employees
RENAME COLUMN department to departmentname;

SELECT firstname, lastname, joining_date from employees

SELECT firstname, age, salary from employees
order by salary desc;
WHERE joining_date > '2021-01-01';

ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER USING salary:: INTEGER;


-- Assignment 2

select * from employee;
drop table employee;

create table siddharth (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR(50),
	department VARCHAR(50),
	salary NUMERIC(10,2),
	joining_date DATE,
	age INT
);

GRANT ALL PRIVILEGES ON SCHEMA public TO postgres;
GRANT ALL PRIVILEGES ON TABLE siddharth TO postgres;

INSERT INTO siddharth
SELECT * FROM siddharth;

ALTER TABLE siddharth
RENAME TO employee;

select * from employee;

select  (salary*0.10) as bonus
 from employee;
--calculat new salary
 SELECT first_name, last_name, department,salary,
 		(salary*12) AS Anual_salary,
		 (salary*0.05) AS Incrimet_salary,
		 (salary*1.05) AS new_salary
 		FROM employee;


-- Assignment 3

SELECT * FROM employee;

SELECT first_name, salary, 
 	(salary*0.05) AS incriment,
	 (salary*1.05) AS new_salary
	FROM employee;

SELECT * FROM employee WHERE age>=40 AND salary >= 50000;

SELECT * FROM employee WHERE age>=60 OR salary >= 60000;


SELECT * FROM employee 
WHERE NOT (department='IT');

SELECT * FROM employee 
WHERE NOT (age>25);


--assinment
--1.Retrieve employee whose salary is between 40,000 and 60,000 -use between oparator 

SELECT first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 40000 AND 60000;

--2. find employee whos email addreass end with gmail.com - use like oparator 

SELECT first_name, last_name, email, salary
FROM employee
WHERE email like '%gmail.com';

-- Retrive employee who belong to either the 'finance' or 'marketing' departmentn -- use in oparator 

SELECT first_name, last_name, department
FROM employee
WHERE department IN ('Finance','Marketing');

SELECT DISTINCT department FROM employee;

--find employee where the email colum is null(if applicable)

SELECT first_name, last_name, email
FROM employee
WHERE email IS NULL;

-- list employees sorted by salary in DESCRENDING order

SELECT first_name, last_name, salary
FROM employee
ORDER BY salary DESC 
limit 5;

-- Assignment 4

DROP TABLE IF EXISTS student_2024;

CREATE TABLE student_2023(
	student_id INT PRIMARY KEY,
	student_name VARCHAR(50),
	course VARCHAR(50)
);

SELECT * FROM student_2024;

INSERT INTO student_2023(student_id, student_name, course)
VALUES
		(1, 'Arav Sharma', 'Computer Science'),
		(2, 'Ishita Varma', 'Machanical Engineering'),
		(3, 'Kabir Patel', 'Electronics'),
		(4, 'Ananya Desai', 'Civil Engieenring'),
		(5, 'Rahul Gupta', 'Computer Science');

CREATE TABLE student_2024(
	student_id INT PRIMARY KEY,
	student_name VARCHAR(50),
	course VARCHAR(50)
);

INSERT INTO student_2024(student_id, student_name, course) VALUES
		(1, 'bhargav prjapati', 'computer science'),
		(2, 'amisha prajapati', 'civil engineering'),
		(3, 'Kabir Patel', 'Electronics'),
		(4, 'Ananya Desai', 'Civil Engieenring'),
		(5, 'Rahul Gupta', 'Computer Science');
		
--UNION

SELECT student_name, course
FROM student_2023
UNION 
SELECT student_name, course
FROM student_2024;

--UNION ALL 

SELECT student_name, course
FROM student_2023
UNION ALL
SELECT student_name, course
FROM student_2024;

--INTERSECT


SELECT student_name, course
FROM student_2023
INTERSECT
SELECT student_name, course
FROM student_2024;


--EXCEPT

SELECT student_name, course
FROM student_2023
EXCEPT
SELECT student_name, course
FROM student_2024;
		


-- Asssignment 5


DROP TABLE IF EXISTS products;

CREATE TABLE products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	category VARCHAR(50),
	price NUMERIC(10,2),
	quantity INT,
	added_date DATE,
	discount_rate NUMERIC(10,2)
);

INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate)
VALUES 
('Leptop', 'Electronics',75000.50, 10,'2024-01-15',10.00),
('Smartphone', 'Electronics',45000,25,'2024-02-20',5.00),
('Headphone','Accessories', 1500.75,50,'2024-03-05',15.00),
('office chair', 'Furniture', 5500.00,20,'2023-12-01',20),
('Desk', 'Furniture',8000.00,15,'2023-11-20',12.00),
('Monitor', 'Electronics',12000.00,8,'2024-01-10',8),
('Printer','Electronics', 9500.50,5,'2024-02-01',7.50),
('Mouse','Accessories',750.00,40,'2024-03-18',10.00),
('Keybord','Accessories',1250.00,35,'2024-03-08',10.00),
('Table','Electronics',30000.00,12,'2024-02-18',5.00);

SELECT * FROM products;



--Total Quantity available of all product 

SELECT SUM(quantity) AS total_quantity
FROM products;



SELECT SUM(quantity) AS quantity_of_electronics
FROM products
WHERE category = 'Electronics' and price > 20000;

-- total number of products 

SELECT COUNT (*) AS total_products
from products;

-- count with condition

SELECT COUNT (*) AS total_products
FROM products
WHERE product_name LIKE '%phone%';

--Select with condition 

SELECT product_name, quantity
FROM products
WHERE product_name LIKE '%phone';

--average price of producet

SELECT AVG (price) 	AS average_price
FROM products;


--Average price with condition 

SELECT AVG(price) AS average_price
FROM products
WHERE category='Accessories';


SELECT AVG(price) AS average_price
FROM products
WHERE category='Accessories' OR added_date >'2024-02-01';

SELECT MAX(price) AS max_price,
		 MIN (price) AS min_price
FROM products;


-- Assignment 6
SELECT * FROM PRODUCTS;

-- Get all the categorys in uppercase 

SELECT UPPER (category) AS catagory_capital
FROM products;

-- get all the categorys in lowercase 

SELECT LOWER (category) as category_small
FROM products;

--join product name adn category text with hypen.

	SELECT CONCAT (product_name,'_', category) AS product_detail
	from products;

-- Extract first 5 caractor from product name 

SELECT SUBSTRING (product_name,1,5) AS short_name
FROM products;

-- count langth

SELECT product_name, LENGTH (product_name) AS count_of_char
FROM products;

-- remove leading and trailing spaces from string

SELECT LENGTH(TRIM('    monitor     '))AS trimmed_text;
SELECT LENGTH ('    monitor     ')AS length_text;


-- replace word "phone" with the "device" in product names

SELECT REPLACE (product_name, 'phone', 'device') AS updated
FROM products;


--Get the first three caractores from category

SELECT LEFT (category, 3) AS Categor_capitital
FROM products;


-- Assingmnet 7

SELECT * from products;

--1. now () - get current date and time 

SELECT NOW () CURRUNT_DATETIME;

--2. CURRUNT_DATE()-GET CURRENT Date

SELECT CURRENT_DATE AS Today_date;


SELECT added_date, current_date, (CURRENT_DATE-added_date) AS Days
FROM products;


-- 3. EXTRACT()- part of a date 
-- Extract the year, month and day from the added date colomn.

SELECT product_name,
			EXTRACT(YEAR FROM added_date) AS year_added
FROM products;


SELECT product_name,
	EXTRACT (day FROM added_date) AS months
	FROM products;

SELECT product_name,
	EXTRACT (YEAR FROM added_date) AS years,
	EXTRACT (MONTH FROM added_date) AS months,
	EXTRACT (DAY FROM added_date) AS days
	FROM products;


--4. AGE() - Calculate age between dates
-- Calculate the time between added_date and today's date

SELECT product_name, current_date,
	AGE (CURRENT_DATE, added_date) AS age_added_date
	FROM products;

--5. TO_CHAR()- Formate dates as strings
-- format added date in a custom format (DD-MON-YYYY)


 SELECT product_name,
 	TO_CHAR (added_date, 'DD/MONTH/YYYY') AS date_of_joining
	FROM products;


SELECT product_name,
 	TO_CHAR (added_date, 'DD/MM/YYYY') AS date_of_joining
	FROM products;

SELECT product_name,
 	TO_CHAR (added_date, 'DD/MON/YYYY') AS date_of_joining
	FROM products;

SELECT product_name,
 	TO_CHAR (added_date, 'MM/DD/YYYY') AS date_of_joining
	FROM products;

-- DATE_PART () - get specific date part
-- Extract the day of the week from added_date.

SELECT product_name, added_date,
	DATE_PART('DOW', added_date)
	FROM products;


SELECT product_name, added_date,
	DATE_PART('MONTH', added_date)
	FROM products;

SELECT product_name, added_date,
	DATE_PART('DAY', added_date)
	FROM products;



--7. DATE_TRUNC() - Truncate date to precision
--truncuate added_date to the start of the month.

SELECT product_name, added_date,
	DATE_TRUNC('WEEK', added_date) as week_started
	FROM products;


SELECT product_name, added_date,
	DATE_TRUNC('MONTH', added_date) as month_started
	FROM products;

SELECT product_name, added_date,
	DATE_TRUNC('DAY', added_date) as day_started
	FROM products;

--8. INTERVAL - add  or substract time interval
-- add 6 month of the added date 

SELECT product_name, added_date,
	added_date + INTERVAL'6 DAYS' AS new_date
	from products;


SELECT product_name, added_date,
		added_date + INTERVAL '6 MONTH' AS new_date
		FROM products;

SELECT product_name, added_date,
	added_date + INTERVAL '2 year' AS new_date
	FROM products;



--9. current_time() - Get current time
--retrive only current time.

SELECT CURRENT_TIME AS current_time;

--10 TO_DATE () - convert string to date
-- convert a string to a date format.

SELECT TO_DATE ('28-11-2025', 'DD-MM-YYYY');




-- Assignment 8

,SELECT * FROM products;

/* CASE Function  - Categorizing based on conditions
we will caregorize products in to price ranges

Expensive if the price is greater than  or equal to 50,000
modrate if the price is between 10,000 and 49,999 .
Affortable if the price is less than 10,000.
*/

SELECT product_name, price,
CASE 
WHEN price>=50000 THEN 'Expensive'
WHEN price>=10000 AND price<=49999 THEN 'Modrate'
ELSE 'Affortable'
END AS price_category
FROM products;



/* CASE with AND & OR Operators - Stock Status
we will classify products based on quantity available

In stock if quantity is 10 or more 
limited stock if quantity is between 5 and 9
out of stock soon if quantity is less than 5
*/

SELECT product_name, quantity,
	CASE 
		WHEN quantity >= 10 THEN 'in stock'
		WHEN quantity >=5 AND quantity<=9 THEN 'limited stock'
		ELSE 'out of stock'
		END AS quantity_of_products
		FROM products;
		



















