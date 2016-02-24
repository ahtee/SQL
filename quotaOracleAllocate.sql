--Database Administration Homework 6
--Ben Otte

--1--
create tablespace "tbspben" datafile '/home/oracle/app/oracle/oradata//oracltbspben_01' size 100M reuse extent management local uniform size 40k;

--CREATE 3 TABLES, manually allocate 3 extents to each [NEEDS 9 EXTENTS]
--table1
create table hr1.newtable (col1 date) tablespace "tbspben";
--table2
create table hr1.newtable2 (col1 date) tablespace "tbspben";
--table3
create table hr1.newtable3 (col1 date) tablespace "tbspben";

alter user owner quota unlimited on "tbspben";
--extents --total of 9--
alter table newtable allocate extent;
alter table newtable allocate extent;
alter table newtable allocate extent;
--newtable2
alter table newtable2 allocate extent;
alter table newtable2 allocate extent;
alter table newtable2 allocate extent;
--newtable3
alter table newtable3 allocate extent;
alter table newtable3 allocate extent;
alter table newtable3 allocate extent;

--query
select TABLESPACE_NAME, FILE_ID, EXTENT_ID, BLOCK_ID, BLOCKS, BYTES from dba_extents where tablespace_name='tbspben';
--Forgot to copy/paste the first query result. should return 16 rows

--alter tablespace to add another datafile
ALTER TABLESPACE "tbspben" ADD DATAFILE '/home/oracle/app/oracle/oradata/tbspben_02.dbf' size 100M reuse;

--2 more extents for each table
alter table newtable allocate extent;
alter table newtable allocate extent;
--
alter table newtable2 allocate extent;
alter table newtable2 allocate extent;
--
alter table newtable3 allocate extent;
alter table newtable3 allocate extent;

select TABLESPACE_NAME, FILE_ID, EXTENT_ID, BLOCK_ID, BLOCKS, BYTES from dba_extents where tablespace_name='tbspben';
--OUTPUT BELOW vvvvvvv

TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          0          8          5
     40960

tbspben                                13          1         23          5
     40960

tbspben                                13          2         28          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          3         33          5
     40960

tbspben                                14          4          8          5
     40960

tbspben                                13          5         73          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          0         13          5
     40960

tbspben                                13          1         38          5
     40960

tbspben                                13          2         43          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          3         63          5
     40960

tbspben                                13          4         68          5
     40960

tbspben                                14          5         13          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          6         78          5
     40960

tbspben                                13          0         18          5
     40960

tbspben                                13          1         48          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          2         53          5
     40960

tbspben                                13          3         58          5
     40960

tbspben                                14          4         18          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          5         83          5
     40960


19 rows selected.

--3 more extents to first table
alter table newtable allocate extent;
alter table newtable allocate extent;
alter table newtable allocate extent;
--1 extent to the second table
alter table newtable2 allocate extent;

--Run Query
select TABLESPACE_NAME, FILE_ID, EXTENT_ID, BLOCK_ID, BLOCKS, BYTES from dba_extents where tablespace_name='tbspben';

TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          0          8          5
     40960

tbspben                                13          1         23          5
     40960

tbspben                                13          2         28          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          3         33          5
     40960

tbspben                                14          4          8          5
     40960

tbspben                                13          5         73          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                14          6         23          5
     40960

tbspben                                13          7         88          5
     40960

tbspben                                14          8         28          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          0         13          5
     40960

tbspben                                13          1         38          5
     40960

tbspben                                13          2         43          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          3         63          5
     40960

tbspben                                13          4         68          5
     40960

tbspben                                14          5         13          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          6         78          5
     40960

tbspben                                14          7         33          5
     40960

tbspben                                13          0         18          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                13          1         48          5
     40960

tbspben                                13          2         53          5
     40960

tbspben                                13          3         58          5
     40960


TABLESPACE_NAME                   FILE_ID  EXTENT_ID   BLOCK_ID     BLOCKS
------------------------------ ---------- ---------- ---------- ----------
     BYTES
----------
tbspben                                14          4         18          5
     40960

tbspben                                13          5         83          5
     40960


23 rows selected.



--2--
[[[[[[[[[TABLESPACE_2 (I created)_]]]]]]]]]
DATAFILE_2	/home/oracle/app/oracle/oradata/orcl/	[Size (MB)] 100.00	[Used (MB)]  1.00
DATAFILE_3	/home/oracle/app/oracle/oradata/orcl/	[Size (MB)] 100.00	[Used (MB)]  1.00


[[[[[[[SYSAUX]]]]]]]]

Space Usage
	Total Space Used (MB)		1,151.69
	Free Space (MB)		107.31
	Space Used (%)		91.48
Chart Titled: Usage	
			XDB(41.5)		
			Unknown(15.7)		
			Server Manageability - Automatic Workload Repository(9.4)		
			Free Space(8.5)		
			Enterprise Manager Repository(6.9)		
			Others(18.0)		
	
--Occupants of SYSAUX--
Name				Schema				Space Used (MB) 			Space Used (%)			Change Tablespace
XDB					XDB					522.38						41.49					Change Tablespace
Unknown									198.13				15.74														
AWR					SYS					118.38				9.40	
Free Space								107.31				8.52	
Enterprise Man Rep	SYSMAN				86.44				6.87							Change Tablespace
Oracle Spatial	MDSYS					53.63				4.26							Change Tablespace
Analytical Workspace Object Table	SYS	37.88				3.01							Change Tablespace
OLAP API History Tables	SYS				37.88				3.01							Change Tablespace
ORDDATA Components	ORDDATA				15.00				1.19							Change Tablespace
Advisor Framework	SYS					13.94				1.11	
Optimizer Statistics History	SYS		13.56				1.08	
LogMiner			SYSTEM				12.25				0.97							Change Tablespace
OLAP Catalog	OLAPSYS					8.81				0.70							Change Tablespace
Other Components	SYS					6.69				0.53	
Oracle Text	CTXSYS						4.50				0.36							Change Tablespace
Unified Job Scheduler	System			4.44				0.35	
Expression Filter System	EXFSYS		3.63				0.29	
Transaction Layer - SCN to TIME mapping	SYS	3.25			0.26	
Workspace Manager	WMSYS				3.06				0.24							Change Tablespace
SQL Management Base Schema	SYS			1.69				0.13	
PL/SQL Identifier Collection	SYS		1.56				0.12	
Enterprise Manager Monitoring User	DBSNMP	1.50			0.12	
Logical Standby		SYSTEM				1.38				0.11							Change Tablespace
Oracle Streams		SYS					1.00				0.08	
ORDSYS Components	ORDSYS				0.44				0.03							Change Tablespace
Automated Maintenance Tasks	SYS			0.31				0.02	




DROP TABLESPACE "TBSPBEN" INCLUDING CONTENTS;
