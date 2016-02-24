/* Ben Otte - Database Administration */
/* HW Assignment 3 */ 
/* DUE: Wed Sept 24, 2014 */

CREATE TABLE Employee (
	Employee_name varchar(30) NOT NULL,
	Employee_street varchar2(30) NOT NULL,
	Employee_city varchar(20) NOT NULL,
	PRIMARY KEY (Employee_name)
);

CREATE TABLE Works (
	Works_employee_name varchar(30) NOT NULL,
	Works_company_name varchar(30) NOT NULL,
	Works_salary number NOT NULL,
	PRIMARY KEY (Works_employee_name)
);

CREATE TABLE Company (
	Company_name varchar(30) NOT NULL,
	Company_city varchar(30) NOT NULL,
	PRIMARY KEY (Company_name)
);

CREATE TABLE Manages (
	Manages_employee_name varchar(30) NOT NULL,
	Manages_manager_name varchar(30) NOT NULL,
	PRIMARY KEY (Manages_employee_name)
);

INSERT INTO Employee VALUES ('William Gates III', 'University St', 'Redmond');
INSERT INTO Employee VALUES ('Warren Buffett', 'Alaskan Way', 'Omaha');
INSERT INTO Employee VALUES ('Lakshmi Mittal', '1st Ave', 'London');
INSERT INTO Employee VALUES ('Carlos Slim Helu', '1st Ave', 'London');
INSERT INTO Employee VALUES ('Prince Gatlin', '2nd Ave', 'Birmingham');
INSERT INTO Employee VALUES ('Ingvar Kamprad', 'University Ave', 'Oslo');
INSERT INTO Employee VALUES ('Paul Allen', 'First St', 'Seattle');
INSERT INTO Employee VALUES ('Karl Albrecht', 'Westlake Ave', 'London');
INSERT INTO Employee VALUES ('Lawrence Ellison', '20717 International Blvd.', 'Silicon Valley');
INSERT INTO Employee VALUES ('S Robson Walton', 'First Avenue', 'Bentonville');
INSERT INTO Employee VALUES ('Jim Walton', 'Second Avenue', 'Bentonville');
INSERT INTO Employee VALUES ('John Walton', 'Third Avenue', 'Bentonville');
INSERT INTO Employee VALUES ('Alice Walton', 'Fourth Avenue', 'Bentonville');
INSERT INTO Employee VALUES ('Helen Walton', 'Sixth Avenue', 'Bentonville');
INSERT INTO Employee VALUES ('Kenneth Thomson', '20717 International Blvd.', 'Silicon Valley');
INSERT INTO Employee VALUES ('Liliane Bettencourt', '21 Rue de Miroir', 'Lyon');
INSERT INTO Employee VALUES ('Bernard Arnault', '18 Avenue de Suffren', 'Paris');
INSERT INTO Employee VALUES ('Michael Dell', '4533 South', 'Austin');
INSERT INTO Employee VALUES ('Sheldon Adelson', '4533 South', 'Austin');
INSERT INTO Employee VALUES ('Theo Albrecht', 'Westlake Ave', 'London');

INSERT INTO Works VALUES ('William Gates III', 'Microsoft', 1400000);
INSERT INTO Works VALUES ('Warren Buffett', 'Exxon Mobil', 230000);
INSERT INTO Works VALUES ('Lakshmi Mittal', 'General Electric', 60000);
INSERT INTO Works VALUES ('Carlos Slim Helu', 'General Electric', 400000);
INSERT INTO Works VALUES ('Prince Gatlin', 'General Electric', 50000);
INSERT INTO Works VALUES ('Ingvar Kamprad', 'BP', 80000);
INSERT INTO Works VALUES ('Paul Allen', 'Microsoft', 300000);
INSERT INTO Works VALUES ('Karl Albrecht', 'BP', 100000);
INSERT INTO Works VALUES ('Lawrence Ellison', 'Oracle', 98000);
INSERT INTO Works VALUES ('S Robson Walton', 'Wal-Mart Stores', 650000);
INSERT INTO Works VALUES ('Jim Walton', 'Wal-Mart Stores', 98000);
INSERT INTO Works VALUES ('John Walton', 'Wal-Mart Stores', 12000);
INSERT INTO Works VALUES ('Alice Walton', 'Wal-Mart Stores', 94000);
INSERT INTO Works VALUES ('Helen Walton', 'Wal-Mart Stores', 30000);
INSERT INTO Works VALUES ('Kenneth Thomson', 'Oracle', 120000);
INSERT INTO Works VALUES ('Liliane Bettencourt', 'Chanel', 500000);
INSERT INTO Works VALUES ('Bernard Arnault', 'Chanel', 130000);
INSERT INTO Works VALUES ('Michael Dell', 'Dell', 900000);
INSERT INTO Works VALUES ('Sheldon Adelson', 'Dell', 80000);
INSERT INTO Works VALUES ('Theo Albrecht', 'BP', 56000);

INSERT INTO Company VALUES ('Microsoft', 'Redmond');
INSERT INTO Company VALUES ('Exxon Mobil', 'Omaha');
INSERT INTO Company VALUES ('General Electric', 'London');
INSERT INTO Company VALUES ('BP', 'London');
INSERT INTO Company VALUES ('Oracle', 'Silicon Valley');
INSERT INTO Company VALUES ('Wal-Mart Stores', 'Bentonville');
INSERT INTO Company VALUES ('Chanel', 'Paris');
INSERT INTO Company VALUES ('Dell', 'Austin');

INSERT INTO Manages VALUES ('Paul Allen', 'William Gates III');
INSERT INTO Manages VALUES ('Carlos Slim Helu', 'Lakshmi Mittal');
INSERT INTO Manages VALUES ('Karl Albrecht', 'Ingvar Kamprad');
INSERT INTO Manages VALUES ('Theo Albrecht', 'Ingvar Kamprad');
INSERT INTO Manages VALUES ('Kenneth Thomson', 'Lawrence Ellison');
INSERT INTO Manages VALUES ('Jim Walton', 'S Robson Walton');
INSERT INTO Manages VALUES ('John Walton', 'Jim Walton');
INSERT INTO Manages VALUES ('Alice Walton', 'John Walton');
INSERT INTO Manages VALUES ('Helen Walton', 'Jim Walton');
INSERT INTO Manages VALUES ('Bernard Arnault', 'Liliane Bettencourt');
INSERT INTO Manages VALUES ('Sheldon Adelson', 'Michael Dell');


/* 1 GOOD*/
SELECT Works_employee_name, Works_company_name FROM Works WHERE Works_company_name <> 'BP' AND Works_company_name <> 'Dell';
/* 2 GOOD*/
SELECT Employee_name, Works_salary FROM employee, works WHERE employee.Employee_name=works.Works_employee_name AND ( Works_salary >400000 OR Works_salary < 50000);
/* 3 GOOD*/
SELECT Company_name, count(Works.Works_employee_name) FROM Company JOIN Works ON Company.Company_name = Works.Works_company_name Group By Company_name ORDER BY count(Works.Works_employee_name) desc;
/* 4 GOOD - I copied what I had for Q2 and changed stuff.*/
SELECT Manages_manager_name, Works_salary FROM Manages, Works WHERE Manages.Manages_manager_name=works.Works_employee_name AND (Works_salary < (SELECT Works_salary FROM Works WHERE Manages.Manages_employee_name=Works.Works_employee_name));
/* 5 Good - I copied what I had from Q3 and changed some stuff. */
SELECT Company_name, avg(Works.Works_salary) FROM Company JOIN Works ON Company.Company_name = Works.Works_company_name Group By COmpany_name;
/* 6 Good - I decided to use two separate statements.*/
UPDATE Works SET Works_salary = Works_salary+(Works_salary *.10) WHERE Works_salary < 100000;
UPDATE Works SET Works_salary = Works_salary+(Works_salary *.05) WHERE Works_salary > 100000;
/* 7 NEEDS WORK - Cant check to see if the employee is a manager by checking the "Manages" table. Not sure of other methods. I kept what I was thinking in the document below. */
UPDATE Works SET Works_salary=Works_salary+(Works_salary *.10) WHERE JOIN Manages (Works.Works_employee_name=Manages.Manages_manager_name) AND (Works.Works_company_name='Wal-Mart Stores');
/* 8 Good - Wasn't sure if I had to look for any other employees that worked for chanel in the other tables. */
DELETE FROM Works WHERE Works_company_name ='Chanel';
DELETE FROM Company WHERE Company_name = 'Chanel';
