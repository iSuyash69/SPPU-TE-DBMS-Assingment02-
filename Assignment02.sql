CREATE DATABASE ASS1;
USE ASS1;

CREATE TABLE Dept
(DeptNo INT PRIMARY KEY, DeptName VARCHAR(50),Location VARCHAR(50), ManagerId INT);

INSERT INTO Dept
(DeptNo,DeptName,Location,ManagerId)
VALUES 
(401,"Accounts","Building 1",4401),
(402,"Operations","Building 1","4402"),
(403,"Management","Building 2","4403"),
(404,"Advertisment","Building 2","4404"),
(405,"Finance","Building 2","4405"),
(406,"Transportation","Building 2","4406"),
(407,"Research","Building 3","4407"),
(408,"Administration","Building 3","4408"),
(409,"Product Development","Building 4","4409"),
(410,"Sales","Building 4","44010");

CREATE TABLE Employees
(EmpId INT PRIMARY KEY,EmpName VARCHAR(50),Address VARCHAR(50),
City VARCHAR(50),DOB DATE,DOJ DATE,Gender ENUM('M','F'),Salary VARCHAR(50),DeptNo INT,
FOREIGN KEY(DeptNo) REFERENCES Dept(DeptNo));

INSERT INTO Employees
(EmpID,EmpName,Address,City,DOB,DOJ,Gender,Salary,DeptNo)
VALUES
(101,'Suyash Deshpande','B20 Anand Bhakti Sankul','Nashik','2003-09-19','2023-12-15','M','50000',401),
(102, 'Arjuna Singh', '567 Rose Garden Road', 'Ahmedabad', '1990-09-22', '2019-01-10', 'F', '55000', 402),
(103, 'Arjun Singhania', '789 Sapphire Heights', 'Bangalore', '1995-03-10', '2020-06-05', 'M', '62000', 403),
(104, 'Nisha Reddy', '234 Emerald Street', 'Hyderabad', '1992-11-08', '2017-08-15', 'F', '58000', 404),
(105, 'Aditya Verma', '456 Diamond Plaza', 'Delhi', '1987-07-18', '2022-03-25', 'M', '63000', 405),
(106, 'Sneha Rajan', '890 Pearl Manor', 'Chennai', '1993-01-30', '2021-11-02', 'F', '59000', 406),
(107, 'Rohan Desai', '678 Ruby Towers', 'Kolkata', '1989-12-05', '2016-04-12', 'M', '58000', 407),
(108, 'Maya Sharma', '345 Crystal Avenue', 'Pune', '1991-06-27', '2023-01-18', 'F', '60000', 408),
(109, 'Vikram Menon', '101 Topaz Residency', 'Kochi', '1994-04-02', '2022-07-30', 'M', '64000', 409),
(110, 'Meera Gupta', '876 Amethyst Road', 'Jaipur', '1996-08-12', '2020-09-05', 'F', '57000', 410);

CREATE TABLE Project
(ProjectId INT PRIMARY KEY ,Title VARCHAR(50),City VARCHAR(50));

INSERT INTO Project
(ProjectId,Title,City)
VALUES
(901,'Testing Project','Nashik'),
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
(EmpId INT,ProjectId INT,Total_Hrs_Worked VARCHAR(50),FOREIGN KEY(EmpId)REFERENCES Employees(EmpId),FOREIGN KEY(ProjectId)REFERENCES Project(ProjectId));

INSERT INTO Works
(EmpId,ProjectId,Total_Hrs_Worked)
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
(EmpId INT,DependantName VARCHAR(50),Age INT,Relation VARCHAR(50),FOREIGN KEY(EmpId)REFERENCES Employees(EmpId));

INSERT INTO Dependant
(EmpId,DependantName,Age,Relation)
VALUES
(101,"Asim Dada",22,"Godfather"),
(102, "Priya Patel", 28, "Sister"),
(103, "Amit Khanna", 45, "Uncle"),
(104, "Sneha Desai", 22, "Cousin"),
(105, "Raj Kapoor", 65, "Grandfather"),
(106, "Neha Choudhary", 20, "Friend"),
(107, "Vikram Mehta", 42, "Father"),
(108, "Anjali Reddy", 58, "Aunt"),
(109, "Aryan Verma", 5, "Son"),
(110, "Kavita Joshi", 29, "Mother");


-- Query 1: Add column Mobile number in employee table

 ALTER TABLE Employees
 ADD COLUMN PhoneNo VARCHAR(50);

-- Query 2: Update mobile numbers for each employee.

UPDATE Employees
SET PhoneNo = "9850514657"
WHERE EmpId = 101;

UPDATE Employees
SET PhoneNo = "9850524657"
WHERE EmpId = 102;

UPDATE Employees
SET PhoneNo = "9850534657"
WHERE EmpId = 103;

UPDATE Employees
SET PhoneNo = "9850544657"
WHERE EmpId = 104;

UPDATE Employees
SET PhoneNo = "9850514657"
WHERE EmpId = 101;

UPDATE Employees
SET PhoneNo = "9850514657"
WHERE EmpId = 101;

UPDATE Employees
SET PhoneNo = "9850554657"
WHERE EmpId = 105;

UPDATE Employees
SET PhoneNo = "9850514657"
WHERE EmpId = 101;

UPDATE Employees
SET PhoneNo = "9850564657"
WHERE EmpId = 106;

UPDATE Employees
SET PhoneNo = "9850574657"
WHERE EmpId = 107;

UPDATE Employees
SET PhoneNo = "9850584657"
WHERE EmpId = 108;

UPDATE Employees
SET PhoneNo = "9850594657"
WHERE EmpId = 109;

UPDATE Employees
SET PhoneNo = "9850504657"
WHERE EmpId = 110;

-- Query 5: Develop a SQL query to list employees  having name starting with ‘S’

SELECT * FROM Employees
WHERE EmpName LIKE 'S%';

-- Query 6: Develop a SQL query to list department having location ‘Building 1’

SELECT * FROM Dept
WHERE Location = 'Building 1';

-- Query 7: Develop a SQL query to list employee having joining year 2019 to 2020

SELECT * FROM Employees
WHERE DOJ > '2018-12-31' AND DOJ <'2021-01-01';

SELECT * FROM Employees
WHERE YEAR(DOJ) BETWEEN 2019 AND 2020;

-- Query 8: Develop a SQL query to Find the names and cities of residence of all employees who work for “Banking project”

SELECT Employees.EmpId, Employees.EmpName,Employees.City
FROM Employees
INNER JOIN Works
ON Employees.EmpId = Works.EmpId
INNER JOIN Project 
ON Works.ProjectId = Project.ProjectId
WHERE Project.Title='Banking Project';

-- Query 9: Develop a SQL query to Find all employees in the database who live in the same cities as the project  for which they work

UPDATE Employees
SET City='Pune'
WHERE EmpId=105;

SELECT Employees.EmpId,Employees.EmpName,Project.City
FROM Employees
INNER JOIN Works
ON Employees.EmpId = Works.EmpId
INNER JOIN Project 
ON Works.ProjectId = Project.ProjectId
WHERE Employees.City = Project.City;

-- Query 10: Develop  a SQL query to find time required for “Banking project”

SELECT Project.Title, SUM(CAST(Works.Total_Hrs_Worked AS DECIMAL)) AS Total_Hrs_Required
FROM Works
INNER JOIN Project 
ON Works.ProjectId = Project.ProjectId
WHERE Project.Title = 'Banking Project';


-- Query 11: Testing Project”is canceled so delete that entry from project

DELETE FROM Works
WHERE ProjectId IN
(SELECT ProjectId FROM Project WHERE Title='Testing Project');

DELETE Works
FROM Works
INNER JOIN Project
ON Works.ProjectId = Project.ProjectId
WHERE Project.Title = 'Testing Project';

DELETE FROM Project 
WHERE Title='Testing Project';

-- Query 12: Develop a SQL query to display all employees having salary > 50000

SELECT EmpId,EmpName,Salary 
FROM Employees
WHERE Salary>50000;

-- Query 13: Develop a SQL query to display all projects  of “Pune”

SELECT ProjectId,Title FROM Project 
WHERE City = 'Pune';

-- Query 14: Develop a SQL query to display all dependants of  employee id 102

INSERT INTO Dependant 
(EmpId,DependantName,Age,Relation)
VALUES
(102,'Morarji Pandit',70,'Nanasaheb Peshwa');

SELECT DependantName,Age,Relation 
FROM Dependant 
INNER JOIN Employees
ON Dependant.EmpId=Employees.EmpId
WHERE Employees.EmpId=102;

-- Query 15: Develop  a SQL query to Find the number of employees working on each project.

SELECT Project.Title,COUNT(Works.EmpId) AS Employees,GROUP_CONCAT(Employees.EmpName) AS EmployeeNames
FROM Project 
INNER JOIN Works
ON Project.ProjectId = Works.ProjectId
INNER JOIN Employees
ON Works.EmpId = Employees.EmpId
GROUP BY Project.Title;

-- Query 16: Develop  a SQL query to find average salary of each department

INSERT INTO Employees
(EmpID,EmpName,Address,City,DOB,DOJ,Gender,Salary,DeptNo)
VALUES
(111,'Surya Yadav','B20 Anand Bhakti Sankul','Nashik','2003-09-19','2023-12-15','M','60000',401);

SELECT Dept.DeptNo,Dept.DeptName,AVG(CAST(Employees.Salary AS DECIMAL)) AS Avg_Salary,COUNT(Employees.EmpId) AS Employees,GROUP_CONCAT(Employees.EmpName) AS Employee_Names
FROM Dept
INNER JOIN Employees
ON Dept.DeptNo = Employees.DeptNo
GROUP BY Dept.DeptNo,Dept.DeptName;

-- Query 17: Develop  a SQL query to find the age of all employees

SELECT EmpId,EmpName,DOB,FLOOR(DATEDIFF(CURDATE(),DOB)/365.25) AS Age
FROM Employees;

-- Query 18: Display all employees in descending order of age

SELECT EmpId,EmpName,DOB,FLOOR(DATEDIFF(CURDATE(),DOB)/365.25) AS Age
FROM Employees
ORDER BY Age DESC;

-- Query 19: Develop  a SQL query to Find the names of all employees who work for “ERP System"

SELECT Project.Title,COUNT(Employees.EmpId) As Employees,GROUP_CONCAT(Employees.EmpName) AS Employee_Names
FROM Project
INNER JOIN Works
ON Project.ProjectId=Works.ProjectId
INNER JOIN Employees
ON Works.EmpId=Employees.EmpId
WHERE Project.Title='ERP System';

-- Query 20: Develop  a SQL query to display senior person of “Sales”

SELECT Employees.EmpName, FLOOR(DATEDIFF(CURDATE(),Employees.DOJ)/365.25) AS Exp
FROM Dept
INNER JOIN Employees
ON Dept.DeptNo=Employees.DeptNo
WHERE Dept.DeptName='Sales'
ORDER BY Exp DESC
LIMIT 1;

-- Query 21: Develop  a SQL query to Find the employees  who are not having any project.

SELECT Employees.EmpId,Employees.EmpName
FROM Employees
LEFT JOIN Works
ON Employees.EmpId = Works.EmpId
WHERE Works.EmpId IS NULL;

-- Query 22: Create a view containing the total number of employees  whose project location is  “Pune”

CREATE VIEW EmployeeInPune AS
SELECT Project.City, COUNT(Employees.EmpId) AS Employees
FROM Project
INNER JOIN Works
ON Project.ProjectId = Works.ProjectId
INNER JOIN Employees 
ON Works.EmpId=Employees.EmpId
WHERE Project.City='Banglore';

SELECT * FROM EmployeeInPune;

-- Query 23: Create a view containing the total number of employees  whose project location is  “Pune”. Calculate total traveling allowance for all using view (1000 Rs each)

SELECT City , Employees * 1000 AS Total_Travelling_Allowance
FROM EmployeeInPune;
