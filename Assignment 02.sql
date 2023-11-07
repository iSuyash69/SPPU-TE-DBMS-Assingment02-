CREATE DATABASE ASS2;
USE ASS2;

CREATE TABLE Account
(AccNo INT PRIMARY KEY,Branch VARCHAR(50),Balance VARCHAR(50));

INSERT INTO Account
(AccNo,Branch,Balance)
VALUES
(101,'Mumbai',50000),
(102,'Nashik',35000),
(103,'Mumbai',30000),
(104,'Bangalore',90000),
(105,'Nashik',45000),
(106,'Nashik',60000),
(107,'Nashik',55000),
(108,'Pune',85000),
(109,'Pune',70000),
(110,'Banglore',68000);

CREATE TABLE Depositor
(CustName VARCHAR(50),AccNo INT,FOREIGN KEY(AccNo)REFERENCES Account(AccNo));

INSERT INTO Depositor
(CustName,AccNo)
VALUES
('Suyash Deshpande',101),
('Arjuna Singh',102),
('Arjun Singhania',103),
('Nisha Reddy',104),
('Aditya Verma',105),
('Sneha Rajan',106),
('Rohan Desai',107),
('Maya Sharma',108),
('Vikram Menon',109),
('Meera Gupta',110);

CREATE TABLE Loan
(LoanNo INT PRIMARY KEY,Branch VARCHAR(50),Amount VARCHAR(50));

INSERT INTO Loan 
(LoanNo,Branch,Amount)
VALUES
(401,'Mumbai',1600000),
(402,'Nashik',350000),
(403,'Mumbai',300000),
(404,'Bangalore',900000),
(405,'Nashik',450000),
(406,'Nashik',600000),
(407,'Nashik',550000),
(408,'Pune',85000),
(409,'Pune',70000),
(410,'Banglore',68000);

CREATE TABLE Borrower
(CustName VARCHAR(50),LoanNo INT,FOREIGN KEY(LoanNo)REFERENCES Loan(LoanNo));

INSERT INTO Borrower
(CustName,LoanNo)
VALUES
('Suyash Deshpande',401),
('Arjuna Singh',402),
('Arjun Singhania',403),
('Nisha Reddy',404),
('Aditya Verma',405),
('Sneha Rajan',406),
('Rohan Desai',407),
('Maya Sharma',408),
('Vikram Menon',409),
('Meera Gupta',410);


-- Query 01 : Find the customers having loan less than 1 lac

SELECT DISTINCT Borrower.CustName AS Customer
FROM Borrower
INNER JOIN Loan
ON Borrower.LoanNo = Loan.LoanNo
WHERE Loan.Amount<100000;

-- Query 02 : Display account number and customer name starting with ‘P’

UPDATE Depositor
SET CustName='Pditya Verma'
WHERE AccNo=105; 

SELECT Account.AccNo,Depositor.CustName
FROM Account
INNER JOIN Depositor
ON Account.AccNo = Depositor.AccNo
WHERE Depositor.CustName LIKE 'P%';


-- Query 03 : Display name of the depositor with balance

SELECT DISTINCT Depositor.CustName
FROM Depositor
LEFT JOIN Account
ON Depositor.AccNo=Account.AccNo
WHERE Account.Balance IS NOT NULL;

-- Query 04 : Find names of all customers who have a loan at the ‘Nashik branch’

SELECT DISTINCT CustName 
FROM Borrower
LEFT JOIN Loan
ON Borrower.LoanNo=Loan.LoanNo
WHERE Branch='Nashik' AND Amount !=0;

-- Query 05 : Find all customers who have an account and loan or both.

SELECT CustName
FROM(
	SELECT CustName FROM Depositor
    UNION
    SELECT CustName FROM Borrower
    )  AS All_CustNames;
    
-- Query 06 :  Find all customers who do not have loan

UPDATE Loan
SET Amount=0
WHERE LoanNo=403;

SELECT DISTINCT Borrower.CustName
FROM Borrower
LEFT JOIN Loan
ON Borrower.LoanNo=Loan.LoanNo
WHERE Loan.Amount IS NULL OR Loan.Amount=0;

-- Query 07 : Find average account balance at each branch.

SELECT Account.Branch,COUNT(Account.AccNo) AS Accounts,AVG(Account.Balance) AS Avg_Bal
FROM Account
GROUP BY Account.Branch
ORDER BY Avg_Bal DESC
LIMIT 3;

-- Query 08: 

SELECT Borrower.CustName,Loan.Amount
FROM Borrower
INNER JOIN Loan
ON Borrower.LoanNo = Loan.LoanNo
ORDER BY Loan.Amount DESC
LIMIT 1;

