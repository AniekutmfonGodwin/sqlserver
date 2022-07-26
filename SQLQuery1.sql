
-- insert trigger
CREATE OR ALTER TRIGGER dbo.insert_to_customer2 
ON dbo.Customers  
AFTER INSERT   
AS 
	DECLARE @id BIGINT
	DECLARE @address NVARCHAR(200)
	DECLARE @phone_number NVARCHAR(200)
	DECLARE @email NVARCHAR(200)

	SELECT @id=id,@address=[address],@phone_number=phone_number,@email=email FROM inserted

	PRINT 'Insertion start'

	INSERT INTO [dbo].[Customer2] ([address],phone_number,email) VALUES (@address,@phone_number,@email)

	PRINT 'DONE'
GO






-- update trigger
CREATE OR ALTER TRIGGER dbo.update_to_customer2 
ON dbo.Customers  
AFTER UPDATE   
AS 
	DECLARE @id BIGINT
	DECLARE @address NVARCHAR(200)
	DECLARE @phone_number NVARCHAR(200)
	DECLARE @email NVARCHAR(200)
	SELECT @id=id,@address=address,@phone_number=phone_number,@email=email FROM inserted
	PRINT 'Update start'
	--INSERT INTO [dbo].[Customer2] ([address],phone_number,email) VALUES (@address,@phone_number,@email)
	UPDATE [dbo].[Customer2] SET [address] = @address, phone_number = @phone_number,email=@email WHERE id=@id
	PRINT 'DONE'
GO

-- delete trigger
CREATE OR ALTER TRIGGER dbo.delete_to_customer2 
ON dbo.Customers  
AFTER DELETE   
AS 
	DECLARE @id BIGINT
	DECLARE @address NVARCHAR(200)
	DECLARE @phone_number NVARCHAR(200)
	DECLARE @email NVARCHAR(200)
	SELECT @id=id,@address=address,@phone_number=phone_number,@email=email FROM deleted
	PRINT 'Delete start'
	--INSERT INTO [dbo].[Customer2] ([address],phone_number,email) VALUES (@address,@phone_number,@email)

	-- PRINT 'DONE'
GO


-- alter table
ALTER TABLE [dbo].[Customer2]
ALTER COLUMN phone_number VARCHAR(250);


INSERT INTO [dbo].[Customer2] ([address],phone_number,email) VALUES ('ik road','081233334445','testing@gmail.com')
INSERT INTO [dbo].[Customers] (id,address,phone_number,email) VALUES (4,'ik2 road','0812344334445','esting@gmail.com')


DELETE  FROM [dbo].[Customers] WHERE id = 4;

UPDATE  [dbo].[Customers] SET [address]='my address' WHERE id = 2;



-- user 
-- id int not null, username varchar not null , firstname varchar not null, lastname varchar not null, fullname null, age int



 
-- Create a clustered index called IX_TestTable_TestCol1  
-- on the dbo.TestTable table using the TestCol1 column.  
CREATE CLUSTERED INDEX IX_TestTable_customers  
    ON [dbo].[Customers] (id);   
GO


--- Product
-- id, name, price, date_created, admin

-- non clustered index
CREATE NONCLUSTERED INDEX IX_TestTable_customers_non  
    ON [dbo].[Customers] ([address]);   
GO



DECLARE @my_count INT
SELECT @my_count = COUNT(*) FROM [dbo].[Customers]

IF @my_count > 3
	PRINT 'Cannot insert new data'
ELSE
	PRINT 'new data can be inserted'


PRINT UPPER('SQL Tutorial is FUN!')


BEGIN TRANSACTION;

DELETE FROM HumanResources.JobCandidate  
    WHERE JobCandidateID = 13; 

COMMIT; 


CREATE TABLE ValueTable (id INT);  

BEGIN TRANSACTION;  
       INSERT INTO ValueTable VALUES(3);  
       INSERT INTO ValueTable VALUES(4);  

	   BEGIN TRANSACTION;  
			   INSERT INTO ValueTable VALUES(3);  
			   INSERT INTO ValueTable VALUES(4);  
		COMMIT; 
COMMIT; 


BEGIN TRANSACTION;  
BEGIN TRY  
		INSERT INTO ValueTable VALUES(11);  
		INSERT INTO ValueTable VALUES(12); 
	
	COMMIT
END TRY  
BEGIN CATCH  
		ROLLBACK;
END CATCH
    

	   
	   
 




