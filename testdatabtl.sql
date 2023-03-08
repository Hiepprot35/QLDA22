USE [master]
GO
/****** Object:  Database [ProjectManager]    Script Date: 10/14/2021 11:21:32 PM ******/
CREATE DATABASE [QLDA]
GO
USE [QLDA]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnRemoveMark]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnRemoveMark] (
	@text nvarchar(max)
)
	RETURNS nvarchar(max)
AS
BEGIN
	SET @text = LOWER(@text)
		DECLARE @textLen int = LEN(@text)
	IF @textLen > 0
	BEGIN
		DECLARE @index int = 1
		DECLARE @lPos int
		DECLARE @SIGN_CHARS nvarchar(100) = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýđð'
		DECLARE @UNSIGN_CHARS varchar(100) = 'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyydd'

	WHILE @index <= @textLen
		BEGIN
			SET @lPos = CHARINDEX(SUBSTRING(@text,@index,1),@SIGN_CHARS)
			IF @lPos > 0
				BEGIN
					SET @text = STUFF(@text,@index,1,SUBSTRING(@UNSIGN_CHARS,@lPos,1))
				END
			SET @index = @index + 1
		END
	END
	RETURN @text
END

GO
/****** Object:  Table [dbo].[Classs]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DepartmentId] [bigint] NULL,
	[SpecializedId] [bigint] NULL,
	[SchoolYearId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Classs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FoundingDate] [datetime] NULL,
	[Discriptions] [nvarchar](1000) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectList]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectList](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Point] [varchar](3) NULL,
	[LinkDownload] [nvarchar](255) NULL,
	[TeacherId] [bigint] NULL,
	[StudentId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolYear]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolYear](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SchoolYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialized]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialized](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Discriptions] [nvarchar](1000) NULL,
	[DepartmentId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Specialized] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[DateOfBirth] [datetime] NULL,
	[SpecializedId] [bigint] NULL,
	[TrainingSystemId] [bigint] NULL,
	[DepartmentId] [bigint] NULL,
	[ClasssId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[DateOfBirth] [datetime] NULL,
	[DepartmentId] [bigint] NULL,
	[SpecializedId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingSystem]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingSystem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TrainingSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserManagement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Classs] ON 

INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (2, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (3, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (4, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (5, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (6, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (7, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (8, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (9, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (10, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (11, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (12, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (13, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (14, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (15, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (16, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (17, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (18, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (19, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (20, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (21, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (22, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (23, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (24, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (25, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (26, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (27, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (28, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (29, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (30, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (31, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (32, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (33, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (34, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (35, N'12312313', 2, 1, 2, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-10-11T00:04:31.153' AS DateTime), N'string', CAST(N'2021-09-25T15:21:43.427' AS DateTime), 0)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (36, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-26T20:56:45.250' AS DateTime), 1)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (37, N'12312313', 0, 0, 0, N'string', CAST(N'2021-09-23T23:37:39.307' AS DateTime), N'string', CAST(N'2021-09-23T16:37:30.287' AS DateTime), N'string', CAST(N'2021-09-26T16:37:47.150' AS DateTime), 1)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (38, N'string', 0, 0, 0, N'string', CAST(N'2021-09-25T15:21:17.913' AS DateTime), N'string', CAST(N'2021-09-25T08:21:14.637' AS DateTime), N'string', CAST(N'2021-09-26T16:33:30.307' AS DateTime), 1)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (44, N'123', NULL, NULL, NULL, N'admin', CAST(N'2021-09-26T15:54:31.087' AS DateTime), NULL, NULL, NULL, CAST(N'2021-09-26T16:33:26.560' AS DateTime), 1)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (45, N'DDaij hojc', 1, 1, 1, N'admin', CAST(N'2021-09-26T15:54:48.840' AS DateTime), NULL, NULL, NULL, CAST(N'2021-09-26T16:32:22.017' AS DateTime), 1)
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (46, N'Dud', 1, 1, 1, N'admin', CAST(N'2021-09-26T15:55:48.317' AS DateTime), NULL, CAST(N'2021-09-26T16:00:02.530' AS DateTime), NULL, CAST(N'2021-09-26T16:32:18.297' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Classs] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'string', CAST(N'2021-09-26T08:16:05.870' AS DateTime), N'string', N'string', CAST(N'2021-09-26T15:16:07.380' AS DateTime), N'string', CAST(N'2021-09-26T08:16:05.870' AS DateTime), N'string', CAST(N'2021-10-05T23:51:13.203' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (2, N'Khoa công nghệ thông tin', CAST(N'2021-09-26T08:16:05.870' AS DateTime), N'string', N'string', CAST(N'2021-09-26T15:16:56.207' AS DateTime), N'string', CAST(N'2021-10-02T17:16:48.587' AS DateTime), N'string', CAST(N'2021-10-05T23:51:15.543' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (3, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-10-05T23:51:17.407' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (4, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-10-05T23:51:19.420' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (5, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (6, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (7, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (8, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (9, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (10, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (11, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (12, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (13, N'd', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-09-26T21:17:47.293' AS DateTime), NULL, CAST(N'2021-09-26T21:18:12.803' AS DateTime), 0)
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (14, N'd1', CAST(N'2021-09-30T00:00:00.000' AS DateTime), N'ád', N'admin', CAST(N'2021-09-26T21:17:29.390' AS DateTime), NULL, CAST(N'2021-10-11T00:03:03.093' AS DateTime), NULL, CAST(N'2021-10-11T00:03:06.013' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[ProjectList] ON 

INSERT [dbo].[ProjectList] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'123', N'7', N'https://translate.google.com/?hl=vi&sl=vi&tl=en&text=ch%E1%BA%A5m%20%C4%91i%E1%BB%83m&op=translate', 1, 1, N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2021-10-11T00:15:43.533' AS DateTime), NULL, CAST(N'2021-10-09T23:13:51.920' AS DateTime), 0)
INSERT [dbo].[ProjectList] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (5, N'Quản lý nhân sự', NULL, N'http://localhost:17099/', 1, 13, N'1421050318', CAST(N'2021-10-14T22:58:02.210' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[ProjectList] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (6, N'123', NULL, N'123', 1, 13, N'1421050318', CAST(N'2021-10-14T23:04:16.600' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[ProjectList] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (7, N'asd', NULL, N'asd', 1, 13, N'1421050318', CAST(N'2021-10-14T23:05:45.460' AS DateTime), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ProjectList] OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolYear] ON 

INSERT [dbo].[SchoolYear] ([Id], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'2011-2019', N'admin', CAST(N'2021-09-26T22:01:38.737' AS DateTime), NULL, CAST(N'2021-09-26T22:01:55.240' AS DateTime), NULL, CAST(N'2021-09-26T22:02:06.363' AS DateTime), 0)
INSERT [dbo].[SchoolYear] ([Id], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (2, N'2014-2019', N'admin', CAST(N'2021-09-26T22:32:47.303' AS DateTime), NULL, CAST(N'2021-10-02T17:17:20.547' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[SchoolYear] ([Id], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (3, N'1', N'admin', CAST(N'2021-10-09T15:44:33.093' AS DateTime), NULL, CAST(N'2021-10-11T00:04:02.037' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[SchoolYear] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialized] ON 

INSERT [dbo].[Specialized] ([Id], [Name], [Discriptions], [DepartmentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'Công nghệ phần mềm', N'string', 4, N'string', CAST(N'2021-09-26T15:16:36.963' AS DateTime), N'string', CAST(N'2021-10-11T00:03:38.640' AS DateTime), N'string', CAST(N'2021-09-26T08:16:33.613' AS DateTime), 0)
INSERT [dbo].[Specialized] ([Id], [Name], [Discriptions], [DepartmentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (3, N'123d', N'123safD', 1, N'admin', CAST(N'2021-09-26T21:31:30.183' AS DateTime), NULL, CAST(N'2021-09-26T21:31:36.150' AS DateTime), NULL, CAST(N'2021-09-26T21:31:39.380' AS DateTime), 1)
INSERT [dbo].[Specialized] ([Id], [Name], [Discriptions], [DepartmentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (4, N'asd', NULL, NULL, N'admin', CAST(N'2021-10-11T15:52:18.170' AS DateTime), N'admin', CAST(N'2021-10-11T16:14:05.543' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Specialized] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'1421050317', NULL, N'Dũng1', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (2, N'1421050317', NULL, N'Dũng2', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (3, N'1421050317', NULL, N'Dũng3', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (4, N'1421050317', NULL, N'Dũng4', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (5, N'1421050317', NULL, N'Dũng5', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (6, N'1421050317', NULL, N'Dũng6', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (7, N'1421050317', NULL, N'Dũng7', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (8, N'1421050317', NULL, N'Dũng8', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (9, N'1421050317', NULL, N'Dũng8', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (10, N'1421050317', NULL, N'Dũng8', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (11, N'1421050317', NULL, N'Dũng8', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (12, N'1421050317', NULL, N'Dũng8', N'0949234086', NULL, NULL, CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'123', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (13, N'1421050318', N'28-D8-F2-89-C4-6F-B5-00-96-3C-5A-5E-C9-23-9C-1A', N'Dũng8', N'0949234086', N'asd', N'asd', CAST(N'2021-01-01T00:00:00.000' AS DateTime), 1, 1, 2, 35, N'12', CAST(N'2021-10-03T14:26:22.227' AS DateTime), NULL, CAST(N'2021-10-11T00:04:48.510' AS DateTime), NULL, CAST(N'2021-10-03T14:26:46.663' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [DepartmentId], [SpecializedId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'1421050318', N'28-D8-F2-89-C4-6F-B5-00-96-3C-5A-5E-C9-23-9C-1A', N'123123D', N'123', N'123', N'123', CAST(N'2021-10-02T00:00:00.000' AS DateTime), 2, 1, N'admin', CAST(N'2021-10-02T18:02:43.510' AS DateTime), N'admin', CAST(N'2021-10-11T15:46:41.477' AS DateTime), NULL, CAST(N'2021-10-02T18:06:33.933' AS DateTime), 0)
INSERT [dbo].[Teacher] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [DepartmentId], [SpecializedId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (22, N'MGV3405980640', N'15-E5-A5-02-C7-11-2B-9E-28-CF-CD-FD-0F-D6-EA-00', N'asd', NULL, NULL, NULL, NULL, NULL, NULL, N'admin', CAST(N'2021-10-11T15:46:47.980' AS DateTime), N'admin', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[TrainingSystem] ON 

INSERT [dbo].[TrainingSystem] ([Id], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'Đại học chính quy', N'string', CAST(N'2021-09-26T15:16:21.910' AS DateTime), N'string', CAST(N'2021-10-02T17:17:11.943' AS DateTime), N'string', CAST(N'2021-09-26T08:16:20.673' AS DateTime), 0)
INSERT [dbo].[TrainingSystem] ([Id], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (2, N'ád', N'admin', CAST(N'2021-09-26T21:51:33.163' AS DateTime), NULL, CAST(N'2021-09-26T21:51:36.660' AS DateTime), NULL, CAST(N'2021-09-26T21:51:38.897' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TrainingSystem] OFF
GO
SET IDENTITY_INSERT [dbo].[UserManagement] ON 

INSERT [dbo].[UserManagement] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'admin', N'21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3', N'Administrator', N'0949234086', N'letiendung130196@gmail.com', N'system', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[UserManagement] OFF
GO
/****** Object:  StoredProcedure [dbo].[uspClasss_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspClasss_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
	@DepartmentId BIGINT,
	@SpecializedId BIGINT,
	@SchoolYearId BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			c.[Id]
		   ,c.[Name]
		   ,c.[DepartmentId]
		   ,d.[Name] AS DepartmentName
		   ,c.[SpecializedId]
		   ,s.[Name] AS SpecializedName
		   ,c.SchoolYearId
		   ,sy.[Name] AS SchoolYearName
		   ,c.[CreatedBy]
		   ,c.[CreatedDate]
		   ,c.[ModifiedBy]
		   ,c.[ModifiedDate]
			FROM Classs c
			LEFT JOIN Department d ON d.Id = c.DepartmentId AND d.IsDeleted = 0
			LEFT JOIN Specialized s ON s.Id = c.SpecializedId AND s.IsDeleted = 0
			LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER(c.[Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND
				  (
					ISNULL(@DepartmentId, '') = '' OR 
					c.[DepartmentId] = @DepartmentId
				  )
				  AND
				  (
					ISNULL(@SpecializedId, '') = '' OR 
					c.SpecializedId = @SpecializedId
				  )
				  AND
				  (
					ISNULL(@SchoolYearId, '') = '' OR 
					c.SchoolYearId = @SchoolYearId
				  )
				  AND c.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspDepartment_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspDepartment_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			[Id]
		   ,[Name]
		   ,[FoundingDate]
		   ,[Discriptions]
		   ,[CreatedBy]
		   ,[CreatedDate]
		   ,[ModifiedBy]
		   ,[ModifiedDate]
			FROM Department
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER([Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspProjectList_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspProjectList_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
    @TeacherId BIGINT,
    @SchoolYearId BIGINT,
	@Status BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
		-- Tất cả
		IF (@Status = 0)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

		-- Không đạt
		IF (@Status = 1)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						CAST(pl.Point AS DECIMAL(10,1)) < CAST(7 AS DECIMAL(10,1))
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

		-- Đạt
		IF (@Status = 2)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						CAST(pl.Point AS DECIMAL(10,1)) >= CAST(7 AS DECIMAL(10,1))
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspSchoolYear_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspSchoolYear_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   [Id]
			  ,[Name]
			  ,[CreatedBy]
			  ,[CreatedDate]
			  ,[ModifiedBy]
			  ,[ModifiedDate]
			FROM SchoolYear
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER([Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspSpecialized_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspSpecialized_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   s.[Id]
			  ,s.[Name]
			  ,s.[Discriptions]
			  ,s.[DepartmentId]
			  ,d.[Name] AS DepartmentName
			  ,s.[CreatedBy]
			  ,s.[CreatedDate]
			  ,s.[ModifiedBy]
			  ,s.[ModifiedDate]
			FROM Specialized s
			LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER(s.[Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND s.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStudent_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
	@DepartmentId BIGINT,
	@SpecializedId BIGINT,
	@ClasssId BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   s.[Id]
			  ,s.[Username]
			  ,s.[Password]
			  ,s.[Name]
			  ,s.[PhoneNumber]
			  ,s.[Email]
			  ,s.[Address]
			  ,s.[DateOfBirth]
			  ,s.[SpecializedId]
			  ,s1.[Name] AS SpecializedName
			  ,s.[TrainingSystemId]
			  ,ts.[Name] AS TrainingSystemName
			  ,s.[DepartmentId]
			  ,d.[Name] AS DepartmentName
			  ,s.[ClasssId]
			  ,c.[Name] AS ClasssName
			  ,s.[CreatedBy]
			  ,s.[CreatedDate]
			  ,s.[ModifiedBy]
			  ,s.[ModifiedDate]
			FROM Student s
			LEFT JOIN Specialized s1 ON s1.Id = s.[SpecializedId] AND s1.IsDeleted = 0
			LEFT JOIN TrainingSystem ts ON ts.Id = s.[TrainingSystemId] AND ts.IsDeleted = 0
			LEFT JOIN Department d ON d.Id = s.[DepartmentId] AND d.IsDeleted = 0
			LEFT JOIN Classs c ON c.Id = s.[ClasssId] AND c.IsDeleted = 0
			WHERE (
					ISNULL(@Key, '') = '' OR 
					s.[Username] = @Key
				  )
				  AND
				  (
					ISNULL(@DepartmentId, '') = '' OR 
					s.DepartmentId = @DepartmentId
				  )
				  AND(
					ISNULL(@SpecializedId, '') = '' OR 
					s.SpecializedId = @SpecializedId
				  )
				  AND(
					ISNULL(@ClasssId, '') = '' OR 
					s.ClasssId = @ClasssId
				  )
				  AND s.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectAllByUsername]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStudent_SelectAllByUsername]
	@Key NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
		
	WITH TempResult AS 
	(
		SELECT
			 s.[Id]
			,s.[Username]
			,s.[Name]
			,s.[PhoneNumber]
			,s.[Email]
			,s.[Address]
			,s.[DateOfBirth]
			,s.[SpecializedId]
			,s.[TrainingSystemId]
			,s.[DepartmentId]
			,s.[ClasssId]
			,s1.[Name] AS SpecializedName
			,ts.[Name] AS TrainingSystemName
			,d.[Name] AS DepartmentName
			,c.[Name] AS ClasssName
			,sy.[Name] AS SchoolYearName
		FROM Student s
		LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
		LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
		LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
		LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
		LEFT JOIN TrainingSystem ts ON ts.Id = s.TrainingSystemId AND ts.IsDeleted = 0
		WHERE s.Username = @Key AND s.IsDeleted = 0 
	)
    	
	SELECT * FROM TempResult r

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectByClasss]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStudent_SelectByClasss]
	@Key BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   ROW_NUMBER() OVER(ORDER BY s.Id ASC) AS STT
			  ,s.[Username]
			  ,s.[Name]
			  ,s.[PhoneNumber]
			  ,s.[Address]
			  ,s.[DateOfBirth]
			  ,s.[Email]
			  ,s.[SpecializedId]
			  ,s1.[Name] AS SpecializedName
			  ,s.[TrainingSystemId]
			  ,ts.[Name] AS TrainingSystemName
			  ,s.[DepartmentId]
			  ,d.[Name] AS DepartmentName
			  ,s.[ClasssId]
			  ,c.[Name] AS ClasssName
			FROM Student s
			LEFT JOIN Specialized s1 ON s1.Id = s.[SpecializedId] AND s1.IsDeleted = 0
			LEFT JOIN TrainingSystem ts ON ts.Id = s.[TrainingSystemId] AND ts.IsDeleted = 0
			LEFT JOIN Department d ON d.Id = s.[DepartmentId] AND d.IsDeleted = 0
			LEFT JOIN Classs c ON c.Id = s.[ClasssId] AND c.IsDeleted = 0
			WHERE s.[ClasssId] = @Key AND s.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.[Name];

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspTeacher_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspTeacher_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
	@DepartmentId BIGINT,
	@SpecializedId BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   t.[Id]
			  ,t.[Username]
			  ,t.[Password]
			  ,t.[Name]
			  ,t.[PhoneNumber]
			  ,t.[Email]
			  ,t.[Address]
			  ,t.[DateOfBirth]
			  ,t.[DepartmentId]
		      ,d.[Name] AS DepartmentName
			  ,t.[SpecializedId]
		      ,s.[Name] AS SpecializedName
			  ,t.[CreatedBy]
			  ,t.[CreatedDate]
			  ,t.[ModifiedBy]
			  ,t.[ModifiedDate]
			FROM Teacher t
			LEFT JOIN Department d ON d.Id = t.DepartmentId AND d.IsDeleted = 0
			LEFT JOIN Specialized s ON s.Id = t.SpecializedId AND s.IsDeleted = 0
			WHERE (
					ISNULL(@DepartmentId, '') = '' OR 
					t.[DepartmentId] = @DepartmentId
				  )
				  AND
				  (
					ISNULL(@SpecializedId, '') = '' OR 
					t.SpecializedId = @SpecializedId
				  )
				  AND
				  (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER(t.[Username]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND t.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspTrainingSystem_SelectAll]    Script Date: 10/14/2021 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspTrainingSystem_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   [Id]
			  ,[Name]
			  ,[CreatedBy]
			  ,[CreatedDate]
			  ,[ModifiedBy]
			  ,[ModifiedDate]
			FROM TrainingSystem
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER([Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
USE [master]
GO
ALTER DATABASE [ProjectManager] SET  READ_WRITE 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intern](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Point] [varchar](3) NULL,
	[LinkDownload] [nvarchar](255) NULL,
	[TeacherId] [bigint] NULL,
	[StudentId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Intern] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Intern] ON 

INSERT [dbo].[Intern] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'123', N'7', N'https://translate.google.com/?hl=vi&sl=vi&tl=en&text=ch%E1%BA%A5m%20%C4%91i%E1%BB%83m&op=translate', 1, 1, N'1', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, CAST(N'2021-10-11T00:15:43.533' AS DateTime), NULL, CAST(N'2021-10-09T23:13:51.920' AS DateTime), 0)
INSERT [dbo].[Intern] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (5, N'Quản lý nhân sự', NULL, N'http://localhost:17099/', 1, 13, N'1421050318', CAST(N'2021-10-14T22:58:02.210' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Intern] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (6, N'123', NULL, N'123', 1, 13, N'1421050318', CAST(N'2021-10-14T23:04:16.600' AS DateTime), NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Intern] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (7, N'asd', NULL, N'asd', 1, 13, N'1421050318', CAST(N'2021-10-14T23:05:45.460' AS DateTime), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Intern] OFF
GO



CREATE PROCEDURE [dbo].[uspIntern_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
    @TeacherId BIGINT,
    @SchoolYearId BIGINT,
	@Status BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
		-- Tất cả
		IF (@Status = 0)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM Intern pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

		-- Không đạt
		IF (@Status = 1)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM Intern pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						CAST(pl.Point AS DECIMAL(10,1)) < CAST(7 AS DECIMAL(10,1))
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

		-- Đạt
		IF (@Status = 2)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM Intern pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						CAST(pl.Point AS DECIMAL(10,1)) >= CAST(7 AS DECIMAL(10,1))
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO