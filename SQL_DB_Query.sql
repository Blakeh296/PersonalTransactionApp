
/*

SELECT * FROM TransactionHistory TH
inner join TransactionType TT
on TH.TypeName = TT.TypeName
WHERE TT.TypeID = 1


		SELECT * FROM [TransactionHistory]
		SELECT * FROM [TransactionCategory]
		SELECT * FROM TransactionType

		INSERT INTO TransactionType (TypeName) VALUES ('Withdraw')

		delete TransactionHistory
		where TransactionID = '594'

		update TransactionHistory
		set TransactionDate = '7/24/2019'
		where TransactionID  = '579'*/
		
		INSERT INTO TransactionHistory ([Name], CategoryID, Amount, TypeName, TransactionDate, Notes) 
		VALUES ('Clash Royale','9','3.01','Withdraw', '8/5/2019',''),('Sams Club','3','3.20','Withdraw', '8/5/2019',''),
		('Bp 8236333Circle K St','6','0.85','Withdraw', '8/5/2019',''),('Sams Club','3','2.13','Withdraw', '8/4/2019','')