
/*

SELECT * FROM TransactionHistory TH
inner join TransactionType TT
on TH.TypeName = TT.TypeName
WHERE TT.TypeID = 1


		
		SELECT * FROM TransactionType

		INSERT INTO TransactionType (TypeName) VALUES ('Withdraw')

		delete TransactionHistory
		where TransactionID = '594'

		update TransactionHistory
		set TransactionDate = '7/24/2019'
		where TransactionID  = '579'
		
		SELECT * FROM [TransactionHistory]
		SELECT * FROM [TransactionCategory]
		*/
		
		INSERT INTO TransactionHistory ([Name], CategoryID, Amount, TypeName, TransactionDate, Notes) 
		VALUES ('Wal Mart Assocs Payroll','1','711.27','Withdraw', '10/3/2019',''),('Cristy Dental','1','33','Withdraw', '10/4/2019','Filling'),
		('Usaacatm19 ATM','8','160','Withdraw', '10/4/2019',''),('Usaacatm19 ATM', '5','90','Withdraw', '10/4/2019',''),('Clash Royale','9','1.34','Withdraw', '10/7/2019',''),
		('Xfusion Smoke Shop','6','35.29','Withdraw', '10/8/2019',''),('Amazon','9','21.99','Withdraw', '10/8/2019','Back Roller'),
		('Commerce Bank Payment','1','50','Withdraw', '10/9/2019','')

		/*

		CREATE A WAY TO INSERT MORE THAN 1 RECORD AT A TIME THROUGH THE ASP FORM

		('','','','Withdraw', '10/2/2019',''),
		*/