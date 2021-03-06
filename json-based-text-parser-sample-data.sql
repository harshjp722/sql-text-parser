USE [Test]
GO
/****** Object:  Table [dbo].[ActivityTypes]    Script Date: 3/4/2020 11:36:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ActivityTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 3/4/2020 11:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextTemplate]    Script Date: 3/4/2020 11:36:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Text] [nvarchar](4000) NOT NULL,
 CONSTRAINT [PK_TextTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActivityTypes] ON 
GO
INSERT [dbo].[ActivityTypes] ([Id], [ActivityCode], [Name]) VALUES (1, N'A1', N'Activity 1')
GO
INSERT [dbo].[ActivityTypes] ([Id], [ActivityCode], [Name]) VALUES (2, N'A2', N'Harsh Patel')
GO
SET IDENTITY_INSERT [dbo].[ActivityTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([Id], [CountryCode], [Name]) VALUES (1, N'IN', N'India')
GO
INSERT [dbo].[Countries] ([Id], [CountryCode], [Name]) VALUES (2, N'US', N'USA')
GO
INSERT [dbo].[Countries] ([Id], [CountryCode], [Name]) VALUES (3, N'UK', N'United Kingdom')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[TextTemplate] ON 
GO
INSERT [dbo].[TextTemplate] ([Id], [Code], [Text]) VALUES (1, N'TEST', N'Hello #{ActivityName}#, You live in #{CountryName}# with code #{CountryCode}#.')
GO
SET IDENTITY_INSERT [dbo].[TextTemplate] OFF
GO
