USE [Shopping]
GO
/****** Object:  Table [dbo].[AvailableQty]    Script Date: 28-07-2020 13:56:12 ******/
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
/****** Object:  Table [dbo].[CategoryMasterObselete]    Script Date: 28-07-2020 13:56:12 ******/
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
/****** Object:  Table [dbo].[CheckIn]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckIn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserEmailId] [nvarchar](50) NULL,
	[PaymentReceived] [bit] NOT NULL CONSTRAINT [DF_CheckIn_PaymentReceived]  DEFAULT ((0)),
	[UserIp] [nvarchar](max) NOT NULL,
	[itemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Checkout] [bit] NOT NULL CONSTRAINT [DF_Table_1_checkout]  DEFAULT ((0)),
	[Colorid] [int] NULL,
	[Price] [money] NOT NULL,
	[OfferPrice] [money] NOT NULL,
	[DeliveryCharges] [money] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Sales_CreateDate]  DEFAULT (getdate()),
	[UpdateDate] [datetime] NULL,
	[UserSessionId] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_CheckIn_Active]  DEFAULT ((1)),
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ColorMaster]    Script Date: 28-07-2020 13:56:12 ******/
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
/****** Object:  Table [dbo].[ErrorLogging]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogging](
	[id] [int] NOT NULL,
	[ErrorDescription] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemDescripton] [nvarchar](50) NULL,
	[ColorId] [int] NULL,
	[AvailableColor] [nvarchar](max) NULL,
	[InitialQty] [int] NULL CONSTRAINT [DF_ItemMaster_InitialQty]  DEFAULT ((0)),
	[AvailableQty] [int] NULL CONSTRAINT [DF_ItemMaster_AvailableQty]  DEFAULT ((0)),
	[ReserveQty] [int] NULL CONSTRAINT [DF_ItemMaster_ReserveQty]  DEFAULT ((0)),
	[SizeId] [int] NULL,
	[Price] [money] NULL,
	[OfferPrice] [money] NULL,
	[ChildMenuId] [int] NOT NULL,
	[Brand] [nvarchar](max) NULL,
	[detailId] [nvarchar](50) NULL,
	[DeliveryCharges] [int] NULL CONSTRAINT [DF_ItemMaster_DeliveryCharges]  DEFAULT ((0)),
	[Active] [bit] NULL CONSTRAINT [DF_ItemMaster_Active]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_ItemMaster_CreateDate]  DEFAULT (getdate()),
	[UpdateDate] [datetime] NULL,
	[Image1] [nvarchar](max) NULL,
	[Image2] [varbinary](max) NULL,
	[Image3] [varbinary](max) NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 28-07-2020 13:56:12 ******/
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
	[Status] [bit] NOT NULL CONSTRAINT [DF_SubMenu_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_SubMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 28-07-2020 13:56:12 ******/
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
/****** Object:  Table [dbo].[OTPMaster]    Script Date: 28-07-2020 13:56:12 ******/
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
	[SenderAttempt] [int] NOT NULL CONSTRAINT [DF_OTPMaster_SenderAttempt]  DEFAULT ((1)),
	[SenderDateTime] [datetime] NOT NULL CONSTRAINT [DF_OTPMaster_SenderDateTime]  DEFAULT (getdate()),
	[Active] [bit] NOT NULL CONSTRAINT [DF_OTPMaster_Active]  DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentReceived]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentReceived](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[SessionId] [nvarchar](max) NOT NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_PaymentReceived_Quantity]  DEFAULT ((0)),
	[TotalPaymentAmount] [money] NOT NULL CONSTRAINT [DF_PaymentReceived_TotalPaymentAmount]  DEFAULT ((0)),
	[TotalOfferAmount] [money] NOT NULL,
	[ReceivedFormEmailId] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[Pin] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_PaymentReceived_CreatedOn]  DEFAULT (getdate()),
	[Active] [bit] NOT NULL CONSTRAINT [DF_PaymentReceived_Active]  DEFAULT ((1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SizeMaster]    Script Date: 28-07-2020 13:56:12 ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NOT NULL,
	[ParentStateId] [int] NULL,
	[City] [nvarchar](50) NULL,
	[Active] [bit] NULL CONSTRAINT [DF_States_Active]  DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[Active] [bit] NOT NULL CONSTRAINT [DF_Suppliers_Active]  DEFAULT ((1))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[CreateDate] [datetime] NULL CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()),
	[LastLoginDate] [datetime] NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[pin] [nvarchar](50) NULL,
	[UpdatedBy] [datetime] NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_User_Active]  DEFAULT ((1)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSession]    Script Date: 28-07-2020 13:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SessionKey] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_UserSession_Active]  DEFAULT ((1)),
	[SessionDate] [datetime] NOT NULL CONSTRAINT [DF_UserSession_SessionDate]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CheckIn] ON 

INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1, NULL, 0, N'::1', 7, 1, 0, 3, 400.0000, 500.0000, 44.0000, CAST(N'2020-07-18 21:08:12.390' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImMzNmM0OWUzLWM5YzgtNGM5My1iYzIxLTJlZTFhYzA4ODNiOCIsImV4cCI6MTU5NTA4Nzg2NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Ua39FR9nAgeIqaiZbxiMDNDrznVb78PUxt2oLvGstwg', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (2, NULL, 0, N'::1', 7, 1, 0, 3, 400.0000, 500.0000, 44.0000, CAST(N'2020-07-25 11:54:54.147' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjUyZTZhNTEyLTI5Y2MtNGJhYy05MjIxLWM4MzYxOTJlOGMxMiIsImV4cCI6MTU5NTY1OTQ2OSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.-X9RHZxQwEdtPLz-u9s502_7A5QyFHC7QLhtGv2akMc', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (3, NULL, 0, N'::1', 6, 1, 0, 3, 200.0000, 160.0000, 20.0000, CAST(N'2020-07-25 12:36:23.153' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImM4ZTQ3NmEyLTgwMDgtNDcwZC1iYTg2LTdkZjA4ZjQwYWRmMCIsImV4cCI6MTU5NTY2MTk4MSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.HRESSbkkE2I8Rhb_CyZYqDEi2_dy4au8Dz1cxS-C3gM', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (4, NULL, 0, N'::1', 6, 1, 0, 3, 200.0000, 160.0000, 20.0000, CAST(N'2020-07-25 12:39:05.000' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImM4ZTQ3NmEyLTgwMDgtNDcwZC1iYTg2LTdkZjA4ZjQwYWRmMCIsImV4cCI6MTU5NTY2MTk4MSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.HRESSbkkE2I8Rhb_CyZYqDEi2_dy4au8Dz1cxS-C3gM', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (5, NULL, 0, N'::1', 6, 1, 0, 3, 200.0000, 160.0000, 20.0000, CAST(N'2020-07-25 12:45:24.053' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImM4ZTQ3NmEyLTgwMDgtNDcwZC1iYTg2LTdkZjA4ZjQwYWRmMCIsImV4cCI6MTU5NTY2MTk4MSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.HRESSbkkE2I8Rhb_CyZYqDEi2_dy4au8Dz1cxS-C3gM', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (6, NULL, 0, N'::1', 6, 1, 0, 3, 200.0000, 160.0000, 20.0000, CAST(N'2020-07-26 18:00:29.340' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdlMjhlOWExLTNhYzItNGMzOC04ZTg3LWQyMTA2MzEzMGRhMSIsImV4cCI6MTU5NTc2Nzc4NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.j2k1istX_nIX-4GTFxOwY4OHWX0bF9SSEuiefLRBbrY', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (7, NULL, 0, N'::1', 7, 1, 0, 3, 400.0000, 500.0000, 44.0000, CAST(N'2020-07-26 18:02:22.000' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdlMjhlOWExLTNhYzItNGMzOC04ZTg3LWQyMTA2MzEzMGRhMSIsImV4cCI6MTU5NTc2Nzc4NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.j2k1istX_nIX-4GTFxOwY4OHWX0bF9SSEuiefLRBbrY', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (8, NULL, 0, N'::1', 7, 1, 0, 3, 400.0000, 500.0000, 44.0000, CAST(N'2020-07-26 18:09:41.950' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImU0MTNhMTcwLTg5ODctNDUwMS04NWEyLTAwZDIyNGE4NWUyZCIsImV4cCI6MTU5NTc2ODM4MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.rJisM7sMijnsfjOX4PR6bmmqZynohVVYwjZRFLkz2Tg', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (9, NULL, 0, N'::1', 7, 1, 0, 3, 400.0000, 500.0000, 44.0000, CAST(N'2020-07-26 18:12:48.397' AS DateTime), NULL, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImU0MTNhMTcwLTg5ODctNDUwMS04NWEyLTAwZDIyNGE4NWUyZCIsImV4cCI6MTU5NTc2ODM4MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.rJisM7sMijnsfjOX4PR6bmmqZynohVVYwjZRFLkz2Tg', 1)
SET IDENTITY_INSERT [dbo].[CheckIn] OFF
SET IDENTITY_INSERT [dbo].[ColorMaster] ON 

INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (1, N'Green     ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (2, N'Red       ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (3, N'Blue      ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (4, N'Brown     ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ColorMaster] OFF
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'Object reference not set to an instance of an object.')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
GO
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
INSERT [dbo].[ErrorLogging] ([id], [ErrorDescription]) VALUES (2, N'First Origin Call  http://localhost:4200app origin value http://localhost:4200')
SET IDENTITY_INSERT [dbo].[ItemMaster] ON 

INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3]) VALUES (6, 6, N'Masoor Dal', N'Badiya Dal', 3, NULL, 12, 8, 4, 2, 200.0000, 160.0000, 7, N'Tata', NULL, 20, 1, CAST(N'2020-07-18 20:44:39.053' AS DateTime), NULL, N'assets\July 182020\Rent June 2020.JPG', NULL, NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [SupplierId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate], [Image1], [Image2], [Image3]) VALUES (7, 6, N'test item', N'nbomnn', 3, NULL, 12, 7, 5, 2, 400.0000, 500.0000, 7, N'kkyu', NULL, 44, 1, CAST(N'2020-07-18 20:47:48.067' AS DateTime), NULL, N'D:\shop\shopUI\MyShopLazyLoading\src\assets\July 182020\AZ-900 Booking.JPG', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ItemMaster] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (3, 0, N'Men', N'Men', N'Trouser', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (4, 0, N'Woman', N'Women', N'Kurti', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (5, 0, N'Grocery', N'Grocery', N'Pulse', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (6, 3, N'Trouser', N'Trouser', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (7, 3, N'Shirt', N'Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Menu] ([Id], [ParentId], [MenuName], [MainMenuName], [SubMenuName], [MainTrigger], [SubTrigger], [MainMenuId], [SubMenuId], [RouterLink], [Status]) VALUES (8, 5, N'Arhar Dal', N'Arhar Dal', NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[OTPMaster] ON 

INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (1, N'9711352497', CAST(5752 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, CAST(N'2020-07-18 20:56:20.440' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (2, N'9711352497', CAST(8607 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36', 1, CAST(N'2020-07-19 21:41:00.617' AS DateTime), 1)
INSERT [dbo].[OTPMaster] ([Id], [Mobile], [OtpNumber], [OtpText], [SenderIP], [SenderBrowser], [SenderAttempt], [SenderDateTime], [Active]) VALUES (3, N'9711352497', CAST(7080 AS Numeric(18, 0)), N'Your OTP for login to Vidhim Shopping is  ', N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36', 1, CAST(N'2020-07-25 12:28:26.940' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[OTPMaster] OFF
SET IDENTITY_INSERT [dbo].[PaymentReceived] ON 

INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [FirstName], [LastName], [MiddleName], [Address], [City], [Pin], [State], [CreatedOn], [Active]) VALUES (1, 6, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdlMjhlOWExLTNhYzItNGMzOC04ZTg3LWQyMTA2MzEzMGRhMSIsImV4cCI6MTU5NTc2Nzc4NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.j2k1istX_nIX-4GTFxOwY4OHWX0bF9SSEuiefLRBbrY', 1, 200.0000, 160.0000, N'delhi.atul@gmail.com', N'Atul Srivastava', N'Srivastava', N'', N'367, Sector 40', N'5', N'122003', N'1', CAST(N'2020-07-26 18:00:38.300' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PaymentReceived] OFF
SET IDENTITY_INSERT [dbo].[SizeMaster] ON 

INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (1, N'Medium', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (2, N'Large', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (3, N'X Large', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (4, N'XX Large', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (5, N'Small', NULL, NULL)
SET IDENTITY_INSERT [dbo].[SizeMaster] OFF
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (1, N'Haryana', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (2, N'Uttar Pradesh', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (3, N'Gujrat', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (4, N'Madhya Pradesh', 0, NULL, 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (5, N'', 1, N'Gurgaon', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (8, N'Hisar', 1, N'HIsar', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (9, N'Ghaziabad', 2, N'Ghaziabad', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (10, N'Agra', 2, N'Agra', 1)
INSERT [dbo].[States] ([StateId], [StateName], [ParentStateId], [City], [Active]) VALUES (11, N'Noida', 2, N'Noida', 1)
SET IDENTITY_INSERT [dbo].[States] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierId], [SupFirstName], [SupMidName], [SupLastName], [SupAdd1], [SupAdd2], [SupAdd3], [City], [State], [Pin], [Active]) VALUES (6, N'Vidim', NULL, N'Vidhim', NULL, NULL, NULL, N'Gurgaon', N'Haryana', N'122001', 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'/NEicVPIhJPNEgFx60T7Nw==', N'+Q8xqsXSyPswg33tqE6TOdg3pa3joWBOJHDPmUiFqHk=', N'Amit', N'Kumar', N'Sharma', N'atul.s2210@gmail.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-07-19 21:50:09.997' AS DateTime), NULL, N'9', N'2', N'First floor sector 40', N'208001', NULL, 0)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'+Sz1sXcUH+HeDcbtSULdBw==', N'7hgdflvxTOPdMEfBEupPK5g5jPctG8ASU/CF1ec26PA=', N'd', N'd', N'd', N'dd@dd.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-07-20 13:47:59.530' AS DateTime), NULL, N'10', N'2', N'hghghg', N'9999', NULL, 0)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'1Ee9CpFv/TfkgR6oyyF4Sg==', N'BkHyE2zytFgrmI6R83BjYuM+oU0jWy0Se4FAIyO4Yxw=', N'Atul Srivastava', N'', N'Srivastava', N'delhi.atul@gmail.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-07-18 21:01:45.897' AS DateTime), NULL, N'5', N'1', N'367, Sector 40', N'122003', NULL, 1)
INSERT [dbo].[User] ([Salt], [Hash], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'Yg/mJI4bOyBU41VGGE6RNA==', N'OtHjGnaPXzC9AXC95job4wn5ECXIMXD+VFIJQPL2uTo=', N'g', N'g', N'ggg', N'gg@hh.com', CAST(9711352497 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)), CAST(N'2020-07-20 13:36:40.513' AS DateTime), NULL, N'8', N'1', N'jkjkjkjk', N'6565', NULL, 0)
SET IDENTITY_INSERT [dbo].[UserSession] ON 

INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImMzNmM0OWUzLWM5YzgtNGM5My1iYzIxLTJlZTFhYzA4ODNiOCIsImV4cCI6MTU5NTA4Nzg2NywiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.Ua39FR9nAgeIqaiZbxiMDNDrznVb78PUxt2oLvGstwg', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-18 21:07:47.763' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (2, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImZiOWE1NDVmLTQ3YTEtNDE1My05ZDNiLTVhNTE1YWM5NzZiNCIsImV4cCI6MTU5NTA4Nzk5NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.ZjxVSdH3vV2mEn3XlQeOYHCDZHAkcZZoZvoraD38REs', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-18 21:09:55.530' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (3, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjUyZTZhNTEyLTI5Y2MtNGJhYy05MjIxLWM4MzYxOTJlOGMxMiIsImV4cCI6MTU5NTY1OTQ2OSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.-X9RHZxQwEdtPLz-u9s502_7A5QyFHC7QLhtGv2akMc', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-25 11:54:29.320' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (4, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImM4ZTQ3NmEyLTgwMDgtNDcwZC1iYTg2LTdkZjA4ZjQwYWRmMCIsImV4cCI6MTU5NTY2MTk4MSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.HRESSbkkE2I8Rhb_CyZYqDEi2_dy4au8Dz1cxS-C3gM', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-25 12:36:21.237' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (5, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjhmNzJmNDYyLWQ5NTAtNGRhMC1iYTgxLTFlYTllZmZlNzAxNCIsImV4cCI6MTU5NTc1MTU3MiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.tkuw0U-zvhhZhU-HOameTffFU4P03URFRKH3bCDzGK8', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-26 13:29:32.283' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (8, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6ImU0MTNhMTcwLTg5ODctNDUwMS04NWEyLTAwZDIyNGE4NWUyZCIsImV4cCI6MTU5NTc2ODM4MCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.rJisM7sMijnsfjOX4PR6bmmqZynohVVYwjZRFLkz2Tg', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-26 18:09:40.473' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (9, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjNjZjc4N2U4LTVkMTEtNGI0Ni04YmE3LTk2ODMzOGNkMGIwYyIsImV4cCI6MTU5NTc3MTMzMiwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.94srr6KlK1iZhWmodJS5Wlx433DRoLtSTM2U3wqI97U', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-26 18:58:52.013' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (6, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjM5OTJmNDBhLWQxZDEtNDgyZS05NGVkLTYwMWMxYWQzMDgyZiIsImV4cCI6MTU5NTc2Mzc4NSwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.S7-7XGenqDTERcUI10OBXrl50g0dxDCux6B1ZqgpgD0', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-26 16:53:05.427' AS DateTime))
INSERT [dbo].[UserSession] ([Id], [SessionKey], [UserId], [Active], [SessionDate]) VALUES (7, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZWxoaS5hdHVsQGdtYWlsLmNvbSIsImp0aSI6IjdlMjhlOWExLTNhYzItNGMzOC04ZTg3LWQyMTA2MzEzMGRhMSIsImV4cCI6MTU5NTc2Nzc4NCwiaXNzIjoibG93Q2FydC5jb20iLCJhdWQiOiJsb3dDYXJ0LmNvbSJ9.j2k1istX_nIX-4GTFxOwY4OHWX0bF9SSEuiefLRBbrY', N'delhi.atul@gmail.com', 1, CAST(N'2020-07-26 17:59:44.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserSession] OFF
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_TotalQty]  DEFAULT ((0)) FOR [TotalQty]
GO
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_AvailableQty]  DEFAULT ((0)) FOR [AvailableQty]
GO
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_ReservedQty]  DEFAULT ((0)) FOR [ReservedQty]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  CONSTRAINT [DF_MenuMaster_Status]  DEFAULT ((1)) FOR [Status]
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
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
ALTER TABLE [dbo].[SizeMaster]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 28-07-2020 13:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[authenticate]    Script Date: 28-07-2020 13:56:12 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllItems]    Script Date: 28-07-2020 13:56:12 ******/
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
