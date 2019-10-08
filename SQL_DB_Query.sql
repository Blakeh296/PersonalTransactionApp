
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
		VALUES ('','','','Withdraw', '9/1/2019',''),('','','','Withdraw', '9/1/2019',''),
		('','','','Withdraw', '9/1/2019',''),('','','','Withdraw', '9/1/2019','')

		/*
		('','','','Withdraw', '9/1/2019',''),
		*/