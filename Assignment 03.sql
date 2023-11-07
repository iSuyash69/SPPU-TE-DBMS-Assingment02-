CREATE DATABASE ASS3;
USE ASS3;

CREATE TABLE Physician
(RegNo INT PRIMARY KEY,TelNo VARCHAR(50),City VARCHAR(50));

CREATE TABLE Visit
(PName VARCHAR(50) PRIMARY KEY,RegNo INT,DOV DATE,Fees VARCHAR(50),FOREIGN KEY(RegNo)REFERENCES Physician(RegNo));

CREATE TABLE Patient
(PName VARCHAR(50),Street VARCHAR(50),City VARCHAR(50),FOREIGN KEY(PName)REFERENCES Visit(PName));


INSERT INTO Physician (RegNo, TelNo, City) VALUES
(101, '1112223333', 'New York'),
(102, '4445556666', 'Los Angeles'),
(103, '7778889999', 'Chicago'),
(104, '1234567890', 'Houston');

INSERT INTO Visit (PName, RegNo, DOV, Fees) VALUES
('John Doe', 101, '2023-11-01', '100'),
('Jane Smith', 102, '2023-11-02', '150'),
('Emily Johnson', 103, '2023-11-03', '120'),
('Michael Brown', 104, '2023-11-04', '200');

INSERT INTO Patient (PName, Street, City) VALUES
('John Doe', '123 Main St', 'New York'),
('Jane Smith', '456 Elm St', 'Los Angeles'),
('Emily Johnson', '789 Oak St', 'Chicago'),
('Michael Brown', '246 Pine St', 'Houston');


-- Query 01 : 

DELETE FROM Patient
WHERE PName='John Doe';

DELETE FROM Visit
WHERE PName='John Doe';

-- Query 02 : 

SELECT * FROM Patient 
WHERE City = 'Los Angeles';


-- Query 03 :

SELECT COUNT(RegNo)
FROM Physician 
WHERE City='New York';

-- Query 04 : 

SELECT PName,Fees 
FROM Visit
WHERE Fees>150;

-- Query 05 :

SELECT Visit.PName,Patient.City 
FROM Visit
INNER JOIN Patient
ON Visit.PName=Patient.PName
INNER JOIN Physician
ON Visit.RegNo=Physician.RegNo
WHERE Visit.DOV='2023-11-02';

-- Query 06 :
    
SELECT Physician.RegNo,COUNT(Patient.PName)
FROM Physician
LEFT JOIN Visit
ON Physician.RegNo=Visit.RegNo
LEFT JOIN Patient
ON Visit.PName=Patient.PName
GROUP BY Physician.RegNo;

-- Query 07 : 

SELECT DOV,SUM(Fees)
FROM Visit
GROUP BY DOV;

-- Query 08 : 

SELECT DISTINCT Physician.RegNo
FROM Physician
INNER JOIN Visit
ON Physician.RegNo=Visit.RegNo
WHERE Visit.PName='Jane Smith';
