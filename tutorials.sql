USE [aptech]
SELECT 1+1 as column1, 10 + 10 as column2;
-- is the same as
SELECT 1+1 column1, 10 + 10 column2;

/*
 * 
 * put a square bracket around column name with space [my column]
 */*/
 
 
 -- display all database for an instance in sql
 SELECT  * FROM sys.databases;
 
SELECT * FROM sys.views;


-- what is a view
-- A view is a virtual table whose contents are defined by a query.






/*
 * 
 * creating database 
 * 
 CREATE TABLE table_name(Name of the table)  
        column1 datatype,   
        column2 datatype,    
        column3 datatype,    
        .............  
		columnN datatype,  
        PRIMARY KEY (Primary key is used for one or morecolumns )
        
       );  
 */

CREATE TABLE EMPLOYEES (   
	ID   INT              NOT NULL,   
	NAME VARCHAR (20)     NOT NULL,   
	AGE INT              NOT NULL,   
	ADDRESS CHAR (30),  
	SALARY   DECIMAL (18, 2),          
	PRIMARY KEY (ID)
); 

CREATE TABLE user_details (
  user_id int NOT NULL IDENTITY PRIMARY KEY,
  username varchar(255) DEFAULT NULL,
  first_name varchar(50) DEFAULT NULL,
  last_name varchar(50) DEFAULT NULL,
  gender varchar(10) DEFAULT NULL,
  password varchar(50) DEFAULT NULL,
  status tinyint DEFAULT NULL,
  PRIMARY KEY (user_id) 
);



/*
 * for deleting table
 * 
	DROP  TABLE table_name;
 * */

DROP TABLE CUSTOMERS; 


-- inset data in to table
/*
INSERT INTO TABLE_NAME [(column1, column2, column3,...column N)]    
VALUES (value1, value2, value3,...valueN); 

or 

INSERT INTO TABLE_NAME VALUES (value1, value2,...valueN);  
*/

INSERT INTO CUSTOMERS VALUES (007, 'Manii', 30, 'Indonesia', 15000.00 ); 

-- select statement 
SELECT * FROM table_name;  


/*
 * update statement
 
 	UPDATE table_name   
	SET column1 = value1, column2 = value2...., columnN = valueN   
	WHERE [condition];
 
 * */

UPDATE EMPLOYEES  
SET ADDRESS = 'Goa', SALARY = 15000.00;  
WHERE ID= 007; 

/*
 
 deleting from a set of row
 
 
 	DELETE FROM table_name  
	WHERE [condition]; 
	
 * */


DELETE FROM EMPLOYEES  
WHERE NAME = RAHUL;


-- alter a table and 

-- ADD Column

ALTER TABLE aptech.dbo.EMPLOYEES
ADD EMAIL varchar(255) NULL DEFAULT '--empty--' ;



-- DROP COLUMN
ALTER TABLE aptech.dbo.EMPLOYEES
DROP COLUMN NAME;


-- ALTER/MODIFY COLUMN

ALTER TABLE aptech.dbo.EMPLOYEES
ALTER COLUMN ADDRESS VARCHAR(100);

SELECT 3+3;



