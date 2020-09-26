USE bLYtz_Megaplex 

--1.Display MovieID and Total Revenue
--(started with ‘IDR ’ and added with total sum of studio price multiplied with seats sold)
--for every transaction which has studio price higher than 50000 and
--occurred before the 20th day of the month. 

SELECT 
	m.MovieID,
	[Total Revenue] = 'IDR' + CAST(SUM(s.StudioPrice * Seat ) as varchar)
FROM
	Movies m ,
	ScheduleTransactions sc , 
	Studios s,
	MovieTransactionDetails mtd,
	MovieTransactions mt
WHERE 
	s.StudioID = sc.StudioID and
	sc.MovieID = m.MovieID and
	sc.ScheduleTransactionId = mtd.ScheduleTransactionId and
	mtd.MovieTransactionId = mt.MovieTransactionId and
	s.StudioPrice > 50000 and 
	DATEPART(MONTH,DATEPART(DAY,mt.TransactionDate)) < 20
GROUP BY 
	m.MovieID

--2.Display StaffName and Total Sold Seats
--(obtained from sum of seats) for every transaction which is handled by staff whose gender
--is male and occurred before the 28th before the month. Show the data based on 
--the Total Sold Seats in descending order.

SELECT 
	StaffName, 
	SUM(Seat) AS [Total Sold Seats]
FROM 
	Staffs s, 
	MovieTransactions mt,
	MovieTransactionDetails mtd
WHERE 
	s.StaffId = mt.StaffId AND
	mt.MovieTransactionId = mtd.MovieTransactionId AND
	StaffGender LIKE 'Male' AND
	CAST(LEFT(convert(VARCHAR, TransactionDate,4),2) as INT) <28
Group By 
	StaffName
ORDER BY 
	SUM(Seat) DESC

--3.Display Average Refreshment Revenue per Day 
--(started with ‘IDR ‘ and added with the average of quantity multiplied with refreshment 
--price), Transaction Days (obtained from distinct count of refreshment transaction date 
--and ended with ‘ days’) and Female Staff Count 
--(obtained from distinct count of staff and ended with ‘ people’) for 
--every transaction which is handled by staff whose gender is female and 
--the transaction date is before 10 February 2020.

SELECT 
	'IDR ' + CAST([Average Refreshment Revenue per Day] = AVG((RefreshmentQty * RefreshmentPrice) AS VARCHAR), 
	DISTINCT CAST([Female Staff Count] = COUNT(Staffs)AS VARCHAR)+ ' people' 
FROM 
	Refreshments r, 
	RefreshmentTransaction rt, 
	Staffs s
WHERE 
	r.RefreshmentTypeId = rt.RefreshmentTypeId AND
	s.StaffId = r.StaffId AND
	StaffGender LIKE 'Female' AND
	datediff(day, TransactionDate, '2020-02-10')> 0

--4.Display Staff First Name 
--(started with ‘Mr. ’ added with staff’s first name), 
--Total of Refreshment (obtained  from count of refreshment), 
--Total of Quantity Sold (obtained from sum of quantity) for 
--every transaction handled by male staff. Then combine it with 
--Staff First Name (started with ‘Ms. ’ added with staff’s first name),
--Total of Refreshment (obtained  from count of refreshment),
--Total of Quantity Sold (obtained from sum of quantity) for 
--every transaction handled by female staff.

SELECT 
	'Mr. ' + SUBSTRING(StaffName,1,CHARINDEX(' ',StaffName + ' ')-1) AS [Staff First Name],
	[Total of Refreshment] = COUNT(r.RefreshmentId),
	[Total of Quantity Sold] = SUM(RefresmentQty)
FROM 
	Staffs, 
	Refreshments r, 
	RefreshmentTransactions rt,
	RefreshmentTransactionDetails rtd
WHERE 
	Staffs.StaffId = rt.StaffId AND
	r.RefreshmentId = rtd.RefreshmentId AND
	rtd.RefresmentTransactionId = rt.RefresmentTransactionId AND
	StaffGender LIKE 'Male'
GROUP BY StaffName
UNION 
	SELECT 
		'Ms. ' + SUBSTRING(StaffName,1,CHARINDEX(' ',StaffName + ' ')-1) AS [Staff First Name],
		[Total of Refreshment] = COUNT(r.RefreshmentId),
		[Total of Quantity Sold] = SUM(RefresmentQty)
	FROM 
		Staffs, 
		Refreshments r,
		RefreshmentTransactions rt,
		RefreshmentTransactionDetails rtd
	WHERE 
		Staffs.StaffId = rt.StaffId AND
		r.RefreshmentId = rtd.RefreshmentId AND
		rtd.RefresmentTransactionId = rt.RefresmentTransactionId AND
		StaffGender like 'female'
	GROUP BY StaffName

--5.Display Refreshment Transaction ID 
--(obtained from last three number of Transaction ID), 
--Refreshment Transaction Date (obtained from transaction date in ‘mon dd, yyyy’ format) 
--for every refreshment transaction which quantity multiplied by refreshment price 
--is more than average quantity multiplied by refreshment price and refreshment type ID is either ‘RT006’, ‘RT007’, ‘RT008’, ‘RT009’, or ‘RT010’.
--(alias subquery)

SELECT 
	[Refreshment Transaction ID]= RIGHT(RefreshmentTransactions.RefresmentTransactionId,3),
	[Refreshment Transaction Date] = CONVERT(VARCHAR,TransactionDate,107)
FROM 
	RefreshmentTransactions, 
	Refreshments, 
	RefreshmentTypes,
	RefreshmentTransactionDetails,
	(SELECT 
		AVG(RefresmentQty)*RefreshmentPrice AS avgprice
	FROM 
		RefreshmentTransactionDetails rtd, Refreshments r
	WHERE 
		rtd.RefreshmentId = r.RefreshmentId) as A
WHERE 
	RefresmentQty * RefreshmentPrice > A.avgprice AND
	RefreshmentTypes.RefreshmentTypeId IN('RT006', 'RT007','RT009','RT010')

--6.Transaction Date 
--(added with the weekday name of transaction date, added with ‘,
--‘ and the transaction date itself in ‘dd mon yyyy’ format) and 
--Total Movie Revenue (started with ‘IDR ‘ and combined with total seats
--multiplied with studio price) for every transaction which 
--less than 30 days before 28 February 2020 and Total Movie Revenue exceeds average seats 
--multiplied by studio price.
--(alias subquery)

SELECT 
	TransactionDate = DATENAME(WEEKDAY, TransactionDate) + ',' + CONVERT(VARCHAR, TransactionDate,107),
	[Total Movie Revenue] = 'IDR ' + CAST((SUM(Seat)*StudioPrice) AS VARCHAR)
From 
	MovieTransactions MT,
	MovieTransactionDetails MTD,
	ScheduleTransactions ST,
	Studios S
WHERE
	MT.MovieTransactionId = MTD.MovieTransactionId AND
	MTD.ScheduleTransactionId = ST.ScheduleTransactionId AND
	ST.StudioId = S.StudioID AND
	MT.TransactionDate IN (
		SELECT 
			MTD.DesiredMovieSchedule
		From 
			MovieTransactions MT,
			MovieTransactionDetails MTD,
			ScheduleTransactions ST,
			Studios S
		Where 
			MT.MovieTransactionId = MTD.MovieTransactionId AND
			MTD.ScheduleTransactionId = ST.ScheduleTransactionId AND
			ST.StudioID = S.StudioID AND 
			DATEDIFF (DAY,'2020-2-28',TransactionDate) < 31
	)
GROUP BY 
	TransactionDate,
	StudioPrice

--7.Display Staff Last Name(obtained from staff’s last name), 
--RefreshmentTransactionId, RefreshmentName and Price 
--(obtained by adding ‘IDR ‘ in front of the refreshment price) 
--for every transaction which price is more than minimum price of 
--refreshments available for sold and is less than maximum price of 
--refreshments available for sold.
--(alias subquery)

SELECT 
	[Staff Last Name] = RIGHT(S.StaffName,
	CHARINDEX(' ',S.StaffName)),
	R.RefreshmentID,
	RefreshmentTypeID,
	[Price] = 'IDR ' + CAST(RefreshmentPrice AS VARCHAR)
FROM
	Staffs S,
	RefreshmentTransactions RT,
	RefreshmentTransactionDetails RTD,
	Refreshments R
WHERE
	S.StaffID = RT.StaffID AND
	RT.RefresmentTransactionId = RTD.RefresmentTransactionId AND
	RTD.RefreshmentID = R.RefreshmentID AND EXISTS(
		SELECT *
		FROM 
			Refreshments
		GROUP BY 
			RefreshmentPrice
		HAVING
			RefreshmentPrice  < MAX(RefreshmentPrice) AND
			RefreshmentPrice > MIN(RefreshmentPrice)
)

--8.Display Movie Transaction ID 
--(obtained by removing ‘M’ from movie transaction ID and adding ‘ ‘ before last three numbers
--of the ID), StudioName and Studio Price from (obtained by adding ‘IDR ‘ 
--in front of the studio price) for every transaction which seats bought is between 
--average seats bought and maximum seats bought, and studio price between average 
--studio price and maximum studio price.
--(alias subquery)

SELECT 
	[Movie TransactionID] = RIGHT(MovieTransactionId,5) + ' ' + RIGHT(MovieTransactionId,3),
	StudioName,
	[Studio Price] = 'IDR ' + CAST(StudioPrice AS VARCHAR)
FROM 
	Studios S, 
	ScheduleTransactions ST,
	MovieTransactionDetails MTD
WHERE 
	S.StudioID = ST.StudioID AND 
	ST.ScheduleTransactionId = MTD.ScheduleTransactionId AND EXISTS(
		SELECT *
		FROM 
			ScheduleTransactions ST,
			Studios S,
			MovieTransactionDetails MTD,
			MovieTransactions MT
		WHERE
			S.StudioId = ST.StudioID AND
			ST.ScheduleTransactionId = MTD.ScheduleTransactionId AND 
			MTD.MovieTransactionId = MT.MovieTransactionId
		GROUP BY 
			StudioPrice,Seat
		HAVING 
			Seat BETWEEN AVG(Seat) AND MAX(Seat) AND StudioPrice BETWEEN AVG(StudioPrice) and MAX(StudioPrice)
	
	)

--9.Create a view named ‘Movie Schedule Viewer’ to display Studio ID 
--(obtained by replacing ‘ST’ in Studio ID replaced  with ‘Studio ‘), 
--StudioName, Total Play Schedule (obtained from total count of movie schedules), and 
--Movie Duration Total (obtained from total sum of movie duration) for 
--Studios which name started with ‘Satin’ and movie duration is longer than 120  minutes.

CREATE VIEW MovieScheduleViewer AS
	SELECT
		REPLACE(ScheduleTransactions.StudioId,'ST','Studio ') AS StudioID,
		StudioName,
		COUNT(ScheduleTransactionId) AS TotalPlaySchedule,
		SUM(MovieDuration) AS MovieDurationTotal
	FROM
		Studios, Movies, ScheduleTransactions
	WHERE
		StudioName LIKE 'Satin%' AND
		MovieDuration > 120
	GROUP BY
		ScheduleTransactions.StudioId, Studios.StudioName

--10.Create a view named ‘Refreshment Transaction Summary Viewer’ to display 
--Transaction Count (obtained from total count of refreshment transactions and
--combined with ‘ transactions’), 
--Quantity Sold (obtained from total sum of quantity and ended with ‘ products’) 
--for transactions which happened on ‘Saturday’ or ‘Sunday’ and quantity is more than 5.

CREATE VIEW RefreshmentTransactionSummaryViewer
AS
	SELECT
		CAST(COUNT(RefreshmentTransactions.RefresmentTransactionId) AS VARCHAR) + ' transactions' AS TransactionCount,
		CAST(SUM(RefresmentQty) AS VARCHAR) + ' products' AS QuantitySold
	FROM
		RefreshmentTransactions, RefreshmentTransactionDetails
	WHERE
		RefresmentQty > 5 AND
		DATEPART(WEEKDAY, TransactionDate) = 1 AND
		DATEPART(WEEKDAY, TransactionDate) = 7



