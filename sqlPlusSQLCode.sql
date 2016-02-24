--Ben Otte 
--Homework 7 - CIT472
--Due Dec 2, 2014

--Section 1--
--(1)

CREATE TABLE "SYS"."CUSTOMERS" ( "CUSTOMER_NUMBER" NUMBER(4), "CUSTOMER_NAME" VARCHAR2(20), PRIMARY KEY ("CUSTOMER_NUMBER") VALIDATE ) TABLESPACE "SYSTEM" PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE ( INITIAL 64K FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) LOGGING NOCOMPRESS
--Invoices Show DDL Results
CREATE TABLE "SYS"."INVOICES" ( "INVOICE_NUMBER" NUMBER(4), "CUSTOMER_NUMBER" NUMBER(4), "INVOICE_DATE" DATE NOT NULL , "AMOUNT" NUMBER, PRIMARY KEY ("INVOICE_NUMBER") VALIDATE , FOREIGN KEY ("CUSTOMER_NUMBER") REFERENCES "SYS"."CUSTOMERS" ("CUSTOMER_NUMBER") VALIDATE , CHECK ("AMOUNT" >= 0) VALIDATE ) TABLESPACE "SYSTEM" PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE ( INITIAL 64K FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) LOGGING NOCOMPRESS


spool /home/oracle/Desktop/spooloutput/spooloutput.txt

--Demonstrate the effectiveness of constraints by creating statements that violates each constraint. Create 10.
1. Insert into invoices values(123456, 12, sysdate, 15);
2. Insert into invoices values(14, 123456, sysdate, 15);
3. Insert into invoices values (12, 99, NULL, 15);
4. Insert into invoices values(12, 99, sysdate, -2);
5. Insert into customers values (15, 'John'); --should throw an error where the key is already taken

6. Update Customers SET Customer_number = 20 Where Customer_name='Mary';
7. Update Invoices SET Invoice_date=NULL Where Invoice_date=sysdate;
8. Update Invoices set Invoice_number = 12345 WHERE Invoices.Amount=100;
9. Update Invoices set Customer_number=12345 Where Invoices.Amount = 100;
10. Update Invoices set Amount = -5 where Invoices.amount = 340;

--(2)
--Execute these statements in SQLPLUS and include spool files and the comments returned from 
--violating the constraints
1.  ORA-01438: value larger than specified precision allowed for this column
2. ORA-01438: value larger than specified precision allowed for this column
3. ORA-01400: cannot insert NULL into ("SYS"."INVOICES"."INVOICE_DATE")
4. ORA-02290: check constraint (SYS.SYS_C0034125) violated.
5. ORA-00001: unique constraint (SYS.SYS_C0034121) violated

6. 0 rows updated.
7. 0 rows updated.
8. 0 rows updated.
9. 0 rows updated.
10. 0 rows updated.


--Section 2--

--(3)
Create index index_i on customers(customer_name); 
Create bitmap index e_ndex_i on Invoices(invoice_date);

--(4)
INDEX_NAME                     COLUMN_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      INDEX_TYPE                  UNIQUENESS
------------------------------ ----------------------
SYS_C0034121                   CUSTOMER_NUMBER                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  NORMAL                      UNIQUE     
INDEX_I                        CUSTOMER_NAME                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    NORMAL                      NONUNIQUE  
SYS_C0034122                   INVOICE_NUMBER                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   NORMAL                      UNIQUE     
E_NDEX_I                       INVOICE_DATE 