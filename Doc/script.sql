USE [master]
GO
/****** Object:  Database [Team5ADProject]    Script Date: 2017/1/18 14:06:18 ******/
CREATE DATABASE [Team5ADProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Team5ADProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Team5ADProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Team5ADProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Team5ADProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Team5ADProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Team5ADProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Team5ADProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Team5ADProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Team5ADProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Team5ADProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [Team5ADProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Team5ADProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Team5ADProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Team5ADProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Team5ADProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Team5ADProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Team5ADProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Team5ADProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Team5ADProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Team5ADProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Team5ADProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Team5ADProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Team5ADProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Team5ADProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Team5ADProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Team5ADProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Team5ADProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Team5ADProject] SET RECOVERY FULL 
GO
ALTER DATABASE [Team5ADProject] SET  MULTI_USER 
GO
ALTER DATABASE [Team5ADProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Team5ADProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Team5ADProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Team5ADProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Team5ADProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Team5ADProject', N'ON'
GO
USE [Team5ADProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Team5ADProject]
GO
/****** Object:  Table [dbo].[Delegation]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delegation](
	[DelegationID] [nvarchar](50) NOT NULL,
	[DepartmentHeadID] [nvarchar](50) NOT NULL,
	[CoveringHeadID] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Delegation] PRIMARY KEY CLUSTERED 
(
	[DelegationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [nvarchar](50) NOT NULL,
	[Collection_Point] [nvarchar](max) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[HeadName] [nvarchar](50) NOT NULL,
	[RepresentativeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DisbursementLog]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisbursementLog](
	[DisbursementID] [int] NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[NeededNumber] [int] NOT NULL,
	[RetrivedNumber] [int] NOT NULL,
	[GivenNumber] [int] NOT NULL,
 CONSTRAINT [PK_DisbursementLog_1] PRIMARY KEY CLUSTERED 
(
	[DisbursementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discrepancy]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discrepancy](
	[DiscrepancyID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[RequestLog] [nvarchar](max) NULL,
 CONSTRAINT [PK_Discrepancy] PRIMARY KEY CLUSTERED 
(
	[DiscrepancyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Item]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemID] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[InStock] [int] NOT NULL,
	[BinNumber] [nchar](10) NOT NULL,
	[UOM] [nchar](10) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[ReorderQty] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[TotalQty] [int] NOT NULL,
	[Justification] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[RequestLog] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [nvarchar](50) NOT NULL,
	[PurchaseOrderID] [nvarchar](50) NOT NULL,
	[SupplierID] [nvarchar](50) NOT NULL,
	[OrderQty] [int] NOT NULL,
	[ReceivedQty] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OutstandingRequest]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutstandingRequest](
	[ItemID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[OutstandingQty] [int] NOT NULL,
 CONSTRAINT [PK_OutstandingRequest] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [nvarchar](50) NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[RequestLog] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestDetails]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDetails](
	[RequestID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[RequestQty] [int] NOT NULL,
	[RetrievedQty] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_RequestDetail] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[UserID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[GSTRegistrationNo] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[FaxNo] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplyDetails]    Script Date: 2017/1/18 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyDetails](
	[SupplierID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_SupplyDetails] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'COMM', N'Medical School', N'Commerce Dept', N'Mr Mohd Azman', N'8741284', N'Dr.Chia Leow Bee', N'Mr Mohd Azman')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'CPSC', N'Management School', N'Computer Science', N'Mr Wee Kian Fatt', N'8901235', N'Dr.Soh Kian Wee', N'Mr Wee Kian Fatt')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'ENGL', N'Startionery Store', N'English Dept', N'Mrs Pamela Kow', N'8742234', N'Prof Ezra Pound', N'Mrs Pamela Kow')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'REGR', N'Engineering School', N'Registrar Dept', N'Ms Helen Ho', N'8901266', N'Mrs Low Kway Boo', N'Ms Helen Ho')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'STORE', N'Startionery Store', N'Startionery Store Dept', N'Mr Zhang', N'9846378', N'Zhang Zheng', N'Zhang Zheng')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'ZOOL', N'Science School', N'Zoology Dept ', N'Mr Peter Tan Ah Meng', N'8901266', N'Prof Tan', N'Mr Peter Tan Ah Meng')
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C001', N'Clips Double 1"', N'Clip', 500, N'C1        ', N'Dozen     ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C002', N'Clips Double 2"', N'Clip', 600, N'C2        ', N'Dozen     ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C003', N'Clips Double 3/4"', N'Clip', 500, N'C3        ', N'Dozen     ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C004', N'Clips Paper Large', N'Clip', 300, N'C4        ', N'Box       ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C005', N'Clips Paper Medium ', N'Clip', 214, N'C5        ', N'Box       ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C006', N'Clips Paper Small', N'Clip', 123, N'C6        ', N'Box       ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E001', N'Envelope Brown(3"×6")', N'Envelope', 1000, N'E1        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E002', N'Envelope Brown(3"×6" w/Window)', N'Envelope', 1000, N'E2        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E003', N'Envelope Brown (5"x7")', N'Envelope', 435, N'E3        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E004', N'Envelope Brown (5"x7") w/ Window', N'Envelope', 320, N'E4        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E005', N'Envelope White (3"x6")', N'Envelope', 150, N'E5        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E006', N'Envelope White (3"x6") w/ Window', N'Envelope', 302, N'E6        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E007', N'Envelope White (5"x7")', N'Envelope', 232, N'E7        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E008', N'Envelope White (5"x7") w/ Window', N'Envelope', 298, N'E8        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E020', N'Eraser(hard)', N'Eraser', 200, N'E15       ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E021', N'Eraser(soft)', N'Eraser', 200, N'E16       ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E030', N'Exercise Book(100pg)', N'Exercise', 300, N'E17       ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E031', N'Exercise Book (120 pg)', N'Exercise', 400, N'E9        ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E032', N'Exercise Book A4 Hardcover (100 pg)', N'Exercise', 200, N'E10       ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E033', N'Exercise Book A4 Hardcover (120 pg)', N'Exercise', 343, N'E11       ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E034', N'Exercise Book A4 Hardcover (200 pg)', N'Exercise', 321, N'E12       ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E035', N'Exercise Book Hardcover (100 pg)', N'Exercise', 456, N'E13       ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E036', N'Exercise Book Hardcover (120 pg)', N'Exercise', 656, N'E14       ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F020', N'File Separator', N'File', 300, N'F1        ', N'Set       ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F021', N'File-Blue Plain', N'File', 10, N'F2        ', N'Each      ', 200, 100)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F022', N'File-Blue with Logo', N'File', 120, N'F3        ', N'Each      ', 200, 100)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F023', N'File-Brown w/o Logo', N'File', 123, N'F4        ', N'Each      ', 200, 150)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F024', N'File-Brown with Logo', N'File', 345, N'F5        ', N'Each      ', 200, 150)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F031', N'Folder Plastic Blue', N'File', 1000, N'F6        ', N'Each      ', 200, 150)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F032', N'Folder Plastic Clear', N'File', 400, N'F7        ', N'Each      ', 200, 150)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F033', N'Folder Plastic Green', N'File', 50, N'F8        ', N'Each      ', 200, 150)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F034', N'Folder Plastic Pink', N'File', 504, N'F9        ', N'Each      ', 200, 150)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F035', N'Folder Plastic Yellow', N'File', 600, N'F10       ', N'Each      ', 200, 150)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H011', N'Highlighter Blue', N'Pen', 400, N'H1        ', N'Each      ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H012', N'Highlighter Green', N'Pen', 450, N'H2        ', N'Box       ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H013', N'Highlighter Pink', N'Pen', 544, N'H3        ', N'Box       ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H014', N'Highlighter Yellow', N'Pen', 466, N'H4        ', N'Box       ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H031', N'Hole Puncher 2 holes', N'Puncher', 200, N'H5        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H032', N'Hole Puncher 3 holes', N'Puncher', 657, N'H6        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H033', N'Hole Puncher Adjustable', N'Puncher', 657, N'H7        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P010', N'Pad Postit Memo 1"×2"', N'Pad', 200, N'P1        ', N'Packet    ', 100, 60)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P011', N'Pad Postit Memo 1/2"x1"', N'Pad', 800, N'P2        ', N'Packet    ', 100, 60)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P012', N'Pad Postit Memo 1/2"x2"', N'Pad', 1020, N'P3        ', N'Packet    ', 100, 60)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P013', N'Pad Postit Memo 2"x3"', N'Pad', 100, N'P4        ', N'Packet    ', 100, 60)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P014', N'Pad Postit Memo 2"x4"', N'Pad', 300, N'P5        ', N'Packet    ', 100, 60)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P015', N'Pad Postit Memo 2"x4"', N'Pad', 234, N'P6        ', N'Packet    ', 100, 60)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P016', N'Pad Postit Memo 3/4"x2"', N'Pad', 345, N'P7        ', N'Packet    ', 100, 60)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P020', N'Paper Photostat A3', N'Paper', 678, N'P8        ', N'Box       ', 500, 500)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P021', N'Paper Photostat A4', N'Paper', 566, N'P9        ', N'Box       ', 500, 500)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P030', N'Pen Ballpoint Black', N'Pen', 554, N'P10       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P031', N'Pen Ballpoint Blue', N'Pen', 554, N'P11       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P032', N'Pen Ballpoint Red', N'Pen', 454, N'P12       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P033', N'Pen Felt Tip Black', N'Pen', 456, N'P13       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P034', N'Pen Felt Tip Blue', N'Pen', 788, N'P14       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P035', N'Pen Felt Tip Red', N'Pen', 333, N'P15       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P036', N'Pen Transparency Permanent', N'Pen', 355, N'P16       ', N'Packet    ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P037', N'Pen Transparency Soluble', N'Pen', 234, N'P17       ', N'Packet    ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P038', N'Pen Whiteboard Marker Black', N'Pen', 234, N'P18       ', N'Box       ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P039', N'Pen Whiteboard Marker Blue', N'Pen', 245, N'P19       ', N'Box       ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P040', N'Pen Whiteboard Marker Green', N'Pen', 655, N'P20       ', N'Box       ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P041', N'Pen Whiteboard Marker Red', N'Pen', 456, N'P21       ', N'Box       ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P042', N'Pencil 2B', N'Pen', 453, N'P22       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P043', N'Pencil 2B with Eraser End', N'Pen', 367, N'P23       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P044', N'Pencil 4H ', N'Pen', 800, N'P24       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P045', N'Pencil B', N'Pen', 78, N'P25       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P046', N'Pencil B with Eraser End', N'Pen', 789, N'P26       ', N'Dozen     ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'R001', N'Ruler 6"', N'Ruler', 433, N'R2        ', N'Dozen     ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'R002', N'Ruler 12"', N'Ruler', 456, N'R1        ', N'Dozen     ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S010', N'Shorthand Book (100 pg)', N'Shorthand', 570, N'S5        ', N'Each      ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S011', N'Shorthand Book (120 pg)', N'Shorthand', 480, N'S6        ', N'Each      ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S012', N'Shorthand Book (80 pg)', N'Shorthand', 760, N'S7        ', N'Each      ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S020', N'Stapler No. 28', N'Stapler', 488, N'S8        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S021', N'Stapler No. 36', N'Stapler', 390, N'S9        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S022', N'Stapler No. 28', N'Stapler', 230, N'S10       ', N'Box       ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S023', N'Stapler No. 36', N'Stapler', 430, N'S11       ', N'Box       ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S040', N'Scotch Tape', N'Tape', 365, N'S2        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S041', N'Scotch Tape Dispenser', N'Tape', 944, N'S3        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S100', N'Scissors', N'Scissors', 746, N'S1        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'S101', N'Sharpener', N'Sharpener', 850, N'S4        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T001', N'Thumb Tacks Large', N'Tacks', 160, N'T1        ', N'Box       ', 10, 10)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T002', N'Thumb Tacks Medium', N'Tacks', 190, N'T2        ', N'Box       ', 10, 10)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T003', N'Thumb Tacks Small', N'Tacks', 10, N'T3        ', N'Box       ', 10, 10)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T020', N'Transparency Blue', N'Tparency', 57, N'T4        ', N'Box       ', 100, 200)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T021', N'Transparency Clear', N'Tparency', 544, N'T5        ', N'Box       ', 500, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T022', N'Transparency Green', N'Tparency', 654, N'T6        ', N'Box       ', 100, 200)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T023', N'Transparency Red', N'Tparency', 970, N'T7        ', N'Box       ', 100, 200)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T024', N'Transparency Reverse Blue', N'Tparency', 790, N'T8        ', N'Box       ', 100, 200)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T025', N'Transparency Cover 3M', N'Tparency', 100, N'T9        ', N'Box       ', 500, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'T100', N'Trays In/Out', N'Tray', 300, N'T10       ', N'Set       ', 20, 10)
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'00242', N'ENGL', N'Pablo', N'izfmhonc.lmieivnii@zjqxcz.com', N'FZTL4MYR5Y25240HBVT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'00281', N'CPSC', N'Bruce', N'tsghcwb.ymukxpbsl@-adsxs.net', N'RCHC4681OMIGO6V', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'00419', N'REGR', N'Randolph', N'btcwqnfs.qndvbcxf@undhbhx.jznafo.com', N'VUJW7D0M9J', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'00641', N'ZOOL', N'Francis', N'yowyybtg.diqmrp@jpukrl.firjzn.net', N'GKMSPT7Y', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'00703', N'COMM', N'Jeannette', N'xbhntwro.ftvm@rpugmd.umgwop.net', N'D827DHMJZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'01078', N'CPSC', N'Lana', N'ebbbhvzm.snrqgkczlg@kcbcjn.org', N'4LMWC3G7VRO371OS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'01241', N'CPSC', N'Wayne', N'mtrbs@bnwpxi.org', N'8KD148QE9E30ZEUDJ8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'01250', N'COMM', N'Kristine', N'lshp195@uxyelq.qzefqs.com', N'4P3XC0ZCIBBX', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'01493', N'CPSC', N'Grant', N'ggay.xthxwewer@putdsa.org', N'0RNRDVXYLGBQWYM9JTU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02060', N'REGR', N'Dylan', N'wvexngp.nyuico@pgneet.net', N'HWUGMUB02LFY7XO3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02105', N'CPSC', N'Doris', N'rpozqtn@wgzqfbjqm.zririv.org', N'PPNNHOUQ37U', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02338', N'COMM', N'Alejandro', N'fzhy.clvsn@uhetvw.org', N'8E2Y2CVWFKF1L', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02430', N'ENGL', N'Shawna', N'fideyc1@jkgajnwx.onafpf.net', N'3MVA2YV7IW4NVFH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02453', N'COMM', N'Eduardo', N'hppl.yzgkcnfy@rajhka.runemw.net', N'6BMJRVECL4O0MJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02462', N'COMM', N'Jeannette', N'dqqt.rglxx@dxxogx.com', N'OYGMZ5PN31ESAG14RB', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02631', N'CPSC', N'Mitchell', N'uyhxuaw@lkjefg.net', N'DUYOIT2MWAOF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'02892', N'ENGL', N'Damon', N'vvikvwm.leflnrw@dsbcnv.ylhnch.net', N'W4FF8T4DWU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'03258', N'ENGL', N'Edwin', N'jqgqj.pvcmrtsaxg@ruyqht.org', N'ZRK2WADW147HSL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'03603', N'REGR', N'Leticia', N'ochyfx.tdbv@dmtpo.rryqrj.org', N'XIFJZTHIXEL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'03670', N'ZOOL', N'Erik', N'zdhso.rkonan@azlklkh.qtbize.com', N'SP3SXCK9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'04449', N'ZOOL', N'Glenn', N'wkehidg559@leyzzk.-pvety.org', N'3CMMSSXETQHM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'04686', N'REGR', N'Shelley', N'aoafnk.gtcuqkxo@ccoqto.com', N'IBCKP9DCKGY3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'04821', N'COMM', N'Alana', N'ahwjc12@lfxzxg.net', N'XYI3CZE9N4CYZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'04883', N'CPSC', N'Corey', N'akov@c-kgbe.com', N'8WC5J3IEBGFBLGPA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'05423', N'ENGL', N'Melisa', N'snxkhg@yajuzlddc.soebeb.com', N'VQCFEZ20JX8AO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'05557', N'CPSC', N'Louis', N'jldsrs.qlbib@filmigp.jwkmby.org', N'TVBZS7SRW35NXN1B', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'05753', N'COMM', N'Sabrina', N'pzexz@ukqrzv.net', N'SMGNKO9UN7LQGYHDK5P7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'05891', N'CPSC', N'Glen', N'ppcofwyy.tpkjlzs@minwplm.ikrgsz.net', N'DEEQPRHS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'06364', N'COMM', N'Marvin', N'wocast.vqjrn@pngghh.com', N'8XN6YSGECVS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'06712', N'REGR', N'John', N'zofpyml34@cczm.mrywnm.org', N'P3TK6C6ZJH2EXCHV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'07010', N'COMM', N'Holly', N'bneyngp.bqgt@draqzv.net', N'H76IJR82', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'07486', N'CPSC', N'Courtney', N'iklhphy@xslhibik.gghglg.org', N'0K40D0IR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'07580', N'ZOOL', N'Vicky', N'trkcq.cyjk@bjlphk.net', N'VGMQ4CD7COW9TG43474H', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'07796', N'CPSC', N'Angelina', N'mdxuq384@ektqrh.net', N'CE86FKZZRHB7AXT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'07850', N'REGR', N'Karin', N'lvrqqnd880@mvud.ldadpf.net', N'6K5XEOWIMJ7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'07915', N'ENGL', N'Jackie', N'laddv.jtgtbzefni@ncjkdm.org', N'6UFJQKEHKCI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'08816', N'REGR', N'Roman', N'fejp.lnicfjl@gdeuq.zuzyhd.org', N'UZKUHZOMUA5HI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'08953', N'COMM', N'Ronnie', N'ifnjr.syogubtzg@ulrtzs.com', N'VSY1MKIJM230RLAIHU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'09062', N'ZOOL', N'Alma', N'ftslvy.ndmyffgqla@ebndyj.org', N'VGGRDB6ZGDC3P', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'09125', N'CPSC', N'Mitchell', N'edbk46@osfgws.org', N'HGAL6ZDFH4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'09166', N'ENGL', N'Ivan', N'azgkda.vfvdxxrbb@dhzuimuzj.ka-dly.org', N'JTY0NYBV3U', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'09717', N'CPSC', N'Sergio', N'szkewjfe@gxhthkcf.shipfn.org', N'0JCXGO92A2MT7RI7B6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'09836', N'CPSC', N'Fred', N'dkxurwjr@ecblqd.djjn-a.org', N'M2KIFFX75XDMP7K8JQM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'09979', N'ZOOL', N'Jill', N'leef0@nxwdkbw.pwibop.org', N'DV5VLVOL25XPMRB', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10067', N'ENGL', N'Raul', N'pkyczylu8@ykiarusyj.qwcqes.com', N'3N2S6ATM3QBTM67T4K', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10101', N'ZOOL', N'Tomas', N'ncysocu.bqbivp@sdvdoi.lbtekh.net', N'TSJOAQVHU15UYILSOS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10208', N'CPSC', N'Iris', N'cgqrv.olkk@gisxwzvxo.-lnfzm.net', N'YWIFSWAI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10434', N'ZOOL', N'Bobby', N'uzknhv.lfcsa@ivhy.namd--.org', N'A7EIV30OLL1M1TVE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10672', N'COMM', N'Micheal', N'xuqpt924@fwojnu.hm-dau.net', N'1SZKAGMYA7QS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10805', N'CPSC', N'Megan', N'yxzjjc414@zytatbd.vydanp.com', N'E4BMR8NFYYL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10879', N'REGR', N'Lorena', N'bhsr.pdocm@hxjmyi.com', N'V2PWODWOO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'10902', N'COMM', N'Wesley', N'mmiftg772@dkhluijgo.oarumi.com', N'06AMBCD3JHZ4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'11301', N'ENGL', N'Marlon', N'nsaeuj@iaxyh.bxwpmn.net', N'5Y7JMGKIE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'11611', N'ENGL', N'Marlon', N'yqxbkceu9@cqouad.org', N'4U7BSEV78EIWFUUU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'11689', N'COMM', N'Gilbert', N'ajaualn.uuuepaxoxg@vdvhzgk.ayoroj.com', N'JMXJ6IAU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'11924', N'COMM', N'Tabatha', N'iiyek60@nuppgc.com', N'WR0S99ZI99XU3M0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'12717', N'REGR', N'Luz', N'oocnx.dtijzck@ixzl-y.com', N'G90SX4VQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'12788', N'COMM', N'Devon', N'qbnckhi.dmlrhunpnh@qofv.lo-gmp.org', N'BSTENJOZO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'12863', N'ZOOL', N'Alicia', N'klgqg8@ddngymt.wlggdp.com', N'ZTKVZQZVCTKC9MI5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'13212', N'CPSC', N'Shelly', N'drsdn64@cefzivz.gdvrdy.net', N'WI7PFHXOL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'13261', N'ENGL', N'Annette', N'qukhl@doofz.fylhjk.org', N'XB9BU68R9TBAQLGF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14171', N'ENGL', N'Joanna', N'vbmnw220@mqastg.net', N'86DJY4INIUULPCWHZM6W', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14316', N'CPSC', N'Beth', N'hqtc18@sqez.jjzyuz.org', N'PFVU63KD3UBBXK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14321', N'ENGL', N'Jay', N'mokqlvtg.euemn@vrxbzm.org', N'7QSTHZMMG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14500', N'CPSC', N'Trent', N'yhfjblre@rgdmzz.org', N'PV0KAAHY273F', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14681', N'REGR', N'Dianna', N'luboewi59@xooop-.net', N'51QIOUSZOYEP7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14693', N'REGR', N'Frederick', N'fbtu.nlcr@fdbisf.org', N'QT54E6WWV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14895', N'ZOOL', N'Stuart', N'zvjb02@bsvoft.kkmmcl.net', N'81KCH64I', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'14907', N'REGR', N'Chastity', N'aeulda5@vfjajw.org', N'I681CIZKT797PLMRH8NG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'15016', N'ZOOL', N'Casey', N'pcplct104@aswbfto.exsbxo.com', N'5G66I2Y3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'15072', N'ENGL', N'Tanisha', N'huucanxo.ywpqc@jhjgqs.net', N'PGTDQOAKPHO3D2IAAU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'15319', N'REGR', N'Jared', N'nyjll40@bpoyiacki.yytrmi.org', N'FSW1RNP1BT3GCBO5S', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'15339', N'ZOOL', N'Danielle', N'xhzqyn.xrdfm@ymxpak.oclv-e.net', N'7M7PDTQZXCV3O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'15348', N'COMM', N'Donna', N'czgps.mhdudrdoc@r-ubyj.net', N'S9AJ41YOM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'15836', N'ENGL', N'Elias', N'lutdiscr1@xrlgslf.woystw.net', N'WF6ZDKIS5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'16311', N'ENGL', N'Nicholas', N'kxdo460@plbaetufj.p-neye.com', N'KNV5JP7PGUK8Y3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'16510', N'ZOOL', N'Bobbie', N'efjq.qtsbblt@ildbomk.wlpfjj.com', N'DSAMYQ2J', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'16736', N'REGR', N'Ronda', N'uztvggl.znpahpvy@qyoolpkke.qyz-tj.net', N'YYX79BCDED5N9YWD4CB', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'17239', N'COMM', N'Telly', N'xuflsaj@xiowaz.net', N'ZVWBKAMXRH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'17762', N'ENGL', N'Armando', N'mrzec275@ztvbui.net', N'7ZK20R1ATF0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'17994', N'COMM', N'Charlotte', N'sdjycq.jxgxpc@-swqmk.com', N'H99PZN7FBZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'18067', N'ZOOL', N'Leon', N'sinexka56@bowrtag.witshp.com', N'PILMV6I5A94CI69Y4QF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'18074', N'ZOOL', N'Mia', N'jzgz@eiqsgm.com', N'GZUI93L3KZP', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'18506', N'ENGL', N'Jason', N'hyjctdlh.kzjpxqvc@bapxre.xycitr.org', N'VZIAJPG8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'18914', N'COMM', N'Toni', N'zddk@fzhp.swiywm.com', N'FXPK7ZZBN70E85S', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'19390', N'CPSC', N'Darryl', N'moflsjc@wnkm-a.org', N'LRQD3UE581WI3H', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'19581', N'ZOOL', N'Blake', N'zorvn93@vbzs.cvgu-h.net', N'GMXAAQIWV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'19773', N'ZOOL', N'Josh', N'tzwq22@irscg.wcbfsm.org', N'GNQ8J2G4LUGJUIXE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'19958', N'ZOOL', N'Peter', N'dkkoxzbw.mrbvbtep@kegmet.com', N'VS53OL987PT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'19974', N'ZOOL', N'Jeannette', N'fugukhm.mbelczuwgh@gxhjkj.net', N'28TF68YMP', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'20047', N'COMM', N'Sheldon', N'qjwkaec13@igxwgz.net', N'DF388044C9NYTDBH1Y', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'20098', N'CPSC', N'Stefanie', N'zjjtkkpw4@tfcygoqq.cjjkwv.com', N'UN3Q0WQ94JUJX1', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'20224', N'COMM', N'Tamiko', N'lmdcfp.scpmcat@-ikvzk.org', N'GGDP2HNP1TZEZWZIO2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'20602', N'REGR', N'Ellen', N'dlnek5@yhvprhu.ozeimd.net', N'U51K1PLW1DTTV2T0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'20618', N'CPSC', N'Gilberto', N'qdpely.ivestfyzpi@ossojp.org', N'UTJSI8YZKGK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'20665', N'ENGL', N'Bryce', N'vsutpnv@ttfvki.nigjwz.com', N'N00E4ULSP1D8QS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'21015', N'REGR', N'Beth', N'heuacamp130@qhisuu.org', N'YCOEVFFK4SQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'21077', N'ZOOL', N'Tanisha', N'owaywvae@vfawvz.org', N'DG4D5GG799PR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'21403', N'CPSC', N'Garrett', N'fmwy@-jklth.net', N'86TGVDNHKLBGPS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'21537', N'REGR', N'Trisha', N'nhsl97@ouulayptw.yguxku.com', N'Z374YCQTWNYX', N'Employee')
GO
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'21828', N'COMM', N'Alfredo', N'rugmbgl@vhwh.nrotjg.com', N'4OK8FEN9DQNS1GPP2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'21842', N'REGR', N'Pedro', N'jlzl@mjtdiae.qkhcgk.com', N'N1VM6QN5QCT8T21F4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'23463', N'CPSC', N'Brad', N'webycpys.egihpey@zjaxz.alautx.net', N'ZBYSSI5YWDT6DJ9A5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'24142', N'REGR', N'Johnny', N'aykauv.gqhm@hoopr.ueqblc.org', N'8XNAT68FNNFQ3Y', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25072', N'REGR', N'Erin', N'yjlcjzxc478@hrftlv.com', N'L3VENK8ZXW7CR7BB5W5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25304', N'CPSC', N'Mathew', N'axktem.fcek@dncryk.net', N'LEDVTNZKECJLFWUL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25333', N'ENGL', N'Kris', N'oamh.noomhjpjdg@bwqjpt.net', N'X9PIT1AF4AC', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25448', N'COMM', N'Matthew', N'pfgbv467@iodeqlk.nhdoqb.com', N'854IVNICFNQYD418TTZH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25462', N'ENGL', N'Damian', N'ueljd151@lrshzdh.l-yevt.com', N'FZ46F44SO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25554', N'COMM', N'Tamika', N'etrsn@ivnptmxh.rizrts.net', N'724QA5A99J5VQL6O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25591', N'REGR', N'Emma', N'lemr0@tmlroz.net', N'X3BWF02PQ46FYC80N5I', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25910', N'ZOOL', N'Latonya', N'foabgqkx.inbxqdz@apcj.krptdj.com', N'K1FKZKOZMTWWK4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'25915', N'CPSC', N'Sheila', N'ngaqkfyj519@bxloua.com', N'9NRCFJLB33F0I2NE4L2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'26314', N'CPSC', N'Trina', N'atutua8@uahxkt.org', N'KZQYBR1XZMM2R', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'26364', N'COMM', N'Philip', N'xpyldk.vaxex@rlep.acrgcp.com', N'D1OXFUU8T41NO11NRL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'26537', N'REGR', N'Darren', N'iimlrgm50@mnwmiqpd.rsbihg.net', N'GDUDBCBMQVC', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'26646', N'COMM', N'Jeremiah', N'fffk7@qsrvt.ojtnhj.net', N'DC7T0CMWWAOCH2YXW2Z', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'26722', N'CPSC', N'Myra', N'sgugbidf.lsmtneg@qzgwix.com', N'8FT66H6H1ALZLO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'26791', N'REGR', N'Nicholas', N'xgqw.dsyxxu@mhunno.org', N'JFVNQH90NDFFD3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'27269', N'ENGL', N'Mathew', N'ykdt5@pqptyyqdo.mkxiac.net', N'NQZ1QKCF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'27307', N'ZOOL', N'Elisa', N'omwie.eqzybek@bhshj-.com', N'B12SYSU3K', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'27463', N'CPSC', N'Anne', N'mlnlupn1@gxzbu.hcwctv.com', N'87Y697OY48T1T43858F6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'27682', N'ZOOL', N'Keisha', N'yoprer@hmnlfw.fohbce.org', N'ODRRF32IS2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'27824', N'ENGL', N'Emma', N'qjba54@jxlijc.com', N'9JQNCFJHG3B03OB9W', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'27885', N'ENGL', N'Tomas', N'alpmxtj.kchz@txzmeuvg.hisdfi.com', N'07F178TUM2F', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'28090', N'REGR', N'Annette', N'ztnkkpe.zzbyej@rlortw.com', N'B0KR7PDCV2L', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'28391', N'CPSC', N'Rusty', N'hqwld.yczcupehc@xycobn.xmhyxq.org', N'Z47NS45FRTF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'28591', N'ZOOL', N'Leslie', N'rkaizbhd.taqveteqg@uvjqwh.net', N'PYJZ5YWPVADF5V', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'28671', N'CPSC', N'Jeanine', N'lipmjiu4@xxrrvo.com', N'6AOZRHORQ8RB3H', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'29131', N'REGR', N'Elijah', N'uanhcl0@oisdtsbb.jdnyfo.com', N'TXJ9XRAME1JPG2UZV8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'29143', N'REGR', N'Eddie', N'robqbhvc162@ekccei.com', N'3LK77CFHM8BCAT31LC', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'29391', N'ZOOL', N'Sergio', N'jxabjcps.klct@dzsvsu.g-wupd.org', N'N44MWBTFA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'29783', N'REGR', N'Dante', N'agzx7@rhwy.kistde.com', N'QQUT9NWEU8XW4WIX', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'30005', N'REGR', N'Trisha', N'vbki.pata@zepcns.oicqgx.net', N'1OKWHDYHPR7CORSJR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'30209', N'REGR', N'Audra', N'higserq.cjpdndkrka@fchxfm.com', N'XXZYSCYTSOR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'30862', N'COMM', N'Jamal', N'dmhkxmv.nwgc@chpg.y-p-vq.com', N'8CV4YTP7N1BR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'30885', N'ENGL', N'Tyson', N'lplidfsf.knngcd@mjfe.ntoapf.net', N'TP12YZCAZF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'30960', N'ENGL', N'Cassie', N'uzlieucw5@jlj-fp.com', N'FNYPPX4J54ZHHFW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'30961', N'CPSC', N'Rosa', N'tmlrkzv.szgpolft@aqibhbpeo.odcpbb.org', N'0YGEA3QXA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'31382', N'REGR', N'Tabitha', N'rwgbfa@nkfjhm.net', N'7L56U3V9NYN4395P5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'31455', N'CPSC', N'Enrique', N'uyei.jwupmqfpnw@gxupdt.qrrgvo.com', N'5YHF9U41DKNVAUZ5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'31781', N'ZOOL', N'Cary', N'zill@oy-uep.net', N'AGM3PK3NN19E893', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'31834', N'COMM', N'Leroy', N'mbdeeav.fvjxg@cljrwf.com', N'LYOUOQAXJYSQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'31852', N'ENGL', N'Esther', N'ghjddvct.fccrxq@pwoxcih.fzqmjd.org', N'5MYI8L7XSRTY1K1BD9B', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'31880', N'COMM', N'Ebony', N'diwjbyo.hxskonc@atinny.wazmcg.com', N'MGPGG5I50E', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'32106', N'CPSC', N'Ben', N'ajkuv.mbpu@uqjvgg.net', N'3RG6EOTDMB96M', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'32134', N'CPSC', N'Tania', N'jtqnha69@ncuwrs.net', N'O28VJ88X', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'32217', N'CPSC', N'Chandra', N'wriesq9@jdji.ikhgpj.com', N'A0R4CFZV2N', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'32813', N'ZOOL', N'Linda', N'iflro812@brab.qc-wqh.com', N'EHM6EJ4YD1WK6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33012', N'CPSC', N'Staci', N'zwlk.silymku@mvtujcaf.inwaqp.org', N'8C1JXEVWAUZDP', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33106', N'COMM', N'Tracie', N'fbeusi.twpqgn@mzluwz.com', N'7LTO9OIGGTTMGJ9U3F46', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33155', N'REGR', N'Liza', N'hfapqp.faqiuitm@kdocgx.yrddjk.net', N'M7BM9SQ5C1OYH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33389', N'ZOOL', N'Carla', N'ponvdccw4@uprtjxnfr.s-gpuc.net', N'3GJBBQVBZCF5LCQHFGIF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33687', N'ENGL', N'Jess', N'uyrinw52@ybmkcf.aeuxnx.org', N'IZO4VO8RDS3O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33768', N'ZOOL', N'Terrell', N'ldamcnbj379@uvqbhh.org', N'YMN24M074NDNFG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33871', N'REGR', N'Elias', N'fjipbf.npyd@lzao.vpvezr.net', N'ISVMOK8E', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'33889', N'COMM', N'Kent', N'lipacnup083@hadiud.net', N'CQRT8RKEOT5T5XSWZ8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'34280', N'CPSC', N'Randall', N'wnwpqsd.hizfpsls@cngpj-.net', N'DIR9UC1PWLHIED0Y', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'34669', N'COMM', N'Jamey', N'ztvqn.xhodkvawbf@ylydny.net', N'LE0XW3VZZ3U2GBZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'35024', N'ENGL', N'Nikki', N'rsgaoi.csupx@qmsuk.wtrisu.org', N'8MHUZ2NIN0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'35081', N'ENGL', N'Gustavo', N'dfbhaem.zixpbkapzv@cdrzigovj.-qpqfn.com', N'K2ZNMVSUFO3P3SEGS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'36027', N'REGR', N'Nina', N'yskdne.efokfuwiev@rhnbzs.org', N'5BOBINPSYGL7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'36369', N'CPSC', N'Wayne', N'wgcwek.omrzylw@sdbykpm.-ybdke.org', N'KBHY0DWQSQFIDLG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'36561', N'COMM', N'Nelson', N'oaecgn42@kmjgar.org', N'Z6N2I55JANVI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'36628', N'ZOOL', N'Dean', N'qhuyfki71@dqohb.elvjfm.net', N'UPBBJ58V7DTU1CLVVFNW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37099', N'ENGL', N'Nancy', N'jpwn@rrchaxase.ojelq-.com', N'LVNU9ZGOADVG4V', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37293', N'CPSC', N'Melisa', N'tescxxff91@xaxpu.inlf-f.com', N'9FQQ9L5TI0QOYCIA0LY', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37319', N'COMM', N'Tamika', N'zvhber91@vzkhcvpp.lywtyj.com', N'443U8RP2N59A4TNYDXSN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37365', N'ZOOL', N'Kristian', N'ntrprgs.huffpqkvyb@mmjkmpnqq.fnubys.net', N'IEUOX8X22', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37504', N'ZOOL', N'Esteban', N'tzhk9@rpkesf.gyfgul.org', N'IQR43CRZJ83U2P', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37666', N'CPSC', N'Cynthia', N'ylejih.zuyywctyn@ijrwgv.org', N'8N9B87ZO8L7S', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37703', N'ZOOL', N'Darrin', N'wnvtvk.rpkrilsl@vwsuog.org', N'Q9Q9YKTQ59X6SMF6E', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37743', N'COMM', N'Frances', N'gferxmc@sqqcpug.rvptix.com', N'KZAVUVC5U6A2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37878', N'COMM', N'Oliver', N'gthottwa3@sroce.ooghdb.org', N'BM8GXVGM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'37886', N'ZOOL', N'Omar', N'mwfxzlat@rqew.xhtweb.net', N'FGGDEUSXXWXP', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'38007', N'CPSC', N'Claude', N'tfhfiz28@dv-xay.org', N'JLU1G708K0E1JAVPG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'38032', N'COMM', N'Erin', N'kybjeid.ypojtj@ib-txl.org', N'05YYIF4E8L1ZBBHLXK67', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'38525', N'REGR', N'Sandy', N'tlsifb582@tgqoqk.com', N'TYT8MOA02140DTJT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'38614', N'ZOOL', N'Chadwick', N'qzumqi9@equswb.net', N'KJ5E90L91', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'39110', N'ZOOL', N'Lawrence', N'lorj.oztnabok@gqnqth.com', N'YB7EGMB3GKYAFPX', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'39125', N'CPSC', N'Beverly', N'ltojq75@bcjpaxbo.v-ubdd.com', N'FJCF7XNIYGELU7UPR3X', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'39572', N'ENGL', N'Omar', N'wmlovya2@wwlsiy.net', N'M4BLE13PB4Q9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'39610', N'ZOOL', N'Adam', N'dbyy@urzp-a.net', N'JVLWPI48M6AJ5E8BZ3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'40052', N'ENGL', N'Jamie', N'csofnozl10@funf-n.com', N'3JK3KQSL16VV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'40456', N'ENGL', N'Elena', N'wtmde.polbbxq@qurj.pocfcu.org', N'7JQL23U9BW7JKCCHBQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'40827', N'CPSC', N'Oscar', N'wxka.vvzpr@switxzz.xpumws.net', N'JPXIPO5UVDXR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'40884', N'ZOOL', N'Troy', N'odwxmfnp.ihpwwb@ampitl.com', N'FTY0P9O0JR14', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'40900', N'REGR', N'Chandra', N'cnbu95@zpvbzttru.dfmsgc.org', N'W2T4SJ3H3W1', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'40946', N'ZOOL', N'Alexis', N'kxzlcb363@jqzbuv.com', N'ZYICDSMS8B6IM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'41436', N'ENGL', N'Rolando', N'luhasco.umzywznrsb@-wsrzg.org', N'OFJV7E69T4Z', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'41689', N'REGR', N'Jenna', N'uhkvhoq7@znybkn.noieav.org', N'YJC3L6RQEB0W8X5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'41770', N'REGR', N'Ruth', N'oijsonk026@bzacft.org', N'HPOGC5SN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'41868', N'COMM', N'Mia', N'sjgjeovk.oyxhektpg@ezp-yl.org', N'RGE5CTXO4AHHXV6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'41888', N'ENGL', N'Lloyd', N'fspt.keuzlo@xwfg.vtchnl.org', N'GKHNSA74LQLR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'41921', N'ZOOL', N'Tracey', N'umztlcd283@ffypiu.com', N'U8MTOIY7BQMI3CZQOL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'41977', N'ENGL', N'Albert', N'sbzmsk448@abytah.org', N'4TFYVMG0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'42480', N'ZOOL', N'Cathy', N'ffnjm4@enstnw.org', N'S8W1WYWKM49OF3S5OE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'42494', N'CPSC', N'Rene', N'wmuljp.tdfutf@ngucca.com', N'SPRX8KMK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'42540', N'REGR', N'Dean', N'jalfb.wkoouj@-omccx.org', N'VJKABAU3N8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'43355', N'ENGL', N'Spencer', N'tdtc5@aohep.brtanj.net', N'H2KM7RY66PA', N'Employee')
GO
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'43577', N'REGR', N'Danny', N'ohxcpud704@xfhgsx.net', N'7YBLWQ6M9SIP9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'43788', N'ENGL', N'Miranda', N'plnddu.jxch@qvhaaql.yunwpe.org', N'EP18WGD4HITLZB25HJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'43830', N'CPSC', N'Summer', N'peemvwe.fisuycod@ujxeej.net', N'CM8DX9J5XG9ON1J1W', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'43899', N'COMM', N'Elias', N'ogok.meznsgak@wrnutw.com', N'YT9D9BHSKG6ZQ99XJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'44269', N'COMM', N'Dennis', N'nprafr@rbjyj.wbnsgn.net', N'EGIKTOMSSOS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'44312', N'REGR', N'Jamison', N'tksin.rtmzg@siyufpqkp.-jtlvy.com', N'47L4KNFHHG1', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'44477', N'ZOOL', N'Liza', N'gvwugkt.twghqlg@zozjo.zhmkos.org', N'EFK7S21AZ4MA26J3K', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'44685', N'ZOOL', N'Jasmine', N'fjoyd.cxrqxni@mgzsoqs.hgevhb.org', N'505IW3CTFK72F74C4SUU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'45569', N'CPSC', N'Vicky', N'prjpcq.kbzyecpfu@tthf.qsheej.net', N'87WAE76V43S8Q4V0B', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'45673', N'ZOOL', N'Becky', N'qjzz.fotq@nhcjzt.net', N'59A2S8SCO4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'45952', N'REGR', N'Diane', N'gfzm@pefylvcz.pghijp.net', N'1NWCT3MGQABM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'46378', N'REGR', N'Connie', N'jlehzcvk.pgakmw@kzmbvl.org', N'XBIUTDKA71', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'46453', N'ZOOL', N'Emma', N'lfnbckbz9@dtwohx.net', N'CI7LO3A3V', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'46617', N'REGR', N'Abraham', N'pyvgy@nrbvpg.com', N'0HOS2PKCV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'46755', N'CPSC', N'Lance', N'bemd5@kwuiikf.kgnzht.com', N'48H2QOAATJAFQE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'46883', N'ZOOL', N'Aaron', N'hyxofv8@iircay.ibo-lh.org', N'9EYREW736WGBJ70KLBJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'47513', N'REGR', N'Charles', N'fnpi@gpvh-r.org', N'0GZK85NFZMR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'47726', N'CPSC', N'Marcus', N'xpydmiy.hgvvfrzat@fmbedzbv.bpeppr.com', N'MG6MPCU268MOW7W0G', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'47931', N'ZOOL', N'Sherman', N'diuys.cotrnmh@zhzmzn.net', N'PMOHS8FRP', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'48428', N'CPSC', N'Jessica', N'livmsui.ntxgmvo@paol.jddr-z.com', N'QQBK9FI7WWUA6LXV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'48477', N'ENGL', N'Patrick', N'fkzhsl142@mtwiqr.net', N'N27SAAMYVIO1', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'48511', N'ENGL', N'Katina', N'xllb.xzaq@ktojom.net', N'TALHHH1ZOVT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'48590', N'COMM', N'Mason', N'pzxvh.calnuj@rayryqgvl.mhfuml.net', N'WFIO9QRFLSAZHRAXE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49289', N'COMM', N'Alfonso', N'nmmd@t-xxdv.com', N'Q316XWNFO8MZD', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49333', N'ZOOL', N'Angelique', N'wxpcp.tjdooj@kmnak.ekntnn.org', N'R4QLKSOTP6AO5G', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49576', N'CPSC', N'Kelley', N'lismpye39@wjusf.eabvhu.com', N'0E7Y0B6L', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49668', N'ENGL', N'Sherman', N'krtwq.prgfhcqdv@pwuwhmtic.bduhzc.org', N'2TPGFP03BS8Y', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49690', N'ENGL', N'Albert', N'vgztqlz.dewvsgkft@eqvvgsu.wpmlgx.net', N'EGUS4EJ38RWA42', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49753', N'ENGL', N'Hilary', N'vsnrq.kkzr@jbqc.menkrs.net', N'WNEO8ORNVAZ664NJYNK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49833', N'ZOOL', N'Calvin', N'lfkfxh.podc@dnfoqk.com', N'HCMFQ34HU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49920', N'COMM', N'Naomi', N'vuhvz5@edfq.vekhlu.org', N'2R9Q2L6S1NZ80M0S43MH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'49952', N'ENGL', N'Jana', N'fslact35@whghav.com', N'AMAVAA00ZPG0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'50271', N'CPSC', N'Doris', N'lvbbvvkd.hhzpzwj@zwevp.mvwigv.org', N'5PC0ACG1WRFWV2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'50405', N'COMM', N'Lindsey', N'zltoiu.ykcpw@jsbajy.net', N'1QOPI77UD5O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'50437', N'COMM', N'Glen', N'ddqmkfeu@wfpjig.net', N'C4P45BUMKK1OFPP', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'50579', N'CPSC', N'Kurt', N'nzlhbzr.xnzmjxrmh@zlalwvldw.nfzkly.org', N'0ONOXEM6DFSONLQR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'50602', N'COMM', N'Ira', N'hqvulu.iprniwij@azrjswu.boyozh.net', N'ZZO7PONK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'50753', N'REGR', N'Adrian', N'bmoukzh.aavfgnr@gvfgkc.org', N'5QZETW7E7B2K', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'51029', N'CPSC', N'Jerome', N'zpuwmzl1@hndlmb.koqogb.org', N'HH6MBXNG4H61PS9R4O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'51186', N'COMM', N'Gwendolyn', N'vbtpjmo54@duoqhu.net', N'SR51W7VVYURTNR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'51994', N'CPSC', N'Misty', N'uaxlud@lshoef.org', N'UHJDYN04KSHL5WDGQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52045', N'CPSC', N'Telly', N'ycjz.eoutrpbe@fymp.ypuxre.net', N'HGE5R5TSLX60Y25YI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52057', N'ZOOL', N'Latoya', N'nsrzk@rgwo.fvbbsm.com', N'5WO7RSYIGFNDVS6CF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52074', N'CPSC', N'Kendall', N'bemq.pgza@ixmtyu.uvdhlf.net', N'5LH517B1VGIGD', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52085', N'COMM', N'Marianne', N'eqddcr.bmlk@chlvrzmd.eokvza.com', N'A371JDY6IVTM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52089', N'ZOOL', N'Elisa', N'ihdd.wboceg@jhnxtf.net', N'ZWCWTPKH3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52108', N'ZOOL', N'Demetrius', N'prmzjn.ivhheezh@ucgksl.net', N'ERCAG827', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52193', N'CPSC', N'Josephine', N'hcsrwo1@vzeuq.srfhxt.org', N'V837H5S3MLCD24HGJU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52366', N'COMM', N'Celeste', N'mpanus.vrgnehimyi@ffdzptw.mgmgqy.com', N'QIA11VJBNCRV9BB1KD0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52384', N'ENGL', N'Moses', N'cqvtva468@dtrahymdc.ahzbua.net', N'XLO0NDH8OFCSG6OS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52780', N'ENGL', N'Hope', N'kozaslwm.eiez@zmctvk.org', N'ZCMM7YWM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52824', N'COMM', N'Shelby', N'fqtzi581@zxsovs.aordkb.com', N'81YKGN292JCJ2TQK7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52909', N'ENGL', N'Janine', N'urma.bweosm@lrvgno.org', N'0V3YMPFMLLI8VCP7A', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'52934', N'COMM', N'Kelli', N'itsku42@hgmo.qkoavp.org', N'7TM2JVLR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'53029', N'ZOOL', N'Benjamin', N'rbyboiwn.ufmkcdwzms@xazsqf.com', N'E6JKNZCYE2QTMG412MF0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'53235', N'REGR', N'Bridget', N'rygdhal.anurramf@ixdasa.org', N'ZYII7Q2D', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'53580', N'CPSC', N'Martin', N'gosww@q-qotr.net', N'7QBQB6C4YBHJR15', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'53784', N'CPSC', N'Marcella', N'xqjrskuj65@gnmwse.com', N'THOA6IMFJQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'53953', N'ZOOL', N'Frances', N'rqrafj016@xciejx.net', N'DGQ4FHZVXNS8EZOTN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'53976', N'ZOOL', N'Lashonda', N'peolnfbu.mdrho@ltbmm.kftzdu.com', N'OBFWZCD5VSJU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'54188', N'STORE', N'Zheng', N'zzswbb@gmaill.com', N'ZHANGZHENGFATHER', N'StoreHead')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'54234', N'STORE', N'Duyun', N'Duyun@yahoo.com', N'askdljfaslf', N'StoreRep')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'54391', N'COMM', N'Kelli', N'bkumm727@vtzyoa.org', N'A1RWX2UJU3XC4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'54519', N'REGR', N'Rachel', N'xhypqr5@zgzgen.net', N'9WRSK1B4X8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'54967', N'REGR', N'Corey', N'pojb@-xiuke.org', N'6ZI0UGEMITE9LE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'55122', N'ENGL', N'Dale', N'kwbpgpy.ngyz@fyuj.bd-mzi.org', N'QJ5ZHP2P', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'55201', N'COMM', N'Maurice', N'qyhbbjdl38@nnpfvz.net', N'4ELUZMGJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'55531', N'ENGL', N'Roland', N'eymd.bbvhxjpp@jvsuqot.iefbv-.org', N'NUPG4GL2DXFA7Y', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'55751', N'CPSC', N'Ross', N'cjtd@bo-qcj.com', N'KP48QQ4YYONYI7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'55764', N'ZOOL', N'Katina', N'qwdtmvgx1@vxxpqd.org', N'0RB8E9MK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'56015', N'COMM', N'Cassandra', N'uafpwal53@gyfphw.net', N'Z4IYQ6WN2I08X3YAUU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'56150', N'REGR', N'Billie', N'qurhhd61@hstvq.nnltsf.net', N'K7PC46885333P', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'56151', N'REGR', N'Stephen', N'alybqbq395@ndxyaj.yhtxpf.org', N'ZPVF5JPM79KNXWU999', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'56382', N'REGR', N'Aimee', N'qbku@q-wlar.org', N'Y9L7U96O8PYOIQC2JG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'56540', N'ENGL', N'Joanne', N'jzszzr.mgpbgnr@klmb.ogihev.org', N'U7YGB30XKJN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'57099', N'CPSC', N'Latoya', N'ixmahs.dmqvcszcb@omrpt.vwgcxd.net', N'A4XV73TDXY', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'57359', N'ENGL', N'Teresa', N'hauriujm13@ajsjml.com', N'9UNV0HD0DBOACLTW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'57922', N'ZOOL', N'Suzanne', N'byifpf.mczfu@jqeuqk.kythlk.org', N'1DNEMXNW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'58316', N'ENGL', N'Alexis', N'zgsadidn991@sqcfrrfwh.nbyvgv.com', N'Y31FKB8FHSL6T5RXYH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'58338', N'ENGL', N'Guy', N'euccs.oloxnhjzv@vhgzcb.org', N'6CVA675YIYY6FLD', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'58342', N'ZOOL', N'Keisha', N'gwtqw.obxriqkhjf@vcpnmk.org', N'RSZX8O85EVQFB', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'58805', N'CPSC', N'Julian', N'gmslys@kuf-tg.org', N'WS8N75ZHYDRYAWCJ00', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'58885', N'ZOOL', N'Lauren', N'kemc26@joxecs.org', N'TPH7LIHP00', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'59131', N'COMM', N'Jimmy', N'zvhjqxb598@zmo-fw.com', N'HPG0HWE8C6I', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'59212', N'ZOOL', N'Rhonda', N'ekau.yzzkfwmxdl@erxawb.huvhhn.com', N'IQV1Y3UUJTCM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'59318', N'COMM', N'Seth', N'oyxfkep.alsgqj@m-iyhy.net', N'SMSE6B1FVQZF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'59578', N'COMM', N'Gena', N'mdvsxrh@inasvb.com', N'PVW7T1NSAWI8S', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'59714', N'REGR', N'Pedro', N'bndzug.xkmgqugqe@udnd.wznsnp.com', N'6SB5GHNGG3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'60398', N'CPSC', N'Joe', N'fics.aonyombbh@yzxnzmh.ruttvq.net', N'FMM1U643ZQD4S1FVTK6R', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'60408', N'REGR', N'Garrett', N'effpaag.iirs@vhqlnzcia.quwpin.net', N'GGFO11MSOFC7EN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'60487', N'ENGL', N'Yolanda', N'rakredk941@jqvx.jap-f-.com', N'2PRWB84Z7YE3ZHPICAAO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'60623', N'ENGL', N'Tasha', N'miggsxhy.xxbrxbmhfh@ziggxjkgq.zln-do.org', N'49KXI7KNJUYPHC9C', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'60755', N'ZOOL', N'Joshua', N'ccchb@ejeafc.org', N'IW2X6NKNB0IFILV6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'61095', N'COMM', N'Anita', N'ufpur.qbqy@zgtn.wzvwyi.org', N'TTE6YDK5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'61116', N'REGR', N'Samantha', N'woafiy0@rfsyqp.org', N'Y0PZLK641', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'61542', N'CPSC', N'Marty', N'jpmx.eezc@btiici.org', N'6GP8NFZ7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'61843', N'COMM', N'Theodore', N'ctsx859@kvjneq.com', N'GPREQ723FYQMDVSA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'61916', N'REGR', N'Evelyn', N'sful.czanata@oqutys.net', N'XRTT4YXAUS5U1H', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'62120', N'ENGL', N'Amelia', N'qoym.qtesdsp@exnqvwqmr.kdlphb.org', N'S1KYW0IS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'62126', N'CPSC', N'Belinda', N'qmxmlf.fqiug@enfekym.okcso-.org', N'7IJTLISLB54FIRWK', N'Employee')
GO
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'62252', N'ZOOL', N'Bobby', N'djrr.sewuaypgia@lpcznjid.kopwoa.com', N'4MIWLOOZK8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'63255', N'ENGL', N'Don', N'oaswbn@hoxoxbejr.rpgyjy.net', N'QSKXO6EED8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'63704', N'ENGL', N'Bryce', N'vdpv@zddddi.kqksku.net', N'NKI3BR74ZD152NHJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'63997', N'COMM', N'Cody', N'gauizflm.hfappl@lacnxbfv.wheptx.net', N'8G38L7QR70WLUUTJ5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'64204', N'ZOOL', N'Christie', N'kxoi.mfbgm@meckyy.org', N'1HYH216JE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'64606', N'REGR', N'Roger', N'umog.anuiptjk@lxhhkn.com', N'VUJ5I17FF9HA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'64689', N'ENGL', N'Shanda', N'udopqt53@ucxvtnoos.ejbcrh.com', N'HXIZBHV6S0WMAG10PB9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'64817', N'ZOOL', N'Rogelio', N'xenm717@nutqlvkd.omqfmg.net', N'R75AAC7G', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'65173', N'ENGL', N'Leo', N'znetgrls.mbvavt@bajipv.com', N'C503ZTYHZSJGFCYI7HCT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'65296', N'CPSC', N'Erika', N'ozjwreg68@dwnyxkw.rcfxht.org', N'ALNHP6FJRRB', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'65453', N'CPSC', N'Lena', N'zrcrrrnv@bavgd.cmildk.com', N'Q99HIBR7RUK2A5PJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'65713', N'ZOOL', N'Rachel', N'ysujvy385@vvrzkpdh.fxsbdo.net', N'H668DE4R3WVK6VJC2JA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66287', N'COMM', N'Maria', N'cfuir.wzakjcanqm@vczcwq.net', N'JQGCXUQBNUSSANCKRDOD', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66339', N'COMM', N'Natasha', N'mnmujg.xszg@iyrczwdco.xouvwm.org', N'1ZHPDHJFOF2HO18', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66358', N'ZOOL', N'Frederick', N'ckjrojqx@uocpyn.net', N'W9YQJFK3O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66638', N'COMM', N'Wendy', N'cuzsdkrr917@rlnpyq.ajrwqy.com', N'9CLK03I5POKL7C7D', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66671', N'REGR', N'Kirsten', N'ooppptnv497@jzqrme.gunvtg.org', N'1990HZIYV5B4QLU61ZRC', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66694', N'REGR', N'Susana', N'ufdg08@gltiyn.net', N'AV8S492HTT1J7YSDO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66851', N'COMM', N'Loren', N'odvyyzqb.kuzvlugdad@ftkwlk.eslxhs.com', N'X5BQTMQ8DK1H3313I8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66933', N'ZOOL', N'Shelia', N'eslt904@bukose.com', N'PEHJ2M6HM06AX', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'66984', N'REGR', N'Nelson', N'xjfbilxq.dwfseqz@jajzrcl.mlzymv.net', N'2SO8MZJS4KQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67051', N'ENGL', N'Jennie', N'ltdssqy.jangga@oqbhs.gafhrk.com', N'KHQN6RJCAS96A', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67102', N'COMM', N'Cara', N'avol8@psiwsp.net', N'LGVDNB2FI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67107', N'ENGL', N'Brandie', N'yrtqyvyz0@ntavew.com', N'BYET9J8674LUNPHQPE4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67110', N'ENGL', N'Leonard', N'edjzxk95@nopj.azzjfn.com', N'OIRRUAP8CSUGK8TU5CG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67198', N'ENGL', N'Olivia', N'yeascraj.vnmumxvqk@sultyr.com', N'IAIF4KRCZ7UGA2D', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67312', N'REGR', N'Jenna', N'dqpzs6@jdxhc.wagxfz.org', N'2EFV2FZD2GBDT7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67710', N'REGR', N'Roman', N'mupxm.yzzif@zafwua.net', N'4SDHPZXBJE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'67887', N'CPSC', N'Salvatore', N'hpejwhlv.ifum@dxbabw.net', N'ZE8W4FWQKVL6EPVZG3X', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'68079', N'COMM', N'Peter', N'kgrew.wxbmk@frwhq.dbpitx.com', N'UD99OKTPXH50LIG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'68406', N'REGR', N'Israel', N'zdxokmnf10@vszlep.net', N'FH9UY1R7T6Z', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'68791', N'COMM', N'Paula', N'jizp@tqphcbuda.tdjnhk.org', N'R5O6FEUMJFVFRS7DRD0Z', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'68995', N'ZOOL', N'Arthur', N'ohfpr.aujp@dvconu.org', N'4LLLTEK6CZKG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'69092', N'COMM', N'Tamika', N'uyutgena162@dyvzzzal.ovtamg.net', N'65I4PXH2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'69487', N'REGR', N'Candice', N'ghkkbbwn.xwsh@pqgui.cvlukm.com', N'6DO33W6TVL30', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'69498', N'COMM', N'Marie', N'yditl.ncsjyhgz@yatnep.com', N'YSUDI128FCGFE3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'69990', N'COMM', N'Edward', N'hzygfrog6@dqenqd.com', N'4ITAB3J67O9O9J33J9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'70067', N'ZOOL', N'Raul', N'jkgrdhp1@wutmxat.nurtjg.org', N'9CF9WOQENC', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'70310', N'COMM', N'Lawanda', N'cfuksegk.ldztg@dujqft.org', N'FWIX67DKRJ3T9KIM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'70613', N'ENGL', N'Esteban', N'yych.mekun@osxjbt.org', N'1S3YH8GGZZQ05GDIIXO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'70658', N'ENGL', N'Don', N'kijqpp.uwcnlhxzh@bhifcg.net', N'SFQ8L1I2T8SP8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'70979', N'ENGL', N'Randal', N'fietn444@dpgnuu.net', N'BWSPPBVG8PL0W8VC', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71095', N'REGR', N'Rodolfo', N'qgif21@qryaqo.net', N'EMAUU68KE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71116', N'ENGL', N'Alfred', N'mmic07@awrwcvrk.wbpuuv.com', N'G7ARGID0B1CSITI7F', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71136', N'ZOOL', N'Dominic', N'yyibixk@ymfv-g.com', N'7ER20GCEP80IZFCA8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71265', N'ENGL', N'Randi', N'ohivmhqy.grfpurqpm@iuwwnu.net', N'47KZLEYDG1PGA54D2H9L', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71356', N'REGR', N'Latasha', N'zihabyyp.yuaoqkqvwb@zppajz.org', N'50ACGVW2GB7YGHDT0K5D', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71583', N'ENGL', N'Vicky', N'kgdx.dlcngohe@lsqf.vwl-jl.org', N'FVPWK6NZS97GFXH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71643', N'ZOOL', N'Clay', N'kuypd.yens@kkortp.org', N'V84ZLMNXFVG16E0F7M', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71787', N'COMM', N'Roland', N'wdhggemm667@tthfyod.yqwbmr.org', N'TP2BSZDR4195NAMU2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71930', N'ZOOL', N'Melissa', N'wtsy@qxift.z-ekkw.net', N'9OM9QLJEYS9I', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'71961', N'ZOOL', N'Loretta', N'badwslod@mjadxg.com', N'3BFWSVTL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'72084', N'REGR', N'Jackie', N'hydyjqjh90@qsbcxp.com', N'2QOZL0JFB', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'72483', N'COMM', N'Ann', N'gxkwfuom7@hma-hb.net', N'L5ZN9F3Y9RBH97', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'72918', N'ENGL', N'Elaine', N'tdnam.yejnmjidjc@sabuxp.net', N'0NRR6J3EQFRERJ0WBLZ5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'73014', N'ENGL', N'Wendell', N'mgkqsdy.skweu@qyrdup.com', N'1K6ZMOA552', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74099', N'COMM', N'Cassandra', N'fnlnhphy.jpntasp@-apujn.net', N'LJ7O4XGV49L0', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74129', N'REGR', N'Christina', N'zsdpykl8@pehzlq.com', N'6M7ZVAFS9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74184', N'CPSC', N'Marcy', N'amkxiyf05@gxhxld.com', N'JZT7GKIAB79LYNUS2V', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74398', N'ENGL', N'Stephen', N'bniphpxx@wluczxoc.wawsmv.com', N'YXR32ROQT82Q8W2F', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74579', N'REGR', N'Bethany', N'ehxjndur.hhezyz@j-pawb.org', N'XXGACVBS3DU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74660', N'REGR', N'Phillip', N'eoyixhc129@ilnnqf.net', N'6EUPQYRW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74775', N'CPSC', N'Miguel', N'zfylbl648@adrzoc.org', N'N46I2VLNB6S5O9OR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74931', N'REGR', N'Ramon', N'mywubgjb5@pyednm.com', N'E5IH891NB2ZIJG453', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74945', N'ZOOL', N'Marci', N'nbnotqhc.pjvbmnw@yloiuc.com', N'QH8N1Z4A5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74961', N'REGR', N'Tricia', N'fbhidiy.rkxcxu@jnyfrszw.otliyo.org', N'9HC5LRDLAL23XB65', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'74973', N'ENGL', N'Sonia', N'hlxozmcg.rfmlcgu@ykyhutn.rswwsm.net', N'MGWB41A6482TGTN76ZGG', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'75471', N'ZOOL', N'Earnest', N'theifl.rsbocd@gngd.figivb.net', N'AEYWTO3V', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'75523', N'COMM', N'Kristin', N'rzom2@qq-icb.net', N'P7H39DTWLK74O6ABBI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'75822', N'ENGL', N'Margarita', N'liqhftzp.adjkbvbfx@dahxqub.jlhogs.net', N'AWRTHM0O9RH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'76175', N'ZOOL', N'Arthur', N'ftgferx.wrnxhzdc@xerwfz.aagdfx.com', N'O0U475GP', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'76226', N'ENGL', N'Trevor', N'tlvzol8@tqswbt.org', N'HJ5XWYGI6GJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'76414', N'CPSC', N'Elizabeth', N'hrxmj582@hpkey.olqggs.com', N'9NQ6U2Z6LKHRATL4NU7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'76657', N'ZOOL', N'Latoya', N'ntcgm.krav@rbkbiflhg.vgss-n.com', N'EPCQFFAS7EQGD4T', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'76908', N'CPSC', N'Alfredo', N'mumd59@mmdvcf.org', N'M5FUL0N4FBE5KYJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77252', N'ZOOL', N'Elena', N'gbcfjy.fjofn@czdf-x.net', N'DG1ATZT689X3DMWP9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77330', N'REGR', N'Anitra', N'pipp229@oikdr.bgoixu.com', N'0EIZTO16NIUGUBD3V65A', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77347', N'REGR', N'Christine', N'hhxgxkp.cmxq@llloadq.kwnwyp.com', N'7YBDXAAGBA1Q9O4D6KC', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77365', N'CPSC', N'Alonzo', N'ibewo00@nkvjep.com', N'4D7K16KVVWTZ0MFFFVN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77582', N'ZOOL', N'Duane', N'yaqwewaa15@ewahkb.com', N'W9DKC1Q74MUW710', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77664', N'REGR', N'Lisa', N'rianujb.ojyutb@wmymq.ksqpm-.org', N'3NYRD9QR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77666', N'COMM', N'Rose', N'sllewz.gosbbl@djdki-.com', N'1BYGEBIELDE4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77719', N'CPSC', N'Ana', N'flvjd06@agzmua.org', N'R5GL6O3KY', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77846', N'ZOOL', N'Rochelle', N'xelf.ahfrobbm@wfzzydr.iisgum.com', N'OSM2QYIV1EP5Z', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'77906', N'COMM', N'Ebony', N'agnv95@rplhs.ptlpet.org', N'ZHSULGYV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'78430', N'CPSC', N'Randal', N'rgleaf.anlbcx@veeoes.org', N'Q74PHH4I4IW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'78470', N'COMM', N'Jayson', N'umur.upsqi@mgylfqxeq.bzqxfz.org', N'0C53XBK4DATY', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'78500', N'CPSC', N'Trisha', N'uofb.snhwdo@xijmqh.org', N'PDCNHBVVU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'78515', N'ZOOL', N'Edith', N'qwjcgvi.pdpcjgs@owcfgejw.xfjkkc.org', N'VZNOOSZS0POW92DS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'78576', N'ENGL', N'Jorge', N'xqmdv1@gyifwpbvc.bslcsc.com', N'WG9MNPL1ZEJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'78688', N'ENGL', N'Roger', N'khdmqe33@edftma.net', N'ZBJR58EWK9JGCW6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'78830', N'REGR', N'Caroline', N'bhxxy.nitsluwqw@xoebzb.org', N'8L7YOL2BSJADX6N4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79054', N'REGR', N'Bryant', N'vuldmhu.rjfavpohz@wwpyaj.com', N'4GUOHDTFIBTH6ZS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79115', N'COMM', N'Kareem', N'qureeuh413@rblckd.com', N'WKH0DU5UGR6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79118', N'ZOOL', N'Shelia', N'aelu13@zqbpqq.org', N'I8S45WD1ZHSXEF263', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79212', N'CPSC', N'Chanda', N'yjuljmss@klvr-l.com', N'VT9VMACIDQ9P94G', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79223', N'COMM', N'Hilary', N'vtjr8@izrjvssdh.elfdzu.com', N'IUE8276EUD5QWXW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79424', N'COMM', N'Randi', N'mngnb.kydcf@ynlwej.org', N'0WMN1BC6NWW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79657', N'REGR', N'Kathy', N'zykfuzk@gddqhl.net', N'WMMSRUMT2PIILO6ZF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79684', N'ZOOL', N'Levi', N'ninzrhb.srmm@lwiabt.com', N'8V2Z5JWA', N'Employee')
GO
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'79895', N'ENGL', N'Janelle', N'tfrpl931@yqwswy.com', N'708UH7ACHA7DLDWF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'80518', N'REGR', N'Bridgette', N'lnyft621@iacgms.net', N'RMSWFSW55FPOL1MWDAR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'80521', N'CPSC', N'Bradford', N'hzugte.wylnoqqht@ndsksad.zsix-u.com', N'5V58M0PWTWBOUVE0W', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'80565', N'ENGL', N'Ginger', N'ebfws.garltujtb@tjfubq.net', N'1XV0Z0GTG0XG32334BYU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'80623', N'COMM', N'Ericka', N'idrgi.ersegajg@suzuxv.cfzsxx.org', N'PQ3LI29CA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'80796', N'ENGL', N'Nakia', N'wzmeecr0@orveeb.com', N'809R8TBIYC727Y3A69YN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'81167', N'CPSC', N'Angelica', N'aajw.lpurr@nkqi.avcqoj.org', N'32DDWD3QQX4JPLGS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'81455', N'REGR', N'Charles', N'aydq.kosoqcbinr@obgilk.com', N'Z11L70CXR9T', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'81573', N'REGR', N'James', N'oersunm.pghksrnypf@p-wdwm.com', N'LK1D4BM9NMX0MU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'81607', N'COMM', N'Tracie', N'nsbirbl8@sqwgeg.com', N'0FKUIU417Y3YGCF4A', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'81797', N'COMM', N'Guadalupe', N'brbgcq@nhayz-.org', N'RNA8IYD1RNMKEH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'82243', N'COMM', N'Bernard', N'skecpsk23@ruts.ljtyno.net', N'YVKRNAPY09', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'82380', N'ENGL', N'Emily', N'uodzeov83@pmlvls.net', N'DVQ86WQVFS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'82456', N'COMM', N'Martin', N'zwblojfb.ckxdzmncp@axibqi.com', N'U128D1M6YFUIA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'82542', N'ZOOL', N'Nicolas', N'adwjxamz.zywcmgau@rn-xct.org', N'6T7C3CN8H0J', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'82809', N'ZOOL', N'Floyd', N'myrmsqqt.ukjy@hlviwo.com', N'0MHJZCQYUIODXQUE2K', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'82838', N'ZOOL', N'Nathan', N'rwqq.mtyidiz@qpaw.sddnju.com', N'BP6NZY3O6KJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'83336', N'COMM', N'Jennie', N'wcrcmjin.ojschmqdpa@okcmij.org', N'HHNN2LE7B', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'83610', N'REGR', N'Priscilla', N'rvodu@vofpbh.bbohfe.com', N'O053X7UEL2KNQAF6TZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'83718', N'ZOOL', N'Omar', N'ycdexbun389@ytdhzf.org', N'NKJVAU4IBNI2T', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'83793', N'CPSC', N'Rosemary', N'ahil0@qxlfuq.auyjlt.net', N'GGZ6X7SQ3S43AJY8MS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'83936', N'ZOOL', N'Tara', N'dgrafp.wxge@yhzpgo.net', N'K797DW1AH8QCA2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84147', N'ZOOL', N'Lamar', N'gbgnk83@kmhivfjn.dwogac.org', N'NKCBLKO795MID5PUXPZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84177', N'ENGL', N'Dylan', N'wulknpxc2@fsdlev.okg-rs.net', N'7DK2NPE630IZAOTAH', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84461', N'ENGL', N'Jeremy', N'trjnm2@owvzqy.net', N'FH63VI0YW82ESU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84598', N'ENGL', N'Kathleen', N'cpflzur163@gqdp.bdvbva.com', N'JIR4B81807UK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84700', N'REGR', N'Earnest', N'huni.fojg@mrjvdiu.y-o-ux.org', N'BUOMZGT4Z54MK1IVF10K', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84729', N'ENGL', N'Janelle', N'omlyems.afbi@fcdkl.rovpks.net', N'YYIXP92GN6ZYLDO', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84904', N'COMM', N'Melvin', N'ofxbyrha.nblgmie@epkfpi.net', N'QOBBQXR62XU0BW5TR', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'84948', N'ZOOL', N'Crystal', N'tvjqs@coeb.ncoejd.net', N'YO7B4Q2JPO230PI4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'85153', N'REGR', N'Patricia', N'hrtr010@lvgpoa.tgvuji.net', N'YA5YWGZM7QE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'85321', N'REGR', N'Derick', N'hrayeaq.buqwnbk@wmajzy.olghrv.org', N'YO2CDZBU6', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'85501', N'CPSC', N'Julian', N'qbchr836@nihnymy.vmdowd.net', N'VFG49MF6Q4ROL5I8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'85990', N'COMM', N'Jayson', N'ubovpbxk3@tzoykl.dymszl.com', N'1D6O4C2GBM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'86150', N'REGR', N'Paula', N'xfrebpyz43@-tarll.org', N'GKQ94R24O2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'86377', N'ZOOL', N'Scotty', N'woyhd.cnncviey@kszyppk.svdbtf.org', N'0TNBA19QVUPX320ON5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'86618', N'REGR', N'Gail', N'rcizgy35@ndsg.v-mait.net', N'GJ03EJYYOWNS', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'86825', N'REGR', N'Carmen', N'mzeh@oqv-cq.net', N'JW68WZD3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'86885', N'REGR', N'Billie', N'kfzbkq@jbtslxhg.olv-xs.com', N'CFVFV3UVQTL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'86988', N'REGR', N'Carl', N'xbmxvr.fxbxqyvhdp@yylhad.com', N'MXYCOY5HUR1413OHK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'87157', N'ZOOL', N'Laura', N'twsngu.mgepfl@phhldq.net', N'4ULSD1AQ5YXLWGZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'87163', N'ZOOL', N'Leslie', N'lvlt.fbegmkvxzu@nankkuy.vselby.org', N'ZLXY82Z1RKU23', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'87204', N'CPSC', N'Mario', N'getqy@lblknq.net', N'Y1MS00B5JRZ968RQN8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'87359', N'REGR', N'Ginger', N'lkti.gifzycq@nphfcjcpp.lmk-wi.org', N'0IX72538PYXWGGV49IM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'87729', N'ZOOL', N'Lisa', N'vopxkbl45@jyuvut.org', N'OKZDW7BEWBY69LNT253', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'88819', N'CPSC', N'Roberto', N'qvvicpfd375@euednhu.iywocs.com', N'AL7HB2M6CLZGWY', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89314', N'ENGL', N'Evelyn', N'dxkkz.ulcak@uceniqwp.rcsqmv.org', N'BM1H1LY9BWBWDOWBH3', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89600', N'CPSC', N'Lawanda', N'afbmf@hffooy.com', N'ZJOEJVTC8TIQ8Q232RNK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89833', N'COMM', N'Isaac', N'dkrepj8@rldwso.a-qja-.org', N'XVR9WLITWZKLKPBE', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89855', N'CPSC', N'Lillian', N'rbpnejra7@fdxaakezq.k-fmxy.net', N'2UFCAKP9D', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89882', N'ZOOL', N'Gerald', N'fgtif.gbxpemci@fosmvrkwc.fbofse.net', N'JYSJPROW', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89896', N'CPSC', N'Jerome', N'qnzwh122@qwlc.jhgwic.net', N'YSL1H39K5IP5T', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89916', N'ENGL', N'Brandie', N'dpewqj.nemftpojj@eyokndzy.pvgkgj.org', N'86PHEPGTK', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'89925', N'REGR', N'Joanne', N'dake.qmpjexei@sygnwokaa.nljwbd.net', N'0QO9MN7ZEJONGKL', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'90020', N'COMM', N'Celeste', N'gszj.ypewrf@yslfuz.net', N'AC1W9FDDAQZJDGDRI', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'90057', N'CPSC', N'Joanne', N'rhlejk0@-bcilq.com', N'6CUZVINS798RA22UJ2', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'90143', N'REGR', N'Vivian', N'fwiil.xjdmiojdl@ckdnjx.org', N'2D620CH8D7ML', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'90386', N'CPSC', N'Leon', N'ykks44@evrqzz.com', N'KZKW9FWF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'90778', N'COMM', N'Shanna', N'quxlmg@dqguqe.net', N'N649L5T41USZ5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'90789', N'CPSC', N'Harold', N'axnh.wrtuvbb@owuqoqyku.uxquex.com', N'1BW2GSIX0MHS1', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'90824', N'COMM', N'Alison', N'hdiu19@vcyqm.yvbnhj.net', N'QONZ1ZXMNUBM4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'91109', N'ENGL', N'Anna', N'uzkm4@skhqi.gomney.net', N'OKQ2O4MTYPQIPML', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'91236', N'ENGL', N'Trisha', N'jcepi80@jisnbl.marblt.net', N'OFI995IKCNRR4AM75', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'91879', N'CPSC', N'Marcella', N'kwrs@dvxhgr.org', N'MR1KV02U0UK633P', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92154', N'ZOOL', N'Kathryn', N'nbjcnsg535@snvzmyl.geylgb.net', N'47MOCCSTMYSJDWF5WML', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92161', N'CPSC', N'Kimberly', N'eoxh@-ksft-.org', N'FN5X2P1DEHWKOQ8', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92307', N'ZOOL', N'Kimberly', N'zxxdqi.njbfua@zydtlz.org', N'AUAQSDQ47LXBG8U', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92418', N'REGR', N'Salvatore', N'oalsad@nkvagn.net', N'ZF54KGVX', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92582', N'CPSC', N'Melissa', N'tquu.iibz@am-vkh.org', N'QSYX39X2TKN', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92656', N'ENGL', N'Zachary', N'limtw.ossatosv@zpwhlonv.lfsnmr.org', N'ELFZH0LWPMTQ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92707', N'REGR', N'Robyn', N'uubsjdrs457@arizlt.com', N'YO8NEW7UIM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92847', N'REGR', N'Clint', N'hxby650@kgywmi.jvvesg.com', N'OS3LPOYGK7O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92926', N'ENGL', N'Marla', N'lpzldlmz.laybpdwg@mzeciz.com', N'AFYT3S2BJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92954', N'COMM', N'Jordan', N'rgkfeh.xgrdgvq@ghffrfgmh.qkmrrb.com', N'LC8KAPX8CN4U', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'92982', N'REGR', N'Christa', N'nydtte3@wnablvlnx.lrlvvq.net', N'6ZBOJ1WOQCYZX26MA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'93106', N'CPSC', N'Kerrie', N'sstjwea.vgkgwqgvu@lltjsy.-nlksl.org', N'2W17ZR36', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'93291', N'ENGL', N'Laurie', N'vjkrp.fidwppv@aveacf.net', N'OF6CPIID132C82DWPTIF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'93956', N'CPSC', N'Tiffany', N'zdagee.znmm@uugqae.com', N'95VP6ZEN3TXU780IWB', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'93996', N'COMM', N'Sam', N'oyzaof80@prcgta.net', N'4DTEJOKIF1B7WLSKF', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'94217', N'ZOOL', N'Jodi', N'rnmsav.cxkrmm@diafco.mmbjrd.com', N'PIE4ER85N9WX5C', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'94693', N'CPSC', N'Greg', N'yfdvazzd.ewegv@hscsvh.org', N'CPH5KXSK9ALDVV', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'95027', N'CPSC', N'Travis', N'agqf.qxlisrw@cijcep.org', N'558UJQGSNU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'95034', N'REGR', N'Tiffany', N'gtnfhox.xkapdfuymz@zboqhfidc.xpakzo.net', N'9GZV33EZXQ25X3I', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'95185', N'ENGL', N'Dorothy', N'iemu.lhnzqgidr@ktzjcp.org', N'R3IQ4JZ7', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'95826', N'REGR', N'Jerry', N'jjcxz40@mxbyew.com', N'UJ8VJREMOOT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'95896', N'CPSC', N'Claire', N'dmwdvsvw.ptolqjcgpe@ld-ebv.org', N'81X8IAQ0IDCEV3NZ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'95956', N'ENGL', N'Lea', N'hdjlpx.nhlj@iymgkaavq.mfue-d.com', N'VLK9BBMG3OEAL58MFUJ', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'96013', N'COMM', N'Corey', N'tgkc.xxzaudeon@rywbec.gxuqas.org', N'2YMJNLF0CRKTP94', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'96461', N'ENGL', N'Timmy', N'cepk.iyxsgnuufy@vrkeeakf.bcxkub.com', N'VRWV3NCXV81S', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'96517', N'CPSC', N'Kendra', N'qevh.gapdluge@iywyyb.org', N'WRFF1IFPJ7O712', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'96949', N'ZOOL', N'Gwendolyn', N'rpfcpu9@vwzzvmwce.gxatbj.com', N'V0SSKTUKWQ7KRQAALFT', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'97078', N'REGR', N'Myron', N'zmxt67@pddw.umklky.com', N'21XOQY3W3O', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'97231', N'CPSC', N'Noel', N'eguhtgbu264@pxupdid.u-amjq.com', N'6HT2TE4SLOM', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'97381', N'ZOOL', N'Shaun', N'zcapo.dazijbf@xneq-f.net', N'2MS8VFHK2FYUA', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'97517', N'COMM', N'Monte', N'eilwjej.lwjvtltu@m-skwx.net', N'EILHQLDE45UM5', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'97531', N'COMM', N'Gerardo', N'bnovmvq.qzonvro@shalhk.org', N'U5VDDMW4', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'98038', N'COMM', N'Angelique', N'edsjfev@pfwggd.net', N'2R73L577U', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'98215', N'REGR', N'Cassandra', N'hculksnq.hdxyazrl@iemgya.kmksut.net', N'RWMMSID8ZP43GU', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'98271', N'ENGL', N'Janine', N'wbllwrah663@gzwnpk.org', N'UCASHLK3V77', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'98566', N'COMM', N'Kelvin', N'pdfd.ttkwtbg@cvfbjb.com', N'W30TI1ZJ7IF6PUQ9', N'Employee')
GO
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'98808', N'ENGL', N'Lydia', N'rwxhg141@eswzpn.q-lthm.net', N'LQKNUKO10Q9', N'Employee')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email], [Password], [Role]) VALUES (N'99561', N'ENGL', N'Pete', N'mxicnu753@qpjjsd.com', N'P8Y135VF2', N'Employee')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'AAYG', N'312409271', N'ivlcin477@cqgdcf.org', N'Tim', N'MR-0531925-6', N'Andre', N'297 0886', N'302 Rocky Nobel Avenue')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'AGHD', N'751246397', N'awvrh8@jaumfd.org', N'Kristy', N'MR-2163654-5', N'Fred', N'974 9396', N'84 Green Hague Boulevard')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'ALPA', N'461992854', N'alpha@gmail.com', N'ALPHA Office Supplies', N'MR-8500440-2', N'Ms Irene Tan', N'461 2238', N'Blk 1128, Ang Mo Kio Industrial Park
	#02-1108 Ang Mo Kio Street 62
	Singapore 622262')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'ANLJ', N'196738837', N'plasfcz051@lsbo.fqpxnk.com', N'Chadwick', N'MR-3596751-5', N'Renee', N'455 0094', N'56 Fabien Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'ASKH', N'391897250', N'sahhhhk.ahaskfl@asutcypdo.prjxp-.org', N'Tricia', N'MR-4632267-1', N'Leigh', N'789 3869', N'595 Nobel Blvd.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'BANE', N'123123214', N'bane@yahoo.com', N'BANES Shop', N'MR-8200420-2', N'Mr Loh Ah Pek', N'479 2434', N'Blk 124, Alexandra Road
	#03-04 Banes Building
	Singapore 550315')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'BFIQ', N'189361015', N'lstdynq833@uuyxezk.tfszi-.org', N'Marlon', N'MR-9903357-8', N'Marcia', N'914 3930', N'25 Green Second Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'BXYT', N'932733107', N'ckjjhr.ndpzezbl@kydwtag.axmwnp.org', N'Kathryn', N'MR-1024247-9', N'Tyson', N'646 1863', N'668 Old Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'CHEP', N'354213234', N'chep@gmail.com', N'Cheap Stationer', N'Nil', N'Mr Soh Kway Koh', N'474 2434', N'Blk 34, Clementi Road
	#07-02 Ban Ban Soh Building
	Singapore 110525')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'CYLZ', N'760615195', N'zxqpzz.cehcmbszf@cpuerz.net', N'Eduardo', N'MR-7194676-0', N'Cecil', N'493 0921', N'75 Rocky First Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'DHMM', N'336975901', N'opwlh@cbhqbt.com', N'Josephine', N'MR-8986755-5', N'Lorena', N'885 0810', N'30 Fabien Drive')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'DUFR', N'569693484', N'gmfow7@mssydz.net', N'Terrance', N'MR-5418570-1', N'Taryn', N'994 9985', N'32 Rocky Clarendon Parkway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'DXJM', N'678976136', N'jskc40@meubqwrz.ofvlg-.org', N'Shane', N'MR-1074069-0', N'Jamison', N'651 4872', N'603 Nobel Street')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'EBMQ', N'634067926', N'jcmnrfmc.eqhydyvjm@zahxfs.org', N'Sheldon', N'MR-0835157-1', N'Erik', N'900 2127', N'490 Rocky Milton Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'GHSP', N'774247952', N'hlkup.sypezfstf@edethuk.is-vom.org', N'Max', N'MR-2046512-8', N'Yolanda', N'510 8429', N'498 White Fabien Way')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'GRZL', N'781065091', N'vpsi.nvzb@gybtcoq.-wholw.com', N'Joyce', N'MR-8054135-1', N'Brock', N'630 8588', N'51 First St.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'HLSU', N'561577390', N'tjyimwqs.mexuqkc@qwdmkj.com', N'Jake', N'MR-9826007-6', N'Dexter', N'850 5047', N'933 Oak St.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'HOKX', N'040786664', N'wxkbjjh.dtdqjjt@j-sodc.net', N'Tabitha', N'MR-7702727-4', N'Gena', N'786 9021', N'86 Green Clarendon Parkway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'HROK', N'743666212', N'qyomxcoc45@odgceg.net', N'Marianne', N'MR-8734390-8', N'Ty', N'800 9604', N'419 East White Fabien Street')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'HUAJ', N'430159995', N'ytzbnypx967@dlelbg.net', N'Damian', N'MR-2794005-3', N'Vincent', N'755 4489', N'95 Old Boulevard')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'HZTJ', N'115578404', N'dbryf@gwkilz.net', N'Hector', N'MR-6635723-9', N'Donna', N'043 1990', N'85 Nobel Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'ICOX', N'949053365', N'gwndchsv99@hynadv.ncpizq.com', N'Mindy', N'MR-5098371-7', N'Liza', N'862 6579', N'173 East Green Clarendon Boulevard')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'JHWX', N'584868212', N'nvutimrj3@wkzasi.com', N'Leonard', N'MR-0462882-9', N'Shelley', N'364 5066', N'93 Oak Way')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'JODW', N'226791621', N'hhqkc6@bpnlba.com', N'Rogelio', N'MR-2652387-9', N'Jodi', N'900 9836', N'58 Green Nobel Road')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'JZMU', N'409619121', N'xnbm@njkoe-.com', N'Geoffrey', N'MR-1585239-4', N'Ron', N'315 6332', N'730 Green Fabien Avenue')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'KJJH', N'030360776', N'tzhbkxwl.cxmmdie@-lfqic.net', N'Kim', N'MR-8985338-4', N'Mathew', N'583 5018', N'230 Nobel Road')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'LRXW', N'735904322', N'qrbxa.pyckg@b-fkcl.org', N'Karla', N'MR-0200012-5', N'Lana', N'741 8152', N'927 Cowley Drive')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'LYOG', N'087082632', N'wnfb.cskxwfd@yncxcw.org', N'Timothy', N'MR-6664712-2', N'Stacie', N'893 5555', N'43 Green Nobel Blvd.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'MDYN', N'490636386', N'ogcct.kiyqgh@vjqoqe.isjawz.org', N'Beth', N'MR-7512217-4', N'Scot', N'318 0245', N'92 New Parkway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'MRHJ', N'071856615', N'onxb.hchmlwh@umrzws.com', N'Cameron', N'MR-8158335-3', N'Kendrick', N'432 9318', N'332 South Nobel Street')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'NNNB', N'199936268', N'ztwk.rotvkrs@ketm-e.net', N'Antoine', N'MR-6322285-0', N'Bryce', N'280 4834', N'459 Nobel Drive')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'OMEG', N'465467385', N'omeg@163.com', N'OMEGA Stationery Supplier', N'MR-8555330-1', N'Mr Ronnie Ho', N'767 1234', N'Blk 11, Hillview Avenue 
	#03-04,
	Singapore 679036')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'OOXF', N'888942585', N'zjyagyr.idldgjmlf@ryppcymv.lqpyzi.com', N'Kathleen', N'MR-0979905-8', N'Jerry', N'708 3026', N'48 Old St.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'PFWJ', N'519888972', N'hffuy7@ievogrvh.dqmiuc.com', N'Benny', N'MR-8911621-8', N'Carolyn', N'454 8946', N'195 New Drive')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'QFNW', N'034731604', N'rhgs3@qsxqkk.net', N'Lamar', N'MR-4542489-0', N'Neil', N'278 5246', N'788 Green Old Road')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'QGNT', N'988753212', N'hyoxtx.gphjkcj@sgcpjj.com', N'Blanca', N'MR-8461346-6', N'Kristian', N'862 1986', N'76 Milton Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'QHTO', N'672286536', N'idnqtc@ismdec.org', N'Sonny', N'MR-6929767-9', N'Frances', N'776 6523', N'16 East Green Hague Freeway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'QIAM', N'867946899', N'ukwtbos.xfxjxmaze@mrnqnmc.yzvfld.net', N'Paula', N'MR-7397130-8', N'Dale', N'645 7585', N'15 East Green Nobel Street')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'RVCS', N'905266962', N'sirm7@ttubqs.net', N'Stacie', N'MR-5043206-3', N'Kari', N'318 8447', N'870 East White First Way')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'SIYX', N'196727413', N'bcpm406@meofoo.com', N'Demond', N'MR-8464521-5', N'Randall', N'924 7143', N'46 New Road')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'STLX', N'671280010', N'kmhuj.njkmuqm@sohnyj.fxqymk.net', N'Gavin', N'MR-5500538-4', N'Kathy', N'567 3436', N'969 Green Clarendon Road')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'TEKD', N'829193974', N'wzivhtyf.irley@ufnf.hzmmxj.net', N'Sara', N'MR-3330792-6', N'Chastity', N'775 2057', N'924 South Cowley Parkway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'TKHP', N'665580638', N'yiuztnd744@kbujbu.ameflr.org', N'Marci', N'MR-5718541-7', N'Kristy', N'116 2319', N'93 White Fabien Drive')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'TOFS', N'064115432', N'ezmsmg519@kctf.nzyhsd.net', N'Stacy', N'MR-2316374-9', N'Kelli', N'285 1086', N'439 Old St.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'TONG', N'529982654', N'tniy.hxnfxd@fadwkh.net', N'Tera', N'MR-8672666-0', N'Sandra', N'551 1357', N'106 Hague Street')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'TQJR', N'788499050', N'nadvrf.fcswl@qevrpl.gis-mv.org', N'Vanessa', N'MR-3558898-7', N'Sonny', N'048 6179', N'481 First Boulevard')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'WCYX', N'730828642', N'zepwm.nuuh@vpyehjrfg.kyg-op.org', N'Rene', N'MR-9383969-4', N'Kerri', N'938 9125', N'537 Milton St.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'WDRX', N'909705294', N'dvmef375@tzwbueuf.ocwlvf.com', N'Charles', N'MR-1029188-0', N'Margaret', N'658 8284', N'36 Milton St.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'WHZN', N'975723558', N'okzzckvo595@sehexjnn.huahrd.net', N'Myron', N'MR-0114315-3', N'Marcella', N'015 4434', N'272 Oak Blvd.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'WKWW', N'455943153', N'fwpjl.shkpifno@kdjuep.com', N'Dominick', N'MR-2845462-2', N'Fred', N'514 7743', N'607 Fabien Parkway')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'WTAY', N'692858826', N'daqxrl.vmcu@sygk.cemcfj.com', N'Jerry', N'MR-4713106-5', N'Alma', N'511 8658', N'60 Rocky New Avenue')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'WVHA', N'557220384', N'bblfgtgk179@-ovngt.net', N'Micheal', N'MR-2067280-0', N'Aaron', N'010 0193', N'799 East Rocky New Street')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'XDKF', N'732406492', N'smbpv97@odtgufc.dwq-kz.net', N'Faith', N'MR-1144399-1', N'Marlene', N'971 1651', N'505 White First Blvd.')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'YUHX', N'370807449', N'rqeeb.myxw@vhnqeuzdb.sxarhg.net', N'Derick', N'MR-3098479-6', N'Dawn', N'001 7631', N'483 Cowley St.')
ALTER TABLE [dbo].[Delegation]  WITH CHECK ADD  CONSTRAINT [FK_Delegation_Staff] FOREIGN KEY([DepartmentHeadID])
REFERENCES [dbo].[Staff] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Delegation] CHECK CONSTRAINT [FK_Delegation_Staff]
GO
ALTER TABLE [dbo].[Delegation]  WITH CHECK ADD  CONSTRAINT [FK_Delegation_Staff1] FOREIGN KEY([CoveringHeadID])
REFERENCES [dbo].[Staff] ([UserID])
GO
ALTER TABLE [dbo].[Delegation] CHECK CONSTRAINT [FK_Delegation_Staff1]
GO
ALTER TABLE [dbo].[DisbursementLog]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementLog_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisbursementLog] CHECK CONSTRAINT [FK_DisbursementLog_Department]
GO
ALTER TABLE [dbo].[DisbursementLog]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementLog_DisbursementLog] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DisbursementLog] CHECK CONSTRAINT [FK_DisbursementLog_DisbursementLog]
GO
ALTER TABLE [dbo].[Discrepancy]  WITH CHECK ADD  CONSTRAINT [FK_Discrepancy_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discrepancy] CHECK CONSTRAINT [FK_Discrepancy_Item]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Staff] FOREIGN KEY([UserID])
REFERENCES [dbo].[Staff] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Staff]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Item]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Staff] FOREIGN KEY([UserID])
REFERENCES [dbo].[Staff] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Staff]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Supplier]
GO
ALTER TABLE [dbo].[OutstandingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutstandingRequest_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OutstandingRequest] CHECK CONSTRAINT [FK_OutstandingRequest_Department]
GO
ALTER TABLE [dbo].[OutstandingRequest]  WITH CHECK ADD  CONSTRAINT [FK_OutstandingRequest_OutstandingRequest] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OutstandingRequest] CHECK CONSTRAINT [FK_OutstandingRequest_OutstandingRequest]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Staff] FOREIGN KEY([UserID])
REFERENCES [dbo].[Staff] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Staff]
GO
ALTER TABLE [dbo].[RequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetails_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestDetails] CHECK CONSTRAINT [FK_RequestDetails_Item]
GO
ALTER TABLE [dbo].[RequestDetails]  WITH CHECK ADD  CONSTRAINT [FK_RequestDetails_Request] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Request] ([RequestID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestDetails] CHECK CONSTRAINT [FK_RequestDetails_Request]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Department]
GO
ALTER TABLE [dbo].[SupplyDetails]  WITH CHECK ADD  CONSTRAINT [FK_SupplyDetails_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplyDetails] CHECK CONSTRAINT [FK_SupplyDetails_Item]
GO
ALTER TABLE [dbo].[SupplyDetails]  WITH CHECK ADD  CONSTRAINT [FK_SupplyDetails_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplyDetails] CHECK CONSTRAINT [FK_SupplyDetails_Supplier]
GO
USE [master]
GO
ALTER DATABASE [Team5ADProject] SET  READ_WRITE 
GO
