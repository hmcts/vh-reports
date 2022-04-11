IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'sp_TruncateStagingTable')
	EXEC('CREATE PROCEDURE stg.sp_TruncateStagingTable AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE stg.sp_TruncateStagingTable @tableName sysname AS
BEGIN
	DECLARE @sql nvarchar(2000) ;
	SET @sql = 'TRUNCATE TABLE stg.' + quotename(@tableName);
	EXEC(@sql);
END;
GO
