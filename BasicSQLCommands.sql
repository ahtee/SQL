<!--BEN OTTE SQL COMMANDS-->

CREATE TABLE Emp_1(EMP_NUM CHAR(3), EMP_LNAME VARCHAR(15), 
	EMP_FNAME VARCHAR(15), EMP_INITIAL CHAR(1), 
	EMP_HIREDATE DATE, JOB_CODE CHAR(3), 
	PRIMARY KEY (EMP_NUM));

----------------------------------------------

INSERT INTO Emp_1 VALUES ('101', 'News', 'John', 'G', '08-NOV-00', '502');
INSERT INTO Emp_1 VALUES ('102', 'Senior', 'David', 'H', '12-JUL-89', 501);

----------------------------------------------

SELECT *
	FROM Emp_1
	WHERE Job_CODE=502;

----------------------------------------------

COMMIT;

----------------------------------------------
<!--Created more rows to update the rest of the table like in figure Q7.2-->
INSERT INTO Emp_1 VALUES ('103', 'Arbough', 'June', 'E', '01-DEC-96', '500');
INSERT INTO Emp_1 VALUES ('104', 'Ramoras', 'Anne', 'K', '15-Nov-87', '501');
INSERT INTO Emp_1 VALUES ('105', 'Johnson', 'Alice', 'K', '01-FEB-93', '502');
INSERT INTO Emp_1 VALUES ('106', 'Smithfield', 'William,', '', '22-JUN-04', 500);
INSERT INTO Emp_1 VALUES ('107', 'Alonzo', 'Maria', 'D', '10-OCT-93', '500');
INSERT INTO Emp_1 VALUES ('108', 'Washington', 'Ralph', 'B', '22-AUG-91', 501);
INSERT INTO Emp_1 VALUES ('109', 'Smith', 'Larry', 'W', '18-JUL-97', '501');


<!--Then I used the code below-->

UPDATE Emp_1
	SET JOB_CODE='501'
	WHERE EMP_NUM = '107';



ROLLBACK;

----------------------------------------------

DELETE FROM Emp_1
	WHERE EMP_NUM='106' AND
	EMP_FNAME = 'William' AND
	EMP_LNAME = 'Smithfield' AND
	EMP_HIREDATE= '22-JUN-04' AND
	JOB_CODE = '500';

----------------------------------------------

ROLLBACK;

----------------------------------------------


CREATE TABLE Emp_2 (EMP_NUM CHAR(3), EMP_LNAME VARCHAR(15), 
	EMP_FNAME VARCHAR(15), EMP_INITIAL CHAR(1), 
	EMP_HIREDATE DATE, JOB_CODE CHAR(3), EMP_PCT NUMBER(4,2),
	PROJ_NUM CHAR(3) ) ;
	

______________________________________________


UPDATE Emp_2
	SET EMP_PCT = '5.00'
 	WHERE EMP_NUM='101';

UPDATE Emp_2
	SET EMP_PCT = '8.00'
 	WHERE EMP_NUM='102';
UPDATE Emp_2
	SET EMP_PCT = '3.85'
 	WHERE EMP_NUM='103';

UPDATE Emp_2
	SET EMP_PCT = '10.00'
 	WHERE EMP_NUM='104';

UPDATE Emp_2
	SET EMP_PCT = '5.00'
 	WHERE EMP_NUM='105';

UPDATE Emp_2
	SET EMP_PCT = '6.20'
 	WHERE EMP_NUM='106';
UPDATE Emp_2
	SET EMP_PCT = '5.15'
 	WHERE EMP_NUM='107';
UPDATE Emp_2
	SET EMP_PCT = '10.00'
 	WHERE EMP_NUM='108';

UPDATE Emp_2
	SET EMP_PCT = '2.00'
 	WHERE EMP_NUM='109';


===============================================
10.
UPDATE Emp_2
	SET PROJ_NUM='18'
	WHERE JOB_CODE = '500';
===============================================

inSERT INTO emp_2 VALUES('101', 'News', 'John', 'G', '08-NOV-00', '502',NUll,null );
INSERT INTO Emp_2 VALUES ('102', 'Senior', 'David', 'H', '12-JUL-89', 501, null, null);
INSERT INTO Emp_2 VALUES ('103', 'Arbough', 'June', 'E', '01-DEC-96', '500', null, null);
INSERT INTO Emp_2 VALUES ('104', 'Ramoras', 'Anne', 'K', '15-Nov-87', '501', null, null);
INSERT INTO Emp_2 VALUES ('105', 'Johnson', 'Alice', 'K', '01-FEB-93', '502', null, null);
INSERT INTO Emp_2 VALUES ('106', 'Smithfield', 'William,', '', '22-JUN-04', 500, null, null);
INSERT INTO Emp_2 VALUES ('107', 'Alonzo', 'Maria', 'D', '10-OCT-93', '500', null, null);
INSERT INTO Emp_2 VALUES ('108', 'Washington', 'Ralph', 'B', '22-AUG-91', 501, null,null);
INSERT INTO Emp_2 VALUES ('109', 'Smith', 'Larry', 'W', '18-JUL-97', '501' , null, null);
<!--my copying database emp_1 into emp_2 didn't work correctly so i had to do it manually-->

--------------------------------------------------

11.
UPDATE emp_2
	SET PROJ_NUM= 25
	WHERE JOB_CODE>=502;

---------------------------------------------------

12.
UPDATE emp_2
	SET PROJ_NUM = 14
	WHERE EMP_HIREDATE<'01-JAN-94'
	AND JOB_CODE >= 501;

