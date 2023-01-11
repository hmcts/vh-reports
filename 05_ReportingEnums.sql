IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('ReportingEnums'))
CREATE TABLE dbo.ReportingEnums (
	EnumName VARCHAR(100) NOT NULL,
	EnumNumber TINYINT,
	EnumString NVARCHAR(255),
	CONSTRAINT PK_ReportingEnums PRIMARY KEY (EnumName, EnumNumber)
)
GO

TRUNCATE TABLE dbo.ReportingEnums;

INSERT INTO dbo.ReportingEnums (EnumName, EnumString, EnumNumber)
SELECT 'dbo.Event.EventType' AS EnumName, 'None' AS EnumString,0 AS EnumNumber
UNION ALL SELECT 'dbo.Event.EventType','Joined',1
UNION ALL SELECT 'dbo.Event.EventType','Disconnected',2
UNION ALL SELECT 'dbo.Event.EventType','Transfer',3
UNION ALL SELECT 'dbo.Event.EventType','Help',4
UNION ALL SELECT 'dbo.Event.EventType','Start',17
UNION ALL SELECT 'dbo.Event.EventType','CountdownFinished',18
UNION ALL SELECT 'dbo.Event.EventType','Pause',5
UNION ALL SELECT 'dbo.Event.EventType','Close',6
UNION ALL SELECT 'dbo.Event.EventType','Leave',7
UNION ALL SELECT 'dbo.Event.EventType','Consultation',8
UNION ALL SELECT 'dbo.Event.EventType','MediaPermissionDenied',10
UNION ALL SELECT 'dbo.Event.EventType','ParticipantJoining',11
UNION ALL SELECT 'dbo.Event.EventType','SelfTestFailed',12
UNION ALL SELECT 'dbo.Event.EventType','Suspend',13
UNION ALL SELECT 'dbo.Event.EventType','VhoCall',14
UNION ALL SELECT 'dbo.Event.EventType','ParticipantNotSignedIn',16
UNION ALL SELECT 'dbo.Event.EventType','EndpointJoined',19
UNION ALL SELECT 'dbo.Event.EventType','EndpointDisconnected',20
UNION ALL SELECT 'dbo.Event.EventType','EndpointTransfer',21
UNION ALL SELECT 'dbo.Event.EventType','ConnectingToEventHub',22
UNION ALL SELECT 'dbo.Event.EventType','SelectingMedia',23
UNION ALL SELECT 'dbo.Event.EventType','ConnectingToConference',24
UNION ALL SELECT 'dbo.Event.EventType','RoomParticipantJoined',25
UNION ALL SELECT 'dbo.Event.EventType','RoomParticipantDisconnected',26
UNION ALL SELECT 'dbo.Event.EventType','RoomParticipantTransfer',27

UNION ALL SELECT 'dbo.ConferenceStatus.ConferenceState','NotStarted',0
UNION ALL SELECT 'dbo.ConferenceStatus.ConferenceState','InSession',1
UNION ALL SELECT 'dbo.ConferenceStatus.ConferenceState','Paused',2
UNION ALL SELECT 'dbo.ConferenceStatus.ConferenceState','Suspended',3
UNION ALL SELECT 'dbo.ConferenceStatus.ConferenceState','Closed',4


UNION ALL SELECT 'dbo.Conference.State','NotStarted',0
UNION ALL SELECT 'dbo.Conference.State','InSession',1
UNION ALL SELECT 'dbo.Conference.State','Paused',2
UNION ALL SELECT 'dbo.Conference.State','Suspended',3
UNION ALL SELECT 'dbo.Conference.State','Closed',4

UNION ALL SELECT 'dbo.Endpoint.State','NotYetJoined',1
UNION ALL SELECT 'dbo.Endpoint.State','Connected',2
UNION ALL SELECT 'dbo.Endpoint.State','Disconnected',3
UNION ALL SELECT 'dbo.Endpoint.State','InConsultation',4

UNION ALL SELECT 'dbo.Participant.State','None',0
UNION ALL SELECT 'dbo.Participant.State','NotSignedIn',1
UNION ALL SELECT 'dbo.Participant.State','Joining',2
UNION ALL SELECT 'dbo.Participant.State','Available',3
UNION ALL SELECT 'dbo.Participant.State','InHearing',4
UNION ALL SELECT 'dbo.Participant.State','InConsultation',5
UNION ALL SELECT 'dbo.Participant.State','Disconnected',6

UNION ALL SELECT 'dbo.ParticipantStatus.ParticipantState','None',0
UNION ALL SELECT 'dbo.ParticipantStatus.ParticipantState','NotSignedIn',1
UNION ALL SELECT 'dbo.ParticipantStatus.ParticipantState','Joining',2
UNION ALL SELECT 'dbo.ParticipantStatus.ParticipantState','Available',3
UNION ALL SELECT 'dbo.ParticipantStatus.ParticipantState','InHearing',4
UNION ALL SELECT 'dbo.ParticipantStatus.ParticipantState','InConsultation',5
UNION ALL SELECT 'dbo.ParticipantStatus.ParticipantState','Disconnected',6

UNION ALL SELECT 'dbo.Participant.UserRole','None',0
UNION ALL SELECT 'dbo.Participant.UserRole','CaseAdmin',1
UNION ALL SELECT 'dbo.Participant.UserRole','VideoHearingsOfficer',2
UNION ALL SELECT 'dbo.Participant.UserRole','HearingFacilitationSupport',3
UNION ALL SELECT 'dbo.Participant.UserRole','Judge',4
UNION ALL SELECT 'dbo.Participant.UserRole','Individual',5
UNION ALL SELECT 'dbo.Participant.UserRole','Representative',6
UNION ALL SELECT 'dbo.Participant.UserRole','JudicialOfficeHolder',7
UNION ALL SELECT 'dbo.Participant.UserRole','QuickLinkParticipant',8
UNION ALL SELECT 'dbo.Participant.UserRole','QuickLinkObserver',9
UNION ALL SELECT 'dbo.Participant.UserRole','StaffMember',10

UNION ALL SELECT 'dbo.Room.Type','WaitingRoom',0
UNION ALL SELECT 'dbo.Room.Type','HearingRoom',1
UNION ALL SELECT 'dbo.Room.Type','ConsultationRoom',2
UNION ALL SELECT 'dbo.Room.Type','AdminRoom',4

UNION ALL SELECT 'dbo.Room.Status','Live',0
UNION ALL SELECT 'dbo.Room.Status','Closed',1
;



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) = 'dbo' AND name = 'ConferenceNameFilters')
CREATE TABLE dbo.ConferenceNameFilters (
	FilterString nvarchar(255) NOT NULL,
	CONSTRAINT PK_ConferenceNameFilters PRIMARY KEY CLUSTERED (FilterString))
GO


TRUNCATE TABLE dbo.ConferenceNameFilters;

INSERT INTO dbo.ConferenceNameFilters (FilterString)
SELECT 'Test' AS FilterString
UNION ALL SELECT 'Testing' AS FilterString
--UNION ALL SELECT 'QuickTest' AS FilterString
--UNION ALL SELECT 'PenTest' AS FilterString
--UNION ALL SELECT 'VMRtest' AS FilterString
--UNION ALL SELECT 'Regression' AS FilterString
--UNION ALL SELECT 'sanity check' AS FilterString
--UNION ALL SELECT 'quickCheck' AS FilterString
--UNION ALL SELECT 'IM check' AS FilterString
--UNION ALL SELECT 'FreeSwitch check' AS FilterString
--UNION ALL SELECT 'HOTFIX' AS FilterString
--UNION ALL SELECT 'Demo' AS FilterString
GO