SELECT * FROM [TransactionHistory]
SELECT * FROM [TransactionCategory]
SELECT * FROM TransactionType

SELECT * FROM TransactionHistory TH
inner join TransactionType TT
on TH.TypeName = TT.TypeName
WHERE TT.TypeID = 1

/*INSERT INTO TransactionType (TypeName) VALUES ('Withdraw')*/

		/*delete TransactionType
		where TypeID = '2'*/

		/*update TransactionHistory
		set Name = 'Wal Mart Assocs Payroll'
		where Name  = 'DirectDeposit'*/