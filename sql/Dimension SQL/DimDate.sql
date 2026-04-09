create table DimDate(
	DateSK int primary key,
	Date datetime,
	DayOfMonth varchar(2),
	DayName varchar(9),
	DayOfWeek char(1),
	WeekOfYear varchar(2),
	Month varchar(2),
	MonthName varchar(20),
	Quarter char(1),
	Year char(4),
	IsWeekend bit,
	IsHoliday bit
)
DECLARE @StartDate DATE = '2010-01-01'
DECLARE @EndDate DATE = '2050-12-31'
DECLARE @CurrentDate DATE

SET @CurrentDate = @StartDate

WHILE @CurrentDate <= @EndDate
BEGIN

INSERT INTO DimDate
(
	DateSK,
	Date,
	DayOfMonth,
	DayName,
	DayOfWeek,
	WeekOfYear,
	Month,
	MonthName,
	Quarter,
	Year,
	IsWeekend,
	IsHoliday
)
VALUES
(
	CONVERT(int, FORMAT(@CurrentDate,'yyyyMMdd')),
	@CurrentDate,
	DAY(@CurrentDate),
	DATENAME(WEEKDAY,@CurrentDate),
	DATEPART(WEEKDAY,@CurrentDate),
	DATEPART(WEEK,@CurrentDate),
	MONTH(@CurrentDate),
	DATENAME(MONTH,@CurrentDate),
	DATEPART(QUARTER,@CurrentDate),
	YEAR(@CurrentDate),
	CASE 
		WHEN DATEPART(WEEKDAY,@CurrentDate) IN (1,7) THEN 1 
		ELSE 0 
	END,
	0
)

SET @CurrentDate = DATEADD(DAY,1,@CurrentDate)

END