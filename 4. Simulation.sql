USE bLYtz_Megaplex


--Pada suatu saat ada segrombolan orang Jip Rayhan bersama kawan kawannya datang ke cinema
--memesan tiket cinema dengan transaksi bersamaan tetapi memilih beberapa film
--yang dilayani oleh staff
SELECT * FROM ScheduleTransactions

INSERT INTO MovieTransactions
VALUES
	('MTr016', 'SF002', GETDATE())

INSERT INTO MovieTransactionDetails
VALUES
	('MTr016', 'MS004', '2019-12-28', 4),
	('MTr016', 'MS008', '2019-12-28', 4),
	('MTr016', 'MS015', '2019-12-31', 4)
	
--Lalu kawan kawannya juga memesan beberapa refreshment yang disediakan oleh cinema
SELECT * FROM Refreshments
INSERT INTO RefreshmentTransactions
VALUES
	('RTr016', 'SF011', GETDATE())

INSERT INTO RefreshmentTransactionDetails
VALUES
	('RTr016', 'RE001', 2),
	('RTr016', 'RE005', 2),
	('RTr016', 'RE006', 1),
	('RTr016', 'RE008', 1),
	('RTr016', 'RE007', 2),
	('RTr016', 'RE015', 2)
