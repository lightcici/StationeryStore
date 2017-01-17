USE [master]
GO
/****** Object:  Database [Team5ADProject]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Delegation]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[DisbursementLog]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Discrepancy]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[OutstandingRequest]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[RequestDetails]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 2017/1/17 16:30:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[UserID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2017/1/17 16:30:01 ******/
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
/****** Object:  Table [dbo].[SupplyDetails]    Script Date: 2017/1/17 16:30:01 ******/
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
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'COMM', N'Medical School', N'Commerce Dept', N'Mr Mohd Azman', N'8741284', N'Dr.Chia Leow Bee', N'z')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'CPSC', N'Management', N'Computer Science', N'Mr Wee Kian Fatt', N'8901235', N'Dr.Soh Kian Wee', N'z')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'ENGL', N'Startionery Store', N'English Dept', N'Mrs Pamela Kow', N'8742234', N'Prof Ezra Pound', N'z')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'REGR', N'Engineering School', N'Registrar Dept', N'Ms Helen Ho', N'8901266', N'Mrs Low Kway Boo', N'z')
INSERT [dbo].[Department] ([DepartmentID], [Collection_Point], [DepartmentName], [ContactName], [Telephone], [HeadName], [RepresentativeName]) VALUES (N'ZOOL', N'Science School', N'Zoology Dept ', N'Mr Peter Tan Ah Meng', N'8901266', N'Prof Tan', N'z')
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C001', N'Clips Double 1"', N'Clip', 500, N'A1        ', N'Dozen     ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'C002', N'Clips Double 2"', N'Clip', 600, N'A2        ', N'Dozen     ', 50, 30)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E001', N'Envelope Brown(3"×6")', N'Envelope', 1000, N'B1        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E002', N'Envelope Brown(3"×6" w/Window)', N'Envelope', 1000, N'B2        ', N'Each      ', 600, 400)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E020', N'Eraser(hard)', N'Eraser', 200, N'C1        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E021', N'Eraser(soft)', N'Eraser', 200, N'C2        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'E030', N'Exercise Book(100pg)', N'Exercise', 300, N'D1        ', N'Each      ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'F020', N'File Separator', N'File', 300, N'E1        ', N'Set       ', 100, 50)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H011', N'Highlighter Blue', N'Pen', 400, N'F1        ', N'Each      ', 100, 80)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'H031', N'Hole Puncher 2 holes', N'Puncher', 200, N'G1        ', N'Each      ', 50, 20)
INSERT [dbo].[Item] ([ItemID], [Description], [Category], [InStock], [BinNumber], [UOM], [ReorderLevel], [ReorderQty]) VALUES (N'P010', N'Pad Postit Memo 1"×2"', N'Pad', 200, N'H1        ', N'Packet    ', 100, 60)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000001', N'C001', 100, N'', N'Approved', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'11001', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000002', N'C002', 100, N'1', N'Pending Approval', CAST(N'2017-01-17T00:00:00.000' AS DateTime), N'11002', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000003', N'E001', 100, N'1', N'Rejected', CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'11003', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000004', N'E002', 60, N'1', N'Ordered', CAST(N'2017-01-03T00:00:00.000' AS DateTime), N'11004', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000005', N'E020', 30, N'D', N'Pending Approval', CAST(N'2017-01-04T00:00:00.000' AS DateTime), N'12001', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000006', N'E021', 50, N'D', N'Rejected', CAST(N'2017-01-05T00:00:00.000' AS DateTime), N'12002', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000007', N'E030', 20, N'2', N'Approved', CAST(N'2017-01-06T00:00:00.000' AS DateTime), N'12003', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000008', N'F020', 50, N'3', N'Ordered', CAST(N'2017-01-07T00:00:00.000' AS DateTime), N'13001', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000009', N'H011', 40, N'2', N'Rejected', CAST(N'2017-01-08T00:00:00.000' AS DateTime), N'14001', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [ItemID], [TotalQty], [Justification], [Status], [OrderDate], [UserID], [Comment], [RequestLog]) VALUES (N'DO0000010', N'H031', 30, N'2', N'Completed', CAST(N'2017-01-10T00:00:00.000' AS DateTime), N'15003', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'CD/111/01', CAST(N'2017-01-04T15:38:09.020' AS DateTime), N'13006', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'CD/111/04', CAST(N'2017-01-11T12:50:36.077' AS DateTime), N'13002', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'CD/111/09', CAST(N'2017-01-13T13:40:35.077' AS DateTime), N'13003', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'CS/111/01', CAST(N'2017-01-03T16:20:20.060' AS DateTime), N'12003', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'CS/111/02', CAST(N'2017-01-10T10:45:40.090' AS DateTime), N'12005', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'ED/111/01', CAST(N'2017-01-01T12:30:15.790' AS DateTime), N'11001', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'ED/111/02', CAST(N'2017-01-02T11:23:12.023' AS DateTime), N'11002', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'ED/111/03', CAST(N'2017-01-03T08:12:12.020' AS DateTime), N'11003', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'RD/111/01', CAST(N'2017-01-06T10:38:02.090' AS DateTime), N'14003', NULL, NULL)
INSERT [dbo].[Request] ([RequestID], [RequestDate], [UserID], [RequestLog], [Comment]) VALUES (N'ZD/111/01', CAST(N'2017-01-08T13:50:30.030' AS DateTime), N'15006', NULL, NULL)
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11001', N'ENGL', N'Pan Pan', N'ppsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11002', N'ENGL', N'Zhang Zheng', N'zzsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11003', N'ENGL', N'Zheng Jie', N'zjsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11004', N'ENGL', N'Andy Surya Bin Suhendra', N'asbssg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11005', N'ENGL', N'Lee Su-Hui,Angeline', N'lsha@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11006', N'ENGL', N'Nguyen My Duyen', N'nmdsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11007', N'ENGL', N'Qu Mengying', N'qmysg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11008', N'ENGL', N'Hu Sidi', N'hsdsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'11009', N'ENGL', N'Woo Jia Qian', N'wjqsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12001', N'CPSC', N'Aditi Roy', N'arsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12002', N'CPSC', N'Guan Minjun', N'gmjsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12003', N'CPSC', N'Ei Ei Maw', N'eemsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12004', N'CPSC', N'Huang Ji', N'hjsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12005', N'CPSC', N'Kun Mei Ching', N'kmcsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12006', N'CPSC', N'Lim Zhi Yang', N'lzysg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12007', N'CPSC', N'Lv Zu Ming', N'lzmsg@gmai.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12008', N'CPSC', N'Xiong Jie', N'xjsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'12009', N'CPSC', N'Choog Kai Boon', N'ckbsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13001', N'COMM', N'Aung Thu Hein', N'athsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13002', N'COMM', N'Cao Wei', N'cwchina@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13003', N'COMM', N'Chan Kar Jun', N'ckjsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13004', N'COMM', N'Dinar Rahimita', N'drsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13005', N'COMM', N'Gillian Kang', N'gksg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13006', N'COMM', N'Ji Chun Xiao', N'jcxsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13007', N'COMM', N'Huang Wei An', N'hwachina@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13008', N'COMM', N'Lau Mong Pau', N'lmpsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'13009', N'COMM', N'Liu Hui Qiu', N'lhqchina@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14001', N'REGR', N'Aparna Keerthi Veetil', N'akvsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14002', N'REGR', N'Bao Zhi Qiang', N'Bzqchina@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14003', N'REGR', N'Chan Wing Fook
', N'Cwfsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14004', N'REGR', N'Chen Ying', N'ChenY@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14005', N'REGR', N'Fan Jin Long', N'fjlsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14006', N'REGR', N'Gillan Kang', N'Gkang@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14007', N'REGR', N'Hanni Zaw', N'HZaw@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14008', N'REGR', N'Lee Zheng Wei', N'Lzwsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'14009', N'REGR', N'Liu Xu Ran', N'lxrchina@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15001', N'ZOOL', N'	Mai Chi Cuong', N'mccsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15002', N'ZOOL', N'	Quek Wee Kiat', N'qwksg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15003', N'ZOOL', N'Raaj Alamin', N'RAlamin@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15004', N'ZOOL', N'Shi Han Yue', N'shychina@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15005', N'ZOOL', N'Soo Youg Lee', N'sylsg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15006', N'ZOOL', N'Wang Yu Qi', N'Wangyq@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15007', N'ZOOL', N'Yuan Quan', N'yqchina@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15008', N'ZOOL', N'	Zhang Yong', N'zysg@gmail.com')
INSERT [dbo].[Staff] ([UserID], [DepartmentID], [Name], [Email]) VALUES (N'15009', N'ZOOL', N'	Zeng Xian Han', N'zxhchina@gmail.com')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'ALPA', N'4619928', N'ALPA@gmail.com', N'ALPHA Office Supplies', N'MR-8500440-2', N'Ms Irene Tan', N'4612238', N'Blk 1128,Ang Mo Kio Industrial Park #02-1108 Ang Mo Kio Street 62 Singapore 622262')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'BANE', N'4781234', N'baneshop@gmail.com', N'BANES Shop', N'MR-8200420-2', N'Mr Loh Ah Pek', N'4792434', N'Blk 124, Alexandra Road #03-04 Banes Building Singapore 550315')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'CHEP', N'3543234', N'chep3234@gmail.com', N'Cheap Stationer', N'Nil', N'Mr Soh Kway Koh', N'4742434', N'Blk 34, Clementi Road #07-02 Ban Soh Building Singapore 110525')
INSERT [dbo].[Supplier] ([SupplierID], [Phone], [Email], [SupplierName], [GSTRegistrationNo], [ContactName], [FaxNo], [Address]) VALUES (N'OMEG', N'7671233', N'omegss@gmail.com', N'OMEGA Stationery Supplier', N'MR-8555330-1', N'Mr Ronnie Ho', N'7671234', N'Blk 11,Hillview Avenue #03-04, Singapore 679036')
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'ALPA', N'C001', CAST(1.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'ALPA', N'C002', CAST(1.80 AS Decimal(18, 2)), 1)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'ALPA', N'E002', CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'BANE', N'E002', CAST(0.70 AS Decimal(18, 2)), 3)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'BANE', N'E020', CAST(0.70 AS Decimal(18, 2)), 3)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'CHEP', N'C001', CAST(1.80 AS Decimal(18, 2)), 2)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'CHEP', N'E002', CAST(0.50 AS Decimal(18, 2)), 2)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'OMEG', N'C001', CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'OMEG', N'E020', CAST(1.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[SupplyDetails] ([SupplierID], [ItemID], [Price], [Priority]) VALUES (N'OMEG', N'E021', CAST(2.00 AS Decimal(18, 2)), 4)
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
