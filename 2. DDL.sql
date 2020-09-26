CREATE DATABASE bLYtz_Megaplex

USE bLYtz_Megaplex

CREATE TABLE Staffs(
		StaffId CHAR(5) PRIMARY KEY
			CONSTRAINT CheckStaffID 
			CHECK(StaffId LIKE 'SF[0-9][0-9][0-9]'),
		StaffName VARCHAR(31)
			CONSTRAINT CheckStaffName 
			CHECK(LEN(StaffName) BETWEEN 7 AND 30),
		StaffEmail VARCHAR(31),
		StaffGender VARCHAR(10)
			CONSTRAINT CheckStaffGender 
			CHECK(StaffGender LIKE 'Female' OR StaffGender LIKE 'Male'),
		StaffBirthDate DATE,
		StaffPhoneNumber VARCHAR(20),
		StaffAddress VARCHAR(100)
)

CREATE TABLE Movies(
		MovieId CHAR(5) PRIMARY KEY
			CONSTRAINT CheckMovieId 
			CHECK(MovieId LIKE 'MV[0-9][0-9][0-9]'),
		MovieName VARCHAR(150),
		MovieLicense VARCHAR(150),
		MovieDuration INT
			CONSTRAINT CheckMovieDuration 
			CHECK(MovieDuration >= 240)
)

CREATE TABLE Studios(
		StudioId CHAR(5) PRIMARY KEY
			CONSTRAINT CheckStudioId 
			CHECK(StudioId LIKE 'ST[0-9][0-9][0-9]'),
		StudioName VARCHAR(50),
		StudioPrice INT
			CONSTRAINT CheckStudioPrice 
			CHECK(StudioPrice BETWEEN 35000 AND 65000)
)

CREATE TABLE ScheduleTransactions(
		ScheduleTransactionId CHAR(5) PRIMARY KEY
			CONSTRAINT CheckScheduleTransactionId 
			CHECK(ScheduleTransactionId LIKE 'MS[0-9][0-9][0-9]'),
		MovieId CHAR(5)
			REFERENCES Movies(MovieId),
		StudioId CHAR(5)
			REFERENCES Studios(StudioId),
		StaffId CHAR(5)
			REFERENCES Staffs(StaffId),
		ShowtimeDate DATE,
		ShowtimeTime TIME
)

CREATE TABLE MovieTransactions(
		MovieTransactionId  CHAR(6) PRIMARY KEY
			CONSTRAINT CheckMovieTransactionId 
			CHECK(MovieTransactionId LIKE 'MTr[0-9][0-9][0-9]'),
		StaffId CHAR(5)
		REFERENCES Staffs(StaffID),
		TransactionDate DATE,
)

CREATE TABLE MovieTransactionDetails(
		MovieTransactionId  CHAR(6)
			REFERENCES MovieTransactions(MovieTransactionId),
		ScheduleTransactionId CHAR(5)
			REFERENCES ScheduleTransactions(ScheduleTransactionId),
		DesiredMovieSchedule DATE		
			CONSTRAINT CheckDesiredMovieSchedule
			CHECK(DesiredMovieSchedule > GETDATE() + 6),
		Seat INT,
		PRIMARY KEY(MovieTransactionId, ScheduleTransactionId)
)


CREATE TABLE RefreshmentTypes(
		RefreshmentTypeId CHAR(5) PRIMARY KEY
		CONSTRAINT CheckRefreshmentTypeId CHECK(RefreshmentTypeId LIKE 'RT[0-9][0-9][0-9]'),
		RefreshmentTypeName VARCHAR(50)
)

CREATE TABLE Refreshments(
		RefreshmentId CHAR(5) PRIMARY KEY
			CONSTRAINT CheckRefreshmentId 
			CHECK(RefreshmentId LIKE 'RE[0-9][0-9][0-9]'),
		RefreshmentTypeId CHAR(5)
			REFERENCES RefreshmentTypes(RefreshmentTypeId),
		RefreshmentName VARCHAR(50),
		RefreshmentPrice VARCHAR(50),
		RefreshmentStock INT
			CONSTRAINT CheckRefreshmentStock CHECK(RefreshmentStock > 50)
)


CREATE TABLE RefreshmentTransactions(
		RefresmentTransactionId CHAR(6) PRIMARY KEY
			CONSTRAINT CheckRefresmentTransactionId 
			CHECK(RefresmentTransactionId LIKE 'RTr[0-9][0-9][0-9]'),
		StaffId CHAR(5)
			REFERENCES Staffs(StaffID),
		TransactionDate DATE,
)

CREATE TABLE RefreshmentTransactionDetails(
		RefresmentTransactionId CHAR(6)
			REFERENCES RefreshmentTransactions(RefresmentTransactionId),
		RefreshmentId CHAR(5)
			REFERENCES Refreshments(RefreshmentId),
		RefresmentQty INT,
		PRIMARY KEY(RefresmentTransactionId, RefreshmentId)
)