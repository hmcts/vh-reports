IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'stg')
BEGIN
	EXEC ('CREATE SCHEMA stg AUTHORIZATION dbo')
END;
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'Conference')
CREATE TABLE stg.Conference (
	Id uniqueidentifier NOT NULL,
	HearingRefId uniqueidentifier NULL,
	CaseType nvarchar(max) NULL,
	ScheduledDateTime datetime2(7) NULL,
	CaseNumber nvarchar(max) NULL,
	CaseName nvarchar(max) NULL,
	ScheduledDuration int NULL,
	AdminUri nvarchar(max) NULL,
	JudgeUri nvarchar(max) NULL,
	ParticipantUri nvarchar(max) NULL,
	PexipNode nvarchar(max) NULL,
	[State] int NULL,
	ClosedDateTime datetime2(7) NULL,
	HearingVenueName nvarchar(max) NULL,
	AudioRecordingRequired bit NULL,
	IngestUrl nvarchar(max) NULL,
	ActualStartTime datetime2(7) NULL,
	TelephoneConferenceId nvarchar(max) NULL,
	CreatedDateTime datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_stg_Conference PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'ConferenceStatus')
CREATE TABLE stg.ConferenceStatus (
	Id bigint NOT NULL,
	ConferenceState int NULL,
	[TimeStamp] datetime2(7) NULL,
	ConferenceId uniqueidentifier NULL,
	CONSTRAINT PK_stg_ConferenceStatus PRIMARY KEY CLUSTERED (Id ASC ))
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'Endpoint')
CREATE TABLE stg.[Endpoint] (
	Id uniqueidentifier NOT NULL,
	DisplayName nvarchar(max) NULL,
	SipAddress nvarchar(450) NULL,
	Pin nvarchar(max) NULL,
	[State] int NULL,
	ConferenceId uniqueidentifier NULL,
	DefenceAdvocate nvarchar(450) NULL,
	CurrentRoom int NULL,
	CurrentConsultationRoomId bigint NULL,
	CreatedAt datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_stg_Endpoint PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'Event')
CREATE TABLE stg.[Event] (
	Id bigint NOT NULL,
	ConferenceId uniqueidentifier NULL,
	ExternalEventId nvarchar(max) NULL,
	EventType int NULL,
	ExternalTimestamp datetime2(7) NULL,
	ParticipantId uniqueidentifier NULL,
	TransferredFrom int NULL,
	TransferredTo int NULL,
	Reason nvarchar(max) NULL,
	[Timestamp] datetime2(7) NULL,
	EndpointFlag bit NULL,
	Phone nvarchar(max) NULL,
	TransferredFromRoomLabel nvarchar(max) NULL,
	TransferredToRoomLabel nvarchar(max) NULL,
	ParticipantRoomId bigint NULL,
	CONSTRAINT PK_stg_Event PRIMARY KEY CLUSTERED (Id ASC))
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'Heartbeat')
CREATE TABLE stg.Heartbeat (
	[Id] [bigint] NOT NULL,
	[ConferenceId] [uniqueidentifier] NOT NULL,
	[ParticipantId] [uniqueidentifier] NOT NULL,
	[OutgoingAudioPercentageLost] [decimal](18, 2) NOT NULL,
	[OutgoingAudioPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[IncomingAudioPercentageLost] [decimal](18, 2) NOT NULL,
	[IncomingAudioPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[OutgoingVideoPercentageLost] [decimal](18, 2) NOT NULL,
	[OutgoingVideoPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[IncomingVideoPercentageLost] [decimal](18, 2) NOT NULL,
	[IncomingVideoPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
	[BrowserName] [nvarchar](max) NULL,
	[BrowserVersion] [nvarchar](max) NULL,
	[OperatingSystem] [nvarchar](max) NULL,
	[OperatingSystemVersion] [nvarchar](max) NULL,
	[OutgoingAudioPacketSent] [int] NULL,
	[OutgoingAudioPacketsLost] [int] NULL,
	[OutgoingVideoPacketSent] [int] NULL,
	[OutgoingVideoPacketsLost] [int] NULL,
	[IncomingAudioPacketReceived] [int] NULL,
	[IncomingAudioPacketsLost] [int] NULL,
	[IncomingVideoPacketReceived] [int] NULL,
	[IncomingVideoPacketsLost] [int] NULL,
	[OutgoingVideoFramerate] [int] NULL,
	[OutgoingVideoBitrate] [nvarchar](50) NULL,
	[OutgoingVideoCodec] [nvarchar](50) NULL,
	[OutgoingVideoResolution] [nvarchar](50) NULL,
	[OutgoingAudioBitrate] [nvarchar](50) NULL,
	[OutgoingAudioCodec] [nvarchar](50) NULL,
	[IncomingAudioBitrate] [nvarchar](50) NULL,
	[IncomingAudioCodec] [nvarchar](50) NULL,
	[IncomingVideoBitrate] [nvarchar](50) NULL,
	[IncomingVideoCodec] [nvarchar](50) NULL,
	[IncomingVideoResolution] [nvarchar](50) NULL,
	CONSTRAINT PK_stg_Heartbeat PRIMARY KEY CLUSTERED (	Id ASC ))
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'Participant')
CREATE TABLE stg.Participant (
	Id uniqueidentifier NOT NULL,
	ParticipantRefId uniqueidentifier NULL,
	[Name] nvarchar(max) NULL,
	DisplayName nvarchar(max) NULL,
	Username nvarchar(max) NULL,
	UserRole int NULL,
	CaseTypeGroup nvarchar(max) NULL,
	ConferenceId uniqueidentifier NULL,
	Representee nvarchar(max) NULL,
	TestCallResultId bigint NULL,
	CurrentRoom int NULL,
	[State] int NULL,
	FirstName nvarchar(max) NULL,
	LastName nvarchar(max) NULL,
	ContactEmail nvarchar(max) NULL,
	ContactTelephone nvarchar(max) NULL,
	HearingRole nvarchar(max) NULL,
	CurrentConsultationRoomId bigint NULL,
	Discriminator nvarchar(max) NULL,
	CreatedAt datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_stg_Participant PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'ParticipantStatus')
CREATE TABLE stg.ParticipantStatus (
	Id bigint NOT NULL,
	ParticipantState int NULL,
	[TimeStamp] datetime2(7) NULL,
	ParticipantId uniqueidentifier NULL,
	CONSTRAINT PK_stg_ParticipantStatus PRIMARY KEY CLUSTERED (Id ASC))
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'Room')
CREATE TABLE stg.Room (
	Id bigint NOT NULL,
	ConferenceId uniqueidentifier NULL,
	[Label] nvarchar(max) NULL,
	[Type] int NULL,
	[Status] int NULL,
	Locked bit NULL,
	IngestUrl nvarchar(max) NULL,
	ParticipantUri nvarchar(max) NULL,
	PexipNode nvarchar(max) NULL,
	Discriminator nvarchar(max) NULL,
	CreatedAt datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_stg_Room PRIMARY KEY CLUSTERED (Id ASC)
)
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Conference')
CREATE TABLE dbo.Conference (
	Id uniqueidentifier NOT NULL,
	HearingRefId uniqueidentifier NULL,
	CaseType nvarchar(max) NULL,
	ScheduledDateTime datetime2(7) NULL,
	CaseNumber nvarchar(max) NULL,
	CaseName nvarchar(max) NULL,
	ScheduledDuration int NULL,
	AdminUri nvarchar(max) NULL,
	JudgeUri nvarchar(max) NULL,
	ParticipantUri nvarchar(max) NULL,
	PexipNode nvarchar(max) NULL,
	[State] int NULL,
	ClosedDateTime datetime2(7) NULL,
	HearingVenueName nvarchar(max) NULL,
	AudioRecordingRequired bit NULL,
	IngestUrl nvarchar(max) NULL,
	ActualStartTime datetime2(7) NULL,
	TelephoneConferenceId nvarchar(max) NULL,
	CreatedDateTime datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_Conference PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'ConferenceStatus')
CREATE TABLE dbo.ConferenceStatus (
	Id bigint NOT NULL,
	ConferenceState int NULL,
	[TimeStamp] datetime2(7) NULL,
	ConferenceId uniqueidentifier NULL,
	CONSTRAINT PK_ConferenceStatus PRIMARY KEY CLUSTERED (Id ASC ))
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Endpoint')
CREATE TABLE dbo.[Endpoint] (
	Id uniqueidentifier NOT NULL,
	DisplayName nvarchar(max) NULL,
	SipAddress nvarchar(450) NULL,
	Pin nvarchar(max) NULL,
	[State] int NULL,
	ConferenceId uniqueidentifier NULL,
	DefenceAdvocate nvarchar(450) NULL,
	CurrentRoom int NULL,
	CurrentConsultationRoomId bigint NULL,
	CreatedAt datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_Endpoint PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Event')
CREATE TABLE dbo.[Event] (
	Id bigint NOT NULL,
	ConferenceId uniqueidentifier NULL,
	ExternalEventId nvarchar(max) NULL,
	EventType int NULL,
	ExternalTimestamp datetime2(7) NULL,
	ParticipantId uniqueidentifier NULL,
	TransferredFrom int NULL,
	TransferredTo int NULL,
	Reason nvarchar(max) NULL,
	[Timestamp] datetime2(7) NULL,
	EndpointFlag bit NULL,
	Phone nvarchar(max) NULL,
	TransferredFromRoomLabel nvarchar(max) NULL,
	TransferredToRoomLabel nvarchar(max) NULL,
	ParticipantRoomId bigint NULL,
	CONSTRAINT PK_Event PRIMARY KEY CLUSTERED (Id ASC))
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Heartbeat')
CREATE TABLE dbo.Heartbeat (
	[Id] [bigint] NOT NULL,
	[ConferenceId] [uniqueidentifier] NOT NULL,
	[ParticipantId] [uniqueidentifier] NOT NULL,
	[OutgoingAudioPercentageLost] [decimal](18, 2) NOT NULL,
	[OutgoingAudioPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[IncomingAudioPercentageLost] [decimal](18, 2) NOT NULL,
	[IncomingAudioPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[OutgoingVideoPercentageLost] [decimal](18, 2) NOT NULL,
	[OutgoingVideoPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[IncomingVideoPercentageLost] [decimal](18, 2) NOT NULL,
	[IncomingVideoPercentageLostRecent] [decimal](18, 2) NOT NULL,
	[TimeStamp] [datetime2](7) NOT NULL,
	[BrowserName] [nvarchar](max) NULL,
	[BrowserVersion] [nvarchar](max) NULL,
	[OperatingSystem] [nvarchar](max) NULL,
	[OperatingSystemVersion] [nvarchar](max) NULL,
	[OutgoingAudioPacketSent] [int] NULL,
	[OutgoingAudioPacketsLost] [int] NULL,
	[OutgoingVideoPacketSent] [int] NULL,
	[OutgoingVideoPacketsLost] [int] NULL,
	[IncomingAudioPacketReceived] [int] NULL,
	[IncomingAudioPacketsLost] [int] NULL,
	[IncomingVideoPacketReceived] [int] NULL,
	[IncomingVideoPacketsLost] [int] NULL,
	[OutgoingVideoFramerate] [int] NULL,
	[OutgoingVideoBitrate] [nvarchar](50) NULL,
	[OutgoingVideoCodec] [nvarchar](50) NULL,
	[OutgoingVideoResolution] [nvarchar](50) NULL,
	[OutgoingAudioBitrate] [nvarchar](50) NULL,
	[OutgoingAudioCodec] [nvarchar](50) NULL,
	[IncomingAudioBitrate] [nvarchar](50) NULL,
	[IncomingAudioCodec] [nvarchar](50) NULL,
	[IncomingVideoBitrate] [nvarchar](50) NULL,
	[IncomingVideoCodec] [nvarchar](50) NULL,
	[IncomingVideoResolution] [nvarchar](50) NULL,
	CONSTRAINT PK_Heartbeat PRIMARY KEY CLUSTERED (	Id ASC ))
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Participant')
CREATE TABLE dbo.Participant (
	Id uniqueidentifier NOT NULL,
	ParticipantRefId uniqueidentifier NULL,
	[Name] nvarchar(max) NULL,
	DisplayName nvarchar(max) NULL,
	Username nvarchar(max) NULL,
	UserRole int NULL,
	CaseTypeGroup nvarchar(max) NULL,
	ConferenceId uniqueidentifier NULL,
	Representee nvarchar(max) NULL,
	TestCallResultId bigint NULL,
	CurrentRoom int NULL,
	[State] int NULL,
	FirstName nvarchar(max) NULL,
	LastName nvarchar(max) NULL,
	ContactEmail nvarchar(max) NULL,
	ContactTelephone nvarchar(max) NULL,
	HearingRole nvarchar(max) NULL,
	CurrentConsultationRoomId bigint NULL,
	Discriminator nvarchar(max) NULL,
	CreatedAt datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_Participant PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'ParticipantStatus')
CREATE TABLE dbo.ParticipantStatus (
	Id bigint NOT NULL,
	ParticipantState int NULL,
	[TimeStamp] datetime2(7) NULL,
	ParticipantId uniqueidentifier NULL,
	CONSTRAINT PK_ParticipantStatus PRIMARY KEY CLUSTERED (Id ASC))
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Room')
CREATE TABLE dbo.Room (
	Id bigint NOT NULL,
	ConferenceId uniqueidentifier NULL,
	[Label] nvarchar(max) NULL,
	[Type] int NULL,
	[Status] int NULL,
	Locked bit NULL,
	IngestUrl nvarchar(max) NULL,
	ParticipantUri nvarchar(max) NULL,
	PexipNode nvarchar(max) NULL,
	Discriminator nvarchar(max) NULL,
	CreatedAt datetime2(7) NULL,
	UpdatedAt datetime2(7) NULL,
	CONSTRAINT PK_Room PRIMARY KEY CLUSTERED (Id ASC)
)
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'AppInsightsError')
CREATE TABLE stg.AppInsightsError(
	Id uniqueidentifier NOT NULL DEFAULT NEWID(),
	[FileName] nvarchar(255) NULL,
	ProblemId nvarchar(max) NOT NULL,
	TotalExceptions tinyint NULL,
	RunDate datetime2 NULL,
	CONSTRAINT PK_stg_AppInsightsError PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'AppInsightsError')
CREATE TABLE dbo.AppInsightsError(
	Id uniqueidentifier NOT NULL,
	[FileName] nvarchar(255) NULL,
	FileDate datetime2 NULL,
	ProblemId nvarchar(max) NOT NULL,
	TotalExceptions tinyint NULL,
	RunDate datetime2 NULL,
	CONSTRAINT PK_AppInsightsError PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'stg' AND name = 'AppInsightsTrace')
CREATE TABLE stg.AppInsightsTrace (
	Id uniqueidentifier NOT NULL DEFAULT NEWID(),
	[FileName] nvarchar(max) NULL,
	[message] nvarchar(max) NOT NULL,
	customDimensions nvarchar(max) NOT NULL,
	[user_Id] nvarchar(255) NOT NULL,
	client_Model nvarchar(max) NULL,
	client_OS nvarchar(255) NULL,
	[timestamp] nvarchar(max) NOT NULL,
	currentConferenceId nvarchar(max) NULL,
	conference nvarchar(max) NULL,
	participant nvarchar(max) NULL,
	errorInformation nvarchar(max) NULL,
	HostInstanceId nvarchar(max) NULL,
	ProcessId nvarchar(max) NULL,
	LogLevel nvarchar(max) NULL,
	pexipError nvarchar(max) NULL,
	RunDate datetime2 NULL,
	CONSTRAINT PK_stg_AppInsightsTrace PRIMARY KEY CLUSTERED (Id ASC))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'AppInsightsTrace')
CREATE TABLE dbo.AppInsightsTrace(
	Id uniqueidentifier NOT NULL DEFAULT NEWID(),
	[FileName] nvarchar(255) NULL,
	[message] nvarchar(max) NOT NULL,
	customDimensions nvarchar(max) NOT NULL,
	[user_Id] nvarchar(255) NOT NULL,
	client_Model nvarchar(255) NULL,
	client_OS nvarchar(255) NULL,
	[timestamp] datetime2 NOT NULL,
	currentConferenceId nvarchar(255) NULL,
	conference nvarchar(max) NULL,
	participant nvarchar(255) NULL,
	errorInformation nvarchar(max) NULL,
	HostInstanceId nvarchar(255) NULL,
	ProcessId nvarchar(255) NULL,
	LogLevel nvarchar(255) NULL,
	pexipError nvarchar(max) NULL,
	RunDate datetime2 NULL,
	CONSTRAINT PK_AppInsightsTrace PRIMARY KEY CLUSTERED (Id ASC))
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Calendar')
CREATE TABLE dbo.Calendar (
	CalendarDate DATE NOT NULL,
	CalendarDateTime DATETIME NOT NULL,
	CalendarYear SMALLINT NOT NULL,
	CalendarMonth TINYINT NOT NULL,
	CalendarQuarter TINYINT NOT NULL,
	CalendarMonthName VARCHAR(9) NOT NULL,
	CalendarWeek TINYINT NOT NULL,
	CalendarWeekDay VARCHAR(9) NOT NULL,
	CalendarDayOfYear SMALLINT NOT NULL,
	CONSTRAINT PK_Calendar PRIMARY KEY (CalendarDate))
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'Time')
CREATE TABLE dbo.Time (
	TimeOfDay TIME NOT NULL,
	TimeString CHAR(8) NOT NULL,
	Hour24h TINYINT NOT NULL,
	Hour12h TINYINT NOT NULL,
	AM_PM CHAR(2) NOT NULL,
	MinuteOfHour TINYINT NOT NULL,
	CONSTRAINT PK_Time PRIMARY KEY (TimeOfDay))
GO


IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'AppInsightsTrace' and [name] = 'client_OS')
	ALTER TABLE stg.AppInsightsTrace ADD client_OS nvarchar(255) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'AppInsightsTrace' and [name] = 'client_OS')
	ALTER TABLE dbo.AppInsightsTrace ADD client_OS nvarchar(255) NULL;
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'Conference' and [name] = 'UpdatedAt')
	ALTER TABLE stg.Conference ADD UpdatedAt datetime2(7) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'Conference' and [name] = 'UpdatedAt')
	ALTER TABLE dbo.Conference ADD UpdatedAt datetime2(7) NULL;
GO


IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'Participant' and [name] = 'CreatedAt')
	ALTER TABLE stg.Participant ADD CreatedAt datetime2(7) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'Participant' and [name] = 'CreatedAt')
	ALTER TABLE dbo.Participant ADD CreatedAt datetime2(7) NULL;
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'Participant' and [name] = 'UpdatedAt')
	ALTER TABLE stg.Participant ADD UpdatedAt datetime2(7) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'Participant' and [name] = 'UpdatedAt')
	ALTER TABLE dbo.Participant ADD UpdatedAt datetime2(7) NULL;
GO



IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'Endpoint' and [name] = 'CreatedAt')
	ALTER TABLE stg.[Endpoint] ADD CreatedAt datetime2(7) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'Endpoint' and [name] = 'CreatedAt')
	ALTER TABLE dbo.[Endpoint] ADD CreatedAt datetime2(7) NULL;
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'Endpoint' and [name] = 'UpdatedAt')
	ALTER TABLE stg.[Endpoint] ADD UpdatedAt datetime2(7) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'Endpoint' and [name] = 'UpdatedAt')
	ALTER TABLE dbo.[Endpoint] ADD UpdatedAt datetime2(7) NULL;
GO



IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'Room' and [name] = 'CreatedAt')
	ALTER TABLE stg.Room ADD CreatedAt datetime2(7) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'Room' and [name] = 'CreatedAt')
	ALTER TABLE dbo.Room ADD CreatedAt datetime2(7) NULL;
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'stg' AND object_name([object_id])  = 'Room' and [name] = 'UpdatedAt')
	ALTER TABLE stg.Room ADD UpdatedAt datetime2(7) NULL;
GO
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_schema_name([object_id]) = 'dbo' AND object_name([object_id])  = 'Room' and [name] = 'UpdatedAt')
	ALTER TABLE dbo.Room ADD UpdatedAt datetime2(7) NULL;
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'NetworkProblemConfiguration')
CREATE TABLE dbo.NetworkProblemConfiguration (
	Id TINYINT NOT NULL,
	PctHeartbeatsLostThreshold DECIMAL(5,2),
	VideoAudioLossThreshold DECIMAL(5,2),
	ReportingPeriodMinutes TINYINT,
	CONSTRAINT PK_NetworkProblemConfiguration PRIMARY KEY CLUSTERED (Id ASC ))
GO

TRUNCATE TABLE dbo.NetworkProblemConfiguration 
GO

INSERT INTO dbo.NetworkProblemConfiguration (
	Id
	,PctHeartbeatsLostThreshold
	,VideoAudioLossThreshold
	,ReportingPeriodMinutes )
SELECT 1 AS Id
	,0.10 AS PctHeartbeatsLostThreshold
	,0.05 AS VideoAudioLossThreshold
	,5 AS ReportingPeriodMinutes ;
GO


IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE [name] = 'IX_ParticipantStatus_ParticipantState')
CREATE NONCLUSTERED INDEX IX_ParticipantStatus_ParticipantState
ON [dbo].[ParticipantStatus] ([ParticipantState])
INCLUDE ([TimeStamp],[ParticipantId])
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE [name] = 'IX_Participant_ConferenceId')
CREATE NONCLUSTERED INDEX IX_Participant_ConferenceId
ON [dbo].[Participant] ([ConferenceId])

GO