/* HW2 - Ben Otte */
/* CIT 472 Database Administration */
/* Due Wed, Sept 17, 11:59pm */
CREATE TABLE Theatres (
	Theatre_name varchar(60) NOT NULL,
	Theatre_city varchar(30) NOT NULL,
	Theatre_state varchar(2) NOT NULL,
	Theatre_zip number(5) NOT NULL,
	Theatre_phone varchar2(20) NOT NULL,
	PRIMARY KEY (Theatre_name)
);

CREATE TABLE Movies (
	Movie_title varchar(50) NOT NULL,
	Movie_rating number(2, 1) NOT NULL,
	Movie_length number NOT NULL,
	Movie_releasedate DATE NOT NULL,
	PRIMARY KEY (Movie_title),
	check (Movie_rating >= 0 AND Movie_rating <= 10),
	check (Movie_length > 0),
	check (Movie_releasedate > to_date('1900-01-01', 'YYYY-MM-DD'))
);

CREATE TABLE ShownAt (
	ShownAt_theatrename varchar(60) NOT NULL,
	ShownAt_movietitle varchar(50) NOT NULL,
	PRIMARY KEY (ShownAt_theatrename, ShownAt_movietitle),
	FOREIGN KEY (ShownAt_theatrename) REFERENCES Theatres(Theatre_name),
	FOREIGN KEY (ShownAt_movietitle) REFERENCES Movies(Movie_title)
);

INSERT INTO Theatres VALUES ('Great Escape 14', 'Wilder', 'KY', 41076, '859 442-0000');
INSERT INTO Theatres VALUES ('AMC Newport On The Levee 20', 'Newport', 'KY', 41071, '888 AMC-4FUN');
INSERT INTO Theatres VALUES ('Danbarry Dollar Saver Eastgate', 'Cincinnati', 'OH', 45245, '513 947-8111');
INSERT INTO Theatres VALUES ('Danbarry Dollar Cinemas Turfway', 'Florence', 'KY', 41042, '859 647-2828');
INSERT INTO Theatres VALUES ('Esquire Theatre', 'Cincinnati', 'OH', 45220, '513 281-8750');
INSERT INTO Theatres VALUES ('Showcase Cinema De Lux Florence', 'Florence', 'KY', 41042, '800 315-4000');

INSERT INTO Movies VALUES ('The Expendables', 7.6, 103, to_date('2010-08-13', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Eat Pray Love', 4.7, 133, to_date('2010-08-13', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('The Other Guys', 7.1, 107, to_date('2010-08-06', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Inception', 9.1, 148, to_date('2010-07-16', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Salt', 6.7, 100, to_date('2010-07-23', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Bandslam', 5.6, 111, to_date('2009-08-14', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Inglorious Basterds', 8.7, 153, to_date('2009-08-21', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('District 9', 8.7, 112, to_date('2009-08-14', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('A Perfect Getaway', 6.8, 97, to_date('2009-08-07', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Star Trek', 8.4, 127, to_date('2010-05-08', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Aliens in the Attic', 4.5, 86, to_date('2009-07-31', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Public Enemies', 7.5, 140, to_date('2009-07-01', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Away We Go', 7.9, 98, to_date('2009-06-26', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('The Hurt Locker', 8.0, 131, to_date('2008-10-10', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('The Dark Knight', 8.9, 152, to_date('2008-07-18', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('Up', 8.7, 86, to_date('2009-05-29', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('The Departed', 8.5, 151, to_date('2006-10-06', 'YYYY-MM-DD'));
INSERT INTO Movies VALUES ('The Pianist', 8.5, 150, to_date('2003-01-03', 'YYYY-MM-DD'));

INSERT INTO ShownAt VALUES ('Great Escape 14', 'The Expendables');
INSERT INTO ShownAt VALUES ('Great Escape 14', 'Eat Pray Love');
INSERT INTO ShownAt VALUES ('Great Escape 14', 'The Other Guys');
INSERT INTO ShownAt VALUES ('Great Escape 14', 'Inception');
INSERT INTO ShownAt VALUES ('Great Escape 14', 'Bandslam');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'The Expendables');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'Eat Pray Love');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'The Other Guys');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'Inception');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'Salt');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'Inglorious Basterds');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'Public Enemies');
INSERT INTO ShownAt VALUES ('AMC Newport On The Levee 20', 'Up');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Saver Eastgate', 'The Expendables');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Saver Eastgate', 'Star Trek');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Saver Eastgate', 'Away We Go');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Saver Eastgate', 'The Hurt Locker');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Cinemas Turfway', 'A Perfect Getaway');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Cinemas Turfway', 'Star Trek');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Cinemas Turfway', 'Aliens in the Attic');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Cinemas Turfway', 'Public Enemies');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Cinemas Turfway', 'The Departed');
INSERT INTO ShownAt VALUES ('Danbarry Dollar Cinemas Turfway', 'The Pianist');
INSERT INTO ShownAt VALUES ('Esquire Theatre', 'The Dark Knight');
INSERT INTO ShownAt VALUES ('Esquire Theatre', 'Up');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'The Expendables');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'Eat Pray Love');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'The Other Guys');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'Inception');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'Salt');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'Bandslam');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'Inglorious Basterds');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'District 9');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'A Perfect Getaway');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'The Dark Knight');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'Up');
INSERT INTO ShownAt VALUES ('Showcase Cinema De Lux Florence', 'The Pianist');

/*QUERIES*/
/* 1 */
SELECT ShownAt_theatrename FROM ShownAt WHERE ShownAt_movietitle = 'Eat Pray Love';
/* 2 */
SELECT t.Theatre_name, t.Theatre_phone FROM Theatres t, Movies m, ShownAt s WHERE m.Movie_title != 'Up' AND m.Movie_title = s.ShownAt_movietitle AND s.ShownAt_theatrename = t.Theatre_name;
/* 3 */
SELECT Theatre_city, min(Movie_length), max(Movie_length) FROM Theatres, ShownAt, Movies WHERE Movies.Movie_title = ShownAt.ShownAt_movietitle AND ShownAt.ShownAt_theatrename = Theatres.Theatre_name GROUP BY Theatre_city; 
/* 4 */
With T As (SELECT T.Theatre_Name,  T.Theatre_Phone, RANK() OVER (ORDER BY COUNT(s.shownat_movietitle) DESC) AS Rnk FROM Theatres T
JOIN ShownAt  S ON S.ShownAt_TheatreName= T.Theatre_Name GROUP BY T.Theatre_Name,  T.Theatre_Phone) 
SELECT Theatre_Name, Theatre_Phone FROM T WHERE Rnk=1;
/* 5 */
SELECT AVG(m.Movie_rating) AS avg_rating, t.Theatre_name FROM THEATRES t JOIN SHOWNAT sa ON sa.Shownat_theatrename = t.Theatre_name JOIN MOVIES m ON m.Movie_title = sa.ShownAt_movietitle GROUP BY t.Theatre_name ORDER BY avg_rating asc;
/* 6 */
SELECT AVG(m.Movie_rating) AS avg_rating, t.Theatre_city FROM THEATRES t JOIN SHOWNAT sa ON sa.Shownat_theatrename = t.Theatre_name JOIN MOVIES m ON m.Movie_title = sa.ShownAt_movietitle GROUP BY t.Theatre_city ORDER BY avg_rating desc;
/* 7 */
SELECT Theatre_city, Movie_title FROM (SELECT t.Theatre_city, m.Movie_title, ROW_NUMBER() OVER(PARTITION BY t.Theatre_city ORDER BY m.Movie_releasedate) AS rank 
 FROM THEATRES t
 JOIN SHOWNAT sa ON sa.ShownAt_theatrename=t.Theatre_name 
 JOIN MOVIES m ON m.Movie_title = sa.ShownAt_movietitle) x
 WHERE x.rank = 1
 ORDER BY Theatre_city, Movie_title;
