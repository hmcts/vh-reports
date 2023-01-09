IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadConference')
	EXEC('CREATE PROCEDURE dbo.sp_LoadConference AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_LoadConference AS
BEGIN
	MERGE INTO dbo.Conference AS t
	USING stg.Conference AS s
		ON (s.ID = t.ID)
	WHEN MATCHED THEN UPDATE
		SET t.HearingRefId			  = s.HearingRefId			 
			,t.CaseType				  = s.CaseType				 
			,t.ScheduledDateTime	  = s.ScheduledDateTime	 
			,t.CaseNumber			  = s.CaseNumber			 
			,t.CaseName				  = s.CaseName				 
			,t.ScheduledDuration	  = s.ScheduledDuration	 
			,t.AdminUri				  = s.AdminUri				 
			,t.JudgeUri				  = s.JudgeUri				 
			,t.ParticipantUri		  = s.ParticipantUri		 
			,t.PexipNode			  = s.PexipNode			 
			,t.State				  = s.State				 
			,t.ClosedDateTime		  = s.ClosedDateTime		 
			,t.HearingVenueName		  = s.HearingVenueName		 
			,t.AudioRecordingRequired = s.AudioRecordingRequired
			,t.IngestUrl			  = s.IngestUrl			 
			,t.ActualStartTime		  = s.ActualStartTime		 
			,t.TelephoneConferenceId  = s.TelephoneConferenceId 
			,t.CreatedDateTime		  = s.CreatedDateTime	
			,t.UpdatedAt			  = s.UpdatedAt	 
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,HearingRefId
		,CaseType
		,ScheduledDateTime
		,CaseNumber
		,CaseName
		,ScheduledDuration
		,AdminUri
		,JudgeUri
		,ParticipantUri
		,PexipNode
		,State
		,ClosedDateTime
		,HearingVenueName
		,AudioRecordingRequired
		,IngestUrl
		,ActualStartTime
		,TelephoneConferenceId
		,CreatedDateTime
		,UpdatedAt )
	VALUES (
		s.Id
		,s.HearingRefId
		,s.CaseType
		,s.ScheduledDateTime
		,s.CaseNumber
		,s.CaseName
		,s.ScheduledDuration
		,s.AdminUri
		,s.JudgeUri
		,s.ParticipantUri
		,s.PexipNode
		,s.State
		,s.ClosedDateTime
		,s.HearingVenueName
		,s.AudioRecordingRequired
		,s.IngestUrl
		,s.ActualStartTime
		,s.TelephoneConferenceId
		,s.CreatedDateTime
		,s.UpdatedAt
	);

END
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadParticipant')
	EXEC('CREATE PROCEDURE dbo.sp_LoadParticipant AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_LoadParticipant AS
BEGIN
	MERGE INTO dbo.Participant AS t
	USING stg.Participant AS s
		ON (s.ID = t.ID)
	WHEN MATCHED AND t.Name != 'Purged' THEN UPDATE
		SET t.ParticipantRefId = s.ParticipantRefId 	
			,t.Name = s.Name 	
			,t.DisplayName = s.DisplayName 	
			,t.Username = s.Username 	
			,t.UserRole = s.UserRole 	
			,t.CaseTypeGroup = s.CaseTypeGroup			
			,t.ConferenceId = s.ConferenceId 	
			,t.Representee = s.Representee 	
			,t.TestCallResultId = s.TestCallResultId 	
			,t.CurrentRoom = s.CurrentRoom 	
			,t.State = s.State					
			,t.FirstName = s.FirstName				
			,t.LastName = s.LastName 	
			,t.ContactEmail = s.ContactEmail 	
			,t.ContactTelephone = s.ContactTelephone 	
			,t.HearingRole = s.HearingRole 	
			,t.CurrentConsultationRoomId = s.CurrentConsultationRoomId
			,t.Discriminator = s.Discriminator	
			,t.CreatedAt = s.CreatedAt
			,t.UpdatedAt = s.UpdatedAt
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,ParticipantRefId
		,Name
		,DisplayName
		,Username
		,UserRole
		,CaseTypeGroup
		,ConferenceId
		,Representee
		,TestCallResultId
		,CurrentRoom
		,State
		,FirstName
		,LastName
		,ContactEmail
		,ContactTelephone
		,HearingRole
		,CurrentConsultationRoomId
		,Discriminator
		,CreatedAt
		,UpdatedAt )
	VALUES (
		s.Id
		,s.ParticipantRefId
		,s.Name
		,s.DisplayName
		,s.Username
		,s.UserRole
		,s.CaseTypeGroup
		,s.ConferenceId
		,s.Representee
		,s.TestCallResultId
		,s.CurrentRoom
		,s.State
		,s.FirstName
		,s.LastName
		,s.ContactEmail
		,s.ContactTelephone
		,s.HearingRole
		,s.CurrentConsultationRoomId
		,s.Discriminator
		,s.CreatedAt
		,s.UpdatedAt
	);
END
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadParticipantStatus')
	EXEC('CREATE PROCEDURE dbo.sp_LoadParticipantStatus AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_LoadParticipantStatus AS
BEGIN
	MERGE INTO dbo.ParticipantStatus AS t
	USING stg.ParticipantStatus AS s
		ON (s.ID = t.ID)
	WHEN MATCHED THEN UPDATE
		SET t.ParticipantState = s.ParticipantState 	
			,t.TimeStamp = s.TimeStamp 	
			,t.ParticipantId = s.ParticipantId 		
			 
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,ParticipantState
		,TimeStamp
		,ParticipantId )
	VALUES (
		s.Id
		,s.ParticipantState
		,s.TimeStamp
		,s.ParticipantId
	);

	WITH delta AS (
		SELECT 'ParticipantStatus' AS TableName, '''' + FORMAT(MAX(Timestamp),'yyyy-MM-dd HH:mm:ss.fff') + '''' AS DeltaValue FROM dbo.ParticipantStatus
	)
	UPDATE a 
	SET DeltaValue = delta.DeltaValue 
	FROM dbo.AdfConfig a 
	INNER JOIN delta 
	ON delta.TableName = a.TableName

END
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadRoom')
	EXEC('CREATE PROCEDURE dbo.sp_LoadRoom AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_LoadRoom AS
BEGIN
	MERGE INTO dbo.Room AS t
	USING stg.Room AS s
		ON (s.ID = t.ID)
	WHEN MATCHED THEN UPDATE
		SET t.ConferenceId = s.ConferenceId 
			,t.Label = s.Label 
			,t.Type = s.Type 
			,t.Status = s.Status 
			,t.Locked = s.Locked 
			,t.IngestUrl = s.IngestUrl 
			,t.ParticipantUri = s.ParticipantUri
			,t.PexipNode = s.PexipNode 
			,t.Discriminator = s.Discriminator 	
			,t.CreatedAt = s.CreatedAt
			,t.UpdatedAt = s.UpdatedAt
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,ConferenceId
		,Label
		,Type
		,Status
		,Locked
		,IngestUrl
		,ParticipantUri
		,PexipNode
		,Discriminator
		,CreatedAt
		,UpdatedAt )
	VALUES (
		s.Id
		,s.ConferenceId
		,s.Label
		,s.Type
		,s.Status
		,s.Locked
		,s.IngestUrl
		,s.ParticipantUri
		,s.PexipNode
		,s.Discriminator
		,s.CreatedAt
		,s.UpdatedAt
	);
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadEndpoint')
	EXEC('CREATE PROCEDURE dbo.sp_LoadEndpoint AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_LoadEndpoint AS
BEGIN
	MERGE INTO dbo.Endpoint AS t
	USING stg.Endpoint AS s
		ON (s.ID = t.ID)
	WHEN MATCHED AND t.DefenceAdvocate != 'Purged' THEN UPDATE
		SET t.DisplayName = s.DisplayName 
			,t.SipAddress = s.SipAddress 
			,t.Pin = s.Pin 
			,t.State = s.State 
			,t.ConferenceId = s.ConferenceId 
			,t.DefenceAdvocate = s.DefenceAdvocate 
			,t.CurrentRoom = s.CurrentRoom 
			,t.CurrentConsultationRoomId = s.CurrentConsultationRoomId	
			,t.CreatedAt = s.CreatedAt
			,t.UpdatedAt = s.UpdatedAt
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,DisplayName
		,SipAddress
		,Pin
		,State
		,ConferenceId
		,DefenceAdvocate
		,CurrentRoom
		,CurrentConsultationRoomId
		,CreatedAt
		,UpdatedAt )
	VALUES (
		s.Id
		,s.DisplayName
		,s.SipAddress
		,s.Pin
		,s.State
		,s.ConferenceId
		,s.DefenceAdvocate
		,s.CurrentRoom
		,s.CurrentConsultationRoomId
		,s.CreatedAt
		,s.UpdatedAt
	);
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadEvent')
	EXEC('CREATE PROCEDURE dbo.sp_LoadEvent AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_LoadEvent AS
BEGIN
	MERGE INTO dbo.Event AS t
	USING stg.Event AS s
		ON (s.ID = t.ID)
	WHEN MATCHED AND t.Phone != 'Purged' THEN UPDATE
		SET t.ConferenceId = s.ConferenceId 
			,t.ExternalEventId = s.ExternalEventId 
			,t.EventType = s.EventType 
			,t.ExternalTimestamp = s.ExternalTimestamp 
			,t.ParticipantId = s.ParticipantId 
			,t.TransferredFrom = s.TransferredFrom 
			,t.TransferredTo = s.TransferredTo 
			,t.Reason = s.Reason 
			,t.Timestamp = s.Timestamp 
			,t.EndpointFlag = s.EndpointFlag 
			,t.Phone = s.Phone 
			,t.TransferredFromRoomLabel = s.TransferredFromRoomLabel
			,t.TransferredToRoomLabel = s.TransferredToRoomLabel 
			,t.ParticipantRoomId = s.ParticipantRoomId 
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,ConferenceId
		,ExternalEventId
		,EventType
		,ExternalTimestamp
		,ParticipantId
		,TransferredFrom
		,TransferredTo
		,Reason
		,Timestamp
		,EndpointFlag
		,Phone
		,TransferredFromRoomLabel
		,TransferredToRoomLabel
		,ParticipantRoomId )
	VALUES (
		s.Id
		,s.ConferenceId
		,s.ExternalEventId
		,s.EventType
		,s.ExternalTimestamp
		,s.ParticipantId
		,s.TransferredFrom
		,s.TransferredTo
		,s.Reason
		,s.Timestamp
		,s.EndpointFlag
		,s.Phone
		,s.TransferredFromRoomLabel
		,s.TransferredToRoomLabel
		,s.ParticipantRoomId
	);

	WITH delta AS (
		SELECT 'Event' AS TableName, '''' + FORMAT(MAX(Timestamp),'yyyy-MM-dd HH:mm:ss.fff') + '''' AS DeltaValue FROM dbo.Event
	)
	UPDATE a 
	SET DeltaValue = delta.DeltaValue 
	FROM dbo.AdfConfig a 
	INNER JOIN delta 
	ON delta.TableName = a.TableName
END
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadHeartbeat')
	EXEC('CREATE PROCEDURE dbo.sp_LoadHeartbeat AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE [dbo].[sp_LoadHeartbeat] AS
BEGIN
	MERGE INTO dbo.Heartbeat AS t
	USING stg.Heartbeat AS s
		ON (s.ID = t.ID)
	WHEN MATCHED THEN UPDATE
		SET t.ConferenceId = s.ConferenceId 
			,t.ParticipantId = s.ParticipantId 
			,t.OutgoingAudioPercentageLost = s.OutgoingAudioPercentageLost 
			,t.OutgoingAudioPercentageLostRecent = s.OutgoingAudioPercentageLostRecent
			,t.IncomingAudioPercentageLost = s.IncomingAudioPercentageLost 
			,t.IncomingAudioPercentageLostRecent = s.IncomingAudioPercentageLostRecent
			,t.OutgoingVideoPercentageLost = s.OutgoingVideoPercentageLost 
			,t.OutgoingVideoPercentageLostRecent = s.OutgoingVideoPercentageLostRecent
			,t.IncomingVideoPercentageLost = s.IncomingVideoPercentageLost 
			,t.IncomingVideoPercentageLostRecent = s.IncomingVideoPercentageLostRecent
			,t.TimeStamp = s.TimeStamp 
			,t.BrowserName = s.BrowserName 
			,t.BrowserVersion = s.BrowserVersion 
			,t.OperatingSystem = s.OperatingSystem 
			,t.OperatingSystemVersion = s.OperatingSystemVersion 
			,t.OutgoingAudioPacketSent = s.OutgoingAudioPacketSent		
			,t.OutgoingAudioPacketsLost = s.OutgoingAudioPacketsLost		
			,t.OutgoingVideoPacketSent = s.OutgoingVideoPacketSent		
			,t.OutgoingVideoPacketsLost = s.OutgoingVideoPacketsLost		
			,t.IncomingAudioPacketReceived = s.IncomingAudioPacketReceived	
			,t.IncomingAudioPacketsLost = s.IncomingAudioPacketsLost		
			,t.IncomingVideoPacketReceived = s.IncomingVideoPacketReceived	
			,t.IncomingVideoPacketsLost = s.IncomingVideoPacketsLost		
			,t.OutgoingVideoFramerate = s.OutgoingVideoFramerate		
			,t.OutgoingVideoBitrate = s.OutgoingVideoBitrate			
			,t.OutgoingVideoCodec = s.OutgoingVideoCodec			
			,t.OutgoingVideoResolution = s.OutgoingVideoResolution		
			,t.OutgoingAudioBitrate = s.OutgoingAudioBitrate			
			,t.OutgoingAudioCodec = s.OutgoingAudioCodec			
			,t.IncomingAudioBitrate = s.IncomingAudioBitrate			
			,t.IncomingAudioCodec = s.IncomingAudioCodec			
			,t.IncomingVideoBitrate = s.IncomingVideoBitrate			
			,t.IncomingVideoCodec = s.IncomingVideoCodec			
			,t.IncomingVideoResolution = s.IncomingVideoResolution
			,t.Device = s.Device
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,ConferenceId
		,ParticipantId
		,OutgoingAudioPercentageLost
		,OutgoingAudioPercentageLostRecent
		,IncomingAudioPercentageLost
		,IncomingAudioPercentageLostRecent
		,OutgoingVideoPercentageLost
		,OutgoingVideoPercentageLostRecent
		,IncomingVideoPercentageLost
		,IncomingVideoPercentageLostRecent
		,TimeStamp
		,BrowserName
		,BrowserVersion
		,OperatingSystem
		,OperatingSystemVersion 
		,OutgoingAudioPacketSent
		,OutgoingAudioPacketsLost
		,OutgoingVideoPacketSent
		,OutgoingVideoPacketsLost
		,IncomingAudioPacketReceived
		,IncomingAudioPacketsLost
		,IncomingVideoPacketReceived
		,IncomingVideoPacketsLost
		,OutgoingVideoFramerate
		,OutgoingVideoBitrate
		,OutgoingVideoCodec
		,OutgoingVideoResolution
		,OutgoingAudioBitrate
		,OutgoingAudioCodec
		,IncomingAudioBitrate
		,IncomingAudioCodec
		,IncomingVideoBitrate
		,IncomingVideoCodec
		,IncomingVideoResolution
		,Device)
	VALUES (
		s.Id
		,s.ConferenceId
		,s.ParticipantId
		,s.OutgoingAudioPercentageLost
		,s.OutgoingAudioPercentageLostRecent
		,s.IncomingAudioPercentageLost
		,s.IncomingAudioPercentageLostRecent
		,s.OutgoingVideoPercentageLost
		,s.OutgoingVideoPercentageLostRecent
		,s.IncomingVideoPercentageLost
		,s.IncomingVideoPercentageLostRecent
		,s.TimeStamp
		,s.BrowserName
		,s.BrowserVersion
		,s.OperatingSystem
		,s.OperatingSystemVersion
		,s.OutgoingAudioPacketSent
		,s.OutgoingAudioPacketsLost
		,s.OutgoingVideoPacketSent
		,s.OutgoingVideoPacketsLost
		,s.IncomingAudioPacketReceived
		,s.IncomingAudioPacketsLost
		,s.IncomingVideoPacketReceived
		,s.IncomingVideoPacketsLost
		,s.OutgoingVideoFramerate
		,s.OutgoingVideoBitrate
		,s.OutgoingVideoCodec
		,s.OutgoingVideoResolution
		,s.OutgoingAudioBitrate
		,s.OutgoingAudioCodec
		,s.IncomingAudioBitrate
		,s.IncomingAudioCodec
		,s.IncomingVideoBitrate
		,s.IncomingVideoCodec
		,s.IncomingVideoResolution
		,s.Device
	);

	WITH all_devices AS (
		SELECT ConferenceId
			,ParticipantId
			,Device
			,BrowserName
			,BrowserVersion
			,OperatingSystem
			,OperatingSystemVersion
			,ROW_NUMBER() OVER (PARTITION BY ConferenceId, ParticipantId ORDER BY [TimeStamp] DESC ) AS device_order
		FROM stg.HeartBeat
		WHERE Device IS NOT NULL
			OR BrowserName IS NOT NULL
			OR OperatingSystem IS NOT NULL )
	,latest_devices AS (
		SELECT ConferenceId
			,ParticipantId
			,Device
			,BrowserName
			,BrowserVersion
			,OperatingSystem
			,OperatingSystemVersion
		FROM all_devices
		WHERE device_order = 1 )
	MERGE INTO dbo.Device t
	USING latest_devices s
		ON s.ConferenceId = t.ConferenceId
		AND s.ParticipantId = t.ParticipantId
	WHEN MATCHED THEN
		UPDATE SET t.Device = s.Device
			,t.BrowserName = s.BrowserName
			,t.BrowserVersion = s.BrowserVersion
			,t.OperatingSystem = s.OperatingSystem
			,t.OperatingSystemVersion = s.OperatingSystemVersion
	WHEN NOT MATCHED THEN INSERT (
		ConferenceId
		,ParticipantId
		,Device
		,BrowserName
		,BrowserVersion
		,OperatingSystem
		,OperatingSystemVersion )
	VALUES (
		s.ConferenceId
		,s.ParticipantId
		,s.Device 
		,s.BrowserName 
		,s.BrowserVersion 
		,s.OperatingSystem 
		,s.OperatingSystemVersion 
	);

	WITH delta AS (
		SELECT 'Heartbeat' AS TableName, '''' + FORMAT(MAX(Timestamp),'yyyy-MM-dd HH:mm:ss.fff') + '''' AS DeltaValue FROM dbo.Heartbeat
	)
	UPDATE a 
	SET DeltaValue = delta.DeltaValue 
	FROM dbo.AdfConfig a 
	INNER JOIN delta 
	ON delta.TableName = a.TableName
END
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadConferenceStatus')
	EXEC('CREATE PROCEDURE dbo.sp_LoadConferenceStatus AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_LoadConferenceStatus AS
BEGIN
	MERGE INTO dbo.ConferenceStatus AS t
	USING stg.ConferenceStatus AS s
		ON (s.ID = t.ID)
	WHEN MATCHED THEN UPDATE
		SET t.ConferenceState = s.ConferenceState
			,t.TimeStamp = s.TimeStamp
			,t.ConferenceId = s.ConferenceId
	WHEN NOT MATCHED THEN 
	INSERT (
		Id
		,ConferenceState
		,TimeStamp
		,ConferenceId )
	VALUES (
		s.Id
		,s.ConferenceState
		,s.TimeStamp
		,s.ConferenceId
	);

	WITH delta AS (
		SELECT 'ConferenceStatus' AS TableName, '''' + FORMAT(MAX(Timestamp),'yyyy-MM-dd HH:mm:ss.fff') + '''' AS DeltaValue FROM dbo.ConferenceStatus
	)
	UPDATE a 
	SET DeltaValue = delta.DeltaValue 
	FROM dbo.AdfConfig a 
	INNER JOIN delta 
	ON delta.TableName = a.TableName
END
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadAppInsightsError')
	EXEC('DROP PROCEDURE dbo.sp_LoadAppInsightsError')
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadAppInsightsError')
	EXEC('DROP PROCEDURE dbo.sp_LoadAppInsightsError')
GO

IF EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_LoadAppInsightsTrace')
	EXEC('DROP PROCEDURE dbo.sp_LoadAppInsightsTrace')
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'sp_PurgeOldData')
	EXEC('CREATE PROCEDURE dbo.sp_PurgeOldData AS BEGIN SELECT 1 END')
GO

ALTER PROCEDURE dbo.sp_PurgeOldData AS
BEGIN

    --Delete Data older than 90 days from dbo.Participant
	UPDATE dbo.Participant
	SET [Name] = 'Purged'
		,DisplayName = 'Purged'
		,Username = 'Purged'
		,FirstName = 'Purged'
		,LastName = 'Purged'
		,ContactEmail = 'Purged'
		,ContactTelephone = 'Purged'
		,Representee = 'Purged'
	WHERE ISNULL(UpdatedAt,CreatedAt) < DATEADD(DAY,-90, GETDATE())
	AND ( [Name] != 'Purged'
		OR DisplayName != 'Purged'
		OR Username != 'Purged'
		OR FirstName != 'Purged'
		OR LastName != 'Purged'
		OR ContactEmail != 'Purged'
		OR ContactTelephone != 'Purged'
		OR Representee != 'Purged' )

	UPDATE dbo.[Endpoint]
	SET DefenceAdvocate = 'Purged'
	WHERE DefenceAdvocate != 'Purged'
	AND ISNULL(UpdatedAt,CreatedAt) < DATEADD(DAY,-90, GETDATE())

	UPDATE dbo.[Event]
	SET Phone = 'Purged'
	WHERE Phone != 'Purged'
	AND [TimeStamp] < DATEADD(DAY,-90, GETDATE())

	DELETE
	FROM dbo.Heartbeat
	WHERE [TimeStamp] < DATEADD(DAY,-15, GETDATE())

END
GO


/*
EXEC dbo.sp_LoadConference
EXEC dbo.sp_LoadParticipant
EXEC dbo.sp_LoadParticipantStatus
EXEC dbo.sp_LoadRoom
EXEC dbo.sp_LoadEndpoint
EXEC dbo.sp_LoadEvent
EXEC dbo.sp_LoadHeartbeat
EXEC dbo.sp_LoadConferenceStatus

*/