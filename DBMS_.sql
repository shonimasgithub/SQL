#Create a database named library and following TABLES in the database: 
#1. Branch 
#2. Employee 
#3. Books
#4. Customer
#5. IssueStatus
#6. ReturnStatus
CREATE DATABASE library;

USE library;

-- Create Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Books Table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Create Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
USE library;

-- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'Address 1', '123-456-7890'),
(2, 102, 'Address 2', '234-567-8901'),
(3, 103, 'Address 3', '345-678-9012'),
(4, 104, 'Address 4', '456-789-0123'),
(5, 105, 'Address 5', '567-890-1234');

-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Alice', 'Manager', 60000, 1),
(2, 'Bob', 'Assistant', 40000, 1),
(3, 'Charlie', 'Manager', 65000, 2),
(4, 'Diana', 'Clerk', 35000, 3),
(5, 'Eve', 'Manager', 70000, 4);

-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('1111', 'Book A', 'Category 1', 30, 'yes', 'Author A', 'Publisher A'),
('2222', 'Book B', 'Category 2', 20, 'yes', 'Author B', 'Publisher B'),
('3333', 'Book C', 'Category 3', 15, 'no', 'Author C', 'Publisher C'),
('4444', 'Book D', 'Category 4', 25, 'yes', 'Author D', 'Publisher D'),
('5555', 'Book E', 'Category 5', 10, 'no', 'Author E', 'Publisher E');

-- Insert data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'John', 'Address A', '2021-01-15'),
(2, 'Jane', 'Address B', '2022-05-20'),
(3, 'Sam', 'Address C', '2020-12-10'),
(4, 'Lisa', 'Address D', '2021-11-30'),
(5, 'Mike', 'Address E', '2023-03-25');

-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'Book A', '2023-06-10', '1111'),
(2, 2, 'Book B', '2023-06-15', '2222'),
(3, 3, 'Book D', '2023-06-20', '4444'),
(4, 4, 'Book E', '2023-06-25', '5555'),
(5, 5, 'Book C', '2023-06-30', '3333');

-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'Book A', '2023-07-10', '1111'),
(2, 2, 'Book B', '2023-07-15', '2222'),
(3, 3, 'Book D', '2023-07-20', '4444'),
(4, 4, 'Book E', '2023-07-25', '5555'),
(5, 5, 'Book C', '2023-07-30', '3333');


#1. Retrieve the book title, category, and rental price of all available books. 
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

#2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT Books.Book_title, Customer.Customer_name 
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

#4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
 SELECT Customer.Customer_name 
FROM IssueStatus 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id 
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9. Retrieve book_title from book table containing history. 
SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';

#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

#11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT E.Emp_name, B.Branch_address 
FROM Employee E 
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

#12.  Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT Customer.Customer_name 
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN 
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id 
WHERE Books.Rental_Price > 25;

 