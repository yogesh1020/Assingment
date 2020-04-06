--Task:1

DROP TABLE Timesheet 
GO


DROP PARTITION SCHEME [psHumanResources]
GO

DROP PARTITION FUNCTION [pfHumanResourcesDates]
GO



CREATE PARTITION FUNCTION [pfHumanResourcesDates](datetime) 
AS 
RANGE RIGHT FOR VALUES (N'2012-12-31T00:00:00.000', N'2014-12-31T00:00:00.000', N'2016-12-31T00:00:00.000')
GO


CREATE PARTITION SCHEME [psHumanResources] AS PARTITION [pfHumanResourcesDates] TO ([FG0], [FG2], [FG3], [FG1])
GO


CREATE TABLE Timesheet
(
	EmployeeId int NOT NULL,
	ShiftId tinyint NOT NULL,
	RegisteredStartTime datetime NOT NULL,
	RegisteredEndTime datetime NOT NULL,
	CONSTRAINT PK_Timesheet_EmployeeId_ShiftId_ResgisteredStartTime PRIMARY KEY (EmployeeId ASC, ShiftId ASC, RegisteredStartTime)
) ON psHumanResources(RegisteredStartTime);
GO



--Task:2

USE HumanResources
GO
SELECT	i.index_id, i.name AS IndexName, ps.name AS PartitionScheme, pf.name AS PartitionFunction, p.partition_number AS PartitionNumber, 
		fg.name AS [Filegroup], prv_left.[value] AS StartKey, prv_right.[value] AS EndKey, p.row_count AS [Rows]
FROM	sys.dm_db_partition_stats AS p
INNER	JOIN sys.indexes AS i								ON i.OBJECT_ID = p.OBJECT_ID AND i.index_id = p.index_id
INNER	JOIN sys.data_spaces AS ds							ON ds.data_space_id = i.data_space_id
LEFT	OUTER JOIN sys.partition_schemes AS ps				ON ps.data_space_id = i.data_space_id
LEFT	OUTER JOIN sys.partition_functions AS pf			ON ps.function_id = pf.function_id
LEFT	OUTER JOIN sys.destination_data_spaces AS dds		ON dds.partition_scheme_id = ps.data_space_id AND dds.destination_id = p.partition_number
LEFT	OUTER JOIN sys.filegroups AS fg						ON fg.data_space_id = dds.data_space_id
LEFT	OUTER JOIN sys.partition_range_values AS prv_right	ON prv_right.function_id = ps.function_id AND prv_right.boundary_id = p.partition_number
LEFT	OUTER JOIN sys.partition_range_values AS prv_left	ON prv_left.function_id = ps.function_id AND prv_left.boundary_id = p.partition_number - 1
WHERE	OBJECT_NAME(p.object_id) = 'Timesheet'
GO



--Task:3

USE HumanResources
GO

-- FG0
ALTER TABLE Timesheet REBUILD PARTITION = 1 WITH (DATA_COMPRESSION = ROW)
GO
-- FG2
ALTER TABLE Timesheet REBUILD PARTITION = 2 WITH (DATA_COMPRESSION = PAGE)
GO
-- FG3
ALTER TABLE Timesheet REBUILD PARTITION = 3 WITH (DATA_COMPRESSION = PAGE)
GO
-- FG1
ALTER TABLE Timesheet REBUILD PARTITION = 4 WITH (DATA_COMPRESSION = ROW)
GO
select*from Timesheet