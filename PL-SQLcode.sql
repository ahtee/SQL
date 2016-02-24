--1. The basic four arithmetic operators in action. 
SET SERVEROUTPUT ON 
BEGIN
    DBMS_OUTPUT.PUT_LINE(4 * 2);  --Multiplication
    DBMS_OUTPUT.PUT_LINE(24 / 3); --Division
    DBMS_OUTPUT.PUT_LINE(4 + 4);  --Addition
    DBMS_OUTPUT.PUT_LINE(16 - 8); --Subtraction
END;
/


--2. Use table of rowtype to define data type 

-- create demo table 
create table Employee(
   ID                 VARCHAR2(4 BYTE)         NOT NULL,
   First_Name         VARCHAR2(10 BYTE),
   Last_Name          VARCHAR2(10 BYTE),
   Start_Date         DATE,
   End_Date           DATE,
   Salary             Number(8,2),
   City               VARCHAR2(10 BYTE),
   Description        VARCHAR2(15 BYTE)
);

-- prepare data
insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
              values ('01','Jason',    'Martin',  to_date('19960725','YYYYMMDD'), to_date('20060725','YYYYMMDD'), 1234.56, 'Toronto',  'Programmer');

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
               values('02','Alison',   'Mathews', to_date('19760321','YYYYMMDD'), to_date('19860221','YYYYMMDD'), 6661.78, 'Vancouver','Tester');

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
               values('03','James',    'Smith',   to_date('19781212','YYYYMMDD'), to_date('19900315','YYYYMMDD'), 6544.78, 'Vancouver','Tester');

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
               values('04','Celia',    'Rice',    to_date('19821024','YYYYMMDD'), to_date('19990421','YYYYMMDD'), 2344.78, 'Vancouver','Manager');

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
               values('05','Robert',   'Black',   to_date('19840115','YYYYMMDD'), to_date('19980808','YYYYMMDD'), 2334.78, 'Vancouver','Tester');

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary, City,        Description)
               values('06','Linda',    'Green',   to_date('19870730','YYYYMMDD'), to_date('19960104','YYYYMMDD'), 4322.78,'New York',  'Tester');

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary, City,        Description)
               values('07','David',    'Larry',   to_date('19901231','YYYYMMDD'), to_date('19980212','YYYYMMDD'), 7897.78,'New York',  'Manager');

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary, City,        Description)
               values('08','James',    'Cat',     to_date('19960917','YYYYMMDD'), to_date('20020415','YYYYMMDD'), 1232.78,'Vancouver', 'Tester');


-- display data in the table
select * from Employee;

ID   FIRST_NAME LAST_NAME  START_DAT END_DATE      SALARY CITY       DESCRIPTION
---- ---------- ---------- --------- --------- ---------- ---------- ---------------
01   Jason      Martin     25-JUL-96 25-JUL-06    1234.56 Toronto    Programmer
02   Alison     Mathews    21-MAR-76 21-FEB-86    6661.78 Vancouver  Tester
03   James      Smith      12-DEC-78 15-MAR-90    6544.78 Vancouver  Tester
04   Celia      Rice       24-OCT-82 21-APR-99    2344.78 Vancouver  Manager
05   Robert     Black      15-JAN-84 08-AUG-98    2334.78 Vancouver  Tester
06   Linda      Green      30-JUL-87 04-JAN-96    4322.78 New York   Tester
07   David      Larry      31-DEC-90 12-FEB-98    7897.78 New York   Manager
08   James      Cat        17-SEP-96 15-APR-02    1232.78 Vancouver  Tester

set serveroutput on

declare
    type my_text_table_type is table of varchar2(200) index by binary_integer;
     
    type my_emp_table_type is table of employee%rowtype index by binary_integer;

    l_text_table my_text_table_type;
    l_emp_table  my_emp_table_type;
begin
    l_text_table(1) := 'varchar2 value';
    l_text_table(2) := 'varchar2 value 2';
  
    l_emp_table(10).id := 10;
    l_emp_table(10).first_name  := 'S';
    l_emp_table(10).last_name   := 'D';

    l_emp_table(20).id := 20;
    l_emp_table(20).first_name  := 'Chris';
    l_emp_table(20).last_name   := 'Beck';

    dbms_output.put     ('We have ' ||l_text_table.count|| ' varchar2''s ');
    dbms_output.put_line('and ' ||l_emp_table.count|| ' employees.');
    dbms_output.put_line('-');
    dbms_output.put_line('vc2(1)='||l_text_table(1));
    dbms_output.put_line('vc2(2)='||l_text_table(2));
    dbms_output.put_line('-');
    dbms_output.put_line('l_emp_table(10)='||l_emp_table(10).first_name);
    dbms_output.put_line('l_emp_table(20)='||l_emp_table(20).first_name);

end;
/



--3. Implicit cursors:  SQL%ROWCOUNT returns number of rows affected by SQL statement.

BEGIN
    UPDATE employee
       SET salary = salary *2
    WHERE id < '03';
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;
/


--4. Implicit cursors: SQL%NOTFOUND returns TRUE if SQL statement found no records.

BEGIN
    UPDATE employee
       SET salary = salary *2
    WHERE id = '12';
    IF SQL%NOTFOUND THEN
       DBMS_OUTPUT.PUT_LINE('No rows updated. 12 does not exist');
    END IF;
END;
/


-- clean the table
drop table Employee;


--5. Prints all user tables which names start with A
set serveroutput on
declare
    type dd_rec_type is record (
    	table_name varchar2(30), 
	    col_name varchar2(30),
	    data_type varchar2(9));
	    
    -- array of records indexed as int, starts with 1
    type dd_table_type is table of dd_rec_type index by binary_integer;

    -- a var of type record
    dd_rec dd_rec_type;

    -- a var of type table (array)
    dd_table dd_table_type;

    cursor c1 is
	  select table_name, column_name, data_type
	  from user_tab_columns
	  where table_name like '%A%'
	  order by table_name, column_name;
	  
    -- for table index
    i binary_integer;
    prev varchar2(30);
    newentry boolean;

begin
    i := 0;
    open c1;
    loop
	fetch c1 into dd_rec;
	exit when c1%notfound;
	i := i +1;
	dd_table(i) := dd_rec;
    end loop;
    close c1;

    dbms_output.put_line('Tables with name starting with A:');
    dbms_output.new_line;

    prev := '';
    newentry := false;

    for i in 1..dd_table.count loop
	if (i=1) then
		dbms_output.put(dd_table(i).table_name || '(');
		prev := dd_table(i).table_name;
	elsif (prev != dd_table(i).table_name) then
		dbms_output.put_line(');');
		dbms_output.put(dd_table(i).table_name || '(');
		prev := dd_table(i).table_name;
		newentry := false;
	end if;
	if(newentry) then
		dbms_output.put(',');
	end if;
	newentry := true;
	dbms_output.put(dd_table(i).col_name || ':');
	dbms_output.put(dd_table(i).data_type);
    end loop;

    dbms_output.put_line(');');
end;
/


	  select table_name, column_name, data_type
	  from user_tab_columns
	  -- where table_name like 'A%'
	  order by table_name, column_name;

	  select table_name
	  from user_tables;


create table AEmployee(
   ID                 VARCHAR2(4 BYTE)         NOT NULL,
   First_Name         VARCHAR2(10 BYTE),
   Last_Name          VARCHAR2(10 BYTE),
   Start_Date         DATE,
   End_Date           DATE,
   Salary             Number(8,2),
   City               VARCHAR2(10 BYTE),
   Description        VARCHAR2(15 BYTE)
);
