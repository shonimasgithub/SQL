create database dbms5;
use dbms5;
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331002651, 9833520),
(2, 'Canada', 37742154, 9984670),
(3, 'Mexico', 128932753, 1964375),
(4, 'India', 1380004385, 3287263),
(5, 'China', 1439323776, 9596961),
(6, 'Brazil', 212559417, 8515767),
(7, 'Australia', 25499884, 7692024),
(8, 'Russia', 145934462, 17098242),
(9, 'Japan', 126476461, 377975),
(10, 'Germany', 83783942, 357022);

use dbms5;
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Population INT,
    Rating DECIMAL(3,2),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 500, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 300, 4.0, 2, 'Canada'),
(3, 'Pedro', 'Martinez', 450, 4.7, 3, 'Mexico'),
(4, 'Amit', 'Kumar', 1000, 4.9, 4, 'India'),
(5, 'Wei', 'Zhang', 1500, 4.3, 5, 'China'),
(6, 'Carlos', 'Silva', 700, 4.1, 6, 'Brazil'),
(7, 'Olivia', 'Brown', 200, 3.9, 7, 'Australia'),
(8, 'Vladimir', 'Ivanov', 800, 4.6, 8, 'Russia'),
(9, 'Yuki', 'Tanaka', 600, 4.2, 9, 'Japan'),
(10, 'Hans', 'Schmidt', 900, 4.8, 10, 'Germany');

#1. Write an SQL query to print the first three characters of Country_name from the Country table.
SELECT LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;

#2. Write an SQL query to concatenate first name and last name from Persons table.
SELECT CONCAT(Fname, ' ', Lname) AS FullName
FROM Persons;


#3. Write an SQL query to count the number of unique country names from Persons table
SELECT COUNT(DISTINCT Country_name) AS UniqueCountryNames
FROM Persons;

#4. Write a query to print the maximum population from the Country table.
SELECT MAX(Population) AS MaxPopulation
FROM Country;

#5. Write a query to print the minimum population from Persons table.
SELECT MIN(Population) AS MinPopulation
FROM Persons;

#6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Alice', NULL, 400, 3.8, 1, 'USA'),
(12, 'Bob', NULL, 500, 4.0, 2, 'Canada');

SELECT COUNT(Lname) AS LnameCount
FROM Persons;

#7. Write a query to find the number of rows in the Persons table.
SELECT COUNT(*) AS NumberOfRows
FROM Persons;

#8. Write an SQL query to return the current date and time.
SELECT NOW() AS CurrentDateTime;

#9. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)

SELECT Population
FROM Country
LIMIT 3;

#10. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
SELECT * 
FROM Country
ORDER BY RAND()
LIMIT 3;









