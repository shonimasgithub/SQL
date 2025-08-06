#1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    subject VARCHAR(255),
    experience INT,
    salary DECIMAL(10, 2)
);


INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Math', 5, 50000),
(2, 'Bob', 'Science', 8, 60000),
(3, 'Charlie', 'History', 12, 55000),
(4, 'Diana', 'Math', 3, 45000),
(5, 'Eve', 'Science', 15, 70000),
(6, 'Frank', 'English', 7, 48000),
(7, 'Grace', 'Math', 10, 52000),
(8, 'Hank', 'History', 6, 53000);

#2. Create a before insert  trigger named before_insert_teacher that will raise an error “salary cannot be negative”  if the salary inserted to the table is less than zero.

DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;

//

DELIMITER ;

#3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(255),
    timestamp DATETIME
);
DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp) 
    VALUES (NEW.id, 'INSERT', NOW());
END;

//

DELIMITER ;

#4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.

DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with experience greater than 10 years';
    END IF;
END;

//

DELIMITER ;

#5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp) 
    VALUES (OLD.id, 'DELETE', NOW());
END;

//

DELIMITER ;

