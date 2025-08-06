-- Create the Product database
CREATE DATABASE Product;

-- Switch to the Product database
USE Product;

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
#1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view.
-- Create the customer_info view
CREATE VIEW customer_info AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name,
    Email
FROM 
    Customer;

-- Perform the SELECT operation for the customer_info view
SELECT * FROM customer_info;

#2. Create a view named US_Customers that displays customers located in the US.
-- Create the US_Customers view
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'US';

-- Perform the SELECT operation for the US_Customers view
SELECT * FROM US_Customers;

#3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
-- Create the Customer_details view
CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name,
    Email,
    Phone_no,
    State
FROM 
    Customer;

-- Perform the SELECT operation for the Customer_details view
SELECT * FROM Customer_details;

#4. Update phone numbers of customers who live in California for Customer_details view.
-- Update phone numbers of customers who live in California
UPDATE Customer
SET Phone_no = 'NEW_PHONE_NUMBER' -- Replace with the new phone number
WHERE State = 'California';

#5. Count the number of customers in each state and show only states with more than 5 customers.
-- Count the number of customers in each state and show only states with more than 5 customers
SELECT 
    State,
    COUNT(*) AS Number_of_Customers
FROM 
    Customer
GROUP BY 
    State
HAVING 
    COUNT(*) > 5;

#6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
-- Return the number of customers in each state from Customer_details view
SELECT 
    State,
    COUNT(*) AS Number_of_Customers
FROM 
    Customer_details
GROUP BY 
    State;

#7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
-- Return all columns from Customer_details view, sorted by state in ascending order
SELECT *
FROM Customer_details
ORDER BY State ASC;
