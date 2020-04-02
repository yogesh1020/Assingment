CREATE TABLE [dbo].[NewsStudents](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddelName] [varchar](50) NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[AdmitDate] [date] NOT NULL,
 CONSTRAINT [PK_NewsStudents] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


select (SurName +' '+ FirstName +' '+ MiddelName) as FullName  from NewsStudents ;

/* 1 */  select * from NewsStudents where Surname = 'Shah';

/* 2 */ select * from NewsStudents Where Gender = 'Male';

/* 3 */ select * from NewsStudents where Gender = 'Female' and Surname = 'Patel' and AdmitDate > '1-Jan-2006';

/* 4 */ select  * from NewsStudents Where MiddelName like '%bhai';

/* 5 */ select * from NewsStudents Where FirstName like 'M%' and MiddelName like '%ant%';

/* 6 */ select * from NewsStudents where Surname like '__c%';

/* 7 */ select FirstName +' '+MiddelName+' '+Surname  as FullName from NewsStudents
		where FirstName like '%' and MiddelName like '_.' and Surname like '%'

/* 8 */ select FirstName ,  len(FirstName) as FirstName_Length from NewsStudents;

/* 9 */ select
		case 
		when Gender = 'Male' and FirstName Not like '%bhai' Then CONCAT(FirstName,'Bhai')
		end as FirstName
		from NewsStudents

/* 10 */ select FirstName from NewsStudents where gender = 'male' and FirstName like 'Mr.%'

/* 11 */ select FirstName from NewsStudents where FirstName like '__ra' 