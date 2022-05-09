TRUNCATE TABLE dbo.Calendar;
GO

WITH params AS (
	SELECT CAST('1900-01-01' AS date) AS start_date
		,CAST('2050-12-31' AS date) AS end_date )
,digits AS (
	SELECT 0 AS digit
	UNION ALL SELECT 1 AS digit
	UNION ALL SELECT 2 AS digit
	UNION ALL SELECT 3 AS digit
	UNION ALL SELECT 4 AS digit
	UNION ALL SELECT 5 AS digit
	UNION ALL SELECT 6 AS digit
	UNION ALL SELECT 7 AS digit
	UNION ALL SELECT 8 AS digit
	UNION ALL SELECT 9 AS digit )
,nums AS (
	SELECT (d10000.digit * 10000) + (d1000.digit * 1000) + (d100.digit * 100) + (d10.digit * 10) + d1.digit AS num
	FROM digits d1
	INNER JOIN digits d10 ON 1=1
	INNER JOIN digits d100 ON 1=1
	INNER JOIN digits d1000 ON 1=1
	INNER JOIN digits d10000 ON 1=1 )
,dates AS (
	SELECT nums.num AS date_id
		,DATEADD(day,nums.num,params.start_date) AS CalendarDate
	FROM nums
	INNER JOIN params ON 1=1
	WHERE nums.num < DATEDIFF(day,params.start_date,params.end_date)
)
INSERT INTO dbo.Calendar (
	CalendarDate
	,CalendarDateTime
	,CalendarYear
	,CalendarMonth
	,CalendarQuarter
	,CalendarMonthName
	,CalendarWeek
	,CalendarWeekDay
	,CalendarDayOfYear )
SELECT dates.CalendarDate
	,dates.CalendarDate
	,year(dates.CalendarDate) AS CalendarYear
	,month(dates.CalendarDate) AS CalendarMonth
	,datename(quarter,dates.CalendarDate) AS CalendarQuarter
	,datename(month,dates.CalendarDate) AS CalendarMonthName
	,datename(week,dates.CalendarDate) AS CalendarWeek
	,datename(weekday,dates.CalendarDate) AS CalendarWeekDay
	,datename(dayofyear,dates.CalendarDate) AS CalendarDayOfYear
FROM dates
ORDER BY 1
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE [name] = 'IX_Calendar_CalendarDateTime')
CREATE UNIQUE NONCLUSTERED INDEX IX_Calendar_CalendarDateTime ON dbo.Calendar (CalendarDateTime)
GO



