

SELECT * FROM AdventureWorks2019.Person.Address;

-- select without from 
SELECT LEFT('Anies',3);


-- syntax to select all column
USE AdventureWorks2019;
SELECT * FROM HumanResources.Employee;
GO



-- syntax to select specific column
USE AdventureWorks2019;
SELECT LocationID,CostRate FROM Production.Location;
GO


-- formating coulmn and also renaming column
USE AdventureWorks2019;
SELECT [Name] +':'+ [CountryRegionCode] +'->'+ [Group] AS [Formated Coulmn]  FROM Sales.SalesTerritory;
GO

-- creating computed column
USE AdventureWorks2019;
SELECT [Name] +':'+ [CountryRegionCode] +'->'+ [Group] AS [Formated Coulmn], [SalesYTD] * [SalesLastYear] AS [Computed Column] 
FROM Sales.SalesTerritory;
GO


-- remove duplicate row based on a specific column.
SELECT DISTINCT [Name] FROM AdventureWorks2019.[Sales].[SalesTerritory];

-- limit output to first 10 rows and remove duplicate
SELECT DISTINCT TOP 10 [Name]  FROM AdventureWorks2019.[Sales].[SalesTerritory];


-- limit output to first 10 rows 
SELECT TOP 10 [Name]  FROM AdventureWorks2019.[Sales].[SalesTerritory];


-- limit output to first 50% of the total rows 
-- note the top opperation can be used with all other sql syntax
SELECT TOP 50 PERCENT [Name]  FROM AdventureWorks2019.[Sales].[SalesTerritory];

-- into clause create a new table from the result of the select statement
SELECT TOP 10 * INTO [Person].[NewAddress] FROM [Person].[Address];

-- new table created
SELECT * FROM [Person].[NewAddress];


-- select with LIKE operation
/*
E.g
'Jr_' => start with Jr and any one character
'B%' => start with B and one or more character
'C[AN][DY]' => starts with C and require A OR N in the second position and D or Y in the third position
'A[^R][^S]' => starts with A and does not start with R in the second position also does not starts with S in the thired position.

Note you can combine multiple of this in one WHERE clause.

*/

SELECT * FROM [Person].[Address]
WHERE [City] LIKE 'S[n0]%';


-- the group by syntax
--- Note group by need to be used with aggregate function
-- also if the column contain a null value that the rows with the null value becomes a seperate group.
SELECT [City],COUNT(*) AS [count] FROM [Person].[Address] GROUP BY [City];

-- HAVING syntax 
-- this is mostly used with syntax where the WHERE clause cannot be used.
SELECT [City],COUNT(*) AS [count] FROM [Person].[Address] GROUP BY [City] HAVING  [City] = 'Kingsport';




-- using group by with CUBE
-- the cube group a combination of two column.
SELECT [City],[PostalCode],COUNT(*) AS [count] FROM [Person].[Address] GROUP BY CUBE([City],[PostalCode]);

-- using group by with ROLLUP
SELECT [City],[PostalCode],COUNT(*) AS [count] FROM [Person].[Address] GROUP BY ROLLUP([City],[PostalCode]);



-- working with xml
SELECT TOP (1000) [BusinessEntityID]
      ,[Name]
      ,[SalesPersonID]
      ,[Demographics]
  FROM [AdventureWorks2019].[Sales].[Store];



-- aggregate functions
-- aggregate functions ignores null value except when used with COUNT
-- a list of the functions can be found in session 9 of the slide page 14

SELECT COUNT(*) FROM AdventureWorks2019.Person.Address;
SELECT COUNT_BIG(*) FROM AdventureWorks2019.Person.Address;

SELECT MAX([AddressID]) FROM AdventureWorks2019.Person.Address;

SELECT SUM([AddressID]) FROM AdventureWorks2019.Person.Address;

-- subqueries

-- creating views
CREATE VIEW [StoreFilter] AS
SELECT  [BusinessEntityID]
      ,[Name]
      ,[SalesPersonID]
      ,[Demographics]
  FROM [AdventureWorks2019].[Sales].[Store];


-- query views 
SELECT * FROM [dbo].[StoreFilter];


-- store procedure
CREATE PROCEDURE sp_SelectAllStore
AS
SELECT * FROM [Sales].[Store]
GO;

-- create store procedure with a parameter
CREATE PROCEDURE sp_SelectAllStore2 @Name nvarchar(50)
AS
SELECT * FROM [Sales].[Store] WHERE [Name] = @Name
GO;


-- run store procedure
EXEC sp_SelectAllStore;

-- run store procedure with params 
EXEC sp_SelectAllStore2 @Name = 'Next-Door Bike Store';





-- variables
USE aptech
DECLARE @user_id INT = 8
DECLARE @username VARCHAR(1000)

PRINT @user_id
SELECT @username=username FROM aptech.dbo.user_details WHERE user_id = @user_id;

PRINT @username


-- passing data to a variable using select statement
USE aptech
DECLARE @username VARCHAR(1000)

SELECT @username=username FROM aptech.dbo.user_details;

PRINT @username

-- Nvarchar stores UNICODE data. If you have requirements to store UNICODE or multilingual data, nvarchar is the choice. Varchar stores ASCII data and should be your data type of choice for normal use. Regarding memory usage, nvarchar uses 2 bytes per character, whereas varchar uses 1.
DECLARE @my_name NVARCHAR(100)
SET @my_name = 'anies'
PRINT @my_name




-- error handling
BEGIN TRY  
	SELECT 1/0
END TRY  
BEGIN CATCH  
     PRINT 'error occurred'
END CATCH 


BEGIN TRY  
     SELECT * FROM NonexistentTable; 
END TRY  
BEGIN CATCH  
     PRINT 'error occurred'
END CATCH 



-- if else statment in transact sql
DECLARE @total_count INT;

SELECT @total_count=COUNT(*) FROM aptech.dbo.user_details;

PRINT @total_count
IF @total_count > 200
	PRINT 'Count is greater than 200'
ELSE 
	PRINT 'Count is less than 200'

	
	
-- whill loop
USE AdventureWorks2012;  
GO  
WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300  
BEGIN  
   UPDATE Production.Product  
      SET ListPrice = ListPrice * 2  
   SELECT MAX(ListPrice) FROM Production.Product  
   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500  
      BREAK  
   ELSE  
      CONTINUE  
END  
PRINT 'Too much for the market to bear';



-- BATCH EXECUTION
BEGIN
USE aptech;
SELECT * FROM aptech.dbo.user_details
SELECT * FROM aptech.dbo.Product
END


-- Creating synonyms

CREATE SYNONYM for_test FOR aptech.dbo.user_details


SELECT * FROM for_test


