create table otteb1_customer (customerID char(3) primary key, customerAddress char(25), customerName char(25),
	customerCity Char(10), customerState char(2), orderID char(3) primary key );

Insert into otteb1_customer Values ('22','532 Blue Road', 'Toms Hardware', 'Cincinnati', 'OH', '100'); 

Insert into otteb1_customer Values ('50','3642 Biltmor Av', 'Anandtech', 'Tallahassee', 'FL', '104');

Insert into otteb1_customer Values ('81','5122 Alvin Hei', 'Sharons Thrift', 'Austin', 'TX', '33');

Insert into otteb1_customer values ('33', '743 Evergreen', 'Widget Resell', 'Springfield', 'MO', '107');

insert into otteb1_customer values ('22', '532 Blue Road', 'Toms Hardware', 'Cincy ', 'OH', '39');

<!-------------- -->
CREATE TABLE otteb1_otteb1_midterm (ASSIGN_NAME CHAR(40),
	GRADE NUMBER(5,2), POINT_TOTAL NUMBER(5,2) );

INSERT INTO otteb1_midterm VALUES ('Design Project 8/30 (G)', 10.00, 10);
INSERT INTO otteb1_midterm VALUES ('QUIZ 1', 26.00, 40);
INSERT INTO otteb1_midterm VALUES ('ERD Individual (9-11)', 7.50, 10);
INSERT INTO otteb1_midterm VALUES ('Group Assignment 9-13', 10.00, 10);

INSERT INTO otteb1_midterm VALUES ('Chapter 3-R.O.', 8.50, 10);
INSERT INTO otteb1_midterm VALUES ('Chapt 3 - Integrity', 9.50, 10);
INSERT INTO otteb1_midterm VALUES ('CH 3 Quiz', 66.6666, 100);
INSERT INTO otteb1_midterm VALUES ('CH 10 In-class individ', 6.50, 10.00);

INSERT INTO otteb1_midterm VALUES ('Ch 4 (G)', 10.00, 10.00);

SELECT SUM(GRADE) FROM otteb1_midterm;
