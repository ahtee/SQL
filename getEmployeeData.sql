/* Ben Otte - Homework 5 Submission File */

/* --PART <A>-- */
--WAL-MART STORES
SET SERVEROUTPUT ON

DECLARE
	comp varchar(20);
	loc varchar(20);
	te number;
	tm number;
	ase number;
	asm number;
BEGIN
	Select Company_name into comp from Company where Company_name = 'Wal-Mart Stores';
	Select City into loc from Company where Company_name = 'Wal-Mart Stores';
	Select count(Employee_name) into te from Works where Company_name='Wal-Mart Stores';
	--needs work
  SELECT count(Manages.Manager_name) Into tm FROM Manages, Works WHERE Manages.Manager_name =  Works.Employee_name and Works.Company_name = 'Wal-Mart Stores' and Salary < 100000;
  --needs work
  SELECT avg(salary) into ase from Works where COMPANY_NAME like 'Wal-Mart Stores';
  --needs work
  Select avg(Salary) into asm from Works where employee_name in (Select manager_name from manages) and company_name = 'Wal-Mart Stores';
  
  --Output to the user the values we found
  dbms_output.put_line('Company Name: ' || comp);
  dbms_output.put_line('Located in: ' || loc);
  dbms_output.put_line('Total Employees:  ' || te);
  dbms_output.put_line('Total Managers: ' || tm);
  dbms_output.put_line('Average Salary Employees: ' || ase);
  dbms_output.put_line('Average Salary Managers: ' || asm);
END;
.
run;
--Output to Wal-Mart Stores:
/* anonymous block completed
Company Name: Wal-Mart Stores
Located in: Bentonville
Total Employees:  5
Total Managers: 3
Average Salary Employees: 111800
Average Salary Managers: 75000 */

--CHANEL
SET SERVEROUTPUT ON

DECLARE
	comp varchar(20);
	loc varchar(20);
	te number;
	tm number;
	ase number;
	asm number;
BEGIN
	Select Company_name into comp from Company where Company_name = 'Chanel';
	Select City into loc from Company where Company_name = 'Chanel';
	Select count(Employee_name) into te from Works where Company_name='Chanel';
	--needs work
  SELECT count(Manages.Manager_name) Into tm FROM Manages, Works WHERE Manages.Manager_name =  Works.Employee_name and Works.Company_name = 'Chanel' and Salary < 100000;
  --needs work
  SELECT avg(salary) into ase from Works where COMPANY_NAME like 'Chanel';
  --needs work
  Select avg(Salary) into asm from Works where employee_name in (Select manager_name from manages) and company_name = 'Chanel';
  
  --Output to the user the values we found
  dbms_output.put_line('Company Name: ' || comp);
  dbms_output.put_line('Located in: ' || loc);
  dbms_output.put_line('Total Employees:  ' || te);
  dbms_output.put_line('Total Managers: ' || tm);
  dbms_output.put_line('Average Salary Employees: ' || ase);
  dbms_output.put_line('Average Salary Managers: ' || asm);
END;
.
run;
--Output to Chanel
/* anonymous block completed
Company Name: Chanel
Located in: Paris
Total Employees:  2
Total Managers: 0
Average Salary Employees: 2565000
Average Salary Managers: 5000000 */

--BP
SET SERVEROUTPUT ON

DECLARE
	comp varchar(20);
	loc varchar(20);
	te number;
	tm number;
	ase number;
	asm number;
BEGIN
	Select Company_name into comp from Company where Company_name = 'BP';
	Select City into loc from Company where Company_name = 'BP';
	Select count(Employee_name) into te from Works where Company_name='BP';
	--needs work
  SELECT count(Manages.Manager_name) Into tm FROM Manages, Works WHERE Manages.Manager_name =  Works.Employee_name and Works.Company_name = 'BP' and Salary < 100000;
  --needs work
  SELECT avg(salary) into ase from Works where COMPANY_NAME like 'BP';
  --needs work
  Select avg(Salary) into asm from Works where employee_name in (Select manager_name from manages) and company_name = 'BP';
  
  --Output to the user the values we found
  dbms_output.put_line('Company Name: ' || comp);
  dbms_output.put_line('Located in: ' || loc);
  dbms_output.put_line('Total Employees:  ' || te);
  dbms_output.put_line('Total Managers: ' || tm);
  dbms_output.put_line('Average Salary Employees: ' || ase);
  dbms_output.put_line('Average Salary Managers: ' || asm);
END;
.
run;

--Output to BP
/* anonymous block completed
Company Name: BP
Located in: London
Total Employees:  3
Total Managers: 2
Average Salary Employees: 78666.6666666666666666666666666666666667
Average Salary Managers: 80000 */
/* END PART A */


/* --PART <B>-- */
CREATE OR REPLACE
PROCEDURE giveRaise
(
    X IN VARCHAR2, --company in a city
    Y  IN NUMBER, --if the employee is a manager
    Z  IN NUMBER -- if the employee is NOT a manager
)
IS
BEGIN
  -- Give all employees that works in a company located in city X a Y percent 
  -- raise if they are managers and Z percent raise if they are not managers. X,
  -- Y, and Z will be the three parameters for the stored procedure. 
  
  --Managers. Updates the salary, selects the city name if it matches and gets the company name relating to the city. 
    --After comparing that, we check if the employee is a manager and then the salary should update.
  UPDATE WORKS
  SET SALARY = SALARY * ((Y/100) + 1) 
  WHERE
   WORKS.COMPANY_NAME = 
    (
      SELECT COMPANY_NAME 
      from COMPANY 
      WHERE X = COMPANY.COMPANY_NAME
    ) 
    AND 
     WORKS.EMPLOYEE_NAME IN 
    (
      SELECT MANAGER_NAME 
      FROM MANAGES 
    );
    
    --Employees. This update command checks if the employee of the company we found (first by looking 
      --for the company by comaring the city name to the company name) and then checks if the employee is 
      --not a manager 
  UPDATE WORKS
  SET SALARY = SALARY * ((Z/100) + 1) 
  WHERE 
     WORKS.COMPANY_NAME =
      (
        SELECT COMPANY_NAME
        from COMPANY
        WHERE X = COMPANY.COMPANY_NAME
      )
    AND
   WORKS.EMPLOYEE_NAME IN 
    (
      SELECT EMPLOYEE_NAME 
      FROM MANAGES
    );

END giveRaise;


--PART B, DOESNT WORK BUT MAYBE EXTRA CREDIT FOR TRYING ANOTHER WAY?



--OPTIONAL USING CASE (MAYBE BETTER???)
CREATE OR REPLACE
PROCEDURE giveRaise
(
    X IN VARCHAR2, --company in a city
    Y  IN NUMBER, --if the employee is a manager
    Z  IN NUMBER -- if the employee is NOT a manager
)
IS
BEGIN
  -- Give all employees that works in a company located in city X a Y percent 
  -- raise if they are managers and Z percent raise if they are not managers. X,
  -- Y, and Z will be the three parameters for the stored procedure. 
  --Managers
  UPDATE WORKS
  --SET SALARY = SALARY * ((Y/100) + 1) 
  SET  SALARY = case

  		WHEN Works.Employee_name IN (SELECT MANAGER_NAME FROM MANAGES) 
  		AND WORKS.COMPANY_NAME IN (SELECT COMPANY_NAME FROM COMPANY WHERE X like COMPANY.COMPANY_NAME)
  		THEN SALARY * ((Y/100) + 1)

  		WHEN Works.Employee_name IN (SELECT EMPLOYEE_NAME FROM MANAGES) 
  		AND WORKS.COMPANY_NAME IN (SELECT COMPANY_NAME FROM COMPANY WHERE X like COMPANY.COMPANY_NAME)
  		THEN SALARY * ((Z/100) + 1)

  		ELSE SALARY -- Just to make sure nothing changes
  END giveRaise;

  /* end part b */
