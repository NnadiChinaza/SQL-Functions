USE sql_hr;

-- CREATING A STORED PRCEDURE FOR EMPLOYESS WHOS SALARY IS GREATER THAN $5000

DELIMITER && 
CREATE procedure Salary5000()
BEGIN
SELECT first_name, last_name, job_title, salary
FROM employee
WHERE salary > 5000;
END &&
DELIMITER ; 


-- TOP 5 SALARY EARNERS

DELIMITER &&
CREATE PROCEDURE TOPnSalary(IN var int)
BEGIN
SELECT*
FROM employees
ORDER BY salary desc
LIMIT var;
END &&
DELIMITER ; 

Call TOPnSalary (5)

-- USING STORED PROCEDURE TO UPDATE A RECORD

DELIMITER //
CREATE PROCEDURE Update_Salary(IN emp_name varchar(20), IN New_Salary float)
BEGIN
UPDATE employees set Salary = New_Salary
WHERE first_name = emp_name;
END //
DELIMITER ;
