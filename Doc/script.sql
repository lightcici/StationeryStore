USE [master]
GO
/****** Object:  Database [Team5ADProject]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[Delegation]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[DisbursementLog]    Script Date: 2017/1/17 13:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisbursementLog](
	[ItemID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[NeededNumber] [int] NOT NULL,
	[RetrivedNumber] [int] NOT NULL,
	[GivenNumber] [int] NOT NULL,
 CONSTRAINT [PK_DisbursementLog] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discrepancy]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[Item]    Script Date: 2017/1/17 13:23:52 ******/
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
	[ReorderQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2017/1/17 13:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[TotalQuantity] [int] NOT NULL,
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2017/1/17 13:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [nvarchar](50) NOT NULL,
	[PurchaseOrderID] [nvarchar](50) NOT NULL,
	[SupplierID] [nvarchar](50) NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[ReceivedQuantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OutstandingRequest]    Script Date: 2017/1/17 13:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutstandingRequest](
	[ItemID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[DisbursementQty] [int] NOT NULL,
	[ActualGivenQty] [int] NOT NULL,
 CONSTRAINT [PK_OutstandingRequest] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[RequestDetails]    Script Date: 2017/1/17 13:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestDetails](
	[RequestID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[RequestQuantity] [int] NOT NULL,
	[RetrievedQuantity] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_RequestDetail] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 2017/1/17 13:23:52 ******/
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
/****** Object:  Table [dbo].[SupplyDetails]    Script Date: 2017/1/17 13:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyDetails](
	[SupplierID] [nvarchar](50) NOT NULL,
	[ItemID] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_SupplyDetails] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC,
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
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
