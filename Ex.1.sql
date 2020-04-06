--Task :2 
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[StreeAddress] [varchar](max) NOT NULL,
	[PostalCode] [int] NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](30) NOT NULL,
	[Country] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 03-04-2020 19:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 03-04-2020 19:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[MobileNumber] [int] NOT NULL,
	[HireDate] [date] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[ShiftId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 03-04-2020 19:43:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Address]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Shift] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shift] ([ShiftId])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Shift]
GO


--Task:3

create PARTITION FUNCTION pfHumanResourcesDates () 
AS RANGE RIGHT 
FOR VALUES ('2018-10-01 00:00','2019-01-01 00:00','2019-04-01 00:00');


CREATE PARTITION SCHEME psHumanResources 
AS PARTITION pfHumanResourcesDates TO (FG0, FG1, FG2, FG3);


CREATE TABLE Timesheet
(
	EmployeeId int NOT NULL,
	ShiftId tinyint NOT NULL,
	RegisteredStartTime datetime NOT NULL,
	RegisteredEndTime datetime NOT NULL,
	CONSTRAINT PK_Timesheet_EmployeeId_ShiftId_ResgisteredStartTime PRIMARY KEY (EmployeeId ASC, ShiftId ASC, RegisteredStartTime)
) ON psHumanResources(RegisteredStartTime);
GO


--Insert data into Timesheet table
INSERT INTO Timesheet
VALUES (1,1, '2018-11-23 07:00', '2018-11-23 15:00');
GO
INSERT INTO Timesheet
VALUES (1,1, '2018-11-25 07:00', '2018-11-25 15:00');
GO
INSERT INTO Timesheet
VALUES (1,1, '2019-02-21 07:00', '2019-02-21 15:00');
GO
INSERT INTO Timesheet
VALUES (1,1, '2019-02-23 07:00', '2019-02-23 15:00');
GO

--Task:4


CREATE TABLE Timesheet_Staging
(
	EmployeeId int NOT NULL,
	ShiftId tinyint NOT NULL,
	RegisteredStartTime datetime NOT NULL,
	RegisteredEndTime datetime NOT NULL,
	CONSTRAINT PK_Timesheet_EmployeeId_ShiftId_RegisteredStartTime PRIMARY KEY (EmployeeId ASC, ShiftId ASC, RegisteredStartTime)
) ON FG1
GO

select *from Timesheet_Staging
select *from Timesheet
-- Add check constraint 
ALTER TABLE Timesheet_Staging
WITH CHECK ADD CONSTRAINT DateBoundaries
CHECK (RegisteredStartTime >= '2018-10-01 00:00' and RegisteredStartTime < '2019-01-01 00:00' AND RegisteredStartTime IS NOT NULL);
GO