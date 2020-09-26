USE bLYtz_Megaplex

INSERT INTO Staffs 
VALUES 
('SF001', 'Cherries','Cherries168@gmail.com','Female','12-10-1990','0895701758141','Jl. Kyai Tapai No. 34'),
('SF002','Kevindo','Kevindo15@gmail.com','Male','05-15-1997','081247283923','Jl. Peta Selatan No. 6'),
('SF003','Caroline','Caroline80@gmail.com','Female','08-18-1998','08524563948','Jl. Syahdan No. 28'),
('SF004','Wijayandi','Wijayandi18@gmail.com','Male','10-28-1999','081306472514','Jl. Sunset Road No. 10A'),
('SF005','Jessica','Jessicasica@yahoo.com','Female','08-02-2000','081958465241', 'Jl. Utan Jati No. 2K'),
('SF006','Sabiana','Sabinaa@gmail.com','Female','09-29-1999','081208880990','Jl. Palma No. 08'),
('SF007','Reynaldi','Naldireynaldi@gmail.com','Male','12-03-1993','082255123121','Jl. Kembangan Utara No. 76'),
('SF008','Aristanto','Aristanto@rocketmail.com','Male','05-06-1997','089852418364','Jl. Alam sutera No. 22C'),
('SF009','Debrina','Debrinana00@gmail.com','Female','01-01-1999','08912413777','Jl. Taman Palem No. 9'),
('SF010','Enrico cong','Enricooo@gmail.com','Male','11-07-1998','0822551234','Jl. Gajah mada No. 77'),
('SF011','Shellina','Shel.lina1@gmail.com','Female','10-10-2000','08135457890','Jl. Pegadungan No. 4'),
('SF012','Dominic','Domdom@gmail.com','Male','12-12-1992','0852401758145','Jl. Sandang No. 5'),
('SF013','Vanessa','NesaVan12@gmail.com','Female','12-02-2000','081927492045','Jl. Grogol No. 1'),
('SF014','Octavianus','octa.vianus@gmail.com','Male','12-04-1995','0815758292145','Jl. Syahdan No. 22'),
('SF015','Bambank','bambambank@yahoo.co.id','Male','05-01-1990','08113525647','Jl. Teuku  umar No. 9')


INSERT INTO Movies 
VALUES 
('MV001','Good Day','951357741','246'),
('MV002','Anothering With You','741852963','271'),
('MV003','Bau Bawang dot com','987654321','242'),
('MV004','DayGone','789123456','256'),
('MV005','Demi Dia','741978321','247'),
('MV006','45 seconds','654879456','281'),
('MV007','Allcestra','975315649','320'),
('MV008','The Greatest Bunisian','164785132','360'),
('MV009','365 Survive','842675396','365'),
('MV010','Good Day','716852471','245'),
('MV011','Ara Ara Kopi','612495195','264'),
('MV012','VIP 2019','167598741','250'),
('MV013','The Chance','756741548','263'),
('MV014','Paz 2','789548799','261'),
('MV015','Our Little Star','657894123','287')


INSERT INTO Studios 
VALUES 
('ST001','Vulpes Cinema','50000'),
('ST002','Sparkling','45000'),
('ST003','Aqua','60000'),
('ST004','Astro','35000'),
('ST005','Celeste','55000'),
('ST006','Superstar Cinema','65000'),
('ST007','Bliss','40000'),
('ST008','Pulse','50000'),
('ST009','RePlay','60000'),
('ST010','Chillax','35000'),
('ST011','Zarudo','65000'),
('ST012','Tiramisu','35000'),
('ST013','Wibu Cinema','40000'),
('ST014','Nyan Nyan','60000'),
('ST015','AQL','45000')


INSERT INTO ScheduleTransactions 
VALUES 
('MS001','MV009','ST002','SF006','2019-12-16','12:15:00'),
('MS002','MV002','ST001','SF011','2020-01-05','16:30:00'),
('MS003','MV012','ST015','SF002','2019-12-25','18:45:00'),
('MS004','MV006','ST013','SF007','2020-02-17','15:00:00'),
('MS005','MV001','ST009','SF014','2019-01-12','12:15:00'),
('MS006','MV010','ST006','SF006','2020-01-20','17:30:00'),
('MS007','MV007','ST005','SF012','2020-03-24','20:15:00'),
('MS008','MV005','ST014','SF001','2020-04-12','12:30:00'),
('MS009', 'MV001', 'ST005','SF006','2019-12-31','10:45:00'),
('MS010', 'MV004', 'ST001','SF005','2019-12-19','13:15:00'),
('MS011', 'MV011', 'ST011','SF011','2019-12-10','16:15:00'),
('MS012', 'MV003', 'ST009','SF009','2020-01-20','19:30:00'),
('MS013', 'MV015', 'ST015','SF004','2019-12-09','14:15:00'),
('MS014', 'MV013', 'ST010','SF015','2020-03-27','16:45:00'),
('MS015', 'MV007', 'ST008','SF001','2020-02-10','20:00:00')


INSERT INTO MovieTransactions 
VALUES 
('MTr015', 'SF005', '2019-12-17'),
('MTr014', 'SF004', '2019-12-18'),
('MTr013', 'SF003', '2019-12-19'),
('MTr012', 'SF012', '2020-01-05'),
('MTr011', 'SF011', '2019-12-22'),
('MTr010', 'SF005', '2019-12-23'),
('MTr009', 'SF014', '2020-02-01'),
('MTr008', 'SF002', '2019-12-27'),
('MTr007', 'SF015', '2019-12-28'),
('MTr006', 'SF013', '2020-01-01'),
('MTr005', 'SF001', '2020-02-05'),
('MTr004', 'SF002', '2019-01-08'),
('MTr003', 'SF008', '2020-01-25'),
('MTr002', 'SF009', '2019-12-26'),
('MTr001', 'SF010', '2020-02-16')


INSERT INTO MovieTransactionDetails
VALUES  
('MTr003', 'MS003', '2019-12-30',5),
('MTr003', 'MS013', '2020-01-02',4),
('MTr004', 'MS012', '2020-12-31',1),
('MTr004', 'MS013', '2020-01-04',4),
('MTr005', 'MS011', '2020-01-01',9),
('MTr005', 'MS012', '2020-01-06',1),
('MTr006', 'MS005', '2020-01-02',7),
('MTr006', 'MS015', '2020-01-07',9),
('MTr007', 'MS014', '2020-01-03',8),
('MTr007','MS011', '2020-01-08',12),
('MTr008','MS002', '2020-01-04',10),
('MTr008','MS012', '2020-01-09',5),
('MTr009','MS006', '2020-01-05',6),
('MTr009','MS015', '2020-01-10',3),
('MTr010','MS013', '2020-01-06',7),
('MTr010','MS015', '2020-01-11',2),
('MTr011','MS001', '2020-01-07',1),
('MTr011','MS011', '2020-01-12',4),
('MTr012','MS002', '2020-01-08',8),
('MTr012','MS012', '2020-01-13',3),
('MTr013','MS002', '2020-01-08',5),
('MTr013','MS011', '2020-01-14',3),
('MTr014','MS009', '2020-01-11',10),
('MTr014','MS010', '2020-01-15',15),
('MTr015','MS010', '2020-01-12',12),
('MTr015','MS014', '2020-01-12',8)



INSERT INTO RefreshmentTypes 
VALUES 
('RT001','Coffee'),
('RT002','Soda'),
('RT003','Juice'),
('RT004','Tea'),
('RT005','Other Beverages'),
('RT006','Western Food'),
('RT007','Heavy Snacks'),
('RT008','Traditional Food'),
('RT009','Eastern Food'),
('RT010','Light Snacks')

INSERT INTO Refreshments
VALUES 
('RE001','RT001','Cappucino', '10000', 75),
('RE002','RT001','Latte', '15000', 60), 
('RE003','RT001','Americano', '13000', 55),
('RE004','RT002', 'Cola', '20000', 70),
('RE005','RT002', 'Sprite', '25000', 100),
('RE006','RT003','Melon', '10000', 150),
('RE007','RT003','Banana', '150000', 65), 
('RE008','RT003','Mango', '10000', 55),
('RE009','RT004','Earl Grey', '80000', 75),
('RE010','RT005','Hot/Ice Cocoa', '10000', 100),
('RE011','RT006','Burger Deluxe' , '12000', 80),
('RE012','RT007','Sausage', '15000', 110), 
('RE013','RT008','Pecel', '15000', 75),
('RE014','RT009','Fried Rice', '30000', 51),
('RE015','RT010','French Fries', '25000', 85)

INSERT INTO RefreshmentTransactions
VALUES 
('RTr001', 'SF005', '2019-12-16'),
('RTr002', 'SF004', '2019-12-17'),
('RTr003', 'SF003', '2019-12-18'),
('RTr004', 'SF012', '2019-12-20'),
('RTr005', 'SF011', '2019-12-22'),
('RTr006', 'SF005', '2019-12-23'),
('RTr007', 'SF014', '2019-12-26'),
('RTr008', 'SF002', '2019-12-27'),
('RTr009', 'SF015', '2019-12-28'),
('RTr010', 'SF013', '2020-01-01'),
('RTr011', 'SF001', '2020-01-05'),
('RTr012', 'SF002', '2020-01-08'),
('RTr013', 'SF008', '2020-01-09'),
('RTr014', 'SF009', '2020-01-12'),
('RTr015', 'SF010', '2020-01-16')


INSERT INTO RefreshmentTransactionDetails
VALUES 
 
('RTr001' , 'RE001',5),
('RTr001' , 'RE002',4),
('RTr002' , 'RE001',7),
('RTr002' , 'RE003',6),
('RTr002' , 'RE004',6),
('RTr003' , 'RE001',9),
('RTr003' , 'RE003',5),
('RTr003' , 'RE004',8),
('RTr003' , 'RE005',2),
('RTr003' , 'RE006',3),
('RTr004' , 'RE006',5),
('RTr004' , 'RE010',4),
('RTr004' , 'RE012',7),
('RTr005' , 'RE003',6),
('RTr006' , 'RE004',6),
('RTr006' , 'RE001',9),
('RTr007' , 'RE003',5),
('RTr008' , 'RE004',8),
('RTr008' , 'RE005',2),
('RTr009' , 'RE003',3),
('RTr009' , 'RE008',5),
('RTr010' , 'RE010',4),
('RTr010' , 'RE013',7),
('RTr011' , 'RE003',6),
('RTr012' , 'RE007',6),
('RTr013' , 'RE001',9),
('RTr013' , 'RE003',5),
('RTr014' , 'RE004',8),
('RTr015' , 'RE005',2),
('RTr015' , 'RE006',3) 

