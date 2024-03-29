DROP DATABASE [TestKey]
USE [master]
GO
/****** Object:  Database [TestKey]    Script Date: 21/3/2023 1:37:06 PM ******/
CREATE DATABASE [TestKey]

 
GO
ALTER DATABASE [TestKey] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestKey].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestKey] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestKey] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestKey] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestKey] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestKey] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestKey] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TestKey] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestKey] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestKey] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestKey] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestKey] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestKey] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestKey] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestKey] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestKey] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestKey] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestKey] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestKey] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestKey] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestKey] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestKey] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestKey] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestKey] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestKey] SET  MULTI_USER 
GO
ALTER DATABASE [TestKey] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestKey] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestKey] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestKey] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestKey] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestKey] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestKey] SET QUERY_STORE = OFF
GO
USE [TestKey]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnRemoveMark]    Script Date: 21/3/2023 1:37:07 PM ******/
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
/****** Object:  Table [dbo].[Classs]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_Classs] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Classs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_Department] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Intern]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_Intern] [nvarchar](50) NULL,
 CONSTRAINT [PK_Intern] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectList]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_ProjectList] [nvarchar](50) NOT NULL,
	[SpecializedId] [bigint] NULL,
 CONSTRAINT [PK_ProjectList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolYear]    Script Date: 21/3/2023 1:37:07 PM ******/
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
/****** Object:  Table [dbo].[Specialized]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_Specialized] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specialized] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_Student] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_Teacher] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingSystem]    Script Date: 21/3/2023 1:37:07 PM ******/
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
	[ID_TrainingSystem] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TrainingSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement]    Script Date: 21/3/2023 1:37:07 PM ******/
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

INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Classs]) VALUES (1, N'CL1', 1, 0, 0, N'string', CAST(N'2023-03-16T01:38:25.183' AS DateTime), N'string', CAST(N'2023-03-15T18:38:08.167' AS DateTime), N'string', CAST(N'2023-03-15T18:38:08.167' AS DateTime), 0, N'CL1')
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Classs]) VALUES (2, N'CL2', 2, 0, 0, N'string', CAST(N'2023-03-16T01:38:36.830' AS DateTime), N'string', CAST(N'2023-03-15T18:38:08.167' AS DateTime), N'string', CAST(N'2023-03-15T18:38:08.167' AS DateTime), 0, N'CL2')
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Classs]) VALUES (7, N'CL3', 1, NULL, NULL, N'admin', CAST(N'2023-03-16T22:58:31.240' AS DateTime), N'admin', CAST(N'2023-03-17T12:13:21.717' AS DateTime), NULL, NULL, 0, N'CL3')
INSERT [dbo].[Classs] ([Id], [Name], [DepartmentId], [SpecializedId], [SchoolYearId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Classs]) VALUES (14, N'â', NULL, NULL, NULL, N'admin', CAST(N'2023-03-18T21:31:06.340' AS DateTime), NULL, NULL, NULL, NULL, 0, N'â')
SET IDENTITY_INSERT [dbo].[Classs] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Department]) VALUES (1, N'Chủ tịch', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'Chủ tịch hội đồng', N'admin', CAST(N'2023-03-18T20:14:03.883' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), 0, N'CT1')
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Department]) VALUES (2, N'Thư ký', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'Thư ký hội đồng', N'admin', CAST(N'2023-03-18T20:14:37.613' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), 0, N'TK1')
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Department]) VALUES (3, N'Uỷ viên', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'Uỷ viên hội đồng', N'admin', CAST(N'2023-03-18T20:15:08.890' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), 0, N'UV1')
INSERT [dbo].[Department] ([Id], [Name], [FoundingDate], [Discriptions], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Department]) VALUES (4, N'Giảng viên phản biên', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'Giảng viên hội đồng', N'admin', CAST(N'2023-03-18T20:15:34.107' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), N'string', CAST(N'2023-03-18T13:12:02.243' AS DateTime), 0, N'GV1')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Intern] ON 

INSERT [dbo].[Intern] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Intern]) VALUES (13, N'Hiệp', N'2', N'Tốt', 11, 2, N'admin', CAST(N'2023-03-20T20:43:38.757' AS DateTime), NULL, NULL, NULL, NULL, 0, N'TT1')
INSERT [dbo].[Intern] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Intern]) VALUES (15, N'Hiepprot3', N'2', N'a', 11, 1, N'admin', CAST(N'2023-03-20T23:19:14.577' AS DateTime), NULL, NULL, NULL, NULL, 0, N'aa aa')
SET IDENTITY_INSERT [dbo].[Intern] OFF
GO
SET IDENTITY_INSERT [dbo].[ProjectList] ON 

INSERT [dbo].[ProjectList] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_ProjectList], [SpecializedId]) VALUES (1, N'62pm1', N'3', N'aaa', 1, 1, N'admin', CAST(N'2023-03-16T10:54:59.370' AS DateTime), NULL, NULL, NULL, NULL, 0, N'62pm1', NULL)
INSERT [dbo].[ProjectList] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_ProjectList], [SpecializedId]) VALUES (2, N'ef', NULL, NULL, NULL, NULL, N'admin', CAST(N'2023-03-16T11:44:29.210' AS DateTime), NULL, NULL, NULL, NULL, 0, N'2', NULL)
INSERT [dbo].[ProjectList] ([Id], [Name], [Point], [LinkDownload], [TeacherId], [StudentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_ProjectList], [SpecializedId]) VALUES (4, N'aa', N'333', N'4', 20, NULL, N'admin', CAST(N'2023-03-21T13:28:29.757' AS DateTime), NULL, NULL, NULL, NULL, 0, N'aa', 8)
SET IDENTITY_INSERT [dbo].[ProjectList] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialized] ON 

INSERT [dbo].[Specialized] ([Id], [Name], [Discriptions], [DepartmentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Specialized]) VALUES (8, N'hiepprot3', NULL, NULL, N'admin', CAST(N'2023-03-19T13:57:30.760' AS DateTime), N'admin', CAST(N'2023-03-21T03:11:44.453' AS DateTime), NULL, NULL, 0, N'1aaaaa')
INSERT [dbo].[Specialized] ([Id], [Name], [Discriptions], [DepartmentId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Specialized]) VALUES (11, N'wư', NULL, NULL, N'admin', CAST(N'2023-03-21T03:06:44.647' AS DateTime), NULL, NULL, NULL, NULL, 0, N'wư')
SET IDENTITY_INSERT [dbo].[Specialized] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Student], [Gender]) VALUES (1, N'20233816689815', N'62-57-9C-75-E4-F3-42-55-56-7D-64-67-92-27-5A-3C', N'string', N'string', N'string', N'string', CAST(N'2023-03-16T02:51:13.067' AS DateTime), 0, 0, 0, 0, N'string', CAST(N'2023-03-16T09:52:02.880' AS DateTime), N'string', CAST(N'2023-03-16T02:51:13.070' AS DateTime), N'admin', CAST(N'2023-03-21T01:35:37.870' AS DateTime), 1, N'SV1', NULL)
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Student], [Gender]) VALUES (2, N'2023785564018', N'C0-E6-D5-9B-E8-43-4D-76-DA-66-45-C2-03-5A-FE-85', N'aaaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'admin', CAST(N'2023-03-20T20:30:14.333' AS DateTime), NULL, NULL, N'admin', CAST(N'2023-03-21T01:35:35.783' AS DateTime), 1, N'aaa', N'ádasd')
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Student], [Gender]) VALUES (4, N'2023249734899', N'F5-63-23-F3-62-4B-0E-04-39-E9-B4-60-31-2B-CB-CF', N'a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'admin', CAST(N'2023-03-21T01:08:04.957' AS DateTime), NULL, NULL, N'admin', CAST(N'2023-03-21T01:35:34.360' AS DateTime), 1, N'a', N'Nam')
INSERT [dbo].[Student] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [SpecializedId], [TrainingSystemId], [DepartmentId], [ClasssId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Student], [Gender]) VALUES (6, N'20234282554297', N'B9-12-97-32-4D-C8-85-F4-3F-0A-93-71-82-A3-27-BF', N'hiepepro', N'323aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'admin', CAST(N'2023-03-21T01:31:32.670' AS DateTime), NULL, NULL, N'admin', CAST(N'2023-03-21T01:35:33.020' AS DateTime), 1, N'23', NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [DepartmentId], [SpecializedId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Teacher], [Gender]) VALUES (20, N'MGV1672989846', N'B8-F9-46-D4-84-75-2D-DE-17-F7-73-0D-05-74-DE-21', N'Giảng viên 1', N'23', N'admin@google.com', N'a', CAST(N'2023-03-15T00:00:00.000' AS DateTime), 1, 8, N'admin', CAST(N'2023-03-21T11:59:54.137' AS DateTime), NULL, NULL, NULL, NULL, 0, N'GV1', N'Nữ')
INSERT [dbo].[Teacher] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [Address], [DateOfBirth], [DepartmentId], [SpecializedId], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted], [ID_Teacher], [Gender]) VALUES (21, N'MGV2889304959', N'05-B2-EF-58-DC-2A-5B-0F-9E-AB-05-74-15-60-0D-91', N'GV2', N'2', N'2051063850@tlu.edu.vn', N'3', CAST(N'2023-03-08T00:00:00.000' AS DateTime), 3, 8, N'admin', CAST(N'2023-03-21T12:00:23.370' AS DateTime), N'admin', CAST(N'2023-03-21T12:01:53.933' AS DateTime), NULL, NULL, 0, N'GV2', N'Nam')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[UserManagement] ON 

INSERT [dbo].[UserManagement] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'admin', N'21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3', N'Administrator', N'0949234086', N'letiendung130196@gmail.com', N'system', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[UserManagement] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_Classs]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[Classs] ADD  CONSTRAINT [ID_Classs] UNIQUE NONCLUSTERED 
(
	[ID_Classs] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_Department]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [ID_Department] UNIQUE NONCLUSTERED 
(
	[ID_Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_Intern]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[Intern] ADD  CONSTRAINT [ID_Intern] UNIQUE NONCLUSTERED 
(
	[ID_Intern] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_ProjectList]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[ProjectList] ADD  CONSTRAINT [ID_ProjectList] UNIQUE NONCLUSTERED 
(
	[ID_ProjectList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_Specialized]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[Specialized] ADD  CONSTRAINT [ID_Specialized] UNIQUE NONCLUSTERED 
(
	[ID_Specialized] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_Student]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [ID_Student] UNIQUE NONCLUSTERED 
(
	[ID_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_Teacher]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [ID_Teacher] UNIQUE NONCLUSTERED 
(
	[ID_Teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ID_TrainingSystem]    Script Date: 21/3/2023 1:37:07 PM ******/
ALTER TABLE [dbo].[TrainingSystem] ADD  CONSTRAINT [ID_TrainingSystem] UNIQUE NONCLUSTERED 
(
	[ID_TrainingSystem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[uspClasss_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
		   ,c.[ID_Classs]
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
/****** Object:  StoredProcedure [dbo].[uspDepartment_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
		   ,[ID_Department]
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
/****** Object:  StoredProcedure [dbo].[uspIntern_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
				  ,t.Id_Teacher AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Id_Student AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,pl.[ID_Intern]
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
					dbo.ufnRemoveMark(TRIM(UPPER(pl.[Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
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
				  ,pl.ID_Intern
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
						s.Name = @Key
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
				  ,pl.[ID_Intern]
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
						s.Name = @Key
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
/****** Object:  StoredProcedure [dbo].[uspProjectList_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
				  ,pl.[SpecializedId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,pl.[ID_ProjectList]
				  ,s1.[Name] as SpecializedName
				  ,c.[Name] AS ClasssName
			
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = pl.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER(pl.[Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
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
				  ,pl.[ID_ProjectList]

				  ,s1.[Name] as SpecializedName
				  ,c.[Name] AS ClasssName
			
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = pl.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Name = @Key
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
				  ,pl.[ID_ProjectList]

				    ,s1.[Name] as SpecializedName
				  ,c.[Name] AS ClasssName
			
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = pl.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Name = @Key
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
/****** Object:  StoredProcedure [dbo].[uspSchoolYear_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
/****** Object:  StoredProcedure [dbo].[uspSpecialized_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
			  ,s.[ID_Specialized]
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
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
			  ,s.[Gender]
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
			  ,s.[ID_Student]
			FROM Student s
			LEFT JOIN Specialized s1 ON s1.Id = s.[SpecializedId] AND s1.IsDeleted = 0
			LEFT JOIN TrainingSystem ts ON ts.Id = s.[TrainingSystemId] AND ts.IsDeleted = 0
			LEFT JOIN Department d ON d.Id = s.[DepartmentId] AND d.IsDeleted = 0
			LEFT JOIN Classs c ON c.Id = s.[ClasssId] AND c.IsDeleted = 0
			WHERE (
					ISNULL(@Key, '') = '' OR 
					s.[Name] = @Key
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
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectAllByUsername]    Script Date: 21/3/2023 1:37:07 PM ******/
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
			,s.[Gender]
			,s.[Address]
			,s.[DateOfBirth]
			,s.[SpecializedId]
			,s.[TrainingSystemId]
			,s.[DepartmentId]
			,s.[ClasssId]
			,s.[ID_Student]
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
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectByClasss]    Script Date: 21/3/2023 1:37:07 PM ******/
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
			  ,s.[Gender]
			  ,s.[SpecializedId]
			  ,s.[ID_Student]
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
/****** Object:  StoredProcedure [dbo].[uspTeacher_bySpeciaAll]    Script Date: 21/3/2023 1:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspTeacher_bySpeciaAll]
	@Key int
   
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
	 
			select 
			sp.[ID_Specialized] ,
			sp.Name,
			t1.Name as CT,
			t2.Name as NV  
			from( Teacher t1  inner join Specialized sp on sp.Id=t1.SpecializedId )
			inner join Teacher t2 on sp.Id=t2.SpecializedId 
			where sp.Id=@Key and
			t1.DepartmentId='4'
			and t2.DepartmentId='3'
				
				  AND t1.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Name ;

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
/****** Object:  StoredProcedure [dbo].[uspTeacher_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
			  ,t.[Gender]
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
			  ,t.[ID_Teacher]
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
					dbo.ufnRemoveMark(TRIM(UPPER(t.[Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
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
/****** Object:  StoredProcedure [dbo].[uspTeacher_SelectBySpecialized]    Script Date: 21/3/2023 1:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspTeacher_SelectBySpecialized]
	@Key int,
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
	s.[Id],
	s.ID_Specialized,
    s.Name AS Name,
    t1.Name AS CT,
    t2.Name AS TK,
	    t3.Name AS UV,
		T4.Name as GV

FROM 
    Specialized s
    LEFT JOIN (
        SELECT 
            SpecializedId, 
            Name
        FROM 
            Teacher 
        WHERE 
            DepartmentId = '1'
    ) t1 ON s.Id = t1.SpecializedId
    LEFT JOIN (
        SELECT 
            SpecializedId, 
            Name
        FROM 
            Teacher 
        WHERE 
            DepartmentId = '2'
    ) t2 ON s.Id = t2.SpecializedId
	LEFT JOIN (
        SELECT 
            SpecializedId, 
            Name
        FROM 
            Teacher 
        WHERE 
            DepartmentId = '3'
    ) t3 ON s.Id = t3.SpecializedId
		LEFT JOIN (
        SELECT 
            SpecializedId, 
            Name
        FROM 
            Teacher 
        WHERE 
            DepartmentId = '4'
    ) t4 ON s.Id = t3.SpecializedId
	where ISNULL(@Key, '') = '' OR 
					s.Id = @Key
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Name ;

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
/****** Object:  StoredProcedure [dbo].[uspTrainingSystem_SelectAll]    Script Date: 21/3/2023 1:37:07 PM ******/
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
			  ,[ID_TrainingSystem]
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
ALTER DATABASE [TestKey] SET  READ_WRITE 
GO
