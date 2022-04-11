TRUNCATE TABLE dbo.Time
GO

WITH digits AS (
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
	SELECT (d1000.digit * 1000) + (d100.digit * 100) + (d10.digit * 10) + d1.digit AS num
	FROM digits d1
	INNER JOIN digits d10 ON 1=1
	INNER JOIN digits d100 ON 1=1
	INNER JOIN digits d1000 ON 1=1
	WHERE (d1000.digit * 1000) + (d100.digit * 100) + (d10.digit * 10) + d1.digit < 1440 )
,datetimes AS (
	SELECT nums.num
		,DATEADD(minute,nums.num,'2001-01-01') AS TimeOfDay
		,datepart(hour,DATEADD(minute,nums.num,'2001-01-01')) AS Hour24h
	FROM nums )
INSERT INTO dbo.Time (
	TimeOfDay
	,TimeString
	,Hour24h
	,Hour12h
	,AM_PM
	,MinuteOfHour )
SELECT CONVERT(time, datetimes.TimeOfDay) AS TimeOfDay
	,CONVERT(varchar,datetimes.TimeOfDay,108) AS TimeString
	,datetimes.Hour24h
	,CASE WHEN datetimes.Hour24h % 12 = 0 THEN 12 ELSE datetimes.Hour24h % 12 END AS Hour12h
	,CASE WHEN datetimes.Hour24h < 12 THEN 'AM' ELSE 'PM' END AS AM_PM
	,datepart(minute,datetimes.TimeOfDay) As MinuteOfHour
FROM datetimes
ORDER BY datetimes.num

