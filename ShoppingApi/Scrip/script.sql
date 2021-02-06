USE [Shopping] 
GO
/****** Object:  Table [dbo].[AvailableQty]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[CategoryMasterObselete]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[CheckIn]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[ColorMaster]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[ErrorLogging]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogging](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_ErorLogger_ID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupMaster]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupMaster](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GroupMaster] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[GroupId] [int] NULL,
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
	[Brand] [nvarchar](max) NULL,
	[detailId] [nvarchar](50) NULL,
	[DeliveryCharges] [int] NULL,
	[Active] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Image1] [nvarchar](max) NULL,
	[Image2] [varbinary](max) NULL,
	[Image3] [varbinary](max) NULL,
	[ImageSmall3] [nvarchar](max) NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPMaster]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [nvarchar](50) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentReceived]    Script Date: 2/6/2021 7:51:48 PM ******/
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
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[Pin] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[PrivacyAgreed] [bit] NULL,
	[Active] [bit] NOT NULL,
	[PaymentMethodType] [int] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[ConsignmentNum] [nvarchar](max) NOT NULL,
	[OrderStatusId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeMaster]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[ParentStateId] [int] NULL,
	[City] [nvarchar](50) NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/6/2021 7:51:48 PM ******/
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
/****** Object:  Table [dbo].[UserSession]    Script Date: 2/6/2021 7:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionKey] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[SessionDate] [datetime] NOT NULL
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

INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1333, NULL, 0, N'::1', 30, 1, 0, 5, 545.0000, 444.0000, 56.0000, CAST(N'2021-01-07T13:00:36.380' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjUwYjY0ODQ3LTMzNDgtNDQ1Mi1hYjY5LWI2NzE4Y2Y3MmNmYiIsImV4cCI6MTYwMjMzOTU5OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.zoUkl2kNqD_emMUj6NEiKW_hlMJBgLqbzzvPjw9LcDY', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1334, NULL, 0, N'::1', 30, 1, 0, 5, 545.0000, 444.0000, 56.0000, CAST(N'2021-01-07T13:00:57.630' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjUwYjY0ODQ3LTMzNDgtNDQ1Mi1hYjY5LWI2NzE4Y2Y3MmNmYiIsImV4cCI6MTYwMjMzOTU5OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.zoUkl2kNqD_emMUj6NEiKW_hlMJBgLqbzzvPjw9LcDY', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1335, NULL, 0, N'::1', 31, 1, 0, 5, 343.0000, 66.0000, 45.0000, CAST(N'2021-01-07T13:01:06.463' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjUwYjY0ODQ3LTMzNDgtNDQ1Mi1hYjY5LWI2NzE4Y2Y3MmNmYiIsImV4cCI6MTYwMjMzOTU5OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.zoUkl2kNqD_emMUj6NEiKW_hlMJBgLqbzzvPjw9LcDY', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1336, NULL, 0, N'::1', 31, 1, 0, 5, 343.0000, 66.0000, 45.0000, CAST(N'2021-01-30T18:53:17.030' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjBiMjYxYWRmLWExYmUtNGNkMC04MTUxLTVhNzBkZmMwMGYzNyIsImV4cCI6MTYxMjAxNDE5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.fVifqQ2MU9MAtb380FqFMUVnUNJr2KlaEpCnB-kDhGQ', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1337, NULL, 0, N'::1', 31, 1, 0, 5, 343.0000, 66.0000, 45.0000, CAST(N'2021-01-30T20:24:12.633' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjBiMjYxYWRmLWExYmUtNGNkMC04MTUxLTVhNzBkZmMwMGYzNyIsImV4cCI6MTYxMjAxNDE5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.fVifqQ2MU9MAtb380FqFMUVnUNJr2KlaEpCnB-kDhGQ', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1338, NULL, 0, N'::1', 38, 1, 0, 8, 300.0000, 30.0000, 300.0000, CAST(N'2021-01-31T16:40:04.777' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjBiMjYxYWRmLWExYmUtNGNkMC04MTUxLTVhNzBkZmMwMGYzNyIsImV4cCI6MTYxMjAxNDE5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.fVifqQ2MU9MAtb380FqFMUVnUNJr2KlaEpCnB-kDhGQ', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1339, NULL, 0, N'::1', 39, 1, 0, 8, 300.0000, 30.0000, 300.0000, CAST(N'2021-01-31T16:51:03.067' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjBiMjYxYWRmLWExYmUtNGNkMC04MTUxLTVhNzBkZmMwMGYzNyIsImV4cCI6MTYxMjAxNDE5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.fVifqQ2MU9MAtb380FqFMUVnUNJr2KlaEpCnB-kDhGQ', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1340, NULL, 0, N'::1', 39, 1, 0, 8, 300.0000, 30.0000, 300.0000, CAST(N'2021-01-31T16:51:04.280' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2Vyc2Vzc2lvbiIsImp0aSI6IjBiMjYxYWRmLWExYmUtNGNkMC04MTUxLTVhNzBkZmMwMGYzNyIsImV4cCI6MTYxMjAxNDE5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.fVifqQ2MU9MAtb380FqFMUVnUNJr2KlaEpCnB-kDhGQ', 0)
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
SET IDENTITY_INSERT [dbo].[ErrorLogging] ON 

INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (3, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (4, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (5, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (6, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (7, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (8, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (9, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (10, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (11, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (12, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (13, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (14, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (15, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (16, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (17, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (18, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (19, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (20, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (21, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (22, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (23, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (24, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (25, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (26, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (27, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (28, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (29, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (30, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (31, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (32, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (33, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (34, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (35, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (36, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (37, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (38, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (39, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (40, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (41, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (42, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (43, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (44, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (45, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (46, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (47, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (48, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (49, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (50, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (51, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (52, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (53, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (54, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (55, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (56, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (57, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (58, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (59, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (60, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (61, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (62, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (63, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (64, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (65, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (66, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (67, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (68, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (69, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (70, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (71, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (72, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (73, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (74, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (75, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (76, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (77, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (78, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (79, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (80, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (81, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (82, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (83, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (84, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (85, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (86, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (87, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (88, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (89, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (90, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (91, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (92, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (93, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (94, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (95, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (96, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (97, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (98, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (99, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (100, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (101, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (102, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (103, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (104, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (105, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (106, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (107, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (108, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (109, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (110, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (111, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (112, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (113, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (114, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (115, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (116, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (117, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (118, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (119, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (120, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (121, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (122, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (123, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (124, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (125, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (126, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (127, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (128, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (129, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (130, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (131, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (132, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (133, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (134, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (135, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (136, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (137, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (138, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (139, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (140, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (141, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (142, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (143, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (144, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (145, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (146, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (147, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (148, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (149, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (150, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (151, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (152, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (153, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (154, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (155, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (156, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (157, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (158, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (159, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (160, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (161, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (162, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (163, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (164, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (165, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (166, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (167, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (168, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (169, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (170, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (171, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (172, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (173, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (174, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (175, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (176, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (177, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (178, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (179, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (180, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (181, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (182, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (183, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (184, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (185, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (186, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (187, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (188, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (189, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (190, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (191, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (192, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (193, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (194, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (195, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (196, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (197, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (198, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (199, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (200, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (201, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (202, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (203, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (204, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (205, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (206, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (207, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (208, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (209, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (210, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1182, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1183, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1184, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1185, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1186, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1187, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1188, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1189, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1190, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1191, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1192, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1193, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1194, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1195, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1196, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1197, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1198, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1199, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1200, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1201, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1202, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1203, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1204, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1205, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1206, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1207, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1208, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1209, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1210, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1211, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1212, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1213, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1214, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1215, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1216, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1217, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1218, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1219, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1220, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1221, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1222, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1223, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1224, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1225, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1226, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1227, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1228, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1229, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1230, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1231, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1232, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1233, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1234, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1235, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1236, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1237, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1238, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1239, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1240, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1241, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1242, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1243, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1244, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1245, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1246, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1247, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1248, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1249, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1250, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1251, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1252, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1253, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1254, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1255, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1256, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1257, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1258, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1259, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1260, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1261, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1262, N'Invalid column name ''ImageSmall3''.')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1263, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1264, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1265, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1266, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1267, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1268, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1269, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1270, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1271, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1272, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1273, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1274, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1275, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1276, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1277, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1278, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1279, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1280, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1281, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1282, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1283, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1284, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1285, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1286, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1287, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1288, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1289, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1290, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1291, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1292, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1293, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1294, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1295, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1296, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1297, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1298, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1299, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1300, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1301, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1302, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1303, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1304, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1305, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1306, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1307, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1308, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1309, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1310, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1311, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1312, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1313, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1314, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1315, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1316, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1317, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1318, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1319, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1320, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1321, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1322, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1323, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1324, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1325, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1326, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1327, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1328, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1329, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1330, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1331, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1332, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1333, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1334, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1335, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1336, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1337, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1338, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1339, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1340, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1341, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1342, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1343, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1344, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1345, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1346, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1347, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1348, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1349, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1350, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1351, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1352, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1353, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1354, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1355, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1356, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1357, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1358, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1359, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1360, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1361, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1362, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1363, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1364, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1365, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1366, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1367, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1368, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1369, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1370, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1371, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1372, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1373, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1374, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1375, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1376, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1377, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1378, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1379, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1380, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1381, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1382, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1383, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1384, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1385, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1386, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1387, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1388, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1389, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1390, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1391, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1392, N'Object reference not set to an instance of an object.')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1393, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1394, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1395, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1396, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1397, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1398, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1399, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1400, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1401, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1402, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1403, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1404, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1405, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1406, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1407, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1408, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1409, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1410, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1411, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1412, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1413, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1414, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1415, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1416, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1417, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1418, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1419, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1420, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1421, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1422, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1423, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1424, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1425, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1426, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1427, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1428, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1429, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1430, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1431, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1432, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1433, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1434, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1435, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1436, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1437, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1438, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1439, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1440, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1441, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1442, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1443, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1444, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1445, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1446, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1447, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1448, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1449, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1450, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1451, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1452, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1453, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1454, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1455, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1456, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1457, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1458, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1459, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1460, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1461, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1462, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1463, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1464, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1465, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1466, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1467, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1468, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1469, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1470, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1471, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1472, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1473, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1474, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1475, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1476, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1477, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1478, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1479, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1480, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1481, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1482, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1483, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1484, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1485, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1486, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1487, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1488, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1489, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1490, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1491, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1492, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1493, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1494, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1495, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1496, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1497, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1498, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1499, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1500, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1501, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1502, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1503, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1504, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1505, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1506, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1507, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1508, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1509, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1510, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1511, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1512, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1513, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1514, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1515, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1516, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1517, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1518, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1519, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1520, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1521, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1522, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1523, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1524, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1525, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1526, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1527, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1528, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1529, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1530, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1531, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1532, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1533, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1534, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1535, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1536, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1537, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1538, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1539, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1540, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1541, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1542, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1543, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1544, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1545, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1546, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1547, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1548, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1549, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1550, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1551, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1552, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1553, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1554, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1555, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1556, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1557, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1558, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1559, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1560, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1561, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1562, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1563, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1564, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1565, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1566, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1567, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1568, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1569, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1570, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1571, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1572, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1573, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1574, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1575, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1576, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1577, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1578, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1579, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1580, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1581, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1582, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1583, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1584, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1585, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1586, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1587, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1588, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1589, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1590, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1591, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1592, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1593, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1594, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1595, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1596, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1597, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1598, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1599, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1600, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1601, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1602, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1603, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1604, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1605, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1606, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1607, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1608, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1609, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1610, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1611, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1612, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1613, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1614, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1615, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1616, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1617, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1618, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1619, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1620, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1621, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1622, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1623, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1624, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1625, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1626, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1627, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1628, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1629, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1630, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1631, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1632, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1633, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1634, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1635, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1636, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1637, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1638, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1639, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1640, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1641, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1642, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1643, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1644, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1645, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1646, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1647, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1648, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1649, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1650, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1651, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1652, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1653, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1654, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1655, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1656, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1657, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1658, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1659, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1660, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1661, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1662, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1663, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1664, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1665, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1666, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1667, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1668, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1669, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1670, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1671, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1672, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1673, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1674, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1675, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1676, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1677, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1678, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1679, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1680, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1681, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1682, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1683, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1684, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1685, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1686, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1687, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1688, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1689, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1690, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1691, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1692, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1693, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1694, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1695, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1696, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1697, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1698, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1699, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1700, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1701, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1702, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1703, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1704, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1705, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1706, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1707, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1708, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1709, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1710, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1711, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1712, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1713, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1714, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1715, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1716, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1717, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1718, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1719, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1720, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1721, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1722, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1723, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1724, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1725, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1726, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1727, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1728, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1729, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1730, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1731, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1732, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1733, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1734, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1735, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1736, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1737, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1738, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1739, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1740, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1741, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1742, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1743, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1744, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1745, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1746, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1747, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1748, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1749, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1750, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1751, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1752, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1753, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1754, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1755, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1756, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1757, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1758, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1759, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1760, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1761, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1762, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1763, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1764, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1765, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1766, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1767, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1768, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1769, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1770, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1771, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1772, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1773, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1774, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1775, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1776, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1777, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1778, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1779, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1780, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1781, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1782, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1783, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1784, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1785, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1786, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1787, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1788, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1789, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1790, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1791, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1792, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1793, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1794, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1795, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1796, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1797, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1798, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1799, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1800, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1801, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1802, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1803, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1804, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1805, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1806, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1807, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1808, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1809, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1810, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1811, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1812, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1813, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1814, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1815, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1816, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1817, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1818, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1819, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1820, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1821, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1822, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1823, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1824, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1825, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1826, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1827, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1828, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1829, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1830, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1831, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1832, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1833, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1834, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1835, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1836, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1837, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1838, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1839, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1840, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1841, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1842, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1843, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1844, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1845, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1846, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1847, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1848, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1849, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1850, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1851, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1852, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1853, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1854, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1855, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1856, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1857, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1858, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1859, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1860, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1861, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1862, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1863, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1864, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1865, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1866, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1867, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1868, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1869, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1870, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1871, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1872, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1873, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1874, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1875, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1876, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1877, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1878, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1879, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1880, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1881, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1882, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1883, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1884, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1885, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1886, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1887, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1888, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1889, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1890, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1891, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1892, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1893, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1894, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1895, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1896, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1897, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1898, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1899, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1900, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1901, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1902, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1903, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1904, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1905, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1906, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1907, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1908, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1909, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1910, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1911, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1912, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1913, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1914, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1915, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1916, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1917, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1918, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1919, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1920, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1921, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1922, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1923, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1924, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1925, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1926, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1927, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1928, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1929, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1930, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1931, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1932, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1933, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1934, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1935, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1936, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1937, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1938, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1939, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1940, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1941, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1942, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1943, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1944, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1945, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1946, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1947, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1948, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1949, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1950, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1951, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1952, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1953, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1954, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1955, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1956, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1957, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1958, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1959, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1960, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1961, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1962, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1963, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1964, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1965, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1966, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1967, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1968, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1969, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1970, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1971, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1972, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1973, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1974, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1975, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1976, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1977, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1978, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1979, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1980, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1981, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1982, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1983, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1984, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1985, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1986, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1987, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1988, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1989, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1990, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1991, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1992, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1993, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1994, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1995, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1996, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1997, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1998, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (1999, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2000, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2001, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2002, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2003, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2004, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2005, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2006, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2007, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2008, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2009, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2010, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2011, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2012, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2013, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2014, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2015, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2016, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2017, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2018, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2019, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2020, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2021, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2022, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2023, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2024, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2025, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2026, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2027, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2028, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2029, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2030, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2031, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2032, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2033, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2034, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2035, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2036, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2037, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2038, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2039, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2040, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2041, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2042, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2043, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2044, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2045, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2046, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2047, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2048, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2049, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2050, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2051, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2052, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2053, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2054, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2055, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2056, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2057, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2058, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2059, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2060, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2061, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2062, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2063, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2064, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2065, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2066, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2067, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2068, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2069, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2070, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2071, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2072, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2073, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2074, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2075, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2076, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2077, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2078, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2079, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2080, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2081, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2082, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2083, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2084, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2085, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2086, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2087, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2088, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2089, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2090, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2091, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2092, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2093, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2094, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2095, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2096, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2097, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2098, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2099, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2100, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2101, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2102, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2103, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2104, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2105, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2106, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2107, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2108, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2109, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2110, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2111, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2112, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2113, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2114, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2115, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2116, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2117, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2118, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2119, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2120, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2121, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2122, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2123, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2124, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2125, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2126, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2127, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2128, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2129, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2130, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2131, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2132, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2133, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2134, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2135, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2136, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2137, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2138, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2139, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2140, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2141, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2142, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2143, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2144, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2145, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2146, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2147, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2148, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2149, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2150, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2151, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2152, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2153, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2154, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2155, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2156, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2157, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2158, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2159, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2160, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2161, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2162, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2163, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2164, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2165, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2166, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2167, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2168, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2169, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2170, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2171, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2172, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2173, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2174, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2175, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2176, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2177, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2178, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2179, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2180, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2181, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2182, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2183, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2184, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2185, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2186, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2187, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2188, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2189, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2190, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2191, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2192, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2193, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2194, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2195, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2196, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2197, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2198, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2199, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2200, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2201, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2202, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2203, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2204, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2205, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2206, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2207, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2208, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2209, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2210, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2211, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2212, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2213, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2214, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2215, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2216, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2217, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2218, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2219, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2220, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2221, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2222, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2223, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2224, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2225, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2226, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2227, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2228, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2229, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2230, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2231, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2232, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2233, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2234, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2235, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2236, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2237, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2238, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2239, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2240, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2241, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2242, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2243, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2244, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2245, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2246, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2247, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2248, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2249, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2250, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2251, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2252, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2253, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2254, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2255, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2256, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2257, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2258, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2259, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2260, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2261, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2262, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2263, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2264, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2265, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2266, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2267, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2268, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2269, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2270, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2271, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2272, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2273, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2274, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2275, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2276, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2277, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2278, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2279, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2280, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2281, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2282, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2283, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2284, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2285, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2286, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2287, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2288, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2289, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2290, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2291, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2292, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2293, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2294, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2295, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2296, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2297, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2298, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2299, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2300, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2301, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2302, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2303, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2304, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2305, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2306, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2307, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2308, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2309, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2310, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2311, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2312, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2313, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2314, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2315, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2316, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2317, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2318, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2319, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2320, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2321, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2322, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2323, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2324, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2325, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2326, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2327, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2328, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2329, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2330, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2331, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2332, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2333, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2334, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2335, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2336, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2337, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2338, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2339, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2340, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2341, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2342, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2343, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2344, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2345, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2346, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2347, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2348, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2349, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2350, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2351, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2352, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2353, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2354, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2355, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2356, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2357, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2358, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2359, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2360, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2361, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2362, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2363, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2364, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2365, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2366, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2367, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2368, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2369, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2370, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2371, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2372, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2373, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2374, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2375, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2376, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2377, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2378, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2379, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2380, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2381, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2382, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2383, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2384, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2385, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2386, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2387, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2388, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2389, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2390, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2391, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2392, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2393, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2394, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2395, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2396, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2397, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2398, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2399, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2400, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2401, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2402, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2403, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2404, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2405, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2406, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2407, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2408, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2409, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2410, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2411, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2412, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2413, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2414, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2415, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2416, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2417, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2418, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2419, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2420, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2421, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2422, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2423, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2424, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2425, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2426, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2427, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2428, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2429, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2430, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2431, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2432, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2433, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2434, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2435, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2436, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2437, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2438, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2439, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2440, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2441, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2442, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2443, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2444, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2445, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2446, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2447, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2448, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2449, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2450, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2451, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2452, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2453, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2454, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2455, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2456, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2457, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2458, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2459, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2460, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2461, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2462, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2463, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2464, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2465, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2466, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2467, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2468, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2469, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2470, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2471, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2472, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2473, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2474, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2475, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2476, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2477, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2478, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2479, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2480, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2481, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2482, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2483, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2484, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2485, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2486, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2487, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2488, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2489, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2490, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2491, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2492, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2493, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2494, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2495, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2496, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2497, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2498, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2499, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2500, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2501, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2502, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2503, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2504, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2505, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2506, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2507, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2508, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2509, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2510, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2511, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2512, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2513, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2514, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2515, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2516, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2517, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2518, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2519, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2520, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2521, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2522, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2523, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2524, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2525, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2526, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2527, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2528, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2529, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2530, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2531, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2532, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2533, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2534, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2535, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2536, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2537, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2538, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2539, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2540, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2541, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2542, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2543, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2544, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2545, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2546, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2547, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2548, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2549, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2550, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2551, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2552, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2553, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2554, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2555, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2556, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2557, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2558, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2559, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2560, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2561, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2562, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2563, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2564, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2565, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2566, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2567, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2568, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2569, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2570, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2571, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2572, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2573, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2574, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2575, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2576, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2577, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2578, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2579, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2580, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2581, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2582, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2583, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2584, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2585, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2586, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2587, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2588, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2589, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2590, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2591, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2592, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2593, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2594, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2595, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2596, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2597, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2598, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2599, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2600, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2601, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2602, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2603, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2604, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2605, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2606, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2607, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2608, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2609, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2610, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2611, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2612, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2613, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2614, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2615, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2616, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2617, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2618, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2619, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2620, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2621, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2622, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2623, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2624, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2625, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2626, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2627, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2628, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2629, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2630, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2631, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2632, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2633, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2634, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2635, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2636, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2637, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2638, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2639, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2640, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2641, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2642, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2643, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2644, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2645, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2646, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2647, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2648, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2649, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2650, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2651, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2652, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2653, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2654, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2655, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2656, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2657, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2658, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2659, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2660, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2661, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2662, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2663, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2664, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2665, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2666, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2667, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2668, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2669, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2670, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2671, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2672, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2673, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2674, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2675, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2676, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2677, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2678, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2679, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2680, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2681, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2682, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2683, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2684, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2685, N'First Origin Call  app origin value http://localhost:4200')
SET IDENTITY_INSERT [dbo].[ErrorLogging] OFF
SET IDENTITY_INSERT [dbo].[GroupMaster] ON 

INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (2, N'N/A', 2, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (4, N'N/A', 1, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (5, N'N/A', 2, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (6, N'N/A', 2, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (8, N'N/A', 2, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (9, N'N/A', 2, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (10, N'N/A', 1, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (11, N'N/A', 1, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (12, N'N/A', 1, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (13, N'N/A', 1, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (14, N'N/A', 1, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (15, N'N/A', 2, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (16, N'N/A', 1, NULL, NULL, 1)
INSERT [dbo].[GroupMaster] ([GroupId], [CreatedBy], [SupplierId], [CreateDate], [ModifyDate], [Active]) VALUES (17, N'N/A', 2, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[GroupMaster] OFF
SET IDENTITY_INSERT [dbo].[ItemMaster] ON 

INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (37, 0, 9, N'test item', N'test descriptio', 5, NULL, 20, 20, 0, 2, 200.0000, 30.0000, 5, N'undefined', NULL, 34, 1, NULL, NULL, N'D:\Images\January 312021\images111.jpg', NULL, NULL, N'D:\Images\January 312021\images111.jpg#D:\Images\January 312021\images311.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (38, 0, 10, N'meri frock', N'bahut badi frocm', 8, NULL, 10, 9, 1, 2, 300.0000, 30.0000, 7, N'undefined', NULL, 300, 1, NULL, NULL, N'D:\Images\January 312021\images611.jpg', NULL, NULL, N'D:\Images\January 312021\images611.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (39, 0, 11, N'meri frock', N'bahut badi frocm', 8, NULL, 10, 10, 0, 2, 300.0000, 30.0000, 7, N'undefined', NULL, 300, 1, NULL, NULL, N'D:\Images\January 312021\images611.jpg', NULL, NULL, N'D:\Images\January 312021\images611.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (40, 0, 12, N'test item', N'dfgdfg', 4, NULL, 30, 30, 0, 1, 20.0000, 600.0000, 7, N'undefined', NULL, 300, 1, NULL, NULL, N'D:\Images\January 312021\images6.jpg', NULL, NULL, N'D:\Images\January 312021\images6.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (41, 0, 13, N'test item', N'dfgdfg', 4, NULL, 30, 30, 0, 1, 20.0000, 600.0000, 7, N'undefined', NULL, 300, 1, NULL, NULL, N'D:\Images\January 312021\images611.jpg', NULL, NULL, N'D:\Images\January 312021\images611.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (42, 1, 14, N'test item', N'rrre', 4, NULL, 34, 34, 0, 2, 34.0000, 1200.0000, 5, N'undefined', NULL, 11, 1, NULL, NULL, N'D:\Images\January 312021\images3.jpg', NULL, NULL, N'D:\Images\January 312021\images3.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (43, 2, 15, N'dfsf', N'dsfsdf', 7, NULL, 44, 44, 0, 3, 45.0000, 0.0000, 7, N'undefined', NULL, 23, 1, NULL, NULL, N'D:\Images\January 312021\images311.jpg', NULL, NULL, N'D:\Images\January 312021\images311.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (44, 1, 16, N'rtre', N'rtet', 5, NULL, 45, 45, 0, 2, 34.0000, 45.0000, 7, NULL, NULL, 121, 1, NULL, NULL, N'D:\Images\January 312021\images611.jpg', NULL, NULL, N'D:\Images\January 312021\images611.jpg')
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [GroupId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3], [ImageSmall3]) VALUES (45, 2, 17, N'tytry', N'tryrty', 4, NULL, 76, 76, 0, 3, 565.0000, 56.0000, 5, N'yutyutt5', NULL, 787, 1, NULL, NULL, N'D:\Images\January 312021\image411.jpg', NULL, NULL, N'D:\Images\January 312021\image411.jpg')
SET IDENTITY_INSERT [dbo].[ItemMaster] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (1, 0, N'Women', N'women', NULL, N'#women', NULL, N'women', NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (2, 0, N'Men', N'men', NULL, N'#men', NULL, N'men', NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (3, 0, N'Kids', N'kid', NULL, N'#kid', NULL, N'kid', NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (4, 1, N'Leggings', NULL, N'leggings', NULL, N'#leg', NULL, N'leg', N'women/1/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (5, 1, N'Kurti', NULL, N'kurti', NULL, N'#kurti', NULL, N'kurti', N'women/1/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (6, 2, N'Trouser', NULL, N'trouser', NULL, N'#trou', NULL, N'trou', N'men/2/1', 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (7, 3, N'frocks', NULL, N'frocks', NULL, N'#froc', NULL, NULL, N'kids/3/1', 1)
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
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([StatusId], [Status]) VALUES (1, N'Live')
INSERT [dbo].[OrderStatus] ([StatusId], [Status]) VALUES (2, N'Cancel')
INSERT [dbo].[OrderStatus] ([StatusId], [Status]) VALUES (3, N'Shipped')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[OTPMaster] ON 

INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (32, N'9711352497', CAST(2900 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 0, CAST(N'2019-10-20T21:19:11.957' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (33, N'9711352497', CAST(4641 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36', 0, CAST(N'2020-01-18T17:37:51.717' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (34, N'9711352497', CAST(6903 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 1, CAST(N'2020-02-22T19:42:50.203' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (35, N'9711372497', CAST(1169 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', 1, CAST(N'2020-02-22T23:19:12.913' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (36, N'9711352497', CAST(6565 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36', 2, CAST(N'2020-06-15T14:00:52.613' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (37, N'9711352497', CAST(8101 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 3, CAST(N'2020-06-27T20:53:48.470' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (38, N'9711352497', CAST(4970 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, CAST(N'2020-06-28T09:19:46.360' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OTPMaster] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([ID], [PaymentTypeName], [Active]) VALUES (1, N'CashOnDelivery', 1)
INSERT [dbo].[PaymentMethod] ([ID], [PaymentTypeName], [Active]) VALUES (2, N'NetBanking', 1)
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
SET IDENTITY_INSERT [dbo].[PaymentStatus] ON 

INSERT [dbo].[PaymentStatus] ([ID], [Status]) VALUES (1, N'Received')
INSERT [dbo].[PaymentStatus] ([ID], [Status]) VALUES (2, N'Pending')
INSERT [dbo].[PaymentStatus] ([ID], [Status]) VALUES (3, N'Hold')
SET IDENTITY_INSERT [dbo].[PaymentStatus] OFF
SET IDENTITY_INSERT [dbo].[SizeMaster] ON 

INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (1, N'Small', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (2, N'Mediam', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (3, N'Large', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (4, N'XL', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (5, N'XXL', NULL, NULL)
SET IDENTITY_INSERT [dbo].[SizeMaster] OFF
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (1, N'Uttar Pradesh', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (2, N'Delh', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (3, N'Haryana', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (4, N'Maharashatra', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (5, N'Punjab', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (6, N'Madhya Pradesh', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (7, N'Bihar', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (9, N'Uttar Pradesh', 1, N'Kanpur', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (10, N'Uttar Pradesh', 1, N'Noida', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (11, N'Uttar Pradesh', 1, N'Lucknow', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (12, N'Uttar Pradesh', 1, N'Ghaziabad', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (13, N'Haryana', 3, N'Gurgaoon', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (14, N'Haryana', 3, N'Faridabad', 1)
SET IDENTITY_INSERT [dbo].[States] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierId], [SupFirstName], [SupMidName], [SupLastName], [SupAdd1], [SupAdd2], [SupAdd3], [City], [State], [Pin], [Active]) VALUES (1, N'Vidhimas', NULL, N'Collutions', N'367', N'sector 40', N'fist floor', N'Gurgaon', N'Haryana', N'122003', 1)
INSERT [dbo].[Suppliers] ([SupplierId], [SupFirstName], [SupMidName], [SupLastName], [SupAdd1], [SupAdd2], [SupAdd3], [City], [State], [Pin], [Active]) VALUES (2, N'Yogi', NULL, N'Supply Chain', N'125', N'Indira Nagar', N'Munshi Pulia', N'Lucknow', N'UP', N'208001', 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'eJF2N+qSVceDpudx/AHGlg==', N'kFUBCtY/xS3rmnVLQYcEfHE1QjdSpf0f0Wr9Z0BgOp4=', N'sff', N'', N'fdffds', N'adfs@gmail.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-06-27T21:04:48.120' AS DateTime), NULL, N'gurgaon', N'[object Object]', N'jfdjfdjfdjf', N'122002', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'yzCpn2+ELhLhnkSIy0XAvQ==', N'l0UQAEuOy1nxm98KfBUnTh1rNHcE2KcuQ1+CwCpvhjw=', N'abc', N'', N'xyz', N'atul.s2@gmail.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-06-28T09:23:15.960' AS DateTime), NULL, N'ggg', N'[object Object]', N'ttt', N'5678', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'qDzqILIeM0oWnDTPoEhaYA==', N'AZCnt6YBBnMZ+t7g8AeNsEFIAhkHL2/pZN/Oq60EASo=', N'Atul', N'Kumar', N'Srivastava', N'atul.s2210@gmail.com', CAST(9711352497 AS Numeric(18, 0)), CAST(99999999 AS Numeric(18, 0)), CAST(N'2019-10-20T21:25:04.777' AS DateTime), NULL, N'Gurgaon', N'Madhya Pradesh', N'House Number 367, Sector 40 Gurgaon', N'122001', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'mK5Qgc/Jp4Q5er0Qpu9gtQ==', N'LIXCgus9k8P8/6zbdteOYmgNy03zZBrcHdqjBi7qInQ=', N'atul', N'kumar', N'srivastava', N'delhi.atul@gmail.com', CAST(0 AS Numeric(18, 0)), NULL, CAST(N'2018-06-05T09:37:03.987' AS DateTime), NULL, N'11', N'1', N'house n umber 367', N'122001', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'b+Y1WTACTC8w8smXLazQ7Q==', N'v4BrJazWarx8rfhywsvYOWzB//22DPzVmwKXIpBbHIc=', N'fgdg', N'', N'fgdgd', N'dfdfs@fdffs.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-06-28T09:46:03.663' AS DateTime), NULL, N'gggg', N'[object Object]', N'dffsf', N'232323', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'dffdfdffsf', NULL, N'rerrwer', N'fsfdsf', N'dsfdsf', N'dfdsf@fsdfdsf.com', CAST(454353 AS Numeric(18, 0)), CAST(45454 AS Numeric(18, 0)), CAST(N'2018-09-30T10:13:02.067' AS DateTime), NULL, NULL, N'Madhya Pradesh', NULL, N'dfdsfds', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'jKNiL63vWA9y84FG8O0V1Q==', N'YRCG6eQMfGwO7ViNezGV7awAmtUhfAyv1w8pg+HjZeo=', N'dfdfs', N'df', N'dffsf', N'dff@gmailc,o.com', CAST(9711352497 AS Numeric(18, 0)), CAST(4545 AS Numeric(18, 0)), CAST(N'2019-04-07T19:30:43.067' AS DateTime), NULL, NULL, N'Madhya Pradesh', NULL, N'4554', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'2aA7greCN8Zv79RUud6LBA==', N'4hJHskUjWzBvpyz0uP6OaaA41WisiCDZ3im+FKgcMD4=', N'dfgdfg', N'', N'fgdfg', N'fgfdfg@dfdf.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-06-15T14:46:44.950' AS DateTime), NULL, N'ddfdfsd', N'[object Object]', N'sdfsfs', N'4545', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'zORyp5NEKdTujXaOtbj6qg==', N'B8E0/9nU13djK7EoY8pMmFvZSQnkt0bOSdTW2lqHq30=', N'gfg', N'', N'happ', N'happu@333.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-06-27T21:08:32.723' AS DateTime), NULL, N'dsfdsfsf', N'[object Object]', N'dfsfsdf', N'1212121', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'LVCv6g4ZsFZbhxG7PoX/MA==', N'93195UJyD8GG2ZMhoYboioZSwsBXoDk6ga8cNN1LSn8=', N'DFDSFDS', N'KJKJKLJ', N'LKJKLJ', N'JKLKJ@KJKLJLK.COM', CAST(711352497 AS Numeric(18, 0)), CAST(878787 AS Numeric(18, 0)), CAST(N'2019-04-07T19:13:04.380' AS DateTime), NULL, NULL, N'Madhya Pradesh', NULL, N'67676', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'tWPYvqBaDJh5HBOf1J3Z4Q==', N'O8Bsiazbq3Qitd+VzGHx309Wi+wIOanlAf41ri+YYeI=', N'kfkfkf', N'', N'kfkfkfk', N'payy@pp.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-02-22T22:14:10.997' AS DateTime), NULL, N'ffdf', N'Delhi', N'dfdfdsfds', N'45454', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'6p4dZ3yjfIBoY9CF6FNh6A==', N'Y/6oeiEXdikLD38DiSuoRYI6GIKFkCqaHF+HiZOtPyc=', N'string', N'string', N'string', N'string', CAST(9711352497 AS Numeric(18, 0)), CAST(9711352497 AS Numeric(18, 0)), CAST(N'2019-08-31T18:57:30.213' AS DateTime), NULL, N'string', N'Madhya Pradesh', N'string', N'string', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'aBPAOOCQwghtheGWZvOTsA==', N'uo2n0QQ6/utZjIcCNY4E7MbxSgtVVHzpAI5XpgMc90M=', N'fgdg', N'', N'dfgdfg', N'tem44p@temp.com', CAST(9711352497 AS Numeric(18, 0)), CAST(555555 AS Numeric(18, 0)), CAST(N'2020-06-28T09:51:06.933' AS DateTime), NULL, N'Kanpur', N'[object Object]', N'fdsffssf', N'565656', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'9199d+yESoC13yew14OJIg==', N'5Y2rC9okKjUBNtXUUvRAmPOvfm3vtipnWTOGOXH5WSY=', N'vidhi', N'', N'srivastava', N'vidhi.atul@gmail.com', CAST(9711352497 AS Numeric(18, 0)), CAST(5555 AS Numeric(18, 0)), CAST(N'2019-04-04T12:12:54.167' AS DateTime), NULL, NULL, N'Madhya Pradesh', NULL, N'121212', NULL, 1)
SET IDENTITY_INSERT [dbo].[UserSession] ON 

INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjkwZjI3NzNhLTJmZDgtNDFmMy05OTVhLTU2YTQ1NDBjZDk1NyIsImV4cCI6MTU2OTc2OTYxNCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.0-AJxgADBaPsOn4oiQ13W6NZVNGHZs3LDzpEyr-uZjU', N'delhi.atul@gmail.com', 0, CAST(N'2019-09-29T20:16:54.780' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (2, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjAxY2JjOWM4LWZkZDItNDMyMS1hNzg2LTU1NjhmYWI0NzA1ZCIsImV4cCI6MTU2OTc2OTY1MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.LRnRJ-Gplm-cbMICJ12J6VJRlB9k4eBpz0-5ZTucYtY', N'delhi.atul@gmail.com', 1, CAST(N'2019-09-29T20:17:30.760' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (3, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImM4ZTA3MTBhLTlmNzAtNGQxYS1hMzRkLTNiYzU1ODgwNDM0ZSIsImV4cCI6MTU2OTc2OTk3MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9._a0VTbhJD33_Lks93tBcLeSjJEEvoZ-ouIW05Wwlz6k', N'delhi.atul@gmail.com', 1, CAST(N'2019-09-29T20:22:52.437' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (4, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImYyZDlhMDdhLTE3NzItNDBjMC1hYjEzLTdjZDRmZTQ4OTg1ZCIsImV4cCI6MTU2OTc3MDM0MywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.oerK6QTmdKRwetydGihriZfNA8xndr9dAUnNbXeq4I8', N'delhi.atul@gmail.com', 1, CAST(N'2019-09-29T20:29:03.940' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (5, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImI4NzE1MWZjLWU4MmItNGJkMi05Nzk5LWE3YWM1MmIwYmNmOSIsImV4cCI6MTU2OTc3MDQwMSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.fzt8uBUGz_9LadM8eBNa-xYCOlHE5BRPwGOSF4q8a70', N'delhi.atul@gmail.com', 1, CAST(N'2019-09-29T20:30:01.083' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (7, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjM0MjZmNzRlLWIyYWYtNDFhOC1hYWM3LTlmYjIwMzExYmM0NCIsImV4cCI6MTU3MDAwOTgwOSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.sQfJIP5myx0VA08CB2iP061yVCAisK-Q6qTBC8p3tms', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-02T15:00:09.297' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (8, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImExN2VkZmJhLWYyMjItNDA5Mi1hZDYxLTZmZGJlMTIwODYxNCIsImV4cCI6MTU3MDAxNTIyNiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Jj3YIQsGb0TDStaay7aAQObrM6SrKI4Eff3fZxvgec4', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-02T16:30:26.513' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (9, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6Ijc1YWQ5N2YyLTIzZDYtNDI5Yi04MDYwLWM0NDk0OTE1OTMyZCIsImV4cCI6MTU3MDAxNTI2OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.qWHGHPR0uSkM3AGFl6Dh1c4X-cvNsadFcafCD4A7K-w', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-02T16:31:08.260' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (10, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImM5Nzg0Yjk2LWQ3YzAtNDQzZC1iOWNhLTQ0NDNlYjRlNDExMSIsImV4cCI6MTU3MDAyODIxNywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.rgTJhbVOHvB_3LMoteB7ywJsidkN4kU64sYei5xayaA', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-02T20:06:57.140' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (11, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImYzOWU1ZGEyLTMzNmEtNGRlMy05YjM4LTMxMDAwMTU1NWJhMSIsImV4cCI6MTU3MDExMzk3NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.5KDn4onrVS9F4ALyeITruyRhvQMtGXhYiOZTG-RwnLI', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-03T19:56:16.717' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (13, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6Ijc1MzE2OTNkLWQ1OGQtNGUxMi05ZGFmLTg2NzNkOTA2Yzc4YSIsImV4cCI6MTU3MDI4MTY4NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.gtYQpB2bCQSdAqQe-q5sSOrZne7Vjx6oH2f4ZAXZUXU', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-05T18:31:27.393' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (15, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjJlNWMzNjAyLWUxMTQtNDE1MS05Yzc2LTFmMDYyYTBjNTMyNyIsImV4cCI6MTU3MDI4MjU5NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.KiybzMnmVzxXTt2HVnXnsuMZXKT5d6jtsskGGxdAuB4', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-05T18:46:35.427' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (6, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImE0ZGJiZTljLWUyMDQtNDMxYS05NmMwLWEwNGJhZGFlNDhhMiIsImV4cCI6MTU2OTc3MjU5NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.mDrFZ5-MJ1JHgIegqJAZSaDf9qMOk4i-v3ukO_1eumg', N'delhi.atul@gmail.com', 1, CAST(N'2019-09-29T21:06:37.120' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (12, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImU1MjdlZThkLWE2OGMtNDMxMy05YWUxLWE0ZDA4YzM0ZGY4OCIsImV4cCI6MTU3MDExNTY3NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.tXdKYPn8HGoRdlfSvjxckANWGM5WQC9pFOX4795RanI', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-03T20:24:37.780' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (14, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjI2YmEwNDFjLTE3YTMtNGNlZS05ZTIzLTJjOWQxYmMwNWI1YyIsImV4cCI6MTU3MDI4MTkyOCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.FCT7bxZwHBX-Y-mnOeqtIDyML_DfLabtd03nUguYzXg', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-05T18:35:28.183' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (16, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjE5ODc2MWE3LWEzNzAtNDYzMi05YWQ5LTMyZjIzYzBkNTU4YyIsImV4cCI6MTU3MDUxNTE2MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.jD-K4AXTjXrrk6r-kFpn9s7q1_lLJEnS8wTikxAeNBI', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T11:22:40.670' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (17, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjFmZGUxY2UyLWU1YzUtNDFhNi05NGFjLTI0NzJjOGRkMmNiZSIsImV4cCI6MTU3MDUxNTg4MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Q5HsAAHuFwF80q1kzrXPnRGEgJKdPZoCvYrTIHbjbHA', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T11:34:42.133' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (18, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjUzZWMyNzBlLWUzMDYtNGE0ZS1iNzI4LTg5YzAxYjEzNzM5NCIsImV4cCI6MTU3MDUxODIyOSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.dQvJUK49fiJ6FeGjhI9hJ8I-_LQSqAgIX7ihbHKoP_w', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T12:13:49.347' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (21, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6Ijc0ODliMmYyLWNhNzQtNDg5ZS05YWRiLTQ2ZTIyODZhZWZhOSIsImV4cCI6MTU3MDUyMDA2OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.proyTiF7r34jQ76fpaL1OafOr364nDoOs4rRk_1zxtU', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T12:44:28.817' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (22, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjQ1Y2I1YjI4LTdkODctNDE0Ni05ZGFjLWM5N2NhZWZjYTI5YSIsImV4cCI6MTU3MDUyMDE2MSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.6pNFgexpjcbElP6idWK6I1MhqVppN3X9N38i5FbIER0', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T12:46:01.723' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (23, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjgxMTVlOTQ0LTJkM2EtNGNmOS04ZGI1LWRhZmUxZWFkNjI5OCIsImV4cCI6MTU3MDU0MjcxOCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.3p1sPkDoA1gmOExESSd3EYLBmuNtupodPCIF3DLcDac', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T19:01:58.370' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (24, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImMwYmI4ZDU0LTQ3MTEtNDQ0Mi05ZTlkLTA2OWRhOGQ0YmZkYSIsImV4cCI6MTU3MDk2MzEwMywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.3rLy8x9uAq-8212RSp0r1gI1sQYPaXZt3xxIIqpyuK8', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-13T15:48:23.360' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (26, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImRhZTM2ODhiLWFmZTEtNDAzMy1hYjJlLTE5MGUzNDlkYzQ2NCIsImV4cCI6MTU3MDk2ODUwNSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.mqHDPEmI7sjUFFePg13FBQ5RID6PQnG8bcCHHuyoVVU', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-13T17:18:25.837' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (27, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImZiMmI2MjQ5LTkxYzQtNDQ3OS05ZTBkLTI0ODE1MDU0YTllYiIsImV4cCI6MTU3MDk2ODcyMywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.WOtSgLeptg1LgHJPOrpD_rx_8_eHg1ZTxdE-5NvZcWM', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-13T17:22:03.417' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (19, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImRkZWNhMGZjLWViNjAtNDQ2Ny05ZWFjLTE0OTA5MzU3MDc3MyIsImV4cCI6MTU3MDUxODM3NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.QlaafsuuY2uLMp0DKuWgJfgqzp0NqxZ9XM1Snu0rSZ4', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T12:16:15.643' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (20, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjU1OGUyNjVhLTM5NGMtNGVhMS1iNWM4LWRkYjUwODZiZGM1MSIsImV4cCI6MTU3MDUxODkzMSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Hj5Q86AJksmRqDXVXoWdDKO9tzorf9ED_a1HgAFfhJQ', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-08T12:25:31.097' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (25, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImZkYWUwMWM2LWY1MjQtNGMxZS04MDgzLTBlMjYzOWE0MTVmYiIsImV4cCI6MTU3MDk2MzYxMywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Ec8yP0gY6zWmPWrN59R0jQmuE5ZZAoafePJUTKsvpKc', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-13T15:56:53.533' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (28, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdjOTk0YWQyLTU3NGQtNDJhNy1hYzE0LTExYjg4ZWViOWU4NCIsImV4cCI6MTU3MDk3MDMwMSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.EQM2ig8t1iAEWDGAAv6Jg67ZV_81yYyj3BOr2wRoQ_U', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-13T17:48:22.010' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (29, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6Ijg2YWM5MzQ2LWIxMDEtNDY2Ny04YWMzLWZiNzg5ZjlkNzNmYyIsImV4cCI6MTU3MTAzMTg0OSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.TsVl_R0u4HbROlp0zWUz30_ndGnKuV-aiHwSmutqyag', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-14T10:54:09.907' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (30, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImMzZTYyYzBmLWM1NGItNGIwMS1iMmZlLWNkY2RmODUyZTAzZiIsImV4cCI6MTU3MTA3NzUwMSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.o-0NpvShuYcqCHwM5i-2QmI4y9IJ9xsWUXDUi3xZGP0', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-14T23:35:02.057' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (31, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjkwMmVlMDU4LWNhMTEtNDU5OS1iZWU4LTQxMzhkYTdjYWEyNCIsImV4cCI6MTU3MTA3ODM3MywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.7O89rM3TZleWobeJ2mpg2yxk7nVOt_Nuohw2-YQir8I', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-14T23:49:33.490' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (32, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjM4NGI0YTc4LTgyNzEtNGQxZi05YzgzLWFkMTM1OTRlMDZiNiIsImV4cCI6MTU3MTEyMDI0OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.R86BxK2dboy-_uBMBpm29xfYvysky8vhWWmPA3bayQ4', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-15T11:27:29.053' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (33, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImJiZDQxNzFmLTg4MjQtNDgwYS04ZDgyLTZlMzRjN2RmOGIyNSIsImV4cCI6MTU3MTEyMDY5MywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.TQ4dXYGzO7cmN_AptC9bm6sjdtmCMlLzPw96T0NJ-Vg', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-15T11:34:53.447' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (34, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImRhMGVlNTk5LTI3YTgtNDFiNi1iYzFmLWNhY2E0ZTgwMmM2MSIsImV4cCI6MTU3MTU2MzEzNywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.mlV2WQRfFlZ5sBQ9T5W1C6065SyPLsDNDxEtS_pOm_I', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-20T14:29:01.360' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (35, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImNmYzdhYWIzLWM4ZmMtNDJmZi1hMjRmLTIyY2FjYWJmY2MyOSIsImV4cCI6MTU3MTU3Mjc3MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.RNt3slHYVvLIriJqQ9-DFbnyDeYiySOi98Aa-I4aIpo', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-20T17:09:30.697' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (36, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjU4ZmY1YzdmLWUxZTgtNDY1YS1hNzU0LTE2ZjNmYzU4NDUzYiIsImV4cCI6MTU3MTU3MjkwMiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.ssqpPPR7ezPr8UCd_8FWogjZC2GbGlntsUbo-BfGR9Y', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-20T17:11:45.420' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (37, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjE2YjgyZDBiLTZjOTgtNDcxMC05YjZiLTYyMzJhNzViNGI2MCIsImV4cCI6MTU3MTU3MzM5OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.h3AHfgfCaOKfLLel6n3x2TE0294Kag5UWnQ6n5u_Xic', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-20T17:19:58.130' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (38, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImUyOWJmZDAxLWEwYTYtNGVlNS1hOTAzLWM3ZDlhNWQ3Y2RjZCIsImV4cCI6MTU3MTU3Mzk4MywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9._ut5GdZ1J6xr6Q94_1caQwiV1Tz1TAeRghcBtU_9WzQ', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-20T17:29:43.050' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (39, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjI0MzA3NTU4LTkyMTctNGZiYS05NjIyLWNhOTUyN2M5N2Y1MCIsImV4cCI6MTU3MTU3NjE4MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.U74QLlqtT-gH68pyc6N8cXBEINYl0Uxp-zpZQek2hsw', N'delhi.atul@gmail.com', 1, CAST(N'2019-10-20T18:06:20.627' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (42, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6ImVkNTNjZWU4LTkyNjAtNGQyNS1iMGNjLTU3MWI1ZmJkZjJkOSIsImV4cCI6MTU3MTU4ODE0MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Exccg-dOPGb--Oz2PSop2Fg1yAyvCptHmfyagd6stO0', N'atul.s2210@gmail.com', 1, CAST(N'2019-10-20T21:25:42.127' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (43, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjEzZjMyNzZlLTQ3ODYtNDExNC1hYzNiLWM5YzVlNjg0ZDFiZCIsImV4cCI6MTU3MjY2NTY3OCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.JsJEvWF9rte8o8IlSVbY0u4wPD9ZkgVfoqontrYLYBc', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-02T08:44:38.107' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (44, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImYzZmIyMjdmLWM4ZTgtNDk4Zi1hMDg1LWY1NGUwZDdmYTNiNCIsImV4cCI6MTU3MjY2NjM1NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Ff5H68CCvtM4xhUSkaAmh8wzT13-P5SAFjXCPvwuhJw', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-02T08:55:57.633' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (45, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6IjdhNzE3MzcwLTQzMjktNGZiZS04MmMxLTdmMzFkMzIyZDQwMCIsImV4cCI6MTU3MjY2NzEyNywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.p2pvkaVR3o7fMDjTyq-SuZZ7mM_cDXm0y4nGdIglhro', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T09:08:47.130' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (46, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6IjAzY2Q4NjNiLTliNDQtNDBhOS1hMTk5LTQyYzY3ZmQ5N2YyMiIsImV4cCI6MTU3MjY2NzI1MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.5GmxTwhcjTjDLDvUas43-JXzC8uHhaoAo9PcFPL2DHE', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T09:10:52.210' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (48, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6IjQwNjllM2FjLWEzNzQtNDJiOC1iMTg3LWFjMGIyNTdiNzZmNyIsImV4cCI6MTU3MjY3Mjg0NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.WSgX4i25BfyBpzsGPCuVyL0TKvttlBMrGhXi3J3IUlQ', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T10:44:07.420' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (49, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6ImZiNzRhM2Y2LTMwMjEtNDVjZC1hYTQ1LTcyNTgwYTk1MzVkMCIsImV4cCI6MTU3MjY3Mjg5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.XKQkJCVLuJxcUrjcAnnvbnDILbAfFaocSwQ91hVocpE', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T10:44:58.737' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (50, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6IjFhNWNjY2RmLWJhZmMtNDE1NS1hMjE1LWRiZWRhYjlmZDI2NSIsImV4cCI6MTU3MjY3OTgxMCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.kQeZzvy9ShsOiej9ndflSnds33m2eC6n3c661lHVlRk', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T12:40:10.450' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (51, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6IjMzNDJiZTkxLWUxZGUtNGFjNC05Y2ZkLTdhN2RiMjllY2YyMiIsImV4cCI6MTU3MjY5MzY0NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.JCdkXvR4zPas33odOb4Q3LwsCy2044mXuDtvZlXg9s0', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T16:30:45.063' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (40, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6ImIzYjk4YjFkLWYzOWQtNDk2OC04ZTUzLTVmNWM5OTEwNTY1NSIsImV4cCI6MTU3MTU3NjU5MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.r2xUAM7VXWrwO-1fFwWg9AnwDPB9tUIdIJYMLw_qox4', N'atul.s2210@gmail.com', 1, CAST(N'2019-10-20T18:13:12.127' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (41, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6ImNjNmNkY2JjLWE3NjktNDMxNC1hN2NlLTlhMTY4OTIxZWE5NCIsImV4cCI6MTU3MTU3Njg4MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.2xp1qFWX9BQNJytekZvWSYkd3KRYOItWX7yP8x3d_0M', N'atul.s2210@gmail.com', 1, CAST(N'2019-10-20T18:18:00.337' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (53, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjYxYWI0MTA1LTZhZjMtNDBlNS05YjhjLWVmNzNjZjFlYjRhZSIsImV4cCI6MTU3MjY5NTY1MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.lGKY6l497h-cBdKhVBJ0Jgu9ufZ2WPd894fkAeONlOU', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-02T17:04:12.933' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (57, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjBlY2FlNTc4LTQyYzEtNDIxYy1hYjU3LWExZmJiOGYzMjczZCIsImV4cCI6MTU3NDQ0ODEwMiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.iDkh1FlbYEubABW1dpiLhr3lYIUvmquJx1GYJ2yD1zw', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-22T23:51:42.273' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (58, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjAzNjViZGM3LTQ4YmQtNDgwYS05MjdjLWY2MzVkMjg2ZTY5YyIsImV4cCI6MTU3NDQ1MDcxNiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.dLLEkPUoaO0UXpd8R1E87OvGliFjmCukvy7h48xanbg', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-23T00:35:16.613' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (60, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImQ2ZGE4MjZiLWU5ZGItNDI4OC05MmY2LTNjZWQ5MTRhMTI3ZCIsImV4cCI6MTU3NDUwMzc2MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.HUD04Jc-t7EA98PzcxYyefP-gDOjpS6WyEaTHv2ETPU', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-23T15:19:20.600' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (61, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjIwYzdkMGQ1LTkzM2YtNGE5Yi1hZmE0LTY0ZjE1N2NkMDFiMSIsImV4cCI6MTU3NDkxNjI5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.592bHYeSqFd-uNshOvN2bfkGl29dj5fGCjs-YvTjXkk', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-28T09:54:56.257' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (62, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjAwM2YwYzBiLWVlOGQtNDQ5Yy04N2IxLTBiYzdkZjJjYzI4NCIsImV4cCI6MTU3NTAzMjI4NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.vbaw5n08HhSqY2GSN8uK7luWqhkOZBogPXLoEM4xBB4', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-29T18:08:04.200' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1062, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImQzNWUwZDVhLTc5ZWMtNGY3Yi1iMmI1LTBmNDdkNTY4YjRmNyIsImV4cCI6MTU3NTExMjgzOCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.HEaqAGnHGvXFRKcdwUnt-alNf8W8sv6YLUpUsMTnQ_E', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-30T16:30:38.113' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1063, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjE3N2JmMTM1LTJkYWQtNGJkNC04ODljLWYwMGNiOTI4ZTIxMiIsImV4cCI6MTU3NTczNzM0MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.GMlJnvNOqnHnmErJvmjTX0z6FTnsQKd6ehSwBKtiZAE', N'delhi.atul@gmail.com', 1, CAST(N'2019-12-07T21:59:00.177' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1064, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImRjNTA3NDlmLTViMzctNDc3My04NTA2LTkyM2ZlNzUwNTZlNCIsImV4cCI6MTU3NjM5NjAzMSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.kDSp00IrHy3qzx0TYlpdA2V2wk4yvaOqnpd35BJh0B0', N'delhi.atul@gmail.com', 1, CAST(N'2019-12-15T12:57:11.203' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1066, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImViZjE2ZDAxLTRiZDMtNGMzNy04MDM4LWU0OGIzZDQ3MDNmZSIsImV4cCI6MTU3NzIwNTA1OSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.wjvZwU_HuUuuX6mOqaa3kZEAL7aWI_j1L7UKKqjScC0', N'delhi.atul@gmail.com', 1, CAST(N'2019-12-24T21:40:59.430' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (47, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6ImI2OTNkMTVlLWM2YTMtNGE5MC04NTdmLWIwNjE0NzlmYmNlOSIsImV4cCI6MTU3MjY2NzMyNSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.yqVlojTE9APYunmfY-yKBN0bVaBh4-NXVJlXp0BfLTQ', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T09:12:05.533' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (52, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6IjNlZGFlYTBhLWNjNjAtNDg1MC1iNDNiLTQxYWE2MjhhNjE1MyIsImV4cCI6MTU3MjY5NTIzNCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.EQ5PqXl7di1KvdWQu5RNRZvYnTY9SXw_9fURPgZH284', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T16:57:14.987' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (56, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6IjM4YTI2Y2MyLTgxMGQtNDc2OC1iZmYzLTZhOWEyY2Q0OGQ3MiIsImV4cCI6MTU3MjY5Nzg5NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.TXpFtPtt43hGzoxiWED62mEovMnI1D9NjmBwE-fyMpo', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T17:41:34.123' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1065, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImJmMTJmY2M3LThiZDYtNDA0Zi05MzAxLTE5YzdmNWE2NmY0NyIsImV4cCI6MTU3NjM5NzYzNiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.yViBsPDIbKjsscou6T8bML6CwXNF-7ywxvihgARni1M', N'delhi.atul@gmail.com', 1, CAST(N'2019-12-15T13:23:56.217' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1067, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImM4Y2QxZWMzLTIzYmUtNDAyYS05NmI2LTI1YzAyMjcyODVkOSIsImV4cCI6MTU3ODc1NTYyNiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.C9wFq9UmHuyYg6o41N6PL5j3e3aWKZ1dZlMY5zIBe4M', N'delhi.atul@gmail.com', 1, CAST(N'2020-01-11T20:23:46.260' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1068, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjViNzE3ODJjLTMyMzgtNDQ2Ni04NTcxLTk4YmQ2MzgxNzkwYSIsImV4cCI6MTU3ODc1NjU4NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.unizq3OdVporC9uEbFwy6HmXNCrd3uTbOsLleeO3hqo', N'delhi.atul@gmail.com', 1, CAST(N'2020-01-11T20:39:47.823' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1069, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6Ijc5YjhjNjIzLTc1M2UtNGU5Zi05MjJlLWUxMTlmODQwOThiNyIsImV4cCI6MTU3OTM1NDM5NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Ty74H99izfxrO2-d6218rhQ1VtbLyFn5O47i0DP2Xj0', N'delhi.atul@gmail.com', 1, CAST(N'2020-01-18T18:43:17.020' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1070, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImI2NzBkM2I5LTRkM2UtNDk0OS1iMTQwLTk5MzAxZGQ1MTFhOSIsImV4cCI6MTU3OTM1NTUyOSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.7XgVCHT7IMhGbk8s9I-__Uc4hhnxY4cc6HU5X10caGg', N'delhi.atul@gmail.com', 1, CAST(N'2020-01-18T19:02:09.633' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1071, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjgyZjczYTZjLTlkZDItNGEyOS05MmNmLTA4OWIzZmFiOTgxZiIsImV4cCI6MTU4MTE1NTczNywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.jektfdmQMiPUPmF3mHm0veEe54IMNyUW3UJAkFaXWQY', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-08T15:05:37.120' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1072, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjRlN2QwNDYyLWIwNDMtNDExMi1hODBjLTkwNzk1OGM4M2E2ZSIsImV4cCI6MTU4MTE4MDIyMiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.M2OjMu8hQrneuXkQ5-Qm5MLtWHxkxPTtIK6kbz78EUw', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-08T21:53:42.223' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1073, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjJlMTZlMzVmLWVlNmEtNDFlMS05M2M1LWU0MzZmYTNlYTdkNSIsImV4cCI6MTU4MTIyNzU4NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.lBx1aqM_lm7zmgBwXSi1TaZW8VdSVFisuJIsa143opM', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-09T11:03:04.783' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1074, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjJiMTgxZWI4LTlkYjgtNGUyZS05ZTU4LTljNWZiM2E5ZmYyOSIsImV4cCI6MTU4MTIyNzY0MSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.9j-J0V_fGCBvU9fPdJt4S7o95QEidx4VMfjwK_wDi8U', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-09T11:04:01.440' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (54, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6ImE1YWM0MWY0LTFmMDAtNGQ2Ny05NWFkLTQ3MjUwZWViNzA3ZiIsImV4cCI6MTU3MjY5NTg2MywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Ben0ZYOUHSTztHrC25R4omHPov_vcqiayMxDMcbIb_Y', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T17:07:43.817' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (55, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhdHVsLnMyMjEwQGdtYWlsLmNvbSIsImp0aSI6ImIzZmE1YWRjLWY0ZmEtNGNkMy1hODAwLWVkYjg4N2M1ODg5OCIsImV4cCI6MTU3MjY5NTkxNSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.y4mEGVhUI0zg6gVUOmKKN3vIVqz_5WmGIwJJvImlhTI', N'atul.s2210@gmail.com', 1, CAST(N'2019-11-02T17:08:35.940' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (59, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjUzOWU2NzZmLTc3ZDQtNDljOC04ZTVkLTRmZDRiZWRiNWJiZSIsImV4cCI6MTU3NDQ1MTQzNiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.rg7L8Fm5BxjNOCfYsHLCJavI5WLmHoqGdhTHEkWmdSY', N'delhi.atul@gmail.com', 1, CAST(N'2019-11-23T00:47:16.150' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1075, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjcxODYzYjZhLWM0MGYtNDEyMy1hYTZiLWYwMDAyNzU0NDhkZSIsImV4cCI6MTU4MTIyODI5NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.iZbu37M8aaHZJQXQWkqKXv6k07YKGZgIwO30xNa070c', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-09T11:14:57.310' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1077, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjQ1MTcwNDVmLTBhYjktNGQ2Ny1iYWIwLTY3Mjg5NGVjZDdiMCIsImV4cCI6MTU4MjM2MDQ3MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.6_DH0OHPV9xnzP-9tSvwFhVvPrjp_VLydUdFxhBnbMM', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T13:44:30.530' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1078, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjlhYmNhNmViLWU1ZTEtNDNjMi1hODNiLWZlNjNmZGRiMTc3NyIsImV4cCI6MTU4MjM2MDczMCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.rj0jlfCa3tsHSdBp9VR9kVtDfl7GnKSQnDpC16pVn2Q', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T13:48:50.780' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1079, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImFlNzNhNTQ3LWU3YmQtNDE4ZS05ZTdjLTM3NTZmYTdkODI5MiIsImV4cCI6MTU4MjM2MjUxMiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.cmLs2iqgBM9qhR566Xgu5HqFlUiJNFK-T6YsrVj5g1U', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T14:18:32.673' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1080, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjBjNGE5Zjk3LTk1NmItNDA3ZC1hMmM1LTYwZmQ1MmU5M2I0OCIsImV4cCI6MTU4MjM2NDA2OSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.-7OdX_5Vz3fHhduwMYCE7MGq9DMd713V-HzZp2mGl7w', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T14:44:29.540' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1081, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImJjODM4MDYzLWY5NzAtNDUyZi1iODRhLTIzYmRmZTU4N2M1NyIsImV4cCI6MTU4MjM2NTk0NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.YKEttqpO_D57GsM84rflQ6ngU1fgbHiD85bUEk-cm64', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T15:15:44.500' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1082, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjEwZmFhZWJkLTVjNDgtNDA5My05NGEwLTdjOGI1YWNhNmY5MyIsImV4cCI6MTU4MjM2NzkxNSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.PqB5yVTroPIGkaZeUCX6QEMKPePjGQ4zytrgSGtaFz4', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T15:48:35.673' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1083, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdlNDA4YzU0LTE3M2UtNDVlOS1iMDIzLTM4MTNjYWRhMWExYyIsImV4cCI6MTU4MjM3ODQxNywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.4K-wHcGIS0316U1hi02ivwSiDbDCFimRHrE9copvnZw', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T18:43:37.887' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1084, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjBmMzdkM2Q4LTllNWMtNGRiNy1iODExLTM0MjhmMDI4MjUwOCIsImV4cCI6MTU4MjM4MDAxOSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.K9OSxKoql6bFNXAZ86fOtqFVINu_eZsuTqIWGDBRppw', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T19:10:19.157' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1076, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImY1NzliYTc2LWNkMjYtNGYyNS04ODQ5LWVmMDczNDk4MTFkNiIsImV4cCI6MTU4MTIyODMzOCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.MKt0VqndzJByArd-OlT-dwPpRJ0bT3YIb5siTiPLF6I', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-09T11:15:38.690' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1085, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjQxOTc0ZmRkLTdjOGUtNDZjYS04NmJmLTFlYjVjZmM0ZDMxNCIsImV4cCI6MTU4MjM5NjQwMSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.IUwENMIN4v6yqW0H5AdjaHUI6GKCBVXSIc8m0AhACBI', N'delhi.atul@gmail.com', 1, CAST(N'2020-02-22T23:43:21.427' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1086, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImE1NmEwYmVjLWI5NDMtNDFlZC05NTEwLTU2MGNhMzc2NTVlOSIsImV4cCI6MTU4MzMzNDgwNCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.V_FAMbajBxj3bbcZRiviE6y3Zhme9qOWFDP8o7J5ZDc', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T20:23:24.610' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1087, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImI2NmYzNTA5LWZjYTAtNDFlNi05MzA1LTU3OTY5MTk0YTAwYyIsImV4cCI6MTU4MzMzODIyOSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.KTV5TYf8uVXkemXQIIHg2aGRJ1WY_P4BPTpiDs3bOPg', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T21:20:29.113' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1088, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjIxNGQ0OGZlLTMxYzAtNDUxZi1hMWRhLTMyNjg5ZjcyMzVkZiIsImV4cCI6MTU4MzMzODIzMywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.uVxMPEkKJOTu_9owpeRV-tmNetmVHTjUrQ0erxthB8c', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T21:20:33.127' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1089, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjJmYzdjNGIxLThiNWEtNGFkNC05MTFkLTQ0Yjk4ZjBlODBkNCIsImV4cCI6MTU4MzMzODI4NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.cwsCQxBOQ5UkXw5gGDSr-9pd5GrIdQvM02YKCs221ik', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T21:21:24.767' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1091, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjQ5ZDJiMzM5LWY2YjAtNGZlMi04MzRkLWQ3YjZkYTEzYmQxNCIsImV4cCI6MTU4MzMzODQ5MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.SakW0ez3ju3GfDfl8NesmfVgGzW9cYQjTJHzJI828qU', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T21:24:52.090' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1093, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImVlNzA3M2RiLTg3NTAtNDJkYy1hNWFiLTJkZmQ0ZGYwMzc4MSIsImV4cCI6MTU4MzM0MTE1MSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.N0W1TLFsF-O9hxg_brl6ogJlgzuOcOvW4xBygFiM6XE', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:09:11.027' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1094, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6Ijk3MjUyNWEwLWUzNmMtNGI4OS04M2NlLTM5MDM1ZjJkNjM3ZiIsImV4cCI6MTU4MzM0MTE4NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.KfeiazOk5TT2OoR64lLVGaib_t63UZB5In5wrgknP6k', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:09:46.643' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1095, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjEwMTY0MDZhLWJlM2EtNDg5MC1hODYxLTUwMTIxM2E2MzQ4MCIsImV4cCI6MTU4MzM0MTc0NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Gqt4UiaotDs9xvqzWykJpKORMNS6fxXG200pNf5stzA', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:19:05.960' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1096, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjljMDMxNjVjLTI0MjktNGMxNC04MDg0LWFlMjhmOGFlZjAzMiIsImV4cCI6MTU4MzM0MTg3NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.llzY3iIERREJcX8M0-J6TRfITSYO2_dO68aCvz6SvEU', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:21:15.363' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1099, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdlYmM4ZDE3LTBlNDAtNDRjNS04YzExLTM4ZmZhNjcyMzZmYiIsImV4cCI6MTU4MzM0MzIwMiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.w4qeiA8fCL45HX5-10kQitn4nQulox3zi2eLoCquS-g', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:43:22.793' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1090, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImY0NTlhOTc2LTAyM2UtNDllNy1hMTdhLWIxNzgwOTM5ODNmMCIsImV4cCI6MTU4MzMzODQyMCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.8RhUinbJaXDALVHpLYekrazjv4witkAYocm-k9d6PEM', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T21:23:40.640' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1092, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjQ5OGNhYTRlLTU3YWUtNDMxYS05YzE4LTRiMzVlM2IyYzkxZSIsImV4cCI6MTU4MzMzODU4NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.rFFohC5ZouWwqhIVk_C6qaprYI10SjD_gHFRjWhtVZ4', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T21:26:27.600' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1097, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjNkZjhhOThhLWQwOTktNGY3MC05ZDUzLTFlMDAzNjIzODU1NiIsImV4cCI6MTU4MzM0Mjk4NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.REWgYOWjlAiYds6OLbhnYqRTGQXvisni5XhbZvvT8hQ', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:39:45.990' AS DateTime))
GO
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1098, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjcxNjBmMWFjLTU0M2ItNGU3MS05YjZhLTZhNDE2YTQ0NGJlZCIsImV4cCI6MTU4MzM0MzA3NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.13zS6HSJXTllUeiTSgwbCGlHTBHAUI4Wem6DC8wwWxY', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:41:16.873' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1100, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImNkYzg5MWRlLWZjYzQtNDg2Yi04YmE2LWIxODczZjI2NDg2YiIsImV4cCI6MTU4MzM0MzM0MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.WTBRbuwJQywMV114rHouHX01mLl3jUGaACEExFW-4IE', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:45:40.757' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1102, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImYyZmM0MWMzLTYzZDMtNGIzNi05OTk4LWRjODg3MTRmNmQ0MiIsImV4cCI6MTU4MzM0Mzc4MywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.lE1iajMTNoZTV4IOd8so8oVll8R9jVTAosRK6kMtL7I', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:53:03.320' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1103, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdmYThhZjE1LTc0OTctNDlhZC1hYzQzLTI4YWMyOGZjM2ZjZCIsImV4cCI6MTU4MzM0NDIxOSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9._XoAbxBOKWuU4PMTNMWznxAgWQSkcMy6hwMTGJXCwF4', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T23:00:19.843' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1104, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6Ijc0N2I0OTZkLTUxMzQtNGZkZi04MjliLWUyYmU5N2I1ZTMzMCIsImV4cCI6MTU4MzM0NDI3MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.nmokODespEZJgPjJnT6l9y0mL3yevOXyvz65vrauC2s', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T23:01:10.813' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1105, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImRhMDQxMzE3LWM0MTUtNGQ2Ni1iMTJkLTQzN2M5MDQ3OGRjOCIsImV4cCI6MTU5MzMyMDIzMSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.xoilhmQP44Ww7eQ8CTQzaX3ZqAvXhCWssSaDehJGrn8', N'delhi.atul@gmail.com', 1, CAST(N'2020-06-28T10:07:11.180' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1106, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjczZDMzOWNkLThmMjEtNGI2YS1hZmNmLWJiYWU0MmRiMWQxNyIsImV4cCI6MTU5Mzg1MjUwNSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Kh8gJuAGBXPCHZGCBh-CKz2a4xsS4iLtiBZMzkF-TYw', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-04T13:58:25.900' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1107, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjFiNTM5MzNjLWFhNzUtNDA1Yi1iMTJiLWNjZTZmYzFkMzdlMyIsImV4cCI6MTU5Mzg1MjU3OSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Rk9Mg87n4hMLFyvlZnRUR2S3kWP15P8jYQ3B4HPwL_8', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-04T13:59:39.067' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1108, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImRmYzQ4YTU0LWRiM2YtNGRhZS1hZTE2LTE2MmMwMDE0OTg0MiIsImV4cCI6MTU5NTgyNzA0MywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.roIQlu0AyVN8e_LdQkTDxI6XKQ5xlUXW4o3Z13wMCAU', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-27T10:27:23.250' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1101, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjQ2ZTBlYTY3LTc0OTktNGFlNS04ZjQyLTE0YjVjNGU1Y2JkNCIsImV4cCI6MTU4MzM0MzQ1OSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Lmjc-1mHFgb9ufmjj4X70sSXjJ6o_nkM3VVTa_cnvLM', N'delhi.atul@gmail.com', 1, CAST(N'2020-03-04T22:47:39.263' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1109, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjUwYmMwOWUyLWE2MTgtNDQ4ZC05ZmRhLTRiYjQzOTI4MDcxYyIsImV4cCI6MTYwMDMzNzI0NiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.7aU6aZ0kSR17rLDy698Sv-yRlnOBGwbupGy0yTVihzA', N'delhi.atul@gmail.com', 1, CAST(N'2020-09-17T15:17:26.840' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1110, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImYzODU3MDQ5LTYwOWQtNDQ0NC04OTE0LTExZTVmNWIxMzgyYiIsImV4cCI6MTYwMDMzNzQ2MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.oWASF4-spzXEdSbDIebtvH-47UZ6EKF57FD4afeA_Ik', N'delhi.atul@gmail.com', 1, CAST(N'2020-09-17T15:21:02.937' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1111, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImI3OGRjZGZkLTI0NmUtNDUzYS1iYTI1LWE0ZTg5MGU5ZDM3OSIsImV4cCI6MTYwMjMzOTAyMywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.KowJxgLa8SH7t0U5EFQs0U8PQIgtaAv5HxfpoNy0cXA', N'delhi.atul@gmail.com', 1, CAST(N'2020-10-10T19:20:23.400' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1112, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImQ1ZjNlZjMwLTc5MzAtNGY3Mi05NDZkLTgzMDhjZTVjYjBjNiIsImV4cCI6MTYwMjMzOTYxNCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.p5S904k44IBAxes6MztcyzO1VKy_5yHVLQdfV8IAdsc', N'delhi.atul@gmail.com', 1, CAST(N'2020-10-10T19:30:14.420' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1113, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjYxYTZhM2M4LWIwYmYtNGZhZS1hMWNjLTc0ZWUyNDkxMzM4MiIsImV4cCI6MTYwOTg0ODMwOSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.3xlEcOHnh2FO7IYWWHEwbcB91pODyRsOQf8pUV-E3XE', N'delhi.atul@gmail.com', 1, CAST(N'2021-01-05T17:15:09.140' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1114, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImEyNmZkMzA2LTQ0ZDctNDg5OS1iMjcxLWIwYWQ3NTMyMjAxOSIsImV4cCI6MTYxMjAxNDIxNSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.f9smhW9huiIZQIOoY9DJWaW9HGxZQpIAxcY1YYeo9ZI', N'delhi.atul@gmail.com', 1, CAST(N'2021-01-30T18:53:35.703' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserSession] OFF
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
ALTER TABLE [dbo].[GroupMaster] ADD  CONSTRAINT [DF_GroupMaster_CreatedBy]  DEFAULT (N'NA') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[GroupMaster] ADD  CONSTRAINT [DF_GroupMaster_SupplierId]  DEFAULT ((0)) FOR [SupplierId]
GO
ALTER TABLE [dbo].[GroupMaster] ADD  CONSTRAINT [DF_GroupMaster_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[GroupMaster] ADD  CONSTRAINT [DF_GroupMaster_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ItemMaster] ADD  CONSTRAINT [DF_ItemMaster_GroupId]  DEFAULT ((0)) FOR [GroupId]
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
ALTER TABLE [dbo].[PaymentMethod] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_TotalPaymentAmount]  DEFAULT ((0)) FOR [TotalPaymentAmount]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_PrivacyAgreed]  DEFAULT ((1)) FOR [PrivacyAgreed]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  DEFAULT ((1)) FOR [PaymentMethodType]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  DEFAULT ((1)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  DEFAULT ('0000') FOR [ConsignmentNum]
GO
ALTER TABLE [dbo].[PaymentStatus] ADD  DEFAULT ('Received') FOR [Status]
GO
ALTER TABLE [dbo].[States] ADD  CONSTRAINT [DF_States_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Suppliers] ADD  CONSTRAINT [DF_Suppliers_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[UserSession] ADD  CONSTRAINT [DF_UserSession_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[UserSession] ADD  CONSTRAINT [DF_UserSession_SessionDate]  DEFAULT (getdate()) FOR [SessionDate]
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
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK__ItemMaste__Group__22401542] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupMaster] ([GroupId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK__ItemMaste__Group__22401542]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK__ItemMaste__Group__50FB042B] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupMaster] ([GroupId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK__ItemMaste__Group__50FB042B]
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
ALTER TABLE [dbo].[PaymentReceived]  WITH CHECK ADD FOREIGN KEY([OrderStatusId])
REFERENCES [dbo].[OrderStatus] ([StatusId])
GO
ALTER TABLE [dbo].[PaymentReceived]  WITH CHECK ADD FOREIGN KEY([PaymentMethodType])
REFERENCES [dbo].[PaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[PaymentReceived]  WITH CHECK ADD FOREIGN KEY([PaymentStatus])
REFERENCES [dbo].[PaymentStatus] ([ID])
GO
ALTER TABLE [dbo].[PaymentReceived]  WITH CHECK ADD FOREIGN KEY([PaymentMethodType])
REFERENCES [dbo].[PaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[PaymentReceived]  WITH CHECK ADD FOREIGN KEY([PaymentStatus])
REFERENCES [dbo].[PaymentStatus] ([ID])
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
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
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
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
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
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 2/6/2021 7:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[AddToCart] 
(
	
	@itemId int,
	@IPAddress nvarchar(max),
	@Quantity int,

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
/****** Object:  StoredProcedure [dbo].[authenticate]    Script Date: 2/6/2021 7:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[authenticate]
(
	@email nvarchar(50),
	@hash nvarchar(max)
	
)
as 

DECLARE @count int

SELECT Salt,Hash,Email,FirsName,MiddleName,LastName,Mobile,UlterNateMobile  from [User] where email = @email AND hash=@hash AND Active=1

GO
/****** Object:  StoredProcedure [dbo].[GetAllItems]    Script Date: 2/6/2021 7:51:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemDetail]    Script Date: 2/6/2021 7:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE PROCEDURE [dbo].[GetItemDetail]

(
	@itemId int
)

AS

BEGIN
	SET NOCOUNT ON;  

        SELECT	im.itemId,im.itemName,im.ItemDescripton,im.SizeId,sm.SizeName,
				im.Price,im.OfferPrice,cm.MenuName,cm.id,im.Image1,
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
