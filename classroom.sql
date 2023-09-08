CREATE DATABASE Assignment01;
USE Assignment01;

CREATE TABLE Dept
(Deptno int PRIMARY KEY,Deptname VARCHAR(50),Location VARCHAR(50),Managerid VARCHAR(50));

INSERT INTO Dept 
(Deptno,Deptname,Location,Managerid)
VALUES
(401,"accounts","Building 1","4401"),
(402,"Operations","Building 1","4402"),
(403,"management","Building 2","4403"),
(404,"advertisment","Building 2","4404"),
(405,"finance","Building 2","4405"),
(406,"Transportation","Building 2","4406"),
(407,"Research","Building 3","4407"),
(408,"Administration","Building 3","4408"),
(409,"Product Development","Building 4","4409"),
(410,"Sales","Building 4","44010");

CREATE TABLE Employees
(Empname VARCHAR(50),Empid INT PRIMARY KEY,Address VARCHAR(50),City VARCHAR(50),DOB DATE,DOJ DATE,Gender ENUM('M','F'),Salary VARCHAR(50),Deptno INT,FOREIGN KEY(Deptno)REFERENCES Dept(Deptno)); 

INSERT INTO Employees (Empname, Empid, Address, City, DOB, DOJ, Gender, Salary, Deptno)
VALUES
('Aarav Kumar', 101, '1234 Green Avenue', 'Mumbai', '1992-05-15', '2018-02-20', 'M', '60000', 401),
('Ishika Patel', 102, '567 Rose Garden Road', 'Ahmedabad', '1990-09-22', '2019-01-10', 'F', '55000', 402),
('Arjun Singhania', 103, '789 Sapphire Heights', 'Bangalore', '1995-03-10', '2020-06-05', 'M', '62000', 403),
('Nisha Reddy', 104, '234 Emerald Street', 'Hyderabad', '1992-11-08', '2017-08-15', 'F', '58000', 404),
('Aditya Verma', 105, '456 Diamond Plaza', 'Delhi', '1987-07-18', '2022-03-25', 'M', '63000', 405),
('Sneha Rajan', 106, '890 Pearl Manor', 'Chennai', '1993-01-30', '2021-11-02', 'F', '59000', 406),
('Rohan Desai', 107, '678 Ruby Towers', 'Kolkata', '1989-12-05', '2016-04-12', 'M', '58000', 407),
('Maya Sharma', 108, '345 Crystal Avenue', 'Pune', '1991-06-27', '2023-01-18', 'F', '60000', 408),
('Vikram Menon', 109, '101 Topaz Residency', 'Kochi', '1994-04-02', '2022-07-30', 'M', '64000', 409),
('Meera Gupta', 110, '876 Amethyst Road', 'Jaipur', '1996-08-12', '2020-09-05', 'F', '57000', 410);

CREATE TABLE Project
(Projectid INT PRIMARY KEY,Title VARCHAR(50),City VARCHAR(50));

INSERT INTO Project 
(Projectid,Title,City)
VALUES
(901,"Testing Project","Mumbai"),
(902,"ERP System","Pune"),
(903,"Testing Project","Aurangabad"),
(904,"Software Project","Mumbai"),
(905,"Banking Project","Pune"),
(906,"Testing Project","Mumbai"),
(907,"ERP System","Delhi"),
(908,"Testing Project","Delhi"),
(909,"Software Project","Banglore"),
(910,"Banking Project","Banglore");

CREATE TABLE Works
(Empid INT,Projectid INT,Total_hrs_worked VARCHAR(50),FOREIGN KEY(Empid) REFERENCES Employees(Empid),FOREIGN KEY(Projectid) REFERENCES Project(Projectid)); 

INSERT INTO Works
(Empid,Projectid,Total_hrs_worked)
VALUES
(101,901,"50"),
(102,902,"50"),
(103,903,"50"),
(104,904,"50"),
(105,905,"50"),
(106,906,"50"),
(107,907,"50"),
(108,908,"50"),
(109,909,"50"),
(110,910,"50");

CREATE TABLE Dependant
(Empid INT,Name_of_dependant VARCHAR(50),Age INT,Relation VARCHAR(50),FOREIGN KEY(Empid) REFERENCES Employees(Empid));

INSERT INTO Dependant
(Empid,Name_of_Dependant,Age,Relation)
VALUES
(101,"Suyash Deshpande",21,"Father"),
(102, "Priya Patel", 28, "Sister"),
(103, "Amit Khanna", 45, "Uncle"),
(104, "Sneha Desai", 22, "Cousin"),
(105, "Raj Kapoor", 65, "Grandfather"),
(106, "Neha Choudhary", 20, "Friend"),
(107, "Vikram Mehta", 42, "Father"),
(108, "Anjali Reddy", 58, "Aunt"),
(109, "Aryan Verma", 5, "Son"),
(110, "Kavita Joshi", 29, "Mother");

-- Query 04 :

ALTER TABLE Employees
ADD COLUMN Mobile_no VARCHAR(50);

-- Query 05 :

UPDATE Employees
SET Mobile_no ="9850514657"
WHERE Empid = 101;

UPDATE Employees
SET Mobile_no = "8765432109"
WHERE Empid = 102;

UPDATE Employees
SET Mobile_no = "7654321098"
WHERE Empid = 103;

UPDATE Employees
SET Mobile_no = "6543210987"
WHERE Empid = 104;

UPDATE Employees
SET Mobile_no = "5432109876"
WHERE Empid = 105;

UPDATE Employees
SET Mobile_no = "4321098765"
WHERE Empid = 106;

UPDATE Employees
SET Mobile_no = "3210987654"
WHERE Empid = 107;

UPDATE Employees
SET Mobile_no = "2109876543"
WHERE Empid = 108;

UPDATE Employees
SET Mobile_no = "1098765432"
WHERE Empid = 109;

UPDATE Employees
SET Mobile_no = "9876543210"
WHERE Empid = 110;

-- Query 06 :

DELETE FROM Works 
WHERE Projectid IN(SELECT Projectid FROM Project WHERE Title="Testing Project");

DELETE FROM Project 
WHERE Title="Testing Project";

-- A better approach here is cascading foriegn key ie. while making a key foriegn key add: ON DELETE CASCADE AND ON UPDATE CASCADE , so that if changes are made in the primary keys that will also refelect in the forign key

-- Query 07 :

SELECT *FROM Employees
WHERE Empname LIKE 'S%';

-- Query 08 :

SELECT Deptno,Deptname FROM Dept
WHERE Location ="Building 1";

-- Query 09 :

SELECT Empname,DOJ FROM Employees
WHERE DOJ BETWEEN '2018-01-01' AND '2020-01-01';

-- Query 10 :

SELECT Empid,Empname,DOJ,Salary FROM Employees
WHERE Salary>'50000';

SELECT * FROM Employees
WHERE Empid=108;

-- Query 11 :

SELECT *FROM Project
WHERE City='Banglore';

-- Query 12 :

SELECT Name_of_dependant,Relation FROM Dependant
WHERE Empid=102;

-- Query 13 cant be performed because instead of Manager_name , Managerid was taken

-- Query 14 cant be performed because age was not added for employees

-- Query 15 :

SELECT Empid,Empname,City,DOB,DOJ FROM Employees
ORDER BY DOB DESC;

-- Personal Query : Check what department is the employee 'Maya Sharma' working in :
 
SELECT Deptno,Deptname,Managerid FROM Dept
WHERE Deptno IN(SELECT Deptno FROM Employees WHERE Empid=108);

-- Personal Query : Check total working hrs of 'Maya Sharma' :

SELECT Projectid,Total_hrs_worked FROM Works
WHERE Empid IN(SELECT Empid FROM Employees WHERE Empid=107);

-- Assignment 03 Queries

-- Query 01 :

-- Method 1 :

SELECT Empid,Empname,DOB FROM Employees
WHERE Deptno IN(SELECT Deptno FROM Dept WHERE Deptname='Transportation') and MONTH(DOB)=1;

-- Methon 2 - Using JOINS :

SELECT Empid,Empname,DOB FROM Employees
INNER JOIN Dept 
ON Employees.Deptno=Dept.Deptno
WHERE Dept.Deptname='Transportation' AND MONTH(Employees.DOB)=1;

-- Query 2 :

SELECT Employees.Empid,Empname FROM Employees
INNER JOIN Works
ON Employees.Empid=Works.Empid
INNER JOIN Project
ON Works.Projectid=Project.Projectid
WHERE Project.Title="ERP System";

-- Query 3 :

SELECT Employees.Empid,Empname,Employees.City FROM Employees
INNER JOIN Works
ON Employees.Empid=Works.Empid
INNER JOIN Project
ON Works.Projectid=Project.Projectid
WHERE Project.Title="Banking Project";

-- Query 4 : 

-- To display sum of total working hrs :

SELECT SUM(Total_hrs_worked) FROM Works
INNER JOIN Project 
ON Works.Projectid = Project.Projectid
WHERE Project.Title = "Banking Project";

-- To display empid,empname and their respective working hrs :

SELECT Employees.Empid,Employees.Empname,Works.Total_hrs_worked FROM Employees
INNER JOIN Works 
ON Employees.Empid = Works.Empid
INNER JOIN Project 
ON Works.Projectid = Project.Projectid
WHERE Project.Title = "Banking Project";

-- Query 5 :

-- There was no city matching so making one of them matching:

UPDATE Employees
SET City="Banglore"
WHERE Empid=109;

SELECT Employees.Empid,Employees.Empname,Project.Title,Employees.City,Project.City AS Pcity FROM Employees
INNER JOIN Works
ON Employees.Empid=Works.Empid
INNER JOIN Project
ON Works.Projectid=Project.Projectid
WHERE Employees.City=Project.City;

-- Query 6 :

-- Cant be performed because manager address was not told to be taken eariler

-- Query 7 :

SELECT Employees.Empid,Employees.Empname,Project.Title FROM Employees
INNER JOIN Works
ON Employees.Empid=Works.Empid
INNER JOIN Project 
ON Works.Projectid=Project.Projectid
WHERE Project.Title != "Banking Project";

-- Query 8

-- Inserting some employees because every department was having only one employee

INSERT INTO Employees
VALUES
('Suyash Deshpande', 111, '1234 Park Avenue', 'Mumbai', '1992-05-15', '2018-02-20', 'M', '80000',403,"9822623167");

INSERT INTO Employees
VALUES
('Aseem Avhad', 112, '1234 Bnadra West', 'Mumbai', '1992-05-15', '2018-02-20', 'M', '70000',409,"9552090567");

SELECT Dept.Deptname,AVG(Employees.Salary) FROM Dept
INNER JOIN  Employees
ON Dept.Deptno=Employees.Deptno
GROUP BY Dept.Deptname;

-- Query 9




