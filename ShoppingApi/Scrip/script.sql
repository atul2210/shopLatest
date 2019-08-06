USE [Shopping]
GO
/****** Object:  User [as]    Script Date: 8/5/2019 9:54:56 PM ******/
CREATE USER [as] FOR LOGIN [as] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[AvailableQty]    Script Date: 8/5/2019 9:54:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableQty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorId] [int] NULL,
	[TotalQty] [int] NOT NULL,
	[AvailableQty] [int] NOT NULL,
	[ReservedQty] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_AvailableQty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMasterObselete]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMasterObselete](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[SubCategoryId] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckIn]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckIn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserEmailId] [nvarchar](50) NULL,
	[PaymentReceived] [bit] NOT NULL,
	[UserIp] [nvarchar](max) NOT NULL,
	[itemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Checkout] [bit] NOT NULL,
	[Colorid] [int] NULL,
	[Price] [money] NOT NULL,
	[OfferPrice] [money] NOT NULL,
	[DeliveryCharges] [money] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UserSessionId] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorMaster]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorMaster](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nchar](10) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ColorMaster] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogging]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogging](
	[id] [int] NOT NULL,
	[ErrorDescription] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemDescripton] [nvarchar](50) NULL,
	[ColorId] [int] NULL,
	[AvailableColor] [nvarchar](max) NULL,
	[InitialQty] [int] NULL,
	[AvailableQty] [int] NULL,
	[ReserveQty] [int] NULL,
	[SizeId] [int] NULL,
	[Price] [money] NULL,
	[OfferPrice] [money] NULL,
	[ChildMenuId] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Color] [nvarchar](max) NULL,
	[Brand] [nvarchar](max) NULL,
	[detailId] [nvarchar](50) NULL,
	[DeliveryCharges] [int] NULL,
	[Active] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MainMenuName] [nvarchar](50) NULL,
	[SubMenuName] [nvarchar](50) NULL,
	[MainTrigger] [nvarchar](50) NULL,
	[SubTrigger] [nvarchar](50) NULL,
	[MainMenuId] [nvarchar](50) NULL,
	[SubMenuId] [nvarchar](50) NULL,
	[RouterLink] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_SubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuMaster](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_MenuMaster] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPMaster]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTPMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[OtpNumber] [numeric](18, 0) NOT NULL,
	[OtpText] [nvarchar](50) NOT NULL,
	[SenderIP] [nvarchar](50) NOT NULL,
	[SenderBrowser] [nvarchar](max) NOT NULL,
	[SenderAttempt] [int] NOT NULL,
	[SenderDateTime] [datetime] NOT NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentReceived]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentReceived](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[SessionId] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPaymentAmount] [money] NOT NULL,
	[TotalOfferAmount] [money] NOT NULL,
	[ReceivedFormEmailId] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeMaster]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeMaster](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_SizeMaster] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupFirstName] [varchar](50) NOT NULL,
	[SupMidName] [varchar](50) NULL,
	[SupLastName] [varchar](50) NOT NULL,
	[SupAdd1] [varchar](50) NULL,
	[SupAdd2] [varchar](50) NULL,
	[SupAdd3] [varchar](50) NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](15) NOT NULL,
	[Pin] [varchar](20) NOT NULL,
	[Active] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Salt] [nvarchar](max) NOT NULL,
	[Hash] [nvarchar](max) NULL,
	[FirsName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [numeric](18, 0) NOT NULL,
	[UlterNateMobile] [numeric](18, 0) NULL,
	[CreateDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[pin] [nvarchar](50) NULL,
	[UpdatedBy] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoryMasterObselete] ON 

INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (1, N'Female', 0, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (2, N'Male', 0, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (3, N'Kids', 0, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (4, N'Electronics', 0, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (5, N'Furniture', 0, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (6, N'SportsBooks', 0, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (7, N'Grocery', 0, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (8, N'Salwar', 1, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (9, N'Kurti', 1, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (10, N'Women T-Shirt', 1, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (11, N'Leggings', 1, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (12, N'Saari', 1, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (13, N'Pant', 2, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (14, N'Jeans', 2, NULL, NULL)
INSERT [dbo].[CategoryMasterObselete] ([CategoryId], [CategoryName], [SubCategoryId], [CreateDate], [UpdateDate]) VALUES (15, N'Knicker', 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CategoryMasterObselete] OFF
SET IDENTITY_INSERT [dbo].[CheckIn] ON 

INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-09T15:52:30.690' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxMjcwMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.3-sDSvqZxWyRNt14AihbFd3RPg4f_1BhMsGzuZ4Wpak', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (2, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-09T15:58:28.583' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxMjcwMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.3-sDSvqZxWyRNt14AihbFd3RPg4f_1BhMsGzuZ4Wpak', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (3, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-09T20:49:28.220' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNDQ4MjcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NuFao5A_goQtErvVBt4qx_4DfP_COTbuXsCOcC-mntI', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (4, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-09T21:08:10.030' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNDQ4MjcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NuFao5A_goQtErvVBt4qx_4DfP_COTbuXsCOcC-mntI', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (5, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-09T22:27:16.500' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (6, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-09T22:27:28.093' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (7, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-09T22:36:47.660' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (8, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-09T22:37:11.400' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (9, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-09T23:15:51.143' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (10, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-10T10:34:46.660' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxOTQzNDYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.iutgoUtD3YfMNi3cyVuTt_3QD2_Q_bvnSFAIccVQ4fU', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (11, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-10T11:24:52.180' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (12, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-10T11:28:34.420' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxOTQzNDYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.iutgoUtD3YfMNi3cyVuTt_3QD2_Q_bvnSFAIccVQ4fU', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (13, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-10T11:30:59.183' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (14, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-10T11:35:32.043' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (15, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-10T11:35:48.250' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (16, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-10T17:53:55.233' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (17, NULL, 0, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-10T17:54:14.493' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (18, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-10T19:16:08.400' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (19, NULL, 0, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-10T19:16:15.447' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (20, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T10:24:44.357' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (21, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T10:24:54.033' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (22, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T10:43:03.317' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (23, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T10:48:22.740' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (24, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T11:24:43.520' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (25, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T11:38:47.253' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzA5ODcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.L2F_QhP7x2HM9Kvf0-3nkuQHjJiRLGQSJO0OHTDUFLo', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (26, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T11:40:08.650' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (27, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T12:20:31.510' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (28, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-12T12:20:51.007' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (29, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T12:34:11.900' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (30, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-12T12:42:36.243' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (31, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-12T12:48:19.597' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (32, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-12T12:49:44.783' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (33, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-12T12:56:32.527' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (34, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-12T13:05:23.923' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (35, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-12T13:05:35.743' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (36, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-12T13:16:28.437' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (37, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-12T13:16:41.957' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (38, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T13:17:18.340' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (39, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T13:17:29.287' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (40, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T13:17:39.427' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (41, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T13:18:16.533' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (42, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T13:18:32.143' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (43, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T13:21:30.797' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (44, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T13:26:32.483' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (45, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-12T13:27:10.260' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (46, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T13:27:49.183' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (47, NULL, 0, N'127.0.0.1', 15, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-12T13:28:03.693' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (48, NULL, 0, N'127.0.0.1', 22, 1, 0, 2, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-12T13:33:03.510' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (49, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-13T10:40:38.327' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (50, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-13T10:49:46.017' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (51, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-03-15T12:39:08.660' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (52, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-28T10:26:02.713' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTM3NDkwMjIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.j7tyXujO-zK4O_qfDfoLVAWyV-Xq1jBKB-nCXvyHv0g', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (53, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-28T10:31:13.690' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTM3NDkzMzMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.BMJ1IEz2B5dxRbMpKJ4eooWPOV2P2xOJgw4Asm-xmjE', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (54, NULL, 0, N'127.0.0.1', 22, 1, 0, 2, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-30T21:57:10.953' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTM5NjMyOTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.U6ge2CUa8q8UjPbSU4_8w_EQGYPWNrheDMSBJhHyMy0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (55, NULL, 0, N'127.0.0.1', 15, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-31T11:47:18.857' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTM5NjMyOTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.U6ge2CUa8q8UjPbSU4_8w_EQGYPWNrheDMSBJhHyMy0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (56, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-31T11:48:51.760' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTM5NjMyOTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.U6ge2CUa8q8UjPbSU4_8w_EQGYPWNrheDMSBJhHyMy0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (57, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-31T11:48:53.630' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTM5NjMyOTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.U6ge2CUa8q8UjPbSU4_8w_EQGYPWNrheDMSBJhHyMy0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (58, NULL, 0, N'127.0.0.1', 15, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-03-31T12:21:18.720' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTM5NjMyOTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.U6ge2CUa8q8UjPbSU4_8w_EQGYPWNrheDMSBJhHyMy0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (59, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-31T12:36:24.257' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQwMTYwNDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.FjbJUTxlDjMJ0nevLOTS13KenBOZSnHi4YtUnaixee0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (60, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-03-31T12:37:30.207' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQwMTYxMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.nEjx_UxPFwSjP7FOXmhlnWx7qjxfXC-vPgevrZm1h8w', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (61, NULL, 0, N'127.0.0.1', 17, 1, 0, 4, 345.0000, 444.0000, 50.0000, CAST(N'2019-03-31T21:30:54.690' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQwMTYxMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.nEjx_UxPFwSjP7FOXmhlnWx7qjxfXC-vPgevrZm1h8w', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (62, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-04-04T12:38:51.080' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQzNjE3OTEsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.ZsGspkP2ZCt_O06zMY4WjSzuvvX1mquvIH8QyvVVjEY', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (63, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-04-04T13:06:35.170' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQzNjM0NTUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.VuX3Mqsj52EZ2Fgu-CUzCSJnl818lP0vBORjIc2oS6U', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (64, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-04-04T13:59:20.790' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQzNjY2MjAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.v02enP9utVBXiOcFUFpy2S3XO3AvROjnKINn9a5pW5U', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (65, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-04-07T17:49:21.973' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQ2Mzk2MjEsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.DdxXZFo5qObgl9ewWDItPslHdqFeuyeNgHJF4JkxZrc', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (66, NULL, 0, N'127.0.0.1', 14, 1, 0, 7, 345.0000, 444.0000, 50.0000, CAST(N'2019-04-07T18:03:07.133' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQ2NDA0NDcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.6tjtX3GqAR528375m4vZD2_5pIUSxQugAQUji2FOga4', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (67, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-04-07T18:30:24.357' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQ2NDIwODQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.WoRfWBkeBJIfkpGMUSA-irTrUxtugijQmbaISmyRZE8', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (68, NULL, 0, N'127.0.0.1', 17, 1, 0, 4, 345.0000, 444.0000, 50.0000, CAST(N'2019-04-15T21:33:03.080' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTUzNDQyNDIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CZYwO8VBEzpWMSxpOUvxa7J2hiBA71v-Xv9U8lXtQu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (69, NULL, 0, N'127.0.0.1', 22, 1, 0, 2, 333.0000, 234.0000, 50.0000, CAST(N'2019-04-18T13:29:44.780' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTUzNDQyNDIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CZYwO8VBEzpWMSxpOUvxa7J2hiBA71v-Xv9U8lXtQu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (70, NULL, 0, N'127.0.0.1', 21, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-04-21T14:51:04.330' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTUzNDQyNDIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CZYwO8VBEzpWMSxpOUvxa7J2hiBA71v-Xv9U8lXtQu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (71, NULL, 0, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-05T14:50:34.307' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTUzNDQyNDIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CZYwO8VBEzpWMSxpOUvxa7J2hiBA71v-Xv9U8lXtQu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (72, NULL, 0, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-05T17:07:23.820' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTUzNDQyNDIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CZYwO8VBEzpWMSxpOUvxa7J2hiBA71v-Xv9U8lXtQu0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (73, NULL, 0, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-05T17:07:50.250' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTUzNDQyNDIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CZYwO8VBEzpWMSxpOUvxa7J2hiBA71v-Xv9U8lXtQu0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (74, NULL, 0, N'::1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-05-12T22:14:53.710' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTc3MjQ1NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.o2mKfO4vFueSI-93AZ4p26-PdHhmGzheDNip6GGjkzY', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (75, NULL, 0, N'::1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-12T22:20:50.760' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTc3MjQ1NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.o2mKfO4vFueSI-93AZ4p26-PdHhmGzheDNip6GGjkzY', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (76, NULL, 0, N'::1', 17, 1, 0, 4, 345.0000, 444.0000, 50.0000, CAST(N'2019-05-12T23:36:10.337' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTc3MjQ1NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.o2mKfO4vFueSI-93AZ4p26-PdHhmGzheDNip6GGjkzY', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (77, NULL, 0, N'::1', 15, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-05-15T21:57:35.913' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTc5ODI3MTUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.1s8ROJt8eTorDCw3P6uhn-TpfA_JsrTUWS0o-ZGx51Y', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (78, NULL, 0, N'::1', 17, 1, 0, 4, 345.0000, 444.0000, 50.0000, CAST(N'2019-05-15T22:57:21.257' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTc5ODI3MTUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.1s8ROJt8eTorDCw3P6uhn-TpfA_JsrTUWS0o-ZGx51Y', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (79, NULL, 0, N'::1', 18, 1, 0, 1, 3332.0000, 898.0000, 50.0000, CAST(N'2019-05-15T22:57:47.763' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTc5ODI3MTUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.1s8ROJt8eTorDCw3P6uhn-TpfA_JsrTUWS0o-ZGx51Y', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (80, NULL, 0, N'::1', 18, 1, 0, 1, 3332.0000, 898.0000, 50.0000, CAST(N'2019-05-15T22:58:13.790' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTc5ODI3MTUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.1s8ROJt8eTorDCw3P6uhn-TpfA_JsrTUWS0o-ZGx51Y', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (81, NULL, 0, N'::1', 17, 1, 0, 4, 345.0000, 444.0000, 50.0000, CAST(N'2019-05-17T00:05:11.317' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTgwNzY3NzEsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.Y1CSVbYV4rlctSl4Vr_V3xrZCXVgl9DyGtxcZ1F6lvw', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (82, NULL, 0, N'::1', 21, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-17T00:23:23.190' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTgwNzY3NzEsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.Y1CSVbYV4rlctSl4Vr_V3xrZCXVgl9DyGtxcZ1F6lvw', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (83, NULL, 0, N'::1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-17T00:55:42.340' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTgwNzY3NzEsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.Y1CSVbYV4rlctSl4Vr_V3xrZCXVgl9DyGtxcZ1F6lvw', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (84, NULL, 0, N'::1', 34, 1, 0, 2, 6000.0000, 500.0000, 0.0000, CAST(N'2019-05-17T01:11:43.097' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTgwNzY3NzEsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.Y1CSVbYV4rlctSl4Vr_V3xrZCXVgl9DyGtxcZ1F6lvw', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (85, NULL, 0, N'42.111.35.134', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-05-21T01:17:24.373' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (86, NULL, 0, N'42.111.34.168', 20, 1, 0, 4, 3332.0000, 898.0000, 50.0000, CAST(N'2019-05-21T02:37:56.953' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (87, NULL, 0, N'42.111.38.89', 29, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-21T03:18:45.143' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (88, NULL, 0, N'42.111.38.89', 29, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-21T03:18:45.147' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (89, NULL, 0, N'42.111.38.89', 29, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-21T03:18:45.153' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (90, NULL, 0, N'42.111.38.89', 29, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-21T03:19:09.720' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (91, NULL, 0, N'42.111.38.89', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(N'2019-05-21T03:20:22.603' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (92, NULL, 0, N'42.111.38.89', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-05-21T03:20:41.013' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (93, NULL, 0, N'42.111.36.252', 2, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-05-21T05:33:04.917' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (94, NULL, 0, N'42.111.36.252', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(N'2019-05-21T05:34:14.293' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (95, NULL, 0, N'42.111.39.136', 2, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-05-21T09:28:13.260' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (96, NULL, 0, N'42.111.39.136', 2, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-05-21T09:28:40.070' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTg0MjY3MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.CCUnQtuh-HYfi7pY3ugmhboXTGGHaHq54dto66YkCu0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (97, NULL, 0, N'219.91.227.232', 2, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-06-19T19:55:49.750' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjA5OTk0MDksImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NQUUUeoL6U6eThmeGqj_8t8hsqyTnKdok5QGZYG5Nt4', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (98, NULL, 0, N'42.111.35.145', 5, 1, 0, 5, 333.0000, 234.0000, 50.0000, CAST(N'2019-06-19T21:02:43.310' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (99, NULL, 0, N'42.111.35.145', 5, 1, 0, 5, 333.0000, 234.0000, 50.0000, CAST(N'2019-06-19T21:02:43.527' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
GO
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (100, NULL, 0, N'219.91.227.232', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-06-20T00:22:31.857' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjA5OTk0MDksImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NQUUUeoL6U6eThmeGqj_8t8hsqyTnKdok5QGZYG5Nt4', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (101, NULL, 0, N'42.111.38.143', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-06-21T20:50:20.530' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (102, NULL, 0, N'42.111.37.190', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-06-21T21:06:51.433' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (103, NULL, 0, N'42.111.37.161', 6, 1, 0, 6, 345.0000, 444.0000, 50.0000, CAST(N'2019-06-21T21:50:29.360' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (104, NULL, 0, N'42.111.39.93', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-06-22T00:36:38.843' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (105, NULL, 0, N'42.111.39.93', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-06-22T00:37:56.560' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (106, NULL, 0, N'47.30.187.123', 2, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-06-22T09:24:02.880' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjA5OTk0MDksImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NQUUUeoL6U6eThmeGqj_8t8hsqyTnKdok5QGZYG5Nt4', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (107, NULL, 0, N'47.30.187.123', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-06-22T09:24:21.650' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjA5OTk0MDksImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NQUUUeoL6U6eThmeGqj_8t8hsqyTnKdok5QGZYG5Nt4', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (108, NULL, 0, N'47.30.187.123', 6, 1, 0, 6, 345.0000, 444.0000, 50.0000, CAST(N'2019-06-22T09:24:33.567' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjA5OTk0MDksImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NQUUUeoL6U6eThmeGqj_8t8hsqyTnKdok5QGZYG5Nt4', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (109, NULL, 0, N'42.111.33.126', 2, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-06-24T09:31:26.013' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (110, NULL, 0, N'42.111.33.139', 27, 1, 0, 3, 345.0000, 444.0000, 50.0000, CAST(N'2019-06-26T21:53:51.433' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (111, NULL, 0, N'42.111.38.191', 2, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(N'2019-06-28T00:27:46.307' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (112, NULL, 0, N'42.111.38.34', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(N'2019-06-29T07:31:48.397' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (113, NULL, 0, N'148.72.214.124', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-06-29T07:32:25.573' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjE4MTg4MDQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.VBcDXmccnmQtIjHrRau-A6SQNu30jxt-LaPoS44jUuk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (114, NULL, 0, N'42.111.37.118', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-07-01T04:28:10.790' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (115, NULL, 0, N'47.30.160.115', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-07-06T23:53:17.613' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjI0ODI0NTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.78MVX_RtcSIXfipbnhlqSgd-s-xRC0U5bgptqaGGlZ8', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (116, NULL, 0, N'47.31.97.21', 5, 1, 0, 5, 333.0000, 234.0000, 50.0000, CAST(N'2019-07-12T23:49:35.983' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjMwMDA2MzUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.F7QQ-LuJsED8SMTXcmKTfL0FoWFjwJR1J9uL-tFHXXQ', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (117, NULL, 0, N'47.30.229.203', 1, 1, 0, 1, 700.0000, 650.0000, 50.0000, CAST(N'2019-07-14T07:12:06.870' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjMxMTM1ODYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.jcYBSJgYi1p1stRO2_xO6Qn8dryxiiH3gtV7vjV00ok', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (118, NULL, 0, N'42.111.38.238', 1, 1, 0, 8, 750.0000, 699.0000, 50.0000, CAST(N'2019-07-14T08:03:43.943' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (119, NULL, 0, N'42.111.24.225', 1, 1, 0, 8, 750.0000, 699.0000, 50.0000, CAST(N'2019-07-14T09:01:58.717' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (120, NULL, 0, N'42.111.24.225', 1, 1, 0, 8, 750.0000, 699.0000, 50.0000, CAST(N'2019-07-14T09:04:19.060' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (121, NULL, 0, N'219.91.227.123', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-07-20T23:12:47.377' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjMxMTM1ODYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.jcYBSJgYi1p1stRO2_xO6Qn8dryxiiH3gtV7vjV00ok', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (122, NULL, 0, N'219.91.227.123', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-07-20T23:22:37.333' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (123, NULL, 0, N'219.91.227.123', 1, 1, 0, 8, 750.0000, 699.0000, 50.0000, CAST(N'2019-07-20T23:38:07.000' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (124, NULL, 0, N'42.111.37.106', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(N'2019-07-21T09:43:29.723' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjEwMDM0MjMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.QHQ6R_Itwmu6EbuVMGZZ9rjnnlGKqHrxO3f9fGNDGl0', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (125, NULL, 0, N'219.91.227.235', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(N'2019-08-04T10:37:53.160' AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjQ5NDAzMzMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.roK6nJf6IGJNMEzHYlBDqrDV_b8fH4HBljZn3RjjhuU', 1)
SET IDENTITY_INSERT [dbo].[CheckIn] OFF
SET IDENTITY_INSERT [dbo].[ColorMaster] ON 

INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (1, N'Red       ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (2, N'Green     ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (3, N'Blue      ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (4, N'Orange    ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (5, N'Black     ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (6, N'While     ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (7, N'Yellow    ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (8, N'Navy Blue ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ColorMaster] OFF
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'Value cannot be null.
Parameter name: s')
SET IDENTITY_INSERT [dbo].[ItemMaster] ON 

INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (1, 1, N'Ladies Kurta', N'Navy Blue Ladies Kurta with White Printing', 8, N'Green;Red;Blue;', 2, 0, 2, 4, 750.0000, 699.0000, 5, N'assets/product_img/1.jpg', N'Navy Blue with White Printing', N'Sparsh    ', NULL, 50, 1, CAST(N'2018-03-27T21:27:36.467' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (2, 1, N'balck Kurti la', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 2, 3, 1, 345.0000, 444.0000, 4, N'assets/product_img/4.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (3, 1, N'Blue kurta', N'cheap rate kurti 1', 3, N'Green;Blue;Brown', 5, 2, 3, 1, 3332.0000, 898.0000, 4, N'assets/product_img/2.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (4, 1, N'Rayon Kurti', N'cheap rate kurti 1', 4, N'Blue;Red;Orance', 5, 3, 2, 1, 125.0000, 25.0000, 4, N'assets/product_img/3.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (5, 1, N'Rayon Kurti www', N'Popo', 5, N'Green;Red;Blue;', 5, 4, 1, 2, 333.0000, 234.0000, 4, N'assets/product_img/4.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:27:36.467' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (6, 1, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 4, 1, 1, 345.0000, 444.0000, 4, N'assets/product_img/5.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (7, 1, N'Blue kurta', N'cheap rate kurti 1', 7, N'Green;Red;Blue;', 5, 5, 0, 1, 3332.0000, 898.0000, 4, N'assets/product_img/6.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (8, 1, N'Rayon Kurti', N'cheap rate kurti 1', 1, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 4, N'assets/product_img/7.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (9, 1, N'Rayon Kurti www', N'cheap rate kurti 1', 1, N'Blue;Red;Orance', 5, 55, 0, 2, 333.0000, 234.0000, 4, N'assets/product_img/8.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:27:36.467' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (10, 1, N'balck Kurti la', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 6, N'assets/product_img/9.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (11, 1, N'Blue kurta', N'cheap rate kurti 1', 3, N'Green;Red;Blue;', 5, 10, 7, 1, 3332.0000, 898.0000, 6, N'assets/product_img/10.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (12, 1, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Green;Blue;Brown', 5, 33, 5, 1, 125.0000, 25.0000, 6, N'assets/product_img/11.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (13, 1, N'Rayon Kurti www', N'cheap rate kurti 1', 4, N'Green;Red;Blue;', 5, 4, 5, 2, 333.0000, 234.0000, 7, N'assets/product_img/12.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:27:36.467' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (14, 1, N'balck Kurti la', N'cheap rate kurti 1', 7, N'Blue;Red;Orance', 5, 5, 5, 1, 345.0000, 444.0000, 7, N'assets/product_img/13.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (15, 1, N'Blue kurta', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 6, 0, 1, 3332.0000, 898.0000, 7, N'assets/product_img/14.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (16, 1, N'Rayon Kurti', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 8, 5, 1, 125.0000, 25.0000, 10, N'assets/product_img/15.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (17, 1, N'balck Kurti la', N'cheap rate kurti 1', 4, N'Green;Blue;Brown', 5, 3, 2, 1, 345.0000, 444.0000, 13, N'assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (18, 1, N'Blue kurta', N'cheap rate kurti 1', 1, N'Blue;Red;Orance', 5, 3, 2, 1, 3332.0000, 898.0000, 10, N'assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (19, 1, N'Rayon Kurti', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 125.0000, 25.0000, 13, N'assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (20, 1, N'Blue kurta', N'cheap rate kurti 1', 4, N'Green;Red;Blue;', 5, 5, 0, 1, 3332.0000, 898.0000, 7, N'assets/product_img/6.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (21, 1, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 7, N'assets/product_img/7.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (22, 1, N'Rayon Kurti www', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 5, 0, 2, 333.0000, 234.0000, 7, N'assets/product_img/8.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:27:36.467' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (23, 1, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 7, N'assets/product_img/9.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (24, 1, N'Blue kurta', N'cheap rate kurti 1', 1, N'Green;Red;Blue;', 5, 4, 0, 1, 3332.0000, 898.0000, 1, N'assets/product_img/10.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (25, 1, N'Rayon Kurti', N'cheap rate kurti 1', 2, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'assets/product_img/11.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (26, 1, N'Rayon Kurti www', N'cheap rate kurti 1', 3, N'Green;Red;Blue;', 5, 4, 0, 2, 333.0000, 234.0000, 1, N'assets/product_img/12.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:27:36.467' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (27, 1, N'balck Kurti la', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'assets/product_img/13.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (28, 1, N'Blue kurta', N'cheap rate kurti 1', 4, N'Blue;Red;Orance', 5, 2, 0, 1, 3332.0000, 898.0000, 1, N'assets/product_img/14.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (29, 1, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Blue;Red;Orance', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'assets/product_img/15.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (30, 1, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Green;Blue;Brown', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (31, 1, N'Blue kurta', N'cheap rate kurti 1', 7, N'Blue;Red;Orance', 5, 4, 0, 1, 3332.0000, 898.0000, 1, N'assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (32, 1, N'Rayon Kurti', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 4, 0, 1, 125.0000, 25.0000, 2, N'assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(N'2018-03-27T21:29:46.960' AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (34, 1, N'Poloala ', N'pulpul', 2, N'Pilpala Kurta', 3, 2, 1, 1, 6000.0000, 500.0000, 23, N'assets/product_img/1.jpg', NULL, NULL, NULL, 0, 1, CAST(N'2019-04-21T16:40:12.187' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ItemMaster] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (1, 0, N'Women', N'women', NULL, N'#women', NULL, N'women', NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (2, 0, N'Men', N'men', NULL, N'#men', NULL, N'men', NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (3, 0, N'Kids', N'kid', NULL, N'#kid', NULL, N'kid', NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (4, 1, N'Leggings', NULL, N'leggings', NULL, N'#leg', NULL, N'leg', N'women/1/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (5, 1, N'Kurti', NULL, N'kurti', NULL, N'#kurti', NULL, N'kurti', N'women/1/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (6, 2, N'Trouser', NULL, N'trouser', NULL, N'#trou', NULL, N'trou', N'men/2/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (7, 3, N'frocks', NULL, N'frocks', NULL, N'#froc', NULL, NULL, N'kids/3/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (10, 0, N'Electronics', N'electronics', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (11, 10, N'TV', N'tv', NULL, NULL, NULL, NULL, NULL, N'elec/4/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (13, 10, N'Washing Machine', N'wash', NULL, NULL, NULL, NULL, NULL, N'elec/4/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (14, 0, N'Home & Furniture', N'home', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (15, 14, N'Sofa', N'sofa', NULL, NULL, NULL, NULL, NULL, N'furn/5/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (16, 0, N'Sports & Book', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (18, 16, N'Cricket', NULL, NULL, NULL, NULL, NULL, NULL, N'sports/6/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (19, 0, N'Grocery', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (21, 19, N'Rice', NULL, NULL, NULL, NULL, NULL, NULL, N'grocery/7/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (22, 1, N'Dupatta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (23, 1, N'Sarree', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (24, 1, N'Salwaar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (25, 1, N'Chunni', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuMaster] ON 

INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [Status]) VALUES (1, N'Women', 1)
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [Status]) VALUES (2, N'Men', 1)
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [Status]) VALUES (3, N'Kids', 1)
SET IDENTITY_INSERT [dbo].[MenuMaster] OFF
SET IDENTITY_INSERT [dbo].[OTPMaster] ON 

INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (18, N'9711352497', CAST(1800 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'219.91.227.148', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 0, CAST(N'2019-06-29T07:27:41.820' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (19, N'0711352497', CAST(6763 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'219.91.227.148', N'Mozilla/5.0 (Linux; Android 8.0.0; Nexus 6P Build/OPP3.170518.006) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Mobile Safari/537.36', 0, CAST(N'2019-06-29T11:13:35.347' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (20, N'9711352497', CAST(3724 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'219.91.156.37', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 2, CAST(N'2019-06-30T05:57:27.907' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (21, N'9911367987', CAST(7038 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'64.233.173.136', N'Mozilla/5.0 (Linux; Android 8.1.0; CPH1803) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36', 1, CAST(N'2019-07-01T04:28:49.233' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (23, N'8860658739', CAST(8745 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'47.31.145.32', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, CAST(N'2019-07-06T00:59:40.017' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (22, N'9711352497', CAST(2028 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'64.233.173.136', N'Mozilla/5.0 (Linux; Android 8.1.0; CPH1803) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Mobile Safari/537.36', 1, CAST(N'2019-07-06T00:09:51.707' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OTPMaster] OFF
SET IDENTITY_INSERT [dbo].[PaymentReceived] ON 

INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (1, 8, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(N'2019-03-12T12:21:17.867' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (2, 4, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(N'2019-03-12T12:21:17.893' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (3, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(N'2019-03-12T12:21:17.897' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (4, 8, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(N'2019-03-12T12:29:30.020' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (5, 4, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(N'2019-03-12T12:29:30.020' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (7, 13, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQwMTYxMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.nEjx_UxPFwSjP7FOXmhlnWx7qjxfXC-vPgevrZm1h8w', 1, 333.0000, 234.0000, N'vidhi.atul@gmail.com', CAST(N'2019-04-04T12:24:17.250' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (8, 17, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQwMTYxMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.nEjx_UxPFwSjP7FOXmhlnWx7qjxfXC-vPgevrZm1h8w', 1, 345.0000, 444.0000, N'vidhi.atul@gmail.com', CAST(N'2019-04-04T12:24:17.310' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (10, 14, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQ2NDA0NDcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.6tjtX3GqAR528375m4vZD2_5pIUSxQugAQUji2FOga4', 1, 345.0000, 444.0000, N'vidhi.atul@gmail.com', CAST(N'2019-04-07T19:33:26.470' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (6, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(N'2019-03-12T12:29:30.020' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (9, 13, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTQzNjE3OTEsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.ZsGspkP2ZCt_O06zMY4WjSzuvvX1mquvIH8QyvVVjEY', 1, 333.0000, 234.0000, N'vidhi.atul@gmail.com', CAST(N'2019-04-04T12:38:58.050' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (11, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(N'2019-07-20T23:22:42.607' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (12, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(N'2019-07-20T23:29:28.750' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (15, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(N'2019-07-20T23:39:10.423' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (16, 1, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1, 750.0000, 699.0000, N'delhi.atul@gmail.com', CAST(N'2019-07-20T23:39:10.430' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (13, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(N'2019-07-20T23:38:41.697' AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (14, 1, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NjM2OTAyMTcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.AC-I2NvJAOET2D5n7p8ZqFrmoGl2j6-TqIhnprfBWxo', 1, 750.0000, 699.0000, N'delhi.atul@gmail.com', CAST(N'2019-07-20T23:38:41.710' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PaymentReceived] OFF
SET IDENTITY_INSERT [dbo].[SizeMaster] ON 

INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (1, N'Small', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (2, N'Mediam', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (3, N'Large', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (4, N'XL', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (5, N'XXL', NULL, NULL)
SET IDENTITY_INSERT [dbo].[SizeMaster] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierId], [SupFirstName], [SupMidName], [SupLastName], [SupAdd1], [SupAdd2], [SupAdd3], [City], [State], [Pin], [Active]) VALUES (1, N'Vidhimas', NULL, N'Colluctions', N'House No. 367', N'First Floor', N'Sector 40', N'Gurgaon', N'Haryana', N'122002', 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'XPF6RCmRj6fd2kMo+n7hYg==', N'5kPQphuOWByD2zk6y1l3RWTBAMPtrjEahGArCST6iIU=', N'atul', N'kumar', N'srivastava', N'delhi.atul@gmail.com', CAST(9711352497 AS Numeric(18, 0)), NULL, CAST(N'2018-06-05T09:37:03.987' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'dffdfdffsf', NULL, N'rerrwer', N'fsfdsf', N'dsfdsf', N'dfdsf@fsdfdsf.com', CAST(454353 AS Numeric(18, 0)), CAST(45454 AS Numeric(18, 0)), CAST(N'2018-09-30T10:13:02.067' AS DateTime), NULL, NULL, NULL, NULL, N'dfdsfds', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'jKNiL63vWA9y84FG8O0V1Q==', N'YRCG6eQMfGwO7ViNezGV7awAmtUhfAyv1w8pg+HjZeo=', N'dfdfs', N'df', N'dffsf', N'dff@gmailc,o.com', CAST(9711352497 AS Numeric(18, 0)), CAST(4545 AS Numeric(18, 0)), CAST(N'2019-04-07T19:30:43.067' AS DateTime), NULL, NULL, NULL, NULL, N'4554', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'LVCv6g4ZsFZbhxG7PoX/MA==', N'93195UJyD8GG2ZMhoYboioZSwsBXoDk6ga8cNN1LSn8=', N'DFDSFDS', N'KJKJKLJ', N'LKJKLJ', N'JKLKJ@KJKLJLK.COM', CAST(711352497 AS Numeric(18, 0)), CAST(878787 AS Numeric(18, 0)), CAST(N'2019-04-07T19:13:04.380' AS DateTime), NULL, NULL, NULL, NULL, N'67676', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'9199d+yESoC13yew14OJIg==', N'5Y2rC9okKjUBNtXUUvRAmPOvfm3vtipnWTOGOXH5WSY=', N'vidhi', N'', N'srivastava', N'vidhi.atul@gmail.com', CAST(9711352497 AS Numeric(18, 0)), CAST(5555 AS Numeric(18, 0)), CAST(N'2019-04-04T12:12:54.167' AS DateTime), NULL, NULL, NULL, NULL, N'121212', NULL, 1)
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_TotalQty]  DEFAULT ((0)) FOR [TotalQty]
GO
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_AvailableQty]  DEFAULT ((0)) FOR [AvailableQty]
GO
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_ReservedQty]  DEFAULT ((0)) FOR [ReservedQty]
GO
ALTER TABLE [dbo].[CheckIn] ADD  CONSTRAINT [DF_CheckIn_PaymentReceived]  DEFAULT ((0)) FOR [PaymentReceived]
GO
ALTER TABLE [dbo].[CheckIn] ADD  CONSTRAINT [DF_Table_1_checkout]  DEFAULT ((0)) FOR [Checkout]
GO
ALTER TABLE [dbo].[CheckIn] ADD  CONSTRAINT [DF_Sales_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CheckIn] ADD  CONSTRAINT [DF_CheckIn_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_InitialQty]  DEFAULT ((0)) FOR [InitialQty]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_AvailableQty]  DEFAULT ((0)) FOR [AvailableQty]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_ReserveQty]  DEFAULT ((0)) FOR [ReserveQty]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_DeliveryCharges]  DEFAULT ((0)) FOR [DeliveryCharges]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_SubMenu_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  CONSTRAINT [DF_MenuMaster_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OTPMaster] ADD  CONSTRAINT [DF_OTPMaster_SenderAttempt]  DEFAULT ((1)) FOR [SenderAttempt]
GO
ALTER TABLE [dbo].[OTPMaster] ADD  CONSTRAINT [DF_OTPMaster_SenderDateTime]  DEFAULT (getdate()) FOR [SenderDateTime]
GO
ALTER TABLE [dbo].[OTPMaster] ADD  CONSTRAINT [DF_OTPMaster_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_TotalPaymentAmount]  DEFAULT ((0)) FOR [TotalPaymentAmount]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[AvailableQty]  WITH CHECK ADD  CONSTRAINT [FK_AvailableQty] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[AvailableQty] CHECK CONSTRAINT [FK_AvailableQty]
GO
ALTER TABLE [dbo].[AvailableQty]  WITH CHECK ADD  CONSTRAINT [FK_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryMasterObselete] ([CategoryId])
GO
ALTER TABLE [dbo].[AvailableQty] CHECK CONSTRAINT [FK_CategoryId]
GO
ALTER TABLE [dbo].[AvailableQty]  WITH CHECK ADD  CONSTRAINT [FK_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[ColorMaster] ([ColorId])
GO
ALTER TABLE [dbo].[AvailableQty] CHECK CONSTRAINT [FK_ColorId]
GO
ALTER TABLE [dbo].[AvailableQty]  WITH CHECK ADD  CONSTRAINT [FK_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
ALTER TABLE [dbo].[AvailableQty] CHECK CONSTRAINT [FK_SizeId]
GO
ALTER TABLE [dbo].[CheckIn]  WITH CHECK ADD  CONSTRAINT [FK_UserEmailId] FOREIGN KEY([UserEmailId])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[CheckIn] CHECK CONSTRAINT [FK_UserEmailId]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_ItemMaster_ItemMaster] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_ItemMaster_ItemMaster]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_ItemMaster_ItemMaster1] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_ItemMaster_ItemMaster1]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_ItemMaster_ItemMaster2] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_ItemMaster_ItemMaster2]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_MenuId] FOREIGN KEY([ChildMenuId])
REFERENCES [dbo].[Menu] ([Id])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_MenuId]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_SizeMaster] FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_SizeMaster]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FKColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[ColorMaster] ([ColorId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FKColorId]
GO
ALTER TABLE [dbo].[PaymentReceived]  WITH CHECK ADD  CONSTRAINT [FK_Itemid] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ItemMaster] ([ItemId])
GO
ALTER TABLE [dbo].[PaymentReceived] CHECK CONSTRAINT [FK_Itemid]
GO
ALTER TABLE [dbo].[PaymentReceived]  WITH CHECK ADD  CONSTRAINT [FK_ReceivedFormEmailId] FOREIGN KEY([ReceivedFormEmailId])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[PaymentReceived] CHECK CONSTRAINT [FK_ReceivedFormEmailId]
GO
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[AddToCart] 
(
	
	@itemId int,
	@IPAddress nvarchar(max),
	@Quantity int,
	@Color varchar(50),
	@sessionid varchar(max),
	@price money,
	@offerprice money,
	@deliveryCharges money ,
	@ColorId int --added new
	
)



AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @availableQty int
	DECLARE @ReserveQty int
	DECLARE @Identity int
	---Declare @ColorId int -- commented new
	
	SET @availableQty =0
	SET @ReserveQty=0
	
	----SELECT @ColorId=ColorId FROM ColorMaster WHERE ColorName= @Color   --commented new
	
	
	SELECT @availableQty = AvailableQty,@ReserveQty=ReserveQty
	FROM ItemMaster WHERE ItemId = @itemId
	
	IF @availableQty>0 AND @ColorId IS NOT NULL
	BEGIN
		UPDATE ItemMaster 
		SET AvailableQty=(@availableQty-@Quantity),ReserveQty =(@ReserveQty+@Quantity)
		WHERE ItemId = @itemId
							
	END
	
	INSERT INTO checkin
	(
	  itemid,userIp,Quantity,Colorid,UserSessionId,price,offerprice,deliverycharges
	)
	VALUES(@itemId,@IPAddress,@Quantity,@ColorId,@sessionid,
	@price ,
	@offerprice ,
	@deliveryCharges 
	)
	SET @Identity=SCOPE_IDENTITY()
	
	SELECT  ci.itemid,ci.Quantity,im.itemname,im.ItemDescripton,ci.UserSessionId,im.Price,im.OfferPrice,im.DeliveryCharges,cm.ColorName,im.SizeId,sm.SizeName,ci.userSessionId FROM checkin ci
	INNER JOIN ItemMaster im
	ON ci.itemid = im.ItemId
	inner join ColorMaster cm
	on cm.ColorId=ci.colorid
	inner join ColorMaster cmm -- added new
	on cmm.ColorId = im.colorId -- added new 
	
	inner join SizeMaster sm
	on im.SizeId=sm.SizeId
	WHERE id = @Identity
	AND im.active =1 AND ci.active=1
	
	

	select count(*) as [count] from CheckIn where UserSessionId = @sessionid
	and Active =1
	
	
	

END

GO
/****** Object:  StoredProcedure [dbo].[authenticate]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[authenticate]
(
	@email nvarchar(50)
	
)
as 

DECLARE @count int

SELECT Salt,Hash,Email,FirsName,MiddleName,LastName,Mobile,UlterNateMobile  from [User] where email = @email 

GO
/****** Object:  StoredProcedure [dbo].[GetAllItems]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Atul Srivastava>
-- Create date: <27-Mar-2018>
-- Description:	< Get All Items,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllItems]
(
	@categoryid int,
	@page int
)
	
AS
BEGIN
	SET NOCOUNT ON;  
	DECLARE @PageSize INT,
			@RecordCount int
	
	SET  @PageSize = 10
	

	SELECT @RecordCount = COUNT(*)  FROM ItemMaster where active=1
	select @RecordCount
	

	;WITH PageNumbers AS
	(
        SELECT	im.itemId,im.itemName,im.ItemDescripton,im.SizeId,sm.SizeName,
				im.Price,im.OfferPrice,cm.categoryName,cm.CategoryId,im.image,
				im.detailId,ROW_NUMBER() OVER (ORDER BY im.itemid) AS RowNum,im.color,im.deliverycharges,im.brand,
				im.availableColor,im.AvailableQty,im.ColorId
		from ItemMaster im
			inner join SizeMaster sm on im.SizeId = sm.SizeId
			inner join CategoryMaster cm on im.CategoryId = cm.CategoryId
			where im.CategoryId=@categoryid	and im.active=1
	)
	
		SELECT  * FROM PageNumbers 
		WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1) AND (@Page * @PageSize)
				
	END





--

GO
/****** Object:  StoredProcedure [dbo].[GetItemDetail]    Script Date: 8/5/2019 9:54:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Atul Srivastava>
-- Create date: <13-April-2018>
-- Description:	< Get All Items,,>
-- =============================================



 CREATE PROCEDURE [dbo].[GetItemDetail]

(
	@itemId int
)

AS

BEGIN
	SET NOCOUNT ON;  

        SELECT	im.itemId,im.itemName,im.ItemDescripton,im.SizeId,sm.SizeName,
				im.Price,im.OfferPrice,cm.MenuName,cm.id,im.image,
				im.detailId,cl.ColorName as color,im.brand,im.deliverycharges,
				im.availableColor,im.AvailableQty,im.ColorId
		from ItemMaster im
			inner join SizeMaster sm on im.SizeId = sm.SizeId
			inner join menu cm on im.ChildMenuId = cm.Id
			inner join ColorMaster cl on cl.ColorId = im.ColorId 
			where im.ItemId=@itemId and im.active=1 and im.AvailableQty>0



	



	



				



	END























--

GO
