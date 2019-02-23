USE [Shopping]
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 23-02-2019 20:07:39 ******/
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
/****** Object:  StoredProcedure [dbo].[authenticate]    Script Date: 23-02-2019 20:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[authenticate]
(
	@email nvarchar(50),
	@password nvarchar(50)
)
as 

DECLARE @count int

SELECT @email as Email,FirsName,MiddleName,LastName,Mobile,UlterNateMobile  from [User] where email = @email and password = @password

GO
/****** Object:  StoredProcedure [dbo].[GetAllItems]    Script Date: 23-02-2019 20:07:39 ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemDetail]    Script Date: 23-02-2019 20:07:39 ******/
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
				im.Price,im.OfferPrice,cm.categoryName,cm.CategoryId,im.image,
				im.detailId,im.color,im.brand,im.deliverycharges,
				im.availableColor,im.AvailableQty,im.ColorId
		from ItemMaster im
			inner join SizeMaster sm on im.SizeId = sm.SizeId
			inner join CategoryMaster cm on im.CategoryId = cm.CategoryId
			inner join ColorMaster cl on cl.ColorId = im.ColorId 
			where im.ItemId=@itemId and im.active=1
	
	
				
	END





--

GO
/****** Object:  Table [dbo].[AvailableQty]    Script Date: 23-02-2019 20:07:39 ******/
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
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 23-02-2019 20:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckIn]    Script Date: 23-02-2019 20:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckIn](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[ColorMaster]    Script Date: 23-02-2019 20:07:39 ******/
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
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 23-02-2019 20:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemMaster](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
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
	[CategoryId] [int] NULL,
	[Image] [nvarchar](50) NULL,
	[Color] [nchar](10) NULL,
	[Brand] [nchar](10) NULL,
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
/****** Object:  Table [dbo].[Menu]    Script Date: 23-02-2019 20:07:39 ******/
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
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 23-02-2019 20:07:39 ******/
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
/****** Object:  Table [dbo].[SizeMaster]    Script Date: 23-02-2019 20:07:39 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 23-02-2019 20:07:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Password] [nvarchar](50) NULL,
	[FirsName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
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
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryMaster] ON 

INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CreateDate], [UpdateDate]) VALUES (1, N'Female', NULL, NULL)
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CreateDate], [UpdateDate]) VALUES (2, N'Male', NULL, NULL)
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CreateDate], [UpdateDate]) VALUES (3, N'Kids', NULL, NULL)
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CreateDate], [UpdateDate]) VALUES (4, N'Electronics', NULL, NULL)
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CreateDate], [UpdateDate]) VALUES (5, N'Furniture', NULL, NULL)
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CreateDate], [UpdateDate]) VALUES (6, N'SportsBooks', NULL, NULL)
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CreateDate], [UpdateDate]) VALUES (7, N'Grocery', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CategoryMaster] OFF
SET IDENTITY_INSERT [dbo].[CheckIn] ON 

INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9C60149F1B0 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDU2NDU1OTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.sfxUlH8NybOXVqxoA3xVI8u1oOgBJSdb4yFmXjNszMQ', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (2, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 0.0000, CAST(0x0000A9C601523FF2 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDU2NDU1OTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.sfxUlH8NybOXVqxoA3xVI8u1oOgBJSdb4yFmXjNszMQ', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (3, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9DA01596895 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDU2NDU1OTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.sfxUlH8NybOXVqxoA3xVI8u1oOgBJSdb4yFmXjNszMQ', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (4, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9DB00EEEC75 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDc5NzQ4NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.5S6MnV-JALrZ4zqxgmDUbzcbCvO2zCizp0W_QVjTbcM', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (5, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9DB0142B2C1 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDc5NzQ4NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.5S6MnV-JALrZ4zqxgmDUbzcbCvO2zCizp0W_QVjTbcM', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (6, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9DB0145B59A AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDc5NzQ4NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.5S6MnV-JALrZ4zqxgmDUbzcbCvO2zCizp0W_QVjTbcM', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (7, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9DB015DA8B0 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDc5NzQ4NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.5S6MnV-JALrZ4zqxgmDUbzcbCvO2zCizp0W_QVjTbcM', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (8, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 0.0000, CAST(0x0000A9E7016B5BF3 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NDc5NzQ4NTMsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.5S6MnV-JALrZ4zqxgmDUbzcbCvO2zCizp0W_QVjTbcM', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (9, N'127.0.0.1', 22, 1, 0, 2, 333.0000, 234.0000, 0.0000, CAST(0x0000A9FB01862A7E AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzI2OTIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.PlE5EIYoBB3dGGaHoLPVouXaL36RNmwxiZ_EoQe8-es', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (10, N'127.0.0.1', 24, 1, 0, 1, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9FB018676AA AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzI2OTIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.PlE5EIYoBB3dGGaHoLPVouXaL36RNmwxiZ_EoQe8-es', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (11, N'127.0.0.1', 28, 1, 0, 4, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9FB0186AFA6 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzI2OTIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.PlE5EIYoBB3dGGaHoLPVouXaL36RNmwxiZ_EoQe8-es', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (12, N'127.0.0.1', 28, 1, 0, 4, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9FB0186BD4E AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzI2OTIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.PlE5EIYoBB3dGGaHoLPVouXaL36RNmwxiZ_EoQe8-es', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (13, N'127.0.0.1', 28, 1, 0, 4, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9FB0186E32A AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzI2OTIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.PlE5EIYoBB3dGGaHoLPVouXaL36RNmwxiZ_EoQe8-es', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (14, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9FB01880480 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzI2OTIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.PlE5EIYoBB3dGGaHoLPVouXaL36RNmwxiZ_EoQe8-es', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (15, N'127.0.0.1', 2, 1, 0, 2, 345.0000, 444.0000, 0.0000, CAST(0x0000A9FB01883560 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzI2OTIsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.PlE5EIYoBB3dGGaHoLPVouXaL36RNmwxiZ_EoQe8-es', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (16, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9FB0189834A AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0MjQsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.dVyYzi-jkjkhMllNdKEYxSCTpjd3cc_HV9V7DJJioOY', 1)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (17, N'127.0.0.1', 2, 1, 0, 2, 345.0000, 444.0000, 0.0000, CAST(0x0000A9FB0189B320 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0NjUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9ZYgx3YOBMKnGzirzUN1b2zSMW96dGfEBefCdodYXC0', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (18, N'127.0.0.1', 2, 1, 0, 2, 345.0000, 444.0000, 0.0000, CAST(0x0000A9FB018AA3B8 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0NjUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9ZYgx3YOBMKnGzirzUN1b2zSMW96dGfEBefCdodYXC0', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (19, N'127.0.0.1', 2, 1, 0, 2, 345.0000, 444.0000, 0.0000, CAST(0x0000A9FC000F7077 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0NjUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9ZYgx3YOBMKnGzirzUN1b2zSMW96dGfEBefCdodYXC0', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (20, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 0.0000, CAST(0x0000A9FC01865F6F AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0NjUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9ZYgx3YOBMKnGzirzUN1b2zSMW96dGfEBefCdodYXC0', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (21, N'127.0.0.1', 31, 1, 0, 7, 3332.0000, 898.0000, 0.0000, CAST(0x0000A9FC01899549 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA4NTk4MzksImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.2eGByN9unB0Kj8ZvHmlqtj3994jAHddqQ5w5_LkkIdY', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (22, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 0.0000, CAST(0x0000A9FD00C93649 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0NjUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9ZYgx3YOBMKnGzirzUN1b2zSMW96dGfEBefCdodYXC0', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (23, N'127.0.0.1', 2, 1, 0, 2, 345.0000, 444.0000, 0.0000, CAST(0x0000A9FD00C97908 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0NjUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9ZYgx3YOBMKnGzirzUN1b2zSMW96dGfEBefCdodYXC0', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (24, N'127.0.0.1', 32, 1, 0, 6, 125.0000, 25.0000, 0.0000, CAST(0x0000A9FD00C9E4D6 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA3NzM0NjUsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9ZYgx3YOBMKnGzirzUN1b2zSMW96dGfEBefCdodYXC0', 0)
INSERT [dbo].[CheckIn] ([id], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (25, N'127.0.0.1', 26, 1, 0, 3, 333.0000, 234.0000, 0.0000, CAST(0x0000A9FD0147E601 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTA5MzE4OTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.HtrF9uJYFkRtIqZJMnUQqJ_2ucZkcTXtwAnJt9gwzxM', 0)
SET IDENTITY_INSERT [dbo].[CheckIn] OFF
SET IDENTITY_INSERT [dbo].[ColorMaster] ON 

INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (1, N'Red       ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (2, N'Green     ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (3, N'Blue      ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (4, N'Orange    ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (5, N'Black     ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (6, N'While     ', NULL, NULL)
INSERT [dbo].[ColorMaster] ([ColorId], [ColorName], [CreateDate], [UpdateDate]) VALUES (7, N'Yellow    ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ColorMaster] OFF
SET IDENTITY_INSERT [dbo].[ItemMaster] ON 

INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (1, N'Rayon Kurti www', N'cheap rate kurti 1', 1, N'Green;Red;Blue;', 5, 2, 3, 2, 333.0000, 234.0000, 1, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (2, N'balck Kurti la', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 0, 5, 1, 345.0000, 444.0000, 2, N'../assets/product_img/4.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (3, N'Blue kurta', N'cheap rate kurti 1', 3, N'Green;Blue;Brown', 5, 3, 2, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/2.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (4, N'Rayon Kurti', N'cheap rate kurti 1', 4, N'Blue;Red;Orance', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/3.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (5, N'Rayon Kurti www', N'cheap rate kurti 1', 5, N'Green;Red;Blue;', 5, 5, 0, 2, 333.0000, 234.0000, 1, N'../assets/product_img/4.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (6, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/5.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (7, N'Blue kurta', N'cheap rate kurti 1', 7, N'Green;Red;Blue;', 5, 0, 5, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/6.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (8, N'Rayon Kurti', N'cheap rate kurti 1', 1, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/7.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (9, N'Rayon Kurti www', N'cheap rate kurti 1', 1, N'Blue;Red;Orance', 5, 5, 0, 2, 333.0000, 234.0000, 1, N'../assets/product_img/8.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (10, N'balck Kurti la', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/9.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (11, N'Blue kurta', N'cheap rate kurti 1', 3, N'Green;Red;Blue;', 5, 5, 0, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/10.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (12, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/11.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (13, N'Rayon Kurti www', N'cheap rate kurti 1', 4, N'Green;Red;Blue;', 5, 5, 0, 2, 333.0000, 234.0000, 1, N'../assets/product_img/12.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (14, N'balck Kurti la', N'cheap rate kurti 1', 7, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/13.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (15, N'Blue kurta', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/14.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (16, N'Rayon Kurti', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 4, 1, 1, 125.0000, 25.0000, 2, N'../assets/product_img/15.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (17, N'balck Kurti la', N'cheap rate kurti 1', 4, N'Green;Blue;Brown', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (18, N'Blue kurta', N'cheap rate kurti 1', 1, N'Blue;Red;Orance', 5, 5, 0, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (19, N'Rayon Kurti', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (20, N'Blue kurta', N'cheap rate kurti 1', 4, N'Green;Red;Blue;', 5, 5, 0, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/6.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (21, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/7.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (22, N'Rayon Kurti www', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 4, 1, 2, 333.0000, 234.0000, 1, N'../assets/product_img/8.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (23, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/9.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (24, N'Blue kurta', N'cheap rate kurti 1', 1, N'Green;Red;Blue;', 5, 4, 1, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/10.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (25, N'Rayon Kurti', N'cheap rate kurti 1', 2, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/11.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (26, N'Rayon Kurti www', N'cheap rate kurti 1', 3, N'Green;Red;Blue;', 5, 4, 1, 2, 333.0000, 234.0000, 1, N'../assets/product_img/12.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (27, N'balck Kurti la', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/13.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (28, N'Blue kurta', N'cheap rate kurti 1', 4, N'Blue;Red;Orance', 5, 2, 3, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/14.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (29, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Blue;Red;Orance', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/15.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (30, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Green;Blue;Brown', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (31, N'Blue kurta', N'cheap rate kurti 1', 7, N'Blue;Red;Orance', 5, 4, 1, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [CategoryId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (32, N'Rayon Kurti', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 4, 1, 1, 125.0000, 25.0000, 2, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
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
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuMaster] ON 

INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [Status]) VALUES (1, N'Women', 1)
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [Status]) VALUES (2, N'Men', 1)
INSERT [dbo].[MenuMaster] ([MenuId], [MenuName], [Status]) VALUES (3, N'Kids', 1)
SET IDENTITY_INSERT [dbo].[MenuMaster] OFF
SET IDENTITY_INSERT [dbo].[SizeMaster] ON 

INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (1, N'Small', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (2, N'Mediam', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (3, N'Large', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (4, N'XL', NULL, NULL)
INSERT [dbo].[SizeMaster] ([SizeId], [SizeName], [CreateDate], [UpdateDate]) VALUES (5, N'XXL', NULL, NULL)
SET IDENTITY_INSERT [dbo].[SizeMaster] OFF
INSERT [dbo].[User] ([Password], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'thanks123', N'atul', N'kumar', N'srivastava', N'delhi.atul@gmail.com', CAST(9711352497 AS Numeric(18, 0)), NULL, CAST(0x0000A8F6009E7EFC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([Password], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'dffdfdffsf', N'rerrwer', N'fsfdsf', N'dsfdsf', N'dfdsf@fsdfdsf.com', CAST(454353 AS Numeric(18, 0)), CAST(45454 AS Numeric(18, 0)), CAST(0x0000A96B00A85FFC AS DateTime), NULL, NULL, NULL, NULL, N'dfdsfds', NULL, 1)
INSERT [dbo].[User] ([Password], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'dfdfdfdfdfdf', N'fgg', N'fg', N'dfg', N'fg@fdf44s.com', CAST(9711352497 AS Numeric(18, 0)), CAST(8888888888 AS Numeric(18, 0)), CAST(0x0000A9AA0104AC26 AS DateTime), NULL, NULL, NULL, NULL, N'dfdf', NULL, 1)
INSERT [dbo].[User] ([Password], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'dfdfdfdfdfdf', N'fgg', N'fg', N'dfg', N'fg@fdfs.com', CAST(9711352497 AS Numeric(18, 0)), CAST(8888888888 AS Numeric(18, 0)), CAST(0x0000A9AA0103FFF8 AS DateTime), NULL, NULL, NULL, NULL, N'dfdf', NULL, 1)
INSERT [dbo].[User] ([Password], [FirsName], [MiddleName], [LastName], [Email], [Mobile], [UlterNateMobile], [CreateDate], [LastLoginDate], [City], [State], [Address], [pin], [UpdatedBy], [Active]) VALUES (N'string', N'string', N'string', N'string', N'string', CAST(565656 AS Numeric(18, 0)), CAST(343434 AS Numeric(18, 0)), CAST(0x0000A96A013B2BE9 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, 1)
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_TotalQty]  DEFAULT ((0)) FOR [TotalQty]
GO
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_AvailableQty]  DEFAULT ((0)) FOR [AvailableQty]
GO
ALTER TABLE [dbo].[AvailableQty] ADD  CONSTRAINT [DF_AvailableQty_ReservedQty]  DEFAULT ((0)) FOR [ReservedQty]
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
REFERENCES [dbo].[CategoryMaster] ([CategoryId])
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
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryMaster] ([CategoryId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_Category]
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
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [FK_SizeMaster] FOREIGN KEY([SizeId])
REFERENCES [dbo].[SizeMaster] ([SizeId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [FK_SizeMaster]
GO
ALTER TABLE [dbo].[ItemMaster]  WITH CHECK ADD  CONSTRAINT [ItemMaster_ColorId_FK] FOREIGN KEY([ColorId])
REFERENCES [dbo].[ColorMaster] ([ColorId])
GO
ALTER TABLE [dbo].[ItemMaster] CHECK CONSTRAINT [ItemMaster_ColorId_FK]
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
