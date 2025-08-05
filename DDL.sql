
#Create a database named School and perform all the DDL commands(CREATE, ALTER, DROP, RENAME, TRUNCATE) for the table named STUDENT
# Create the database
CREATE DATABASE school1;

#Use the database
USE school1;

# Create the STUDENT table
CREATE TABLE STUDENT (
    RollNo INT PRIMARY KEY,
    Name CHAR(25),
    Marks INT,
    Grade CHAR(2)
);

#(a) Insert 10 rows into the table using INSERT INTO.
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (1, 'Alice', 85, 'A');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (2, 'Bob', 78, 'B');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (3, 'Charlie', 92, 'A');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (4, 'David', 67, 'C');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (5, 'Eve', 74, 'B');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (6, 'Frank', 88, 'A');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (7, 'Grace', 81, 'B');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (8, 'Hank', 95, 'A');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (9, 'Ivy', 69, 'C');
INSERT INTO STUDENT (RollNo, Name, Marks, Grade) VALUES (10, 'Jack', 76, 'B');

#(b) Use the select command to display the table. 
SELECT * FROM STUDENT;

#(c) Add a column named Contact to the STUDENT table. 
ALTER TABLE STUDENT ADD COLUMN Contact CHAR(15);
SELECT * FROM STUDENT;

#(d) Remove the Grade column from the Student table. 
ALTER TABLE STUDENT DROP COLUMN Grade;
SELECT * FROM STUDENT;

#(e) Rename the table to CLASSTEN. 
RENAME TABLE STUDENT TO CLASSTEN;
SELECT * FROM STUDENT;


#(f)  Delete all rows from the table.
TRUNCATE TABLE CLASSTEN;
SELECT * FROM STUDENT;
 


#(g) Remove the table from the database. 
DROP TABLE CLASSTEN;
SELECT * FROM STUDENT;



