IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwRegion'))
	EXEC('CREATE VIEW dbo.vwRegion AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwRegion AS
SELECT 'Scotland' AS Region,'Aberdeen Tribunal Hearing Centre' AS HearingVenueName
UNION ALL SELECT 'Wales','Aberystwyth Justice Centre'
UNION ALL SELECT 'South West','Aldershot Justice Centre'
UNION ALL SELECT 'South East','Amersham Law Courts'
UNION ALL SELECT 'South East','Ashford Tribunal Hearing Centre'
UNION ALL SELECT 'South East','Aylesbury Crown Court'
UNION ALL SELECT 'Scotland','Ayr'
UNION ALL SELECT 'London','Barkingside Magistrates Court'
UNION ALL SELECT 'London','Barnet Civil and Family Courts Centre'
UNION ALL SELECT 'North East','Barnsley Law Courts'
UNION ALL SELECT 'South West','Barnstaple Magistrates, County and Family Court'
UNION ALL SELECT 'North West','Barrow-in-Furness County Court and Family Court, Barrow-in-Furness Magistrates Court'
UNION ALL SELECT 'South East','Basildon Combined Court'
UNION ALL SELECT 'South East','Basildon Magistrates Court and Family Court'
UNION ALL SELECT 'South West','Basingstoke County Court and Family Court'
UNION ALL SELECT 'South West','Basingstoke Magistrates Court'
UNION ALL SELECT 'South West','Bath Law Courts (Civil and Family)'
UNION ALL SELECT 'South East','Bedford County Court and Family Court'
UNION ALL SELECT 'North East','Berwick upon Tweed Magistrates Court'
UNION ALL SELECT 'North East','Beverley Magistrates Court and Hearing Centre'
UNION ALL SELECT 'London','Bexley Magistrates Court'
UNION ALL SELECT 'London','Bexleyheath Social Security and Child Support Tribunal'
UNION ALL SELECT 'North West','Birkenhead County Court'
UNION ALL SELECT 'Midlands','Birmingham Civil and Family Justice Centre'
UNION ALL SELECT 'Midlands','Birmingham Crown Court'
UNION ALL SELECT 'Midlands','Birmingham Immigration and Asylum Chamber (First Tier)'
UNION ALL SELECT 'Midlands','Birmingham Youth Court'
UNION ALL SELECT 'Midlands','Birmingham Magistrates Court'
UNION ALL SELECT 'Midlands','Birmingham Social Security and Child Support Tribunal'
UNION ALL SELECT 'North West','Blackburn Family Court'
UNION ALL SELECT 'North West','Blackburn Magistrates Court'
UNION ALL SELECT 'North West','Blackpool Family Court'
UNION ALL SELECT 'North West','Blackpool Magistrates and Civil Court'
UNION ALL SELECT 'Wales','Blackwood Civil and Family Court'
UNION ALL SELECT 'South West','Bodmin Law Courts'
UNION ALL SELECT 'North West','Bolton Crown Court'
UNION ALL SELECT 'North West','Bolton Social Security and Child Support Tribunal'
UNION ALL SELECT 'North West','Bolton Magistrates Court'
UNION ALL SELECT 'Midlands','Boston Magistrates Court'
UNION ALL SELECT 'Midlands','Boston County Court and Family Court'
UNION ALL SELECT 'South West','Bournemouth Combined Court'
UNION ALL SELECT 'South West','Bournemouth Crown Court'
UNION ALL SELECT 'North East','Bradford and Keighley Magistrates Court and Family Court'
UNION ALL SELECT 'North East','Bradford Combined Court Centre'
UNION ALL SELECT 'North East','Bradford Tribunal Hearing Centre'
UNION ALL SELECT 'London','Brentford County and Family Court'
UNION ALL SELECT 'North East','Bridlington Magistrates Court and Hearing Centre'
UNION ALL SELECT 'South East','Brighton County Court'
UNION ALL SELECT 'South East','Brighton Magistrates Court'
UNION ALL SELECT 'South East','Brighton Tribunal Hearing Centre'
UNION ALL SELECT 'South East','Brighton-Hearing Centre'
UNION ALL SELECT 'South West','Bristol Civil and Family Justice Centre'
UNION ALL SELECT 'South West','Bristol Crown Court'
UNION ALL SELECT 'South West','Bristol Magistrates Court and Tribunals Hearing Centre'
UNION ALL SELECT 'London','Bromley County Court and Family Court'
UNION ALL SELECT 'London','Bromley Magistrates Court'
UNION ALL SELECT 'North West','Burnley Combined Court Centre'
UNION ALL SELECT 'North West','Burnley Magistrates Court'
UNION ALL SELECT 'South East','Bury St Edmunds County Court and Family Court'
UNION ALL SELECT 'South East','Bury St Edmunds Regional Divorce Centre'
UNION ALL SELECT 'Wales','Caernarfon Justice Centre'
UNION ALL SELECT 'South East','Cambridge County Court and Family Court'
UNION ALL SELECT 'South East','Cambridge Crown Court'
UNION ALL SELECT 'South East','Cambridge Magistrates Court'
UNION ALL SELECT 'Midlands','Cannock Magistrates Court'
UNION ALL SELECT 'South East','Canterbury Combined Court Centre'
UNION ALL SELECT 'South East','Canterbury Magistrates Court'
UNION ALL SELECT 'Wales','Cardiff Civil and Family Justice Centre'
UNION ALL SELECT 'Wales','Cardiff Crown Court'
UNION ALL SELECT 'Wales','Cardiff Magistrates Court'
UNION ALL SELECT 'Wales','Cardiff Social Security and Child Support Tribunal'
UNION ALL SELECT 'North West','Carlisle Combined Court'
UNION ALL SELECT 'North West','Carlisle Magistrates Court'
UNION ALL SELECT 'Wales','Carmarthen County Court and Family Court'
UNION ALL SELECT 'London','Central London County Court'
UNION ALL SELECT 'London','Central Criminal Court'
UNION ALL SELECT 'London','Central Family Court'
UNION ALL SELECT 'London','Central London Employment Tribunal'
UNION ALL SELECT 'South East','Chelmsford Justice Centre'
UNION ALL SELECT 'South East','Chelmsford Crown Court'
UNION ALL SELECT 'South East','Chelmsford Magistrates Court and Family Court'
UNION ALL SELECT 'South West','Cheltenham Magistrates Court'
UNION ALL SELECT 'North West','Chester Civil and Family Justice Centre'
UNION ALL SELECT 'North West','Chester Crown Court'
UNION ALL SELECT 'North West','Chester Magistrates Court'
UNION ALL SELECT 'Midlands','Chesterfield Justice Centre'
UNION ALL SELECT 'London','City of London Magistrates Court'
UNION ALL SELECT 'London','Clerkenwell and Shoreditch County Court and Family Court'
UNION ALL SELECT 'South East','Colchester Magistrates Court and Family Court'
UNION ALL SELECT 'London','Court of Protection'
UNION ALL SELECT 'Midlands','Coventry Combined Court Centre'
UNION ALL SELECT 'Midlands','Coventry Magistrates Court'
UNION ALL SELECT 'South East','Crawley Magistrates Court'
UNION ALL SELECT 'North West','Crewe Magistrates Court'
UNION ALL SELECT 'North West','Crewe County Court and Family Court'
UNION ALL SELECT 'London','Croydon County Court and Family Court'
UNION ALL SELECT 'London','Croydon Crown Court'
UNION ALL SELECT 'London','Croydon Employment Tribunal'
UNION ALL SELECT 'London','Croydon Magistrates Court'
UNION ALL SELECT 'Wales','Cwmbran Magistrates Court'
UNION ALL SELECT 'North East','Darlington County Court and Family Court'
UNION ALL SELECT 'North East','Darlington Magistrates Court and Family Court'
UNION ALL SELECT 'South East','Dartford County Court and Family Court'
UNION ALL SELECT 'Midlands','Derby Combined Court Centre'
UNION ALL SELECT 'Midlands','Derby Social Security and Child Support Tribunal'
UNION ALL SELECT 'Midlands','Derby Magistrates Court'
UNION ALL SELECT 'North East','Doncaster Justice Centre North'
UNION ALL SELECT 'North East','Doncaster Justice Centre South'
UNION ALL SELECT 'Midlands','Dudley Magistrates Court'
UNION ALL SELECT 'Midlands','Dudley County Court and Family Court'
UNION ALL SELECT 'Scotland','Dundee Tribunal Hearing Centre'
UNION ALL SELECT 'North East','Durham County Court and Family Court'
UNION ALL SELECT 'North East','Durham Crown Court'
UNION ALL SELECT 'London','Ealing Magistrates Court'
UNION ALL SELECT 'South East','East Berkshire Magistrates Court, Slough'
UNION ALL SELECT 'London','East London Family Court'
UNION ALL SELECT 'London','East London Tribunal Hearing Centre'
UNION ALL SELECT 'Scotland','Edinburgh Employment Tribunal'
UNION ALL SELECT 'Scotland','Edinburgh Employment Appeal Tribunal'
UNION ALL SELECT 'Scotland','Edinburgh Social Security and Child Support Tribunal'
UNION ALL SELECT 'Scotland','Edinburgh Upper Tribunal (Administrative Appeals Chamber)'
UNION ALL SELECT 'London','Edmonton County Court and Family Court'
UNION ALL SELECT 'London','Enfield Social Security and Child Support Tribunal'
UNION ALL SELECT 'South West','Exeter Law Courts'
UNION ALL SELECT 'London','Field House Tribunal Hearing Centre'
UNION ALL SELECT 'South East','Folkestone Magistrates Court'
UNION ALL SELECT 'North East','Gateshead Magistrates Court and Family Court'
UNION ALL SELECT 'North East','Gateshead County Court and Family Court'
UNION ALL SELECT 'Scotland','Glasgow Tribunals Centre'
UNION ALL SELECT 'South West','Gloucester Crown Court'
UNION ALL SELECT 'South West','Gloucester and Cheltenham County and Family Court'
UNION ALL SELECT 'South East','Great Yarmouth Magistrates Court and Family Court'
UNION ALL SELECT 'North East','Great Grimsby Combined Court Centre'
UNION ALL SELECT 'North East','Grimsby Magistrates Court and Family Court'
UNION ALL SELECT 'South East','Guildford Crown Court'
UNION ALL SELECT 'South East','Guildford County Court and Family Court'
UNION ALL SELECT 'South East','Guildford Magistrates Court and Family Court'
UNION ALL SELECT 'Scotland','Hamilton Brandon Gate'
UNION ALL SELECT 'London','Harmondsworth Tribunal Hearing Centre'
UNION ALL SELECT 'North East','Harrogate Justice Centre'
UNION ALL SELECT 'London','Harrow Crown Court'
UNION ALL SELECT 'South East','Hastings County Court and Family Court'
UNION ALL SELECT 'South East','Hastings Magistrates Court'
UNION ALL SELECT 'South East','Hatfield Magistrates Court'
UNION ALL SELECT 'London','Hatton Cross Tribunal Hearing Centre'
UNION ALL SELECT 'South West','Havant Justice Centre'
UNION ALL SELECT 'Wales','Haverfordwest County Court and Family Court'
UNION ALL SELECT 'Wales','Haverfordwest Magistrates Court'
UNION ALL SELECT 'London','Hendon Magistrates Court'
UNION ALL SELECT 'Midlands','Hereford Crown Court'
UNION ALL SELECT 'Midlands','Hereford Justice Centre'
UNION ALL SELECT 'South East','Hertford County Court and Family Court'
UNION ALL SELECT 'South East','High Wycombe County Court and Family Court'
UNION ALL SELECT 'South East','High Wycombe Magistrates Court and Family Court'
UNION ALL SELECT 'London','Highbury Corner Magistrates Court'
UNION ALL SELECT 'South East','Horsham County Court and Family Court'
UNION ALL SELECT 'South East','Horsham Magistrates Court'
UNION ALL SELECT 'South East','Hove Trial Centre'
UNION ALL SELECT 'North East','Huddersfield County Court and Family Court'
UNION ALL SELECT 'North East','Hull and Holderness Magistrates Court and Hearing Centre'
UNION ALL SELECT 'South East','Huntingdon Law Courts'
UNION ALL SELECT 'London','Inner London Crown Court'
UNION ALL SELECT 'Scotland','Inverness Employment Tribunal'
UNION ALL SELECT 'Scotland','Inverness Social Security and Child Support Tribunal'
UNION ALL SELECT 'South East','Ipswich County Court and Family Hearing Centre'
UNION ALL SELECT 'South East','Ipswich Crown Court'
UNION ALL SELECT 'South East','Ipswich Magistrates Court'
UNION ALL SELECT 'South West','Isle of Wight Combined Court'
UNION ALL SELECT 'London','Isleworth Crown Court'
UNION ALL SELECT 'Midlands','Kidderminster Magistrates Court'
UNION ALL SELECT 'South East','King''s Lynn Crown Court'
UNION ALL SELECT 'South East','Kings Lynn Magistrates Court and Family Court'
UNION ALL SELECT 'London','Kingston upon Thames County Court and Family Court'
UNION ALL SELECT 'London','Kingston upon Thames Crown Court'
UNION ALL SELECT 'North East','Kingston-upon-Hull Combined Court Centre'
UNION ALL SELECT 'North East','Kirklees (Huddersfield) Magistrates Court and Family Court'
UNION ALL SELECT 'North West','Lancaster Court House'
UNION ALL SELECT 'North West','Lancaster Crown Court'
UNION ALL SELECT 'London','Land Registration'
UNION ALL SELECT 'London','Lavender Hill Magistrates Court'
UNION ALL SELECT 'North East','Leeds Combined Court Centre'
UNION ALL SELECT 'North East','Leeds Employment Tribunal'
UNION ALL SELECT 'North East','Leeds Magistrates Court and Family Court'
UNION ALL SELECT 'North East','Leeds Social Security and Child Support Tribunal'
UNION ALL SELECT 'Midlands','Leicester County Court and Family Court'
UNION ALL SELECT 'Midlands','Leicester Crown Court'
UNION ALL SELECT 'Midlands','Leicester Magistrates Court'
UNION ALL SELECT 'Midlands','Leicester Tribunal Hearing Centre'
UNION ALL SELECT 'South East','Lewes Combined Court Centre'
UNION ALL SELECT 'North West','Leyland Family Hearing Centre'
UNION ALL SELECT 'Midlands','Lincoln County Court and Family Court'
UNION ALL SELECT 'Midlands','Lincoln Crown Court'
UNION ALL SELECT 'Midlands','Lincoln Magistrates Court'
UNION ALL SELECT 'North West','Liverpool Civil and Family Court'
UNION ALL SELECT 'North West','Liverpool Crown Court'
UNION ALL SELECT 'North West','Liverpool & Knowsley Magistrates Court'
UNION ALL SELECT 'North West','Liverpool Social Security and Child Support Tribunal'
UNION ALL SELECT 'Wales','Llandrindod Wells Magistrates and Family Court'
UNION ALL SELECT 'Wales','Llandudno Magistrates Court'
UNION ALL SELECT 'Wales','Llanelli Law Courts'
UNION ALL SELECT 'London','London (South) Employment Tribunal'
UNION ALL SELECT 'London','London Circuit Commercial Court'
UNION ALL SELECT 'London','London Collection and Compliance Centre'
UNION ALL SELECT 'Midlands','Loughborough Court'
UNION ALL SELECT 'South East','Luton and South Bedfordshire Magistrates Court'
UNION ALL SELECT 'South East','Luton Crown Court'
UNION ALL SELECT 'South East','Luton Justice Centre'
UNION ALL SELECT 'South East','Maidstone Combined Court Centre'
UNION ALL SELECT 'South East','Maidstone Magistrates Court'
UNION ALL SELECT 'North West','Manchester Civil and Family Justice Centre'
UNION ALL SELECT 'North West','Manchester Crown Court (Crown Square)'
UNION ALL SELECT 'North West','Manchester Crown Court (Minshull St)'
UNION ALL SELECT 'North West','Manchester Employment Tribunal'
UNION ALL SELECT 'North West','Manchester Magistrates Court'
UNION ALL SELECT 'North West','Manchester Tribunal Hearing Centre'
UNION ALL SELECT 'Midlands','Mansfield Magistrates and County Court'
UNION ALL SELECT 'South East','Margate Magistrates Court'
UNION ALL SELECT 'London (RCJ)','Mayor''s and City of London Court'
UNION ALL SELECT 'South East','Medway Magistrates Court and Family Court'
UNION ALL SELECT 'South East','Medway County Court and Family Court'
UNION ALL SELECT 'Wales','Merthyr Tydfil Combined Court Centre'
UNION ALL SELECT 'North East','Mid and South East Northumberland Law Courts'
UNION ALL SELECT 'North East','Middlesbrough County Court'
UNION ALL SELECT 'South East','Milton Keynes County Court and Family Court'
UNION ALL SELECT 'South East','Milton Keynes Magistrates Court and Family Court'
UNION ALL SELECT 'Wales','Mold Justice Centre (Mold Law Courts)'
UNION ALL SELECT 'North East','Newcastle Civil & Family Courts and Tribunals Centre'
UNION ALL SELECT 'North East','Newcastle District Probate Registry'
UNION ALL SELECT 'North East','Newcastle Moot Hall'
UNION ALL SELECT 'North East','Newcastle upon Tyne Crown Court and Magistrates Court'
UNION ALL SELECT 'Wales','Newport (South Wales) County Court and Family Court'
UNION ALL SELECT 'Wales','Newport (South Wales) Crown Court'
UNION ALL SELECT 'Wales','Newport'
UNION ALL SELECT 'Wales','Newport (South Wales) Magistrates Court'
UNION ALL SELECT 'South West','Newton Abbot Magistrates Court'
UNION ALL SELECT 'North East','Newton Aycliffe Magistrates Court'
UNION ALL SELECT 'North East','North Shields County Court and Family Court'
UNION ALL SELECT 'South West','North Somerset Magistrates Court'
UNION ALL SELECT 'Midlands','North Staffordshire Justice Centre'
UNION ALL SELECT 'North East','North Tyneside Magistrates Court'
UNION ALL SELECT 'Midlands','Northampton Crown, County and Family Court'
UNION ALL SELECT 'Midlands','Northampton Magistrates Court'
UNION ALL SELECT 'Midlands','Northampton Social Security and Child Support Tribunal'
UNION ALL SELECT 'South East','Norwich Combined Court Centre'
UNION ALL SELECT 'South East','Norwich Magistrates Court and Family Court'
UNION ALL SELECT 'South East','Norwich Social Security and Child Support Tribunal'
UNION ALL SELECT 'Midlands','Nottingham County Court and Family Court'
UNION ALL SELECT 'Midlands','Nottingham Magistrates Court'
UNION ALL SELECT 'Midlands','Nottingham Crown Court'
UNION ALL SELECT 'Midlands','Nottingham Social Security and Child Support Tribunal'
UNION ALL SELECT 'South East','Oxford Magistrates Court'
UNION ALL SELECT 'South East','Oxford Combined Court Centre'
UNION ALL SELECT 'South East','Peterborough Combined Court Centre'
UNION ALL SELECT 'South East','Peterborough Magistrates Court'
UNION ALL SELECT 'North East','Peterlee Magistrates Court'
UNION ALL SELECT 'South West','Plymouth Combined Court'
UNION ALL SELECT 'South West','Plymouth Magistrates Court'
UNION ALL SELECT 'Wales','Pontypridd County Court and Family Court'
UNION ALL SELECT 'South West','Poole Magistrates Court'
UNION ALL SELECT 'Wales','Port Talbot Justice Centre'
UNION ALL SELECT 'South West','Portsmouth Combined Court Centre'
UNION ALL SELECT 'South West','Portsmouth Magistrates Court'
UNION ALL SELECT 'Wales','Prestatyn Justice Centre'
UNION ALL SELECT 'North West','Preston Combined Court Centre'
UNION ALL SELECT 'North West','Preston Crown Court and Family Court (Sessions House)'
UNION ALL SELECT 'North West','Preston Magistrates Court'
UNION ALL SELECT 'South East','Reading County Court and Family Court'
UNION ALL SELECT 'South East','Reading Crown Court'
UNION ALL SELECT 'South East','Reading Magistrates Court and Family Court'
UNION ALL SELECT 'South East','Reading Tribunal Hearing Centre'
UNION ALL SELECT 'Midlands','Redditch Magistrates Court'
UNION ALL SELECT 'North West','Reedley Family Hearing Centre'
UNION ALL SELECT 'North West','Rochdale Social Security and Child Support Tribunal'
UNION ALL SELECT 'London','Rolls Building'
UNION ALL SELECT 'London','Romford County Court and Family Court'
UNION ALL SELECT 'London','Romford Magistrates Court (formerly Havering Magistrates Court)'
UNION ALL SELECT 'London (RCJ)','Royal Courts of Justice'
UNION ALL SELECT 'South West','Salisbury Law Courts'
UNION ALL SELECT 'North East','Scarborough Justice Centre'
UNION ALL SELECT 'North West','Sefton Magistrates Court'
UNION ALL SELECT 'South East','Sevenoaks Magistrates Court and Family Court'
UNION ALL SELECT 'North East','Sheffield Combined Court Centre'
UNION ALL SELECT 'North East','Sheffield Designated Family Court'
UNION ALL SELECT 'North East','Sheffield Magistrates Court'
UNION ALL SELECT 'Midlands','Shrewsbury Crown Court'
UNION ALL SELECT 'North East','Skipton County Court and Family Court'
UNION ALL SELECT 'North East','Skipton Magistrates Court'
UNION ALL SELECT 'South East','Slough County Court and Family Court'
UNION ALL SELECT 'London','Snaresbrook Crown Court'
UNION ALL SELECT 'North East','South Tyneside Magistrates Court'
UNION ALL SELECT 'North East','South Tyneside County Court and Family Court'
UNION ALL SELECT 'South West','Southampton Hearing Centre'
UNION ALL SELECT 'South East','Southend County Court and Family Court'
UNION ALL SELECT 'South East','Southend Crown Court'
UNION ALL SELECT 'South East','Southend Magistrates Court'
UNION ALL SELECT 'London','Southwark Crown Court'
UNION ALL SELECT 'South East','St Albans Crown Court'
UNION ALL SELECT 'South East','St Albans Magistrates Court'
UNION ALL SELECT 'North West','St Helens County Court and Family Court'
UNION ALL SELECT 'Midlands','Stafford Combined Court Centre'
UNION ALL SELECT 'South East','Staines County Court and Family Court'
UNION ALL SELECT 'South East','Staines Magistrates Court and Family Court'
UNION ALL SELECT 'South East','Stevenage Magistrates Court'
UNION ALL SELECT 'Scotland','Stirling Wallace House'
UNION ALL SELECT 'North West','Stockport County Court and Family Court'
UNION ALL SELECT 'North West','Stockport Magistrates Court'
UNION ALL SELECT 'Midlands','Stoke-on-Trent Combined Court'
UNION ALL SELECT 'London','Stratford Magistrates Court (and Stratford Housing Centre)'
UNION ALL SELECT 'North East','Sunderland County, Family, Magistratesí and Tribunal Hearings'
UNION ALL SELECT 'London','Sutton Social Security and Child Support Tribunal'
UNION ALL SELECT 'Wales','Swansea Civil Justice Centre'
UNION ALL SELECT 'Wales','Swansea Crown Court'
UNION ALL SELECT 'Wales','Swansea Magistrates Court'
UNION ALL SELECT 'South West','Swindon Combined Court'
UNION ALL SELECT 'South West','Swindon Magistrates Court'
UNION ALL SELECT 'North West','Tameside Magistrates Court'
UNION ALL SELECT 'South West','Taunton Crown, County and Family Court'
UNION ALL SELECT 'South West','Taunton Magistrates Court, Tribunals and Family Hearing Centre'
UNION ALL SELECT 'London','Taylor House Tribunal Hearing Centre'
UNION ALL SELECT 'North East','Teesside Combined Court Centre'
UNION ALL SELECT 'North East','Teesside Magistrates Court'
UNION ALL SELECT 'North East','Teesside Combined Court Centre'
UNION ALL SELECT 'Midlands','Telford County Court and Family Court'
UNION ALL SELECT 'Midlands','Telford Magistrates Court'
UNION ALL SELECT 'London','Thames Magistrates Court'
UNION ALL SELECT 'South West','Torquay and Newton Abbot County Court and Family Court'
UNION ALL SELECT 'South West','Truro Combined Court'
UNION ALL SELECT 'South West','Truro Magistrates Court'
UNION ALL SELECT 'London','Uxbridge County Court and Family Court'
UNION ALL SELECT 'London','Uxbridge Magistrates Court'
UNION ALL SELECT 'North East','Wakefield Civil and Family Justice Centre'
UNION ALL SELECT 'Midlands','Walsall County and Family Court'
UNION ALL SELECT 'Midlands','Walsall Magistrates Court'
UNION ALL SELECT 'London','Wandsworth County Court and Family Court'
UNION ALL SELECT 'North West','Warrington Crown Court'
UNION ALL SELECT 'North West','Warrington Magistrates Court'
UNION ALL SELECT 'Midlands','Warwick Combined Court'
UNION ALL SELECT 'South East','Watford County Court and Family Court'
UNION ALL SELECT 'South East','Watford Tribunal Hearing Centre'
UNION ALL SELECT 'Midlands','Wellingborough Magistrates Court'
UNION ALL SELECT 'Wales','Welshpool Magistrates Court'
UNION ALL SELECT 'North West','West Cumbria Courthouse'
UNION ALL SELECT 'South West','West Hampshire (Southampton) Magistrates Court'
UNION ALL SELECT 'London','West London Family Court'
UNION ALL SELECT 'London','Westminster Magistrates Court'
UNION ALL SELECT 'South West','Weymouth Combined Court'
UNION ALL SELECT 'North West','Wigan and Leigh Magistrates Court'
UNION ALL SELECT 'North West','Wigan County Court and Family Court'
UNION ALL SELECT 'London','Willesden County Court and Family Court'
UNION ALL SELECT 'London','Willesden Magistrates Court'
UNION ALL SELECT 'London','Wimbledon Magistrates Court'
UNION ALL SELECT 'South West','Winchester Combined Court Centre'
UNION ALL SELECT 'North West','Wirral Magistrates Court'
UNION ALL SELECT 'Midlands','Wolverhampton Combined Court Centre'
UNION ALL SELECT 'Midlands','Wolverhampton Magistrates Court'
UNION ALL SELECT 'London','Wood Green Crown Court'
UNION ALL SELECT 'London','Woolwich Crown Court'
UNION ALL SELECT 'Midlands','Worcester Combined Court'
UNION ALL SELECT 'Midlands','Worcester Justice Centre'
UNION ALL SELECT 'South East','Worthing County Court and Family Court'
UNION ALL SELECT 'South East','Worthing Magistrates Court'
UNION ALL SELECT 'Wales','Wrexham County and Family Court'
UNION ALL SELECT 'Wales','Wrexham Magistrates Court'
UNION ALL SELECT 'South East','Yarl''s Wood Immigration and Asylum Hearing Centre'
UNION ALL SELECT 'South West','Yeovil County, Family and Magistrates Court'
UNION ALL SELECT 'North East','York County Court and Family Court'
UNION ALL SELECT 'North East','York Crown Court'
UNION ALL SELECT 'North East','York Magistrates Court and Family Court'
UNION ALL SELECT 'London','London Property Tribunal'
UNION ALL SELECT 'South East','Eastern Property Tribunal'
UNION ALL SELECT 'Midlands','Midlands Property Tribunal'
UNION ALL SELECT 'South West','Southern Property Tribunal'
UNION ALL SELECT 'North East','Northern Property Tribunal'
UNION ALL SELECT 'National','Crown Court'
UNION ALL SELECT 'National','Mental Health Tribunal'
UNION ALL SELECT 'N. Ireland','Laganside Courts'
UNION ALL SELECT 'Midlands','Mary Seacole House - Birmingham'
UNION ALL SELECT 'South East','Goodmayes Hospital - Essex'
UNION ALL SELECT 'South East','Huntercombe Roehampton Hospital'
UNION ALL SELECT 'Midlands','Ardenleigh - Birmingham';
GO

--SELECT top 100 * FROM dbo.vwRegion ORDER BY HearingVenueName
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwJurisdiction'))
	EXEC('CREATE VIEW dbo.vwJurisdiction AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwJurisdiction AS 
SELECT 'Civil' AS Jurisdiction,'Civil' AS CaseType
UNION ALL SELECT 'Family','Family'
UNION ALL SELECT 'Civil','Civil Money Claims'
UNION ALL SELECT 'Family','Divorce'
UNION ALL SELECT 'Family','Adoption'
UNION ALL SELECT 'Family','Placement'
UNION ALL SELECT 'Family','Financial Remedy'
UNION ALL SELECT 'Family','Children Act'
UNION ALL SELECT 'Family','Family Law Act'
UNION ALL SELECT 'Family','Private Law'
UNION ALL SELECT 'Family','Public Law - Care'
UNION ALL SELECT 'Tribunal','Upper Tribunal Administrative Appeals Chamber'
UNION ALL SELECT 'Tribunal','Upper Tribunal Immigration and Asylum Chamber'
UNION ALL SELECT 'Tribunal','Upper Tribunal Lands Chamber'
UNION ALL SELECT 'Tribunal','Employment Appeals Tribunal'
UNION ALL SELECT 'Tribunal','Upper Tribunal Tax'
UNION ALL SELECT 'Tribunal','Immigration and Asylum'
UNION ALL SELECT 'Tribunal','SSCS Tribunal'
UNION ALL SELECT 'Tribunal','Asylum Support'
UNION ALL SELECT 'Tribunal','Employment Tribunal'
UNION ALL SELECT 'Tribunal','Land Registration'
UNION ALL SELECT 'Tribunal','Housing Act'
UNION ALL SELECT 'Tribunal','Housing & Planning Act'
UNION ALL SELECT 'Tribunal','Leasehold Enfranchisement'
UNION ALL SELECT 'Tribunal','Leasehold Management'
UNION ALL SELECT 'Tribunal','Park Homes'
UNION ALL SELECT 'Tribunal','Rents'
UNION ALL SELECT 'Tribunal','Right to buy'
UNION ALL SELECT 'Tribunal','Court of Appeal Criminal Division'
UNION ALL SELECT 'Tribunal','Criminal Injuries Compensation (CIC)'
UNION ALL SELECT 'Tribunal','War Pension'
UNION ALL SELECT 'Tribunal','Mental Health'
UNION ALL SELECT 'Tribunal','Special Educational Needs and Disability'
UNION ALL SELECT 'Tribunal','GRC - Charity'
UNION ALL SELECT 'Tribunal','GRC - CRB'
UNION ALL SELECT 'Tribunal','GRC - DVSA'
UNION ALL SELECT 'Tribunal','GRC - EJ'
UNION ALL SELECT 'Tribunal','GRC - Estate Agents'
UNION ALL SELECT 'Tribunal','GRC - Food'
UNION ALL SELECT 'Tribunal','GRC - Environment'
UNION ALL SELECT 'Tribunal','GRC - Gambling'
UNION ALL SELECT 'Tribunal','GRC - Immigration Services'
UNION ALL SELECT 'Tribunal','GRC - Information Rights'
UNION ALL SELECT 'Tribunal','GRC - Pensions Regulation'
UNION ALL SELECT 'Tribunal','GRC - Professional Regulations'
UNION ALL SELECT 'Tribunal','GRC - Query Jurisdiction'
UNION ALL SELECT 'Tribunal','GRC - Welfare of Animals'
UNION ALL SELECT 'Tribunal','Tax'
;
GO
												

--SELECT top 100 * FROM dbo.vwJurisdiction ORDER BY [CaseType]
--GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwConferenceDuration'))
	EXEC('CREATE VIEW dbo.vwConferenceDuration AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwConferenceDuration AS
WITH cs AS (
	SELECT cs.ConferenceId
		,cs.timestamp
		,LEAD(timestamp) OVER (PARTITION BY cs.ConferenceId ORDER BY timestamp, id) AS next_timestamp
		,re.EnumString AS StateDesc
	FROM dbo.ConferenceStatus cs
	INNER JOIN dbo.ReportingEnums re
		ON re.EnumNumber = cs.ConferenceState
		AND re.EnumName = 'dbo.ConferenceStatus.ConferenceState'
	WHERE (try_convert(time,cs.TimeStamp) > '05:30:00' 
	OR try_convert(time,cs.TimeStamp) < '02:00:00'))
,ps AS (
	SELECT p.ConferenceId
		,ps.timestamp
		,LEAD(timestamp) OVER (PARTITION BY p.ConferenceId ORDER BY ps.timestamp, ps.id) AS next_timestamp
		,re.EnumString AS StateDesc
	FROM dbo.ParticipantStatus ps
	INNER JOIN dbo.Participant p
	ON p.Id = ps.ParticipantId
	INNER JOIN dbo.ReportingEnums re
		ON re.EnumNumber = ps.ParticipantState
		AND re.EnumName = 'dbo.ParticipantStatus.ParticipantState'
	WHERE (try_convert(time,ps.TimeStamp) > '05:30:00' 
	OR try_convert(time,ps.TimeStamp) < '02:00:00'))
,ms AS (
	SELECT cs.ConferenceId
		,cs.TimeStamp
		,ps.next_timestamp
	FROM cs
	INNER JOIN ps
	ON ps.ConferenceId = cs.ConferenceId
	WHERE cs.StateDesc = 'InSession'
	AND ps.StateDesc IN ('InHearing','InConsultation')
	AND cs.next_timestamp IS NULL
	AND ps.next_timestamp >= cs.TimeStamp
)
SELECT cs.ConferenceId
	,MIN(cs.timestamp) as [Hearing Start]
	,MAX(ISNULL(cs.next_timestamp,ms.next_timestamp)) AS [Hearing End]
	,DATEDIFF(minute, MIN(cs.timestamp), MAX(ISNULL(cs.next_timestamp,ms.next_timestamp))) AS [Hearing Duration]
	,SUM(DATEDIFF(minute, cs.timestamp, ISNULL(cs.next_timestamp,ms.next_timestamp))) AS [In Session Duration]
FROM cs
LEFT JOIN ms
ON ms.ConferenceId = cs.ConferenceId
AND ms.TimeStamp = cs.TimeStamp
WHERE cs.StateDesc = 'InSession'
GROUP BY cs.ConferenceId;
GO

--SELECT top 100 * FROM dbo.vwConferenceDuration ORDER BY [ConferenceId]
--GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwEvent'))
	EXEC('CREATE VIEW dbo.vwEvent AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwEvent AS
SELECT ev.Id AS [Event.Id]
	,ev.ConferenceId AS [Event.ConferenceId]
	,cd.[Hearing Start]
	,cd.[Hearing End]
	,cd.[Hearing Duration]
	,cd.[In Session Duration]

	,ev.ExternalEventId AS [Event.ExternalEventId]
	,ev.EventType AS [Event.EventType]
	,ISNULL(let.EnumString,'Unknown') AS [Event.EventType.Desc]
	,ev.ExternalTimestamp AS [Event.ExternalTimestamp]
	,ev.ParticipantId AS [Event.ParticipantId]
	,ev.TransferredFrom AS [Event.TransferredFrom]
	,ev.TransferredTo AS [Event.TransferredTo]
	,ev.Reason AS [Event.Reason]
	,ev.Timestamp AS [Event.Timestamp]
	,ev.EndpointFlag AS [Event.EndpointFlag]
	,ev.Phone AS [Event.Phone]
	,ev.TransferredFromRoomLabel AS [Event.TransferredFromRoomLabel]
	,ev.TransferredToRoomLabel AS [Event.TransferredToRoomLabel]
	,ev.ParticipantRoomId AS [Event.ParticipantRoomId]

	,c.HearingRefId AS [Conference.HearingRefId]
	,c.CaseType AS [Conference.CaseType]
	,ISNULL(j.Jurisdiction,'N/A') AS Jurisdiction
	,c.ScheduledDateTime AS [Conference.ScheduledDateTime]
	,c.CaseNumber AS [Conference.CaseNumber]
	,c.CaseName AS [Conference.CaseName]
	,c.ScheduledDuration AS [Conference.ScheduledDuration]
	,c.AdminUri AS [Conference.AdminUri]
	,c.JudgeUri AS [Conference.JudgeUri]
	,c.ParticipantUri AS [Conference.ParticipantUri]
	,c.PexipNode AS [Conference.PexipNode]
	,c.State AS [Conference.State]
	,ISNULL(lcs.EnumString,'Unknown') AS [Conference.State.Desc]
	,c.ClosedDateTime AS [Conference.ClosedDateTime]
	,c.HearingVenueName AS [Conference.HearingVenueName]
	,ISNULL(rg.Region,'N/A') AS Region
	,c.AudioRecordingRequired AS [Conference.AudioRecordingRequired]
	,c.IngestUrl AS [Conference.IngestUrl]
	,c.ActualStartTime AS [Conference.ActualStartTime]
	,c.TelephoneConferenceId AS [Conference.TelephoneConferenceId]
	,c.CreatedDateTime AS [Conference.CreatedDateTime]
	,ISNULL(ep.HybridHearingFlag,0) AS [Conference.HybridHearingFlag]
	,ISNULL(r.RoomCount,0) AS [Conference.RoomCount]

	,p.ParticipantRefId AS [Participant.ParticipantRefId]
	,p.Name AS [Participant.Name]
	,p.DisplayName AS [Participant.DisplayName]
	,p.Username AS [Participant.Username]
	,p.UserRole AS [Participant.UserRole]
	,ISNULL(lur.EnumString,'Unknown') AS [Participant.UserRoleDesc]
	,p.CaseTypeGroup AS [Participant.CaseTypeGroup]
	,p.Representee AS [Participant.Representee]
	,p.TestCallResultId AS [Participant.TestCallResultId]
	,p.CurrentRoom AS [Participant.CurrentRoom]
	,p.State AS [Participant.State]
	,ISNULL(lps.EnumString,'Unknown') AS [Participant.State.Desc]
	,p.FirstName AS [Participant.FirstName]
	,p.LastName AS [Participant.LastName]
	,p.ContactEmail AS [Participant.ContactEmail]
	,p.ContactTelephone AS [Participant.ContactTelephone]
	,p.HearingRole AS [Participant.HearingRole]
	,p.CurrentConsultationRoomId AS [Participant.CurrentConsultationRoomId]
	,p.Discriminator AS [Participant.Discriminator]
	
FROM dbo.Event ev
LEFT JOIN dbo.Conference c
	ON c.Id = ev.ConferenceId
LEFT JOIN dbo.vwConferenceDuration cd
	ON cd.ConferenceId = ev.ConferenceId
LEFT JOIN dbo.Participant p
	ON p.Id = ev.ParticipantId
LEFT JOIN dbo.ReportingEnums let
	ON let.EnumName = 'dbo.Event.EventType'
	AND let.EnumNumber = ev.EventType
LEFT JOIN dbo.ReportingEnums lcs
	ON lcs.EnumName = 'dbo.Conference.State'
	AND lcs.EnumNumber = c.State
LEFT JOIN dbo.ReportingEnums lps
	ON lps.EnumName = 'dbo.Participant.State'
	AND lps.EnumNumber = p.State
LEFT JOIN dbo.ReportingEnums lur
	ON lur.EnumName = 'dbo.Participant.UserRole'
	AND lur.EnumNumber = p.UserRole
LEFT JOIN dbo.vwRegion rg
	ON c.HearingVenueName = rg.HearingVenueName
LEFT JOIN dbo.vwJurisdiction j
	ON j.CaseType = c.CaseType
OUTER APPLY (
	SELECT TOP(1) 1 AS HybridHearingFlag
	FROM dbo.EndPoint ep
	WHERE ep.ConferenceId = c.Id ) ep
OUTER APPLY (
	SELECT COUNT(*) AS RoomCount
	FROM dbo.Room r
	WHERE r.ConferenceId = c.Id) r
GO

--SELECT top 100 * FROM dbo.vwEvent ORDER BY [Event.ParticipantId] DESC, [Event.TimeStamp]
--GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwParticipantStatus'))
	EXEC('CREATE VIEW dbo.vwParticipantStatus AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwParticipantStatus AS
SELECT ps.Id AS [ParticipantStatus.Id]
	,ps.ParticipantState AS [ParticipantStatus.ParticipantState]
	,ISNULL(lpss.EnumString,'Unknown') AS [ParticipantStatus.ParticipantState.Desc]
	,ps.TimeStamp AS [ParticipantStatus.TimeStamp]
	,ps.ParticipantId AS [ParticipantStatus.ParticipantId]

	,p.ParticipantRefId AS [Participant.ParticipantRefId]
	,p.Name AS [Participant.Name]
	,p.DisplayName AS [Participant.DisplayName]
	,p.Username AS [Participant.Username]
	,p.UserRole AS [Participant.UserRole]
	,ISNULL(lur.EnumString,'Unknown') AS [Participant.UserRoleDesc]
	,p.CaseTypeGroup AS [Participant.CaseTypeGroup]
	,p.Representee AS [Participant.Representee]
	,p.TestCallResultId AS [Participant.TestCallResultId]
	,p.CurrentRoom AS [Participant.CurrentRoom]
	,p.State AS [Participant.State]
	,ISNULL(lps.EnumString,'Unknown') AS [Participant.State.Desc]
	,p.FirstName AS [Participant.FirstName]
	,p.LastName AS [Participant.LastName]
	,p.ContactEmail AS [Participant.ContactEmail]
	,p.ContactTelephone AS [Participant.ContactTelephone]
	,p.HearingRole AS [Participant.HearingRole]
	,p.CurrentConsultationRoomId AS [Participant.CurrentConsultationRoomId]
	,p.Discriminator AS [Participant.Discriminator]

	,c.Id AS [Conference.Id]
	,cd.[Hearing Start]
	,cd.[Hearing End]
	,cd.[Hearing Duration]
	,cd.[In Session Duration]
	,c.HearingRefId AS [Conference.HearingRefId]
	,c.CaseType AS [Conference.CaseType]
	,ISNULL(j.Jurisdiction,'N/A') AS Jurisdiction
	,c.ScheduledDateTime AS [Conference.ScheduledDateTime]
	,c.CaseNumber AS [Conference.CaseNumber]
	,c.CaseName AS [Conference.CaseName]
	,c.ScheduledDuration AS [Conference.ScheduledDuration]
	,c.AdminUri AS [Conference.AdminUri]
	,c.JudgeUri AS [Conference.JudgeUri]
	,c.ParticipantUri AS [Conference.ParticipantUri]
	,c.PexipNode AS [Conference.PexipNode]
	,c.State AS [Conference.State]
	,ISNULL(lcs.EnumString,'Unknown') AS [Conference.State.Desc]
	,c.ClosedDateTime AS [Conference.ClosedDateTime]
	,c.HearingVenueName AS [Conference.HearingVenueName]
	,ISNULL(rg.Region,'N/A') AS Region
	,c.AudioRecordingRequired AS [Conference.AudioRecordingRequired]
	,c.IngestUrl AS [Conference.IngestUrl]
	,c.ActualStartTime AS [Conference.ActualStartTime]
	,c.TelephoneConferenceId AS [Conference.TelephoneConferenceId]
	,c.CreatedDateTime AS [Conference.CreatedDateTime]
	,ISNULL(ep.HybridHearingFlag,0) AS [Conference.HybridHearingFlag]
	,ISNULL(r.RoomCount,0) AS [Conference.RoomCount]

FROM dbo.ParticipantStatus ps
LEFT JOIN dbo.Participant p
	ON p.Id = ps.ParticipantId
LEFT JOIN dbo.Conference c
	ON c.Id = p.ConferenceId
LEFT JOIN dbo.vwConferenceDuration cd
	ON cd.ConferenceId = p.ConferenceId
LEFT JOIN dbo.ReportingEnums lpss
	ON lpss.EnumName = 'dbo.ParticipantStatus.ParticipantState'
	AND lpss.EnumNumber = ps.ParticipantState
LEFT JOIN dbo.ReportingEnums lps
	ON lps.EnumName = 'dbo.Participant.State'
	AND lps.EnumNumber = p.State
LEFT JOIN dbo.ReportingEnums lur
	ON lur.EnumName = 'dbo.Participant.UserRole'
	AND lur.EnumNumber = p.UserRole
LEFT JOIN dbo.ReportingEnums lcs
	ON lcs.EnumName = 'dbo.Conference.State'
	AND lcs.EnumNumber = c.State
LEFT JOIN dbo.vwRegion rg
	ON c.HearingVenueName = rg.HearingVenueName
LEFT JOIN dbo.vwJurisdiction j
	ON j.CaseType = c.CaseType
OUTER APPLY (
	SELECT TOP(1) 1 AS HybridHearingFlag
	FROM dbo.EndPoint ep
	WHERE ep.ConferenceId = c.Id ) ep
OUTER APPLY (
	SELECT COUNT(*) AS RoomCount
	FROM dbo.Room r
	WHERE r.ConferenceId = c.Id) r
GO

--SELECT top 100 * FROM dbo.vwParticipantStatus ORDER BY [ParticipantStatus.ParticipantId] DESC, [ParticipantStatus.TimeStamp]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwConferenceStatus'))
	EXEC('CREATE VIEW dbo.vwConferenceStatus AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwConferenceStatus AS
SELECT cs.Id AS [ConferenceStatus.Id]
	,cs.ConferenceState AS [ConferenceStatus.ConferenceState]
	,ISNULL(lcss.EnumString,'Unknown') AS [ConferenceStatus.ConferenceState.Desc]
	,cs.TimeStamp AS [ConferenceStatus.TimeStamp]
	,cs.ConferenceId AS [ConferenceStatus.ConferenceId]
	,cd.[Hearing Start]
	,cd.[Hearing End]
	,cd.[Hearing Duration]
	,cd.[In Session Duration]

	,c.HearingRefId AS [Conference.HearingRefId]
	,c.CaseType AS [Conference.CaseType]
	,ISNULL(j.Jurisdiction,'N/A') AS Jurisdiction
	,c.ScheduledDateTime AS [Conference.ScheduledDateTime]
	,c.CaseNumber AS [Conference.CaseNumber]
	,c.CaseName AS [Conference.CaseName]
	,c.ScheduledDuration AS [Conference.ScheduledDuration]
	,c.AdminUri AS [Conference.AdminUri]
	,c.JudgeUri AS [Conference.JudgeUri]
	,c.ParticipantUri AS [Conference.ParticipantUri]
	,c.PexipNode AS [Conference.PexipNode]
	,c.State AS [Conference.State]
	,ISNULL(lcs.EnumString,'Unknown') AS [Conference.State.Desc]
	,c.ClosedDateTime AS [Conference.ClosedDateTime]
	,c.HearingVenueName AS [Conference.HearingVenueName]
	,ISNULL(rg.Region,'N/A') AS Region
	,c.AudioRecordingRequired AS [Conference.AudioRecordingRequired]
	,c.IngestUrl AS [Conference.IngestUrl]
	,c.ActualStartTime AS [Conference.ActualStartTime]
	,c.TelephoneConferenceId AS [Conference.TelephoneConferenceId]
	,c.CreatedDateTime AS [Conference.CreatedDateTime]
	,ISNULL(r.RoomCount,0) AS [Conference.RoomCount]

FROM dbo.ConferenceStatus cs
LEFT JOIN dbo.Conference c
	ON c.Id = cs.ConferenceId
LEFT JOIN dbo.vwConferenceDuration cd
	ON cd.ConferenceId = cs.ConferenceId
LEFT JOIN dbo.ReportingEnums lcss
	ON lcss.EnumName = 'dbo.ConferenceStatus.ConferenceState'
	AND lcss.EnumNumber = cs.ConferenceState
LEFT JOIN dbo.ReportingEnums lcs
	ON lcs.EnumName = 'dbo.Conference.State'
	AND lcs.EnumNumber = c.State
LEFT JOIN dbo.vwRegion rg
	ON c.HearingVenueName = rg.HearingVenueName
LEFT JOIN dbo.vwJurisdiction j
	ON j.CaseType = c.CaseType
OUTER APPLY (
	SELECT COUNT(*) AS RoomCount
	FROM dbo.Room r
	WHERE r.ConferenceId = c.Id) r
GO

--SELECT top 100 * FROM dbo.vwConferenceStatus ORDER BY [ConferenceStatus.ConferenceId] DESC, [ConferenceStatus.TimeStamp]
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwEndpoint'))
	EXEC('CREATE VIEW dbo.vwEndpoint AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwEndpoint AS
SELECT ep.Id AS [EndPoint.Id]
	,ep.DisplayName AS [EndPoint.DisplayName]
	,ep.SipAddress AS [EndPoint.SipAddress]
	,ep.Pin AS [EndPoint.Pin]
	,ep.State AS [EndPoint.State]
	,ep.ConferenceId AS [EndPoint.ConferenceId]
	,cd.[Hearing Start]
	,cd.[Hearing End]
	,cd.[Hearing Duration]
	,cd.[In Session Duration]
	,ep.DefenceAdvocate AS [EndPoint.DefenceAdvocate]
	,ep.CurrentRoom AS [EndPoint.CurrentRoom]
	,ep.CurrentConsultationRoomId AS [EndPoint.CurrentConsultationRoomId]

	,c.HearingRefId AS [Conference.HearingRefId]
	,c.CaseType AS [Conference.CaseType]
	,ISNULL(j.Jurisdiction,'N/A') AS Jurisdiction
	,c.ScheduledDateTime AS [Conference.ScheduledDateTime]
	,c.CaseNumber AS [Conference.CaseNumber]
	,c.CaseName AS [Conference.CaseName]
	,c.ScheduledDuration AS [Conference.ScheduledDuration]
	,c.AdminUri AS [Conference.AdminUri]
	,c.JudgeUri AS [Conference.JudgeUri]
	,c.ParticipantUri AS [Conference.ParticipantUri]
	,c.PexipNode AS [Conference.PexipNode]
	,c.State AS [Conference.State]
	,ISNULL(lcs.EnumString,'Unknown') AS [Conference.State.Desc]
	,c.ClosedDateTime AS [Conference.ClosedDateTime]
	,c.HearingVenueName AS [Conference.HearingVenueName]
	,ISNULL(rg.Region,'N/A') AS Region
	,c.AudioRecordingRequired AS [Conference.AudioRecordingRequired]
	,c.IngestUrl AS [Conference.IngestUrl]
	,c.ActualStartTime AS [Conference.ActualStartTime]
	,c.TelephoneConferenceId AS [Conference.TelephoneConferenceId]
	,c.CreatedDateTime AS [Conference.CreatedDateTime]
	,ISNULL(r.RoomCount,0) AS [Conference.RoomCount]

FROM dbo.Endpoint ep
LEFT JOIN dbo.Conference c
	ON c.Id = ep.ConferenceId
LEFT JOIN dbo.vwConferenceDuration cd
	ON cd.ConferenceId = ep.ConferenceId
LEFT JOIN dbo.ReportingEnums lcs
	ON lcs.EnumName = 'dbo.Conference.State'
	AND lcs.EnumNumber = c.State
LEFT JOIN dbo.vwRegion rg
	ON c.HearingVenueName = rg.HearingVenueName
LEFT JOIN dbo.vwJurisdiction j
	ON j.CaseType = c.CaseType
OUTER APPLY (
	SELECT COUNT(*) AS RoomCount
	FROM dbo.Room r
	WHERE r.ConferenceId = c.Id) r
GO

--SELECT top 100 * FROM dbo.vwEndpoint ORDER BY [EndPoint.ConferenceId] DESC
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwHeartbeat'))
	EXEC('CREATE VIEW dbo.vwHeartbeat AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwHeartbeat AS
SELECT hb.Id AS [Heartbeat.Id]
	,hb.ConferenceId AS [Heartbeat.ConferenceId]
	,cd.[Hearing Start]
	,cd.[Hearing End]
	,cd.[Hearing Duration]
	,cd.[In Session Duration]
	,hb.ParticipantId AS [Heartbeat.ParticipantId]
	,hb.OutgoingAudioPercentageLost AS [Heartbeat.OutgoingAudioPercentageLost]
	,hb.OutgoingAudioPercentageLostRecent AS [Heartbeat.OutgoingAudioPercentageLostRecent]
	,hb.IncomingAudioPercentageLost AS [Heartbeat.IncomingAudioPercentageLost]
	,hb.IncomingAudioPercentageLostRecent AS [Heartbeat.IncomingAudioPercentageLostRecent]
	,hb.OutgoingVideoPercentageLost AS [Heartbeat.OutgoingVideoPercentageLost]
	,hb.OutgoingVideoPercentageLostRecent AS [Heartbeat.OutgoingVideoPercentageLostRecent]
	,hb.IncomingVideoPercentageLost AS [Heartbeat.IncomingVideoPercentageLost]
	,hb.IncomingVideoPercentageLostRecent AS [Heartbeat.IncomingVideoPercentageLostRecent]
	,hb.TimeStamp AS [Heartbeat.TimeStamp]
	,hb.BrowserName AS [Heartbeat.BrowserName]
	,hb.BrowserVersion AS [Heartbeat.BrowserVersion]
	,hb.OperatingSystem AS [Heartbeat.OperatingSystem]
	,hb.OperatingSystemVersion AS [Heartbeat.OperatingSystemVersion]

	,c.HearingRefId AS [Conference.HearingRefId]
	,c.CaseType AS [Conference.CaseType]
	,ISNULL(j.Jurisdiction,'N/A') AS Jurisdiction
	,c.ScheduledDateTime AS [Conference.ScheduledDateTime]
	,c.CaseNumber AS [Conference.CaseNumber]
	,c.CaseName AS [Conference.CaseName]
	,c.ScheduledDuration AS [Conference.ScheduledDuration]
	,c.AdminUri AS [Conference.AdminUri]
	,c.JudgeUri AS [Conference.JudgeUri]
	,c.ParticipantUri AS [Conference.ParticipantUri]
	,c.PexipNode AS [Conference.PexipNode]
	,c.State AS [Conference.State]
	,ISNULL(lcs.EnumString,'Unknown') AS [Conference.State.Desc]
	,c.ClosedDateTime AS [Conference.ClosedDateTime]
	,c.HearingVenueName AS [Conference.HearingVenueName]
	,ISNULL(rg.Region,'N/A') AS Region
	,c.AudioRecordingRequired AS [Conference.AudioRecordingRequired]
	,c.IngestUrl AS [Conference.IngestUrl]
	,c.ActualStartTime AS [Conference.ActualStartTime]
	,c.TelephoneConferenceId AS [Conference.TelephoneConferenceId]
	,c.CreatedDateTime AS [Conference.CreatedDateTime]
	,ISNULL(ep.HybridHearingFlag,0) AS [Conference.HybridHearingFlag]
	,ISNULL(r.RoomCount,0) AS [Conference.RoomCount]

	,p.ParticipantRefId AS [Participant.ParticipantRefId]
	,p.Name AS [Participant.Name]
	,p.DisplayName AS [Participant.DisplayName]
	,p.Username AS [Participant.Username]
	,p.UserRole AS [Participant.UserRole]
	,ISNULL(lur.EnumString,'Unknown') AS [Participant.UserRoleDesc]
	,p.CaseTypeGroup AS [Participant.CaseTypeGroup]
	,p.Representee AS [Participant.Representee]
	,p.TestCallResultId AS [Participant.TestCallResultId]
	,p.CurrentRoom AS [Participant.CurrentRoom]
	,p.State AS [Participant.State]
	,ISNULL(lps.EnumString,'Unknown') AS [Participant.State.Desc]
	,p.FirstName AS [Participant.FirstName]
	,p.LastName AS [Participant.LastName]
	,p.ContactEmail AS [Participant.ContactEmail]
	,p.ContactTelephone AS [Participant.ContactTelephone]
	,p.HearingRole AS [Participant.HearingRole]
	,p.CurrentConsultationRoomId AS [Participant.CurrentConsultationRoomId]
	,p.Discriminator AS [Participant.Discriminator]
FROM dbo.Heartbeat hb
LEFT JOIN dbo.Conference c
	ON c.Id = hb.ConferenceId
LEFT JOIN dbo.vwConferenceDuration cd
	ON cd.ConferenceId = hb.ConferenceId
LEFT JOIN dbo.Participant p
	ON p.Id = hb.ParticipantId
LEFT JOIN dbo.ReportingEnums lcs
	ON lcs.EnumName = 'dbo.Conference.State'
	AND lcs.EnumNumber = c.State
LEFT JOIN dbo.ReportingEnums lps
	ON lps.EnumName = 'dbo.Participant.State'
	AND lps.EnumNumber = p.State
LEFT JOIN dbo.ReportingEnums lur
	ON lur.EnumName = 'dbo.Participant.UserRole'
	AND lur.EnumNumber = p.UserRole
LEFT JOIN dbo.vwRegion rg
	ON c.HearingVenueName = rg.HearingVenueName
LEFT JOIN dbo.vwJurisdiction j
	ON j.CaseType = c.CaseType
OUTER APPLY (
	SELECT TOP(1) 1 AS HybridHearingFlag
	FROM dbo.EndPoint ep
	WHERE ep.ConferenceId = c.Id ) ep
OUTER APPLY (
	SELECT COUNT(*) AS RoomCount
	FROM dbo.Room r
	WHERE r.ConferenceId = c.Id) r
GO

--SELECT top 100 * FROM dbo.vwHeartbeat ORDER BY [Heartbeat.ConferenceId] DESC, [Heartbeat.TimeStamp]
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwConference'))
	EXEC('CREATE VIEW dbo.vwConference AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwConference AS
SELECT c.Id AS [Conference.ConferenceId]
	,cd.[Hearing Start]
	,cd.[Hearing End]
	,cd.[Hearing Duration]
	,cd.[In Session Duration]
	,c.HearingRefId AS [Conference.HearingRefId]
	,c.CaseType AS [Conference.CaseType]
	,ISNULL(j.Jurisdiction,'N/A') AS Jurisdiction
	,c.ScheduledDateTime AS [Conference.ScheduledDateTime]
	,c.CaseNumber AS [Conference.CaseNumber]
	,c.CaseName AS [Conference.CaseName]
	,c.ScheduledDuration AS [Conference.ScheduledDuration]
	,c.AdminUri AS [Conference.AdminUri]
	,c.JudgeUri AS [Conference.JudgeUri]
	,c.ParticipantUri AS [Conference.ParticipantUri]
	,c.PexipNode AS [Conference.PexipNode]
	,c.State AS [Conference.State]
	,ISNULL(lcs.EnumString,'Unknown') AS [Conference.State.Desc]
	,c.ClosedDateTime AS [Conference.ClosedDateTime]
	,c.HearingVenueName AS [Conference.HearingVenueName]
	,ISNULL(rg.Region,'N/A') AS Region
	,c.AudioRecordingRequired AS [Conference.AudioRecordingRequired]
	,c.IngestUrl AS [Conference.IngestUrl]
	,c.ActualStartTime AS [Conference.ActualStartTime]
	,c.TelephoneConferenceId AS [Conference.TelephoneConferenceId]
	,c.CreatedDateTime AS [Conference.CreatedDateTime]
	,ISNULL(jg.JudgeName,'NA') AS JudgeName
	,ISNULL(ep.HybridHearingFlag,0) AS [Conference.HybridHearingCount]
	,ISNULL(r.RoomCount,0) AS [Conference.RoomCount]
	,ISNULL(ic.InConsultationFlag,0) AS InConsultationFlag
	,ISNULL(pcc.PrivateConsultationCount,0) AS PrivateConsultationCount
	,ISNULL(pc.ParticipantCount,0) AS ParticipantCount
	,ISNULL(pc.QuickLinkFeatureCount,0) AS QuickLinkFeatureCount
	,ISNULL(pc.DualHostFeatureCount,0) AS DualHostFeatureCount
FROM dbo.Conference c
INNER JOIN dbo.vwConferenceDuration cd
	ON cd.ConferenceId = c.Id
LEFT JOIN dbo.ReportingEnums lcs
	ON lcs.EnumName = 'dbo.Conference.State'
	AND lcs.EnumNumber = c.State
LEFT JOIN dbo.vwRegion rg
	ON c.HearingVenueName = rg.HearingVenueName
LEFT JOIN dbo.vwJurisdiction j
	ON j.CaseType = c.CaseType
OUTER APPLY (
	SELECT TOP(1) 1 AS HybridHearingFlag
	FROM dbo.EndPoint ep
	WHERE ep.ConferenceId = c.Id ) ep
OUTER APPLY (
	SELECT COUNT(*) AS RoomCount
	FROM dbo.Room r
	WHERE r.ConferenceId = c.Id) r
OUTER APPLY (
	SELECT TOP 1 DisplayName AS JudgeName
	FROM dbo.Participant p
	INNER JOIN dbo.ReportingEnums ur
		ON ur.EnumName = 'dbo.Participant.UserRole'
		AND ur.EnumNumber = p.UserRole
		AND ur.EnumString IN ('Judge')
	WHERE p.ConferenceId = c.Id ) jg
OUTER APPLY (
	SELECT SUM(1) AS ParticipantCount
		,SUM(CASE WHEN ur.EnumString IN ('QuickLinkParticipant','QuickLinkObserver') THEN 1 ELSE 0 END) AS QuickLinkFeatureCount
		,SUM(CASE WHEN ur.EnumString = 'StaffMember' THEN 1 ELSE 0 END) AS DualHostFeatureCount
	FROM dbo.Participant p
	LEFT JOIN dbo.ReportingEnums ur
		ON ur.EnumName = 'dbo.Participant.UserRole'
		AND ur.EnumNumber = p.UserRole
		AND ur.EnumString IN ('StaffMember','QuickLinkParticipant','QuickLinkObserver')
	WHERE p.ConferenceId = c.Id ) pc
OUTER APPLY (
	SELECT TOP(1) 1 AS InConsultationFlag
	FROM dbo.Participant p
	INNER JOIN dbo.ParticipantStatus ps
		ON p.Id = ps.ParticipantId
	INNER JOIN dbo.ReportingEnums st
		ON st.EnumName = 'dbo.ParticipantStatus.ParticipantState'
		AND st.EnumNumber = ps.ParticipantState
		AND st.EnumString = 'InConsultation'
	WHERE p.ConferenceId = c.Id ) ic
OUTER APPLY (
	SELECT COUNT(*) AS PrivateConsultationCount
	FROM dbo.Room r
	INNER JOIN dbo.ReportingEnums rt
		ON rt.EnumName = 'dbo.Room.Type'
		AND rt.EnumNumber = r.Type
		AND rt.EnumString = 'ConsultationRoom'
	WHERE r.ConferenceId = c.Id
	AND ic.InConsultationFlag = 1 ) pcc
GO

--SELECT top 100 * FROM dbo.vwConference ORDER BY [Conference.ConferenceId] DESC, [Hearing Start]
GO




IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwConcurrentConferences'))
	EXEC('CREATE VIEW dbo.vwConcurrentConferences AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwConcurrentConferences AS
WITH times AS (
	SELECT TRY_CONVERT(date,[Hearing Start]) AS HearingDate, [Hearing Start] AS Timestamp, 1 AS ConferenceCount
	FROM dbo.vwConferenceDuration
	WHERE [Hearing End] is not null
	UNION ALL
	SELECT TRY_CONVERT(date,[Hearing End]) AS HearingDate, [Hearing End] AS Timestamp, -1 AS ConferenceCount
	FROM dbo.vwConferenceDuration
	WHERE [Hearing End] is not null 
	UNION ALL
	SELECT c.CalendarDate AS HearingDate, c.CalendarDateTime AS Timestamp, 0 AS ConferenceCount
	FROM dbo.vwConferenceDuration d
	INNER JOIN dbo.Calendar c
	ON c.CalendarDateTime > d.[Hearing Start] 
	AND c.CalendarDateTime < d.[Hearing End]
	WHERE d.[Hearing End] is not null	)
,concurrent AS (
	SELECT HearingDate
		,Timestamp
		,LEAD(Timestamp) OVER (ORDER BY Timestamp) AS next_Timestamp
		,SUM(ConferenceCount) OVER (ORDER BY Timestamp) AS ConcurrentConferences
	FROM times )
SELECT cc.HearingDate
	,t.TimeOfDay
	,t.MinuteOfHour
	,cc.ConcurrentConferences
FROM concurrent cc
INNER JOIN dbo.Time t
	ON t.TimeOfDay > TRY_CONVERT(time,cc.Timestamp)
	AND t.TimeOfDay <= TRY_CONVERT(time,cc.next_Timestamp)
WHERE cc.ConcurrentConferences > 0
GO


--SELECT top 100 * FROM dbo.vwConcurrentConferences WHERE HearingDate = '2021-09-10' AND MinuteOfHour IN (0,15,30,45) ORDER BY HearingDate, TimeOfDay
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwParticipantDuration'))
	EXEC('CREATE VIEW dbo.vwParticipantDuration AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwParticipantDuration AS
WITH ps AS (
	SELECT p.ConferenceId
		,ps.ParticipantId
		,ps.timestamp
		,LEAD(timestamp) OVER (PARTITION BY p.ConferenceId ORDER BY ps.timestamp, ps.id) AS next_timestamp
		,re.EnumString AS StateDesc
	FROM dbo.ParticipantStatus ps
	INNER JOIN dbo.Participant p
	ON p.Id = ps.ParticipantId
	INNER JOIN dbo.ReportingEnums re
		ON re.EnumNumber = ps.ParticipantState
		AND re.EnumName = 'dbo.ParticipantStatus.ParticipantState'
	WHERE (try_convert(time,ps.TimeStamp) > '05:30:00' 
	OR try_convert(time,ps.TimeStamp) < '02:00:00'))
SELECT ps.ConferenceId
	,ps.ParticipantId
	,MIN(ps.timestamp) as [Hearing Start]
	,MAX(ps.next_timestamp) AS [Hearing End]
	,DATEDIFF(minute, MIN(ps.timestamp), MAX(ps.next_timestamp)) AS [Hearing Duration]
	,SUM(DATEDIFF(minute, ps.timestamp, ps.next_timestamp)) AS [In Hearing Duration]
FROM ps
WHERE ps.StateDesc IN ('InHearing','InConsultation')
GROUP BY ps.ConferenceId
	,ps.ParticipantId
GO

--SELECT top 100 * FROM dbo.vwParticipantDuration WHERE [Hearing Start] > '2021-09-10' and [Hearing Start] < '2021-09-11' ORDER BY [ConferenceId], ParticipantId
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwConcurrentParticipants'))
	EXEC('CREATE VIEW dbo.vwConcurrentParticipants AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwConcurrentParticipants AS
WITH times AS (
	SELECT TRY_CONVERT(date,[Hearing Start]) AS HearingDate, [Hearing Start] AS Timestamp, 1 AS ParticipantCount
	FROM dbo.vwParticipantDuration
	WHERE [Hearing End] is not null
	UNION ALL
	SELECT TRY_CONVERT(date,[Hearing End]) AS HearingDate, [Hearing End] AS Timestamp, -1 AS ParticipantCount
	FROM dbo.vwParticipantDuration
	WHERE [Hearing End] is not null 
	UNION ALL
	SELECT c.CalendarDate AS HearingDate, c.CalendarDateTime AS Timestamp, 0 AS ParticipantCount
	FROM dbo.vwParticipantDuration d
	INNER JOIN dbo.Calendar c
		ON c.CalendarDateTime > d.[Hearing Start] 
		AND c.CalendarDateTime < d.[Hearing End]
	WHERE d.[Hearing End] is not null	)
,concurrent AS (
	SELECT HearingDate
		,Timestamp
		,LEAD(Timestamp) OVER (ORDER BY Timestamp) AS next_Timestamp
		,SUM(ParticipantCount) OVER (ORDER BY Timestamp) AS ConcurrentParticipants
	FROM times )
SELECT cc.HearingDate
	,t.TimeOfDay
	,t.MinuteOfHour
	,cc.ConcurrentParticipants
FROM concurrent cc
INNER JOIN dbo.Time t
	ON t.TimeOfDay > TRY_CONVERT(time,cc.Timestamp)
	AND t.TimeOfDay <= TRY_CONVERT(time,cc.next_Timestamp)
WHERE cc.ConcurrentParticipants > 0
GO


--SELECT top 100 * FROM dbo.vwConcurrentParticipants WHERE HearingDate = '2021-09-10' AND MinuteOfHour IN (0,15,30,45) ORDER BY HearingDate, TimeOfDay
GO


IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwConferenceCount'))
	EXEC('CREATE VIEW dbo.vwConferenceCount AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwConferenceCount AS
SELECT ConferenceId, TRY_CONVERT(date,[Hearing Start]) AS HearingDate, [Hearing Start] AS Timestamp, 1 AS ConferenceCount
FROM dbo.vwConferenceDuration
WHERE [Hearing End] is not null
UNION ALL
SELECT ConferenceId, TRY_CONVERT(date,[Hearing End]) AS HearingDate, [Hearing End] AS Timestamp, -1 AS ConferenceCount
FROM dbo.vwConferenceDuration
WHERE [Hearing End] is not null 
UNION ALL
SELECT d.ConferenceId, DATEADD(day,-1,c.CalendarDate) AS HearingDate, DATEADD(millisecond,-1,c.CalendarDateTime) AS Timestamp, -1 AS ConferenceCount
FROM dbo.vwConferenceDuration d
INNER JOIN dbo.Calendar c
ON c.CalendarDateTime > d.[Hearing Start] 
AND c.CalendarDateTime < d.[Hearing End]
WHERE d.[Hearing End] is not null
UNION ALL
SELECT d.ConferenceId, c.CalendarDate AS HearingDate, c.CalendarDateTime AS Timestamp, 1 AS ConferenceCount
FROM dbo.vwConferenceDuration d
INNER JOIN dbo.Calendar c
ON c.CalendarDateTime > d.[Hearing Start] 
AND c.CalendarDateTime < d.[Hearing End]
WHERE d.[Hearing End] is not null
GO

--SELECT top 100 *, SUM(ConferenceCount) OVER (PARTITION BY HearingDate ORDER BY TimeStamp) AS Concurrent FROM dbo.vwConferenceCount WHERE HearingDate >= '2021-09-10' ORDER BY HearingDate, Timestamp
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwParticipantCount'))
	EXEC('CREATE VIEW dbo.vwParticipantCount AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwParticipantCount AS
SELECT ConferenceId, ParticipantId, TRY_CONVERT(date,[Hearing Start]) AS HearingDate, [Hearing Start] AS Timestamp, 1 AS ParticipantCount
FROM dbo.vwParticipantDuration
WHERE [Hearing End] is not null
UNION ALL
SELECT ConferenceId, ParticipantId, TRY_CONVERT(date,[Hearing End]) AS HearingDate, [Hearing End] AS Timestamp, -1 AS ParticipantCount
FROM dbo.vwParticipantDuration
WHERE [Hearing End] is not null 
UNION ALL
SELECT d.ConferenceId, d.ParticipantId, DATEADD(day,-1,c.CalendarDate) AS HearingDate, DATEADD(millisecond,-1,c.CalendarDateTime) AS Timestamp, -1 AS ParticipantCount
FROM dbo.vwParticipantDuration d
INNER JOIN dbo.Calendar c
ON c.CalendarDateTime > d.[Hearing Start] 
AND c.CalendarDateTime < d.[Hearing End]
WHERE d.[Hearing End] is not null
UNION ALL
SELECT d.ConferenceId, d.ParticipantId, c.CalendarDate AS HearingDate, c.CalendarDateTime AS Timestamp, 1 AS ParticipantCount
FROM dbo.vwParticipantDuration d
INNER JOIN dbo.Calendar c
ON c.CalendarDateTime > d.[Hearing Start] 
AND c.CalendarDateTime < d.[Hearing End]
WHERE d.[Hearing End] is not null
GO

--SELECT top 100 *, SUM(ParticipantCount) OVER (PARTITION BY HearingDate ORDER BY TimeStamp) AS Concurrent FROM dbo.vwParticipantCount WHERE HearingDate >= '2021-09-10' ORDER BY HearingDate, Timestamp
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwParticipantConcurrentCount'))
	EXEC('CREATE VIEW dbo.vwParticipantConcurrentCount AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwParticipantConcurrentCount AS
WITH pc AS (
	SELECT ConferenceId, ParticipantId, TRY_CONVERT(date,[Hearing Start]) AS HearingDate, [Hearing Start] AS Timestamp, 1 AS ParticipantCount
	FROM dbo.vwParticipantDuration
	WHERE [Hearing End] is not null
	UNION ALL
	SELECT ConferenceId, ParticipantId, TRY_CONVERT(date,[Hearing End]) AS HearingDate, [Hearing End] AS Timestamp, -1 AS ParticipantCount
	FROM dbo.vwParticipantDuration
	WHERE [Hearing End] is not null 
	UNION ALL
	SELECT d.ConferenceId, d.ParticipantId, DATEADD(day,-1,c.CalendarDate) AS HearingDate, DATEADD(millisecond,-1,c.CalendarDateTime) AS Timestamp, -1 AS ParticipantCount
	FROM dbo.vwParticipantDuration d
	INNER JOIN dbo.Calendar c
	ON c.CalendarDateTime > d.[Hearing Start] 
	AND c.CalendarDateTime < d.[Hearing End]
	WHERE d.[Hearing End] is not null
	UNION ALL
	SELECT d.ConferenceId, d.ParticipantId, c.CalendarDate AS HearingDate, c.CalendarDateTime AS Timestamp, 1 AS ParticipantCount
	FROM dbo.vwParticipantDuration d
	INNER JOIN dbo.Calendar c
	ON c.CalendarDateTime > d.[Hearing Start] 
	AND c.CalendarDateTime < d.[Hearing End]
	WHERE d.[Hearing End] is not null
)
SELECT ConferenceId
	,ParticipantId
	,HearingDate
	,Timestamp
	,ParticipantCount
	,SUM(ParticipantCount) OVER (PARTITION BY HearingDate ORDER BY TimeStamp) AS ConcurrentCount
FROM pc
GO

--SELECT top 100 * FROM dbo.vwParticipantConcurrentCount WHERE HearingDate >= '2021-09-10' ORDER BY HearingDate, Timestamp
GO



IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwConferenceConcurrentCount'))
	EXEC('CREATE VIEW dbo.vwConferenceConcurrentCount AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwConferenceConcurrentCount AS
WITH cc AS (
	SELECT ConferenceId, TRY_CONVERT(date,[Hearing Start]) AS HearingDate, [Hearing Start] AS Timestamp, 1 AS ConferenceCount
	FROM dbo.vwConferenceDuration
	WHERE [Hearing End] is not null
	UNION ALL
	SELECT ConferenceId, TRY_CONVERT(date,[Hearing End]) AS HearingDate, [Hearing End] AS Timestamp, -1 AS ConferenceCount
	FROM dbo.vwConferenceDuration
	WHERE [Hearing End] is not null 
	UNION ALL
	SELECT d.ConferenceId, DATEADD(day,-1,c.CalendarDate) AS HearingDate, DATEADD(millisecond,-1,c.CalendarDateTime) AS Timestamp, -1 AS ConferenceCount
	FROM dbo.vwConferenceDuration d
	INNER JOIN dbo.Calendar c
	ON c.CalendarDateTime > d.[Hearing Start] 
	AND c.CalendarDateTime < d.[Hearing End]
	WHERE d.[Hearing End] is not null
	UNION ALL
	SELECT d.ConferenceId, c.CalendarDate AS HearingDate, c.CalendarDateTime AS Timestamp, 1 AS ConferenceCount
	FROM dbo.vwConferenceDuration d
	INNER JOIN dbo.Calendar c
	ON c.CalendarDateTime > d.[Hearing Start] 
	AND c.CalendarDateTime < d.[Hearing End]
	WHERE d.[Hearing End] is not null
)
SELECT ConferenceId
	,HearingDate
	,Timestamp
	,ConferenceCount
	,SUM(ConferenceCount) OVER (PARTITION BY HearingDate ORDER BY TimeStamp) AS ConcurrentCount
FROM cc
GO

--SELECT top 100 * FROM dbo.vwConferenceConcurrentCount WHERE HearingDate >= '2021-09-10' ORDER BY HearingDate, Timestamp
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwApplicationInsights'))
	EXEC('CREATE VIEW dbo.vwApplicationInsights AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwApplicationInsights AS
SELECT t.id AS [MessageID]
	,t.[timestamp] AS MessageTimestamp
	,t.[message] AS MessageText
	,t.[user_Id] AS UserID
	,t.[client_Model] AS DeviceType
	,t.[client_OS] AS ClientOS
	,d.[key] AS CustomDimensionKey
	,d.[value] AS CustomDimensionValue
	,CASE WHEN e.errorInformation IS NOT NULL THEN 1 ELSE 0 END AS IsErrorFlag
FROM dbo.AppInsightsTrace t
CROSS APPLY OPENJSON(t.customDimensions) d
CROSS APPLY OPENJSON(t.customDimensions) WITH (errorInformation VARCHAR(50) '$."errorInformation"') e
GO


--SELECT top 100 * FROM dbo.vwApplicationInsights WHERE MessageTimestamp >= '2022-03-28' ORDER BY MessageTimestamp, MessageID
GO

IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE schema_name(schema_id) in ('dbo') AND name in ('vwApplicationInsightsWide'))
	EXEC('CREATE VIEW dbo.vwApplicationInsightsWide AS SELECT 1 AS col1')
GO

ALTER VIEW dbo.vwApplicationInsightsWide AS
SELECT t.id AS [MessageID]
	,t.[timestamp] AS MessageTimestamp
	,t.[message] AS MessageText
	,t.[user_Id] AS UserID
	,t.[client_Model] AS DeviceType
	,t.[client_OS] AS ClientOS
	,cd.CategoryName
	,cd.AspNetCoreEnvironment
	,cd.ParentId
	,cd.RequestId
	,cd.RequestPath
	,cd.SpanId
	,cd.TraceId
	,cd.EventId
	,cd.EventName
	,cd.OriginalFormat
	,cd.ElapsedMilliseconds
	,cd.StatusCode
	,cd.HttpMethod
	,cd.Uri
	,cd.[Path]
	,cd.DisplayName
	,cd.ControllerName
	,cd.Host
	,cd.Method
	,cd.Protocol
	,cd.Scheme
	,cd.ContentType
	,cd.PhysicalPath
	,cd.VirtualPath
	,cd.EndpointName
	,cd.Accept
	,cd.[Content-Security-Policy]
	,cd.[Content-Type]
	,cd.[Date]
	,cd.[Strict-Transport-Security]
	,cd.[Request-Context]
	,cd.[Content-Length]
	,cd.Controller
	,cd.AssemblyName
	,cd.RouteData
	,cd.MethodInfo
	,cd.ValidationState
	,cd.ActionResult
	,cd.[Type]
	,cd.[Authorization]
	,cd.AuthenticationScheme
	,cd.commandText
	,cd.commandTimeout
	,cd.commandType
	,cd.elapsed
	,cd.conferenceId
	,cd.TQuery
	,cd.TResult
	,cd.currentConferenceId
	,cd.notificationType
	,cd.TOut
	,cd.TIn1
	,cd.[Set-Cookie]
	,cd.[parameters]
	,cd.participantId
	,cd.ConferenceId2
	,cd.Category
	,cd.LogLevel
	,CASE WHEN t.errorInformation IS NOT NULL OR t.pexipError IS NOT NULL THEN 1 ELSE 0 END AS IsErrorFlag
FROM dbo.AppInsightsTrace t
CROSS APPLY OPENJSON(t.customDimensions) WITH (
	CategoryName VARCHAR(250) '$."CategoryName"'
	,AspNetCoreEnvironment VARCHAR(250) '$."AspNetCoreEnvironment"'
	,ParentId VARCHAR(250) '$."ParentId"'
	,RequestId VARCHAR(250) '$."RequestId"'
	,RequestPath VARCHAR(250) '$."RequestPath"'
	,SpanId VARCHAR(250) '$."SpanId"'
	,TraceId VARCHAR(250) '$."TraceId"'
	,EventId VARCHAR(250) '$."EventId"'
	,EventName VARCHAR(250) '$."EventName"'
	,OriginalFormat VARCHAR(250) '$."{OriginalFormat}"'
	,ElapsedMilliseconds VARCHAR(250) '$."ElapsedMilliseconds"'
	,StatusCode VARCHAR(250) '$."StatusCode"'
	,HttpMethod VARCHAR(250) '$."HttpMethod"'
	,Uri VARCHAR(250) '$."Uri"'
	,[Path] VARCHAR(250) '$."Path"'
	,DisplayName VARCHAR(250) '$."DisplayName"'
	,ControllerName VARCHAR(250) '$."ControllerName"'
	,Host VARCHAR(250) '$."Host"'
	,Method VARCHAR(250) '$."Method"'
	,Protocol VARCHAR(250) '$."Protocol"'
	,Scheme VARCHAR(250) '$."Scheme"'
	,ContentType VARCHAR(250) '$."ContentType"'
	,PhysicalPath VARCHAR(250) '$."PhysicalPath"'
	,VirtualPath VARCHAR(250) '$."VirtualPath"'
	,EndpointName VARCHAR(250) '$."EndpointName"'
	,Accept VARCHAR(250) '$."Accept"'
	,[Content-Security-Policy] VARCHAR(250) '$."Content-Security-Policy"'
	,[Content-Type] VARCHAR(250) '$."Content-Type"'
	,[Date] VARCHAR(250) '$."Date"'
	,[Strict-Transport-Security] VARCHAR(250) '$."Strict-Transport-Security"'
	,[Request-Context] VARCHAR(250) '$."Request-Context"'
	,[Content-Length] VARCHAR(250) '$."Content-Length"'
	,Controller VARCHAR(250) '$."Controller"'
	,AssemblyName VARCHAR(250) '$."AssemblyName"'
	,RouteData VARCHAR(250) '$."RouteData"'
	,MethodInfo VARCHAR(250) '$."MethodInfo"'
	,ValidationState VARCHAR(250) '$."ValidationState"'
	,ActionResult VARCHAR(250) '$."ActionResult"'
	,[Type] VARCHAR(250) '$."Type"'
	,[Authorization] VARCHAR(250) '$."Authorization"'
	,AuthenticationScheme VARCHAR(250) '$."AuthenticationScheme"'
	,commandText VARCHAR(250) '$."commandText"'
	,commandTimeout VARCHAR(250) '$."commandTimeout"'
	,commandType VARCHAR(250) '$."commandType"'
	,elapsed VARCHAR(250) '$."elapsed"'
	,conferenceId VARCHAR(250) '$."conferenceId"'
	,TQuery VARCHAR(250) '$."TQuery"'
	,TResult VARCHAR(250) '$."TResult"'
	,currentConferenceId VARCHAR(250) '$."currentConferenceId"'
	,notificationType VARCHAR(250) '$."notificationType"'
	,TOut VARCHAR(250) '$."TOut"'
	,TIn1 VARCHAR(250) '$."TIn1"'
	,[Set-Cookie] VARCHAR(250) '$."Set-Cookie"'
	,[parameters] VARCHAR(250) '$."parameters"'
	,participantId VARCHAR(250) '$."participantId"'
	,ConferenceId2 VARCHAR(250) '$."ConferenceId"'
	,Category VARCHAR(250) '$."Category"'
	,LogLevel VARCHAR(250) '$."LogLevel"'
) cd
GO


--SELECT top 100 * FROM dbo.vwApplicationInsightsWide WHERE MessageTimestamp >= '2022-03-28' ORDER BY MessageTimestamp, MessageID
GO



