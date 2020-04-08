USE [AdventureWorks]
GO

/****** Object:  Table [Sales].[MediaOutlet]    Script Date: 4/8/2020 8:46:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Sales].[MediaOutlet](
	[MediaOutletID] [int] NOT NULL,
	[MediaOutletName] [nvarchar](40) NULL,
	[PrimaryContact] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [Clustered_ID] UNIQUE CLUSTERED 
(
	[MediaOutletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [Sales].[PrintMediaPlacement]    Script Date: 4/8/2020 8:47:13 AM ******/

CREATE TABLE [Sales].[PrintMediaPlacement](
	[PrintMediaPlacementID] [int] NOT NULL,
	[MediaOutletID] [int] NULL,
	[PlacementDate] [datetime] NULL,
	[PublicationDate] [datetime] NULL,
	[RelatedProductID] [int] NULL,
	[PlacementCost] [decimal](18, 2) NULL
) ON [PRIMARY]
GO





/****** Object:  Index [Clustered_ID]    Script Date: 4/8/2020 8:48:01 AM ******/
ALTER TABLE [Sales].[MediaOutlet] ADD  CONSTRAINT [Clustered_ID] UNIQUE CLUSTERED 


/****** Object:  Index [PrintMediaPlacement_ID]    Script Date: 4/8/2020 8:48:49 AM ******/
CREATE UNIQUE CLUSTERED INDEX [PrintMediaPlacement_ID] ON [Sales].[PrintMediaPlacement]


/****** Object:  Index [PrintMediaPlacement_NCID]    Script Date: 4/8/2020 8:49:13 AM ******/
CREATE NONCLUSTERED INDEX [PrintMediaPlacement_NCID] ON [Sales].[PrintMediaPlacement]
(
	[PublicationDate] ASC,
	[PlacementCost] ASC
)
INCLUDE([PrintMediaPlacementID],[MediaOutletID],[PlacementDate],[RelatedProductID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO