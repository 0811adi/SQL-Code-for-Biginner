USE company;

create table employeeinfo(
ID int not null auto_increment primary key,
Emp_name varchar(30) not null,
Address varchar(250) not null,
City varchar(50) not null,
age int not null,
DOJ date not null,
designation varchar(50) not null,
salary decimal(15,2) not null,
mobile varchar(10) not null
);
desc employeeinfo;
select * from employeeinfo;  ## for showing structure of table
#for droping table syntax- DROP TABLE table_name;
select * from employeeinfo where year(DOJ) = 2021 and day(DOJ) = 12;
alter table employeeinfo
add Email  varchar(30);

alter table employeeinfo
drop Email;

insert into employeeinfo(Emp_name,Address,City,age,DOJ,designation,salary,mobile)
values('sunil kumar','104 street no. 13','Jaipur',29,'2022-02-12','Manager',
42000,'9472725084');
insert into employeeinfo (Emp_name,Address,City,age,DOJ,designation,
salary,mobile)
values('Manoj Singh','72 ,street o. 1','Jaipur',30,'2021-10-30','Programmer',
43000,'9188832564');
insert into employeeinfo (Emp_name,Address,City,age,DOJ,designation,
salary,mobile)
values('kamal',' 12 bihar sharif','Jaipur', 36,'2021-4-12','Programmer',
40000,'7765346521');
insert into employeeinfo (Emp_name,Address,City,age,DOJ,designation,
salary,mobile)
values('Danish','RK Nagar','New bus stand',42,'2020-12-24','Programmer',
36000,'786315429');
insert into employeeinfo (Emp_name,Address,City,age,DOJ,designation,
salary,mobile)
values('rAHUL KUMAR','ANNA Nagar','Chennai',45,'2019-12-24','Developer',
46000,'9536143265');

# for seeing specefic colum
select Emp_name,mobile from employeeinfo;
select Emp_name,mobile,DOJ from employeeinfo; # RESULT SHOW AS ORDER THAT GIVEN
select Emp_name,mobile,DOJ,City from employeeinfo;

 #THE SQL WHERE CLAUSE
 
 select Emp_name,mobile from employeeinfo
 where designation = 'Programmer';
 
 SELECT Emp_name, mobile,designation,salary
 from employeeinfo
 where salary > 41000;
 
  SELECT Emp_name, mobile,designation,salary,age
 from employeeinfo
 where age < 35;

# THE SQL UPDATE
 UPDATE employeeinfo
 set Address = 'P79, Block No 5'
 where ID = 4;
 
  select * from employeeinfo;
  UPDATE employeeinfo
 set Emp_name = 'Rahul kumar'
 where ID = 5;
 
UPDATE employeeinfo
 set salary = 45000
 where ID = 3;
  
 ## THE SQL DELETE
 DELETE FROM employeeinfo
 where ID = 4;
 
 select * from employeeinfo;
 
 # if you want to delete all records from table then you can use 
# syntax- DELETE TABLE_NAME

# THE SQL AND OPERATOR
select ID,Emp_name
from employeeinfo
where designation = 'Programmer' and age > 40;

select id, emp_name
from employeeinfo
where designation = 'Programmer' and city = 'Jaipur';

select ID,Emp_name
from employeeinfo
where designation = 'Developer' and City = 'Chennai';



### THE SQL OR OPERATOR
select ID,Emp_name,City,age
from employeeinfo
where City = 'Jaipur'or age > 40;
select * employeeinfo;
# THE SQL NOT OPERATOR

select ID,Emp_name,City
from employeeinfo
where not City = 'jaipur';

## THE SQL LIKE OPERATOR
# the like operator is used in a where clause to search for a specified pattern in a column
# the percent sign(%) represent zero,one,or multiple charecters
# the underscore sign (_) represent one,single charecter

select * from employeeinfo
where City like 'J%';  # thew city srarted from J

select * from employeeinfo
where Emp_name like 'R%';  # thew name  started from R

select * from employeeinfo
where Emp_name like '%L';  # thew EMP_NAME ENDED from 

SELECT * FROM EMPLOYEEINFO
where mobile like '__8%'; # first 3rd places is 8


select * from employeeinfo
where Emp_name not like '%d';  # thew EMP_NAME ENDED from

# THE SQL IN Operator
select * from employeeinfo
where City IN ('New bus stand','chennai');

select * from employeeinfo
where city not in ('jaipur','chennai');


select * from employeeinfo
where designation  in ('Programmer');


## THE SQL BETWEEN Operator

select * from employeeinfo
where salary BETWEEN 37000 AND 42000;

select * from employeeinfo
WHERE ID BETWEEN 1 AND 5;

select * from employeeinfo
WHERE DOJ BETWEEN '20-01-01' AND '2023-01-01';

# THE SQL SELECT TOP Clause
# the top clause is used to show specify the number of records from table
# note- not all database systems support the select TOP clause 
# MYSQL support the LIMIT clause 

select * from employeeinfo
LIMIT 4;

## THE SQL ORDER BY Clause
# the sql ORDER BY clause is used to sort the column data in ascending or descending order

select * from employeeinfo
ORDER BY emp_name,Salary;

select * from employeeinfo
ORDER BY emp_name DESC;


## WORKING WITH SQL function
select count(Emp_name)
from employeeinfo;

select sum(salary)
from employeeinfo;


select avg(salary)  ## average
from employeeinfo;

select Emp_name , MIN(SALARY) AS LowestSalary
from employeeinfo;

select Emp_name , max(SALARY) AS HighestSalary
from employeeinfo;


## SQL Joins
# the SQL Joins clause is used to combine records from two or more tables


create database customerdb;

use customerdb;

create table Customer
(
CustomerID int primary key,
CustomerName varchar(20),
City varchar(20)
);

insert into Customer values(101,'ASHISH','Kota');
insert into Customer values(102,'Ajay','Ajmer');
insert into Customer values(103,'Jay','Bundi');
insert into Customer values(104,'Aman','Jhalawar');
insert into Customer values(105,'Chirag','Udaipur');
insert into Customer values(106,'Deepak','Jodhpur');
insert into Customer values(107,'Rohan','Jaipur');
insert into Customer values(108,'Dinesh','Alwar');
insert into Customer values(109,'Suresh','KOTA');
insert into Customer values(110,'Ankit','Jaipur');

select * from customer;

Create table Orders
(OrderID INT,
CustomerID INT primary key,
OrderDate date
);

select * from orders;

insert into orders values(1,101,'2021-01-05');
insert into orders values(2,102,'2021-02-10');
insert into orders values(3,103,'2021-01-04');
insert into orders values(4,104,'2021-03-08');
insert into orders values(5,105,'2021-04-09');
insert into orders values(6,106,'2021-01-05');
insert into orders values(7,107,'2021-05-12');
insert into orders values(8,108,'2021-02-05');
insert into orders values(9,109,'2021-06-03');
insert into orders values(10,110,'2021-07-04');

# INNER JOIN QUERY 1
select orders.OrderID,customer.CustomerName,orders.OrderDate
from orders
inner join customer on orders.CustomerID = customer.CustomerID;

 
 # INNER JOIN QUERY 2
 
 SELECT ORDERS.ORDERDATE, Customer.City
 from Orders
 INNER JOIN Customer ON ORDERS.CUSTOMERID = Customer.CUSTOMERID;
 
 
 ## The SQL GROUP BY
 
 USE company;
 SELECT COUNT(designation), SUM(SALARY),designation
 FROM EMPLOYEEINFO
 GROUP BY designation;
  
 
 # SQL INSERT INTO SELECT Statment
 # YOU CAN COPIES DATA FROM ONE TABLE AND INSERT IT INTO ANOTHER TABLE
  
 insert into employeeinfoBackup
 select * from employeeinfo; # before runnimg this code we have to create 
 # new table whose structure is same as employeeinfo
  

CREATE TABLE employeeinfoBackup (
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Emp_name VARCHAR(30) NOT NULL,
    Address VARCHAR(250) NOT NULL,
    City VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    DOJ DATE NOT NULL,
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(15 , 2 ) NOT NULL,
    mobile VARCHAR(10) NOT NULL
);
 select * from employeeinfoBackup;
 # NOW WE CAN COPY 
 INSERT INTO employeeinfoBackup
 select * from employeeinfo;
 
 # THE SQL TRUNCATE TABLE Command
 # SYNTAX- TRUNCATE TABLE table_name
  
 create DATABASE ConstraintsExample;
 
 
 # SQL Constraints
 # BY USING SQL Constraints you can set specify rules for data in table
 
 # NOT NULL CONSTRAINT- Ensure that a column value should not NULL
 use ConstraintsExample;
 
 create table notnullExample
 (
 EmpName varchar(30),
 Age int
 );
  select * from notnullExample;
 insert into notnullExample (EmpName,Age) VALUES('Raju',26);
 insert into notnullExample (Age) values(26);
 
 drop table notnullExample;
   
 create table notnullExample
 (
 EmpName varchar(30) not null,
 Age int
 );
  
 insert into notnullExample (EmpName,Age) VALUES('Raju',26);
  insert into notnullExample (Age) values(26);  # here show error because notnull defined in name
    
  
  # DEFAULT CONSTRAINT
  # set a default value for a column if no value is inserting.
    
  create table defaultExample
  (
  EmpName varchar(30) not null,
  Age int,
  Mobile varchar(50) default 'Mobile no. is not available'
  );
    
  # CHECK CONSTRAINT
  
  CREATE TABLE checkExample
  (
  EmpName varchar(255),
  Age int,
  CHECK (Age >= 18)
  );
   
  select * from checkExample;
  
  insert into checkExample(EmpName,Age) values('Raju',26);
  insert into checkExample(EmpName,Age) values('Ram',17); # here show error
    
  
  # UNIQUE CONSTRAINT
  
CREATE TABLE uniqueExample
(
EmpName varchar(255) Not NULL,
Mobile varchar(10) not null unique
);
  select * from uniqueExample;
    
  insert into uniqueExample(EmpName,Mobile) values ('Raju','0123456789');
    insert into uniqueExample(EmpName,Mobile) values ('Rahul','0123456789'); # show error
        

# Primary key constraint
# do it yourself


# SQL FOREIGN KEY CONSTRAINT

CREATE TABLE Department
(
Dept_Id int primary key ,Dept_Name varchar(50)
);

insert into Department values (1,'Account');
insert into Department values (2,'HR');
insert into Department values (3,'IT');

SELECT * FROM Department;

Create table Employee_Details
(
Emp_ID INT PRIMARY KEY,
Emp_Name varchar(50) not null,
Dept_id int,
FOREIGN KEY (Dept_Id) REFERENCES Department(Dept_Id)
);
use company;
select * from employeeinfo;
call new_procedure;
