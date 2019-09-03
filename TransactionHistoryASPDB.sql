/*
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
*/
/*
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
*/
/*
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
						********** WARNING, DO NOT RUN ENTIRE SCRIPT AT RISK OF LOSING DATA *************
*/

USE [master]
GO
		PRINT ''
		PRINT 'Database'
		PRINT ''

IF EXISTS (SELECT * FROM Sys.databases WHERE Name = 'TransactionHistoryASPNET') DROP DATABASE TransactionHistoryASPNET

	PRINT 'TransactionHistoryASPNET DROPPED'

CREATE DATABASE TransactionHistoryASPNET
GO

	PRINT 'TransactionHistoryASPNET CREATED'
	PRINT ''
	PRINT 'Tables'
	PRINT ''

USE TransactionHistoryASPNET
GO

CREATE TABLE TransactionCategory (
									CategoryID int Identity NOT NULL,
									CatName VARCHAR(MAX) NOT NULL,
									PRIMARY KEY (CategoryID)
								 )

 PRINT '1 TransactonCategory'

 CREATE INDEX idx_TransactionCatagoryID ON TransactionCategory (CategoryID)



CREATE TABLE TransactionType (
								TypeID int Identity NOT NULL,
								TypeName VARCHAR(50) NOT NULL,
								PRIMARY KEY (TypeName)			 )

	PRINT '2 TransactionType'


CREATE TABLE TransactionHistory (
				TransactionID INT IDENTITY NOT NULL,
				Name VARCHAR(200) NOT NULL,
				CategoryID INT NOT NULL,
				Amount MONEY NOT NULL,
				TypeName VARCHAR(50) NOT NULL,
				TransactionDate DATETIME NOT NULL,
				Notes VARCHAR(MAX) NULL,
				PRIMARY KEY (TransactionID) )

				PRINT '3 Transaction History'
				PRINT ''
				PRINT 'Inserts'

CREATE TABLE [Login] (UserID int identity , UserName VARCHAR(100), Password VARCHAR(100), PRIMARY KEY (UserID))

				PRINT '4 Login'

ALTER TABLE TransactionHistory ADD CONSTRAINT FK_TransactionCategory FOREIGN KEY (CategoryID)
REFERENCES TransactionCategory (CategoryID)

ALTER TABLE TransactionHistory ADD CONSTRAINT FK_TransactionTypeName FOREIGN KEY (TypeName)
REFERENCES TransactionType (TypeName)

	 -- CAN BE TAKEN TO THE BOTTOM
INSERT INTO TransactionCategory (CatName) VALUES ('Bill'), ('Income'), ('Food'), ('Gas'), ('MaryJ'), ('Tobacco'), ('Credit'), ('FamilyPerpetuity'), ('Misc')
INSERT INTO TransactionType (TypeName) VALUES ('Deposit'), ('Widthdraw')
INSERT INTO [Login] (UserName, [Password]) VALUES ('Blakeh296', 'A0E7C854A2EB64A613768396DF72B515')
GO

	CREATE PROC InsTransHistory (@Name VARCHAR(200), @CategoryID INT, @Amount MONEY, @TypeName VARCHAR(50), @TransactionDate DATETIME, @Notes VARCHAR(MAX))
	AS
		BEGIN
			INSERT INTO TransactionHistory
			VALUES (@Name, @CategoryID, @Amount, @TypeName, @TransactionDate, @Notes)
			RETURN
		END
		GO

	CREATE PROC AdminLogin
	AS
		BEGIN
			SELECT * From [Login]
		END
		GO

	CREATE PROC ViewTransactionCategories
	AS
		BEGIN
				SELECT * FROM TransactionCategory
		END
	GO

	--SELECT * FROM TransactionHistory
	--SELECT HashBytes('MD5', 'Shadow7076')

	/*update TransactionHistory
		set TransactionDate = '09-30-2018'
		where TransactionID = '113'*/