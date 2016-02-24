-- CIT 472/572 HW6 Script - database 
-- if tables already exist, drop them
 
drop table employee;
drop table works;
drop table company;
drop table manages;

--	Create tables

create table employee
(employee_name varchar2(35),
street varchar2(30),
city varchar2(15),
primary key (employee_name));

create table works
(employee_name varchar2(35),
company_name varchar2(20),
salary number(7),
primary key (employee_name));

create table company
(company_name varchar2(20),
city varchar2(15),
primary key (company_name));

create table manages
(employee_name varchar2(35),
manager_name varchar2(35),
primary key (employee_name));

--	Populate tables 

insert into employee 
values('William Gates III', 'University St', 'Redmond');
insert into employee
values('Warren Buffett', 'Alaskan Way', 'Omaha');
insert into employee
values('Lakshmi Mittal', '1st Ave', 'London');
insert into employee
values('Carlos Slim Helu', '1st Ave', 'London');
insert into employee
values('Prince Alwaleed Bin Talal Alsaud', 'Roy St', 'Riyadh');
insert into employee
values('Ingvar Kamprad', 'University Ave', 'Oslo');
insert into employee
values('Paul Allen', 'University St', 'Redmond');
insert into employee
values('Karl Albrecht', 'Westlake Ave', 'London');
insert into employee
values('Lawrence Ellison', '20717 International Blvd.', 'Silicon Valley');
insert into employee
values('S Robson Walton', 'Sixth Avenue', 'Bentonville');
insert into employee
values('Jim Walton', 'Sixth Avenue', 'Bentonville');
insert into employee
values('John Walton', 'Sixth Avenue', 'Bentonville');
insert into employee
values('Alice Walton', 'Sixth Avenue', 'Bentonville');
insert into employee
values('Helen Walton', 'Sixth Avenue', 'Bentonville');
insert into employee
values('Kenneth Thomson', '20717 International Blvd.', 'Silicon Valley');
insert into employee
values('Liliane Bettencourt', '18 Avenue de Suffren', 'Paris');
insert into employee
values('Bernard Arnault', '18 Avenue de Suffren', 'Paris');
insert into employee
values('Michael Dell', '4533 South', 'Austin');
insert into employee
values('Sheldon Adelson', '4533 South', 'Austin');
insert into employee
values('Theo Albrecht', 'Westlake Ave', 'London');

insert into works
values('William Gates III', 'Microsoft', 1400000);
insert into works
values('Warren Buffett', 'Exxon Mobil', 2300000);
insert into works
values('Lakshmi Mittal', 'General Electric', 600000);
insert into works
values('Carlos Slim Helu', 'General Electric', 400000);
insert into works
values('Prince Alwaleed Bin Talal Alsaud', 'ChevronTexaco', 50000);
insert into works
values('Ingvar Kamprad', 'BP', 80000);
insert into works
values('Paul Allen', 'Microsoft', 300000);
insert into works
values('Karl Albrecht', 'BP', 100000);
insert into works
values('Lawrence Ellison', 'Oracle', 98000);
insert into works
values('S Robson Walton', 'Wal-Mart Stores', 65000);
insert into works
values('Jim Walton', 'Wal-Mart Stores', 40000);
insert into works
values('John Walton', 'Wal-Mart Stores', 120000);
insert into works
values('Alice Walton', 'Wal-Mart Stores', 34000);
insert into works
values('Helen Walton', 'Wal-Mart Stores', 300000);
insert into works
values('Kenneth Thomson', 'Oracle', 120000);
insert into works
values('Liliane Bettencourt', 'Chanel', 5000000);
insert into works
values('Bernard Arnault', 'Chanel', 130000);
insert into works
values('Michael Dell', 'Dell', 900000);
insert into works
values('Sheldon Adelson', 'Dell', 80000);
insert into works
values('Theo Albrecht', 'BP', 56000);

insert into company
values('Microsoft', 'Redmond');
insert into company
values('Exxon Mobil', 'Omaha');
insert into company
values('General Electric', 'London');
insert into company
values('ChevronTexaco', 'Riyadh');
insert into company
values('BP', 'London');
insert into company
values('Oracle', 'Silicon Valley');
insert into company
values('Wal-Mart Stores', 'Bentonville');
insert into company
values('Chanel', 'Paris');
insert into company
values('Dell', 'Austin');

insert into manages
values('Paul Allen', 'William Gates III');
insert into manages
values('Carlos Slim Helu', 'Lakshmi Mittal');
insert into manages
values('Karl Albrecht', 'Ingvar Kamprad');
insert into manages
values('Theo Albrecht', 'Ingvar Kamprad');
insert into manages
values('Kenneth Thomson', 'Lawrence Ellison');
insert into manages
values('Jim Walton', 'S Robson Walton');
insert into manages
values('John Walton', 'Jim Walton');
insert into manages
values('Alice Walton', 'John Walton');
insert into manages
values('Helen Walton', 'Jim Walton');
insert into manages
values('Bernard Arnault', 'Liliane Bettencourt');
insert into manages
values('Sheldon Adelson', 'Michael Dell');

commit;
