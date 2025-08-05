show databases;
create database dbms4;
use dbms4;
#create table name country with attributes country-id,country_name,population
CREATE TABLE Country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    population INT NOT NULL
);
INSERT INTO Country (country_id, country_name, population) VALUES
(1, 'USA', 331002651),
(2, 'India', 1380004385),
(3, 'China', 1439323776),
(4, 'Brazil', 212559417),
(5, 'Russia', 145934462);
use dbms4;
# create a table name persons witha attributes person_id,name,age,rating,country_id
CREATE TABLE Persons (
    person_id INT PRIMARY KEY,
    Firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
INSERT INTO Persons (person_id, Firstname,lastname,age, rating, country_id) VALUES
(1, 'John','Doe', 30, 4.5, 1),
(2, 'Jane','Smith', 25, 3.8, 2),
(3, 'Wang','Wei', 40, 4.2, 3),
(4, 'Carlos','Silva', 35, 3.9, 4),
(5, 'Olga','Ivanova', 28, 4.1, 5);

#1. Add a new column called DOB in Persons table with data type as Date.
ALTER TABLE Persons
ADD DOB DATE;

#2. Write a user-defined function to calculate age using DOB.
DELIMITER //

CREATE FUNCTION CalculateAge(dob DATE) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END; //

DELIMITER ;

#3. Write a select query to fetch the Age of all persons using the function that has been created
SELECT Person_id, Firstname, lastname, DOB, CalculateAge(DOB) AS Age
FROM Persons;

#4. Perform inner join, Left join, and Right join on the tables
#inner join
SELECT p.Person_id, p.Firstname, p.lastname, c.country_name
FROM Persons p
INNER JOIN Country c ON p.country_id = c.country_id;
#Left join
SELECT p.Person_id, p.Firstname, p.lastname, c.country_name
FROM Persons p
LEFT JOIN Country c ON p.country_id = c.country_id;
#Right join
SELECT p.Person_id, p.Firstname, p.lastname, c.country_name
FROM Persons p
RIGHT JOIN Country c ON p.country_id = c.country_id;



