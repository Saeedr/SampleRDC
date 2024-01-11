USE [Shahab]
GO

/****** Object:  Table [dbo].[Family]    Script Date: 28/02/1396 10:03:17 Þ.Ù ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Family](
	[FamilyId] [int] NOT NULL,
	[BlockNumber] [varchar](50) NULL,
	[FamilyNumber] [varchar](50) NULL,
	[BuildingNumber] [varchar](50) NULL,
	[FamilyType] [int] NOT NULL,
	[PopulationType] [int] NULL,
	[PlaceId] [int] NULL,
	[RegionStatus] [int] NULL,
	[OwnerShipStatus] [int] NOT NULL,
	[PostalCode] [varchar](50) NULL,
	[MobileNumber] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Priority] [float] NOT NULL,
	[UserId] [int] NOT NULL,
	[RegisterDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SHB_FAMILY] PRIMARY KEY CLUSTERED 
(
	[FamilyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Family]  WITH CHECK ADD  CONSTRAINT [FK_Family_FamilyType_BaseInfo] FOREIGN KEY([FamilyType])
REFERENCES [dbo].[BaseInfo] ([BaseInfoId])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Family] CHECK CONSTRAINT [FK_Family_FamilyType_BaseInfo]
GO

ALTER TABLE [dbo].[Family]  WITH CHECK ADD  CONSTRAINT [FK_Family_OwnerShipStatus_BaseInfo] FOREIGN KEY([OwnerShipStatus])
REFERENCES [dbo].[BaseInfo] ([BaseInfoId])
GO

ALTER TABLE [dbo].[Family] CHECK CONSTRAINT [FK_Family_OwnerShipStatus_BaseInfo]
GO

ALTER TABLE [dbo].[Family]  WITH CHECK ADD  CONSTRAINT [FK_Family_Places] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Places] ([PlaceId])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Family] CHECK CONSTRAINT [FK_Family_Places]
GO

ALTER TABLE [dbo].[Family]  WITH CHECK ADD  CONSTRAINT [FK_Family_PopulationType_BaseInfo] FOREIGN KEY([PopulationType])
REFERENCES [dbo].[BaseInfo] ([BaseInfoId])
GO

ALTER TABLE [dbo].[Family] CHECK CONSTRAINT [FK_Family_PopulationType_BaseInfo]
GO

ALTER TABLE [dbo].[Family]  WITH CHECK ADD  CONSTRAINT [FK_Family_RegionStatus_BaseInfo] FOREIGN KEY([RegionStatus])
REFERENCES [dbo].[BaseInfo] ([BaseInfoId])
GO

ALTER TABLE [dbo].[Family] CHECK CONSTRAINT [FK_Family_RegionStatus_BaseInfo]
GO

ALTER TABLE [dbo].[Family]  WITH CHECK ADD  CONSTRAINT [FK_Family_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[Family] CHECK CONSTRAINT [FK_Family_Users]
GO


