USE [AdventureWorks2019];


-- create table if not exist for SQL server
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Anies' and xtype='U')
    CREATE TABLE Anies (
        Name varchar(64) not null
    )
GO



-- LOGON Triggers
/*
A logon trigger, as the name suggests, is a trigger that fires 
in response to a LOGON event in SQL Server. In simple terms, 
a logon trigger fires whenever someone tries to establish a new 
connection to a database server.





DML => Data Manipulation Language

DDL => Data Definition Language



SYNTAX

CREATE TRIGGER trigger_name
BEFORE | AFTER
INSERT | UPDATE | DELETE
ON table_name
FOR EACH ROW
trigger_body


*/

-- example of what we can do with a trigger is add tax fee to an order amount

