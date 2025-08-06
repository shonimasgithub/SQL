-- comment
# comment
/* multiline comment
select" hi hello";



show databases;
create database dbms2;
use dbms2;
#create table name country with attributes country-id,country_name,population
CREATE TABLE country (
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
use dbms2;
# create a table name persons witha attributes person_id,name,age,rating,country_id
CREATE TABLE Persons (
    person_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
INSERT INTO Persons (person_id, name, age, rating, country_id) VALUES
(1, 'John Doe', 30, 4.5, 1),
(2, 'Jane Smith', 25, 3.8, 2),
(3, 'Wang Wei', 40, 4.2, 3),
(4, 'Carlos Silva', 35, 3.9, 4),
(5, 'Olga Ivanova', 28, 4.1, 5);

#1. Find the number of persons in each country.
SELECT C.country_name, COUNT(P.person_id) AS number_of_persons
FROM Country C
LEFT JOIN Persons P ON C.country_id = P.country_id
GROUP BY C.country_name;

#2. Find the number of persons in each country sorted from high to low.
SELECT C.country_name, COUNT(P.person_id) AS number_of_persons
FROM Country C
LEFT JOIN Persons P ON C.country_id = P.country_id
GROUP BY C.country_name
ORDER BY number_of_persons DESC;

#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
SELECT C.country_name, AVG(P.rating) AS average_rating
FROM Country C
JOIN Persons P ON C.country_id = P.country_id
GROUP BY C.country_name
HAVING AVG(P.rating) > 3.0;

#4. Find the countries with the same rating as the USA. (Use Subqueries)
SELECT country_name
FROM Country
WHERE country_id IN (
    SELECT P.country_id
    FROM Persons P
    GROUP BY P.country_id
    HAVING AVG(P.rating) = (
        SELECT AVG(P2.rating)
        FROM Persons P2
        JOIN Country C2 ON P2.country_id = C2.country_id
        WHERE C2.country_name = 'USA'
    )
);

#5. Select all countries whose population is greater than the average population of all nations.
SELECT country_name
FROM Country
WHERE population > (
    SELECT AVG(population)
    FROM Country
);










