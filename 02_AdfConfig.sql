
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'AdfConfig')
CREATE TABLE dbo.AdfConfig (
	Id uniqueidentifier NOT NULL,
	MasterPipeline NVARCHAR(100),
	TableName SYSNAME NOT NULL,
	ProcedureName SYSNAME NOT NULL,
	DeltaColumn SYSNAME NULL,
	DeltaValue NVARCHAR(255) NULL,
	RunOrder SMALLINT NOT NULL,
	CONSTRAINT PK_AdfConfig PRIMARY KEY (Id))
GO

DELETE FROM dbo.AdfConfig
WHERE MasterPipeline = 'Master_TraceFile'
Go

WITH cfg AS (
	SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'Conference' AS TableName, 'sp_LoadConference' AS ProcedureName, NULL AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
	UNION ALL SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'Participant' AS TableName, 'sp_LoadParticipant' AS ProcedureName, NULL AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
	UNION ALL SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'ParticipantStatus' AS TableName, 'sp_LoadParticipantStatus' AS ProcedureName, 'Timestamp' AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
	UNION ALL SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'Room' AS TableName, 'sp_LoadRoom' AS ProcedureName, NULL AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
	UNION ALL SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'Endpoint' AS TableName, 'sp_LoadEndpoint' AS ProcedureName, NULL AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
	UNION ALL SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'Event' AS TableName, 'sp_LoadEvent' AS ProcedureName, 'Timestamp' AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
	UNION ALL SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'Heartbeat' AS TableName, 'sp_LoadHeartbeat' AS ProcedureName, 'Timestamp' AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
	UNION ALL SELECT NEWID() AS Id, 'Master_Staging' AS MasterPipeline, 'ConferenceStatus' AS TableName, 'sp_LoadConferenceStatus' AS ProcedureName, 'Timestamp' AS DeltaColumn, NULL AS DeltaValue, 1 AS RunOrder
)
MERGE INTO dbo.AdfConfig t
USING cfg s
	ON (s.MasterPipeline = t.MasterPipeline
		AND s.TableName = t.TableName)
WHEN MATCHED 
	AND (
		s.ProcedureName <> t.ProcedureName
		OR ISNULL(s.DeltaColumn,'') <> ISNULL(t.DeltaColumn,'')
		OR s.RunOrder <> t.RunOrder) 
	THEN UPDATE 
	SET t.ProcedureName = s.ProcedureName
		,t.DeltaColumn = s.DeltaColumn
		,t.RunOrder = s.RunOrder
WHEN NOT MATCHED THEN 
INSERT (
	Id
	,MasterPipeline
	,TableName
	,ProcedureName
	,DeltaColumn
	,RunOrder
)
VALUES (
	s.Id
	,s.MasterPipeline
	,s.TableName
	,s.ProcedureName
	,s.DeltaColumn
	,s.RunOrder
);
		
IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_GetAdfConfig')
	EXEC('CREATE PROCEDURE dbo.sp_GetAdfConfig AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_GetAdfConfig @MasterPipeline nvarchar(100) AS
BEGIN

	SELECT Id
		,TableName
		,ProcedureName
		,'SELECT * FROM dbo.' + TableName + 
			CASE 
				WHEN DeltaColumn IS NOT NULL AND DeltaValue IS NOT NULL THEN
					' WHERE ' + DeltaColumn + ' > ' + DeltaValue 
				ELSE '' END AS ExtractSQL
		,DeltaValue
		,RunOrder
	FROM dbo.AdfConfig
	WHERE MasterPipeline = @MasterPipeline
	ORDER BY RunOrder
		
END
GO