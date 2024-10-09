In Oracle, PL/SQL (Procedural Language/Structured Query Language) is an extension 
of SQL that allows users to write code in a procedural format, making SQL more 
powerful and versatile. With PL/SQL, you can write blocks of code that include 
variables, control statements (like IF statements and loops), and SQL operations. It 
supports procedures, functions, triggers, and other programming constructs.
1. Simple PL/SQL Block
A simple PL/SQL block consists of three sections: Declaration, Execution, and 
Exception handling. It’s the most basic form of PL/SQL programming and does not 
involve compilation or parameter passing.
Syntax:
DECLARE
 -- Declaration section (optional)
 variable_name data_type := initial_value;
BEGIN
 -- Execution section (required)
 statement1;
 statement2;
EXCEPTION
 -- Exception handling section (optional)
 WHEN exception_name THEN
 statement;
END;
Example:
DECLARE
 v_employee_name VARCHAR2(50);
BEGIN
 SELECT first_name INTO v_employee_name
 FROM employees
 WHERE employee_id = 101;
DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_employee_name);
END;
• This simple PL/SQL block declares a variable v_employee_name, retrieves the 
first name of the employee with employee_id 101, and prints the name using 
DBMS_OUTPUT.PUT_LINE.
2. Procedures
A procedure is a named PL/SQL block that performs a specific action. It can accept 
input parameters (IN), return output parameters (OUT), or both (IN OUT). Procedures 
can be stored in the database for reuse.
Syntax:
CREATE OR REPLACE PROCEDURE procedure_name (parameter_name [IN | OUT | IN
OUT] data_type)
IS
 -- Declaration section
BEGIN
 -- Execution section
 statement1;
 statement2;
EXCEPTION
 -- Exception handling section
 WHEN exception_name THEN
 statement;
END procedure_name;
• IN parameter: Passes a value to the procedure.
• OUT parameter: Returns a value from the procedure.
• IN OUT parameter: Passes and returns values.
Example:
CREATE OR REPLACE PROCEDURE update_salary (p_employee_id IN NUMBER, 
p_new_salary IN NUMBER)
IS
BEGIN
 UPDATE employees
 SET salary = p_new_salary
 WHERE employee_id = p_employee_id;
 DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Employee ID: ' ||
p_employee_id);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.PUT_LINE('Employee not found.');
END update_salary;
• This procedure update_salary accepts an employee ID (p_employee_id) and a 
new salary (p_new_salary) as input parameters. It updates the salary of the given 
employee and prints a success message.
Executing the Procedure:
BEGIN
 update_salary(101, 5000);
END;
3. Functions
A function is a PL/SQL block that returns a single value. Functions are similar to 
procedures, but they must return a value using the RETURN statement. They can be 
used in SQL expressions and PL/SQL blocks.
Syntax:
CREATE OR REPLACE FUNCTION function_name (parameter_name [IN] data_type)
RETURN return_data_type
IS
 -- Declaration section
BEGIN
 -- Execution section
statement1;
 RETURN value;
EXCEPTION
 -- Exception handling section
 WHEN exception_name THEN
 statement;
END function_name;
• Functions always have a RETURN clause specifying the data type of the value 
they return.
Example:
CREATE OR REPLACE FUNCTION get_employee_salary (p_employee_id IN NUMBER)
RETURN NUMBER
IS
 v_salary NUMBER;
BEGIN
 SELECT salary INTO v_salary
 FROM employees
 WHERE employee_id = p_employee_id;
 RETURN v_salary;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
 RETURN 0;
END get_employee_salary;
• This function get_employee_salary accepts an employee ID as an input 
parameter, retrieves the salary of the given employee, and returns it. If no 
employee is found, it returns 0.
Calling the Function:
DECLARE
v_salary NUMBER;
BEGIN
 v_salary := get_employee_salary(101);
 DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || v_salary);
END;
• This block calls the get_employee_salary function and prints the salary for 
employee ID 101.