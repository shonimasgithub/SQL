
use dbms3;
#Create a table named Managers with fields : 

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name CHAR(50),
    Last_Name CHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18 AND Age <= 65),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender CHAR(1),
    Department CHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);

#1. Insert 10 rows. 
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'John', 'Doe', '1980-01-15', 44, 'M', 'HR', 30000),
(2, 'Jane', 'Smith', '1975-05-30', 49, 'F', 'Finance', 40000),
(3, 'Michael', 'Brown', '1990-07-22', 34, 'M', 'IT', 35000),
(4, 'Aaliya', 'Khan', '1988-03-10', 36, 'F', 'Marketing', 28000),
(5, 'Chris', 'Johnson', '1982-11-11', 41, 'M', 'IT', 50000),
(6, 'Patricia', 'Williams', '1970-09-25', 53, 'F', 'Finance', 45000),
(7, 'David', 'Jones', '1985-02-05', 39, 'M', 'HR', 32000),
(8, 'Linda', 'Garcia', '1995-12-19', 28, 'F', 'IT', 26000),
(9, 'James', 'Martinez', '1992-08-14', 31, 'M', 'Marketing', 29000),
(10, 'Mary', 'Lopez', '1983-06-27', 40, 'F', 'HR', 31000);

#2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.
SELECT First_name, Last_Name, DOB FROM Managers WHERE Manager_Id = 1;

 
#3. Write a query to display the annual income of all managers. 
SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income FROM Managers;

#4. Write a query to display records of all managers except ‘Aaliya’. 
SELECT * FROM Managers WHERE First_name <> 'Aaliya';

#5. Write a query to display details of managers whose department is IT and earns more than 25000
SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;
