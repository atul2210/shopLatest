USE [Shopping]
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 13-03-2019 11:04:32 ******/
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
/****** Object:  StoredProcedure [dbo].[authenticate]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllItems]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemDetail]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[AvailableQty]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[CategoryMasterObselete]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[CheckIn]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[ColorMaster]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 13-03-2019 11:04:33 ******/
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
	[ChildMenuId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Menu]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[PaymentReceived]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[SizeMaster]    Script Date: 13-03-2019 11:04:33 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 13-03-2019 11:04:33 ******/
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
SET ANSI_PADDING OFF
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

INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (1, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0B01059D77 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxMjcwMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.3-sDSvqZxWyRNt14AihbFd3RPg4f_1BhMsGzuZ4Wpak', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (2, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0B010740DF AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxMjcwMTAsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.3-sDSvqZxWyRNt14AihbFd3RPg4f_1BhMsGzuZ4Wpak', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (3, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0B01572D62 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNDQ4MjcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NuFao5A_goQtErvVBt4qx_4DfP_COTbuXsCOcC-mntI', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (4, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0B015C5001 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNDQ4MjcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.NuFao5A_goQtErvVBt4qx_4DfP_COTbuXsCOcC-mntI', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (5, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0B01720A46 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (6, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0B017217DC AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (7, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0B0174A79A AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (8, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0B0174C36C AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (9, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0B017F61DF AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (10, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0C00AE58CE AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxOTQzNDYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.iutgoUtD3YfMNi3cyVuTt_3QD2_Q_bvnSFAIccVQ4fU', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (11, NULL, 0, N'127.0.0.1', 3, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0C00BC1AE6 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (12, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0C00BD1F56 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxOTQzNDYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.iutgoUtD3YfMNi3cyVuTt_3QD2_Q_bvnSFAIccVQ4fU', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (13, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0C00BDC8FB AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (14, NULL, 0, N'127.0.0.1', 7, 1, 0, 7, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0C00BF08BD AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (15, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0C00BF1BBB AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (16, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0C0126F60A AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (17, NULL, 0, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0C01270C9C AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (18, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0C013D8B18 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (19, NULL, 0, N'127.0.0.1', 16, 1, 0, 3, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0C013D935A AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (20, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00AB96FB AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (21, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00ABA252 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (22, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00B09ED3 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (23, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00B21526 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (24, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00BC10C0 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIxNTA2OTYsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.yp9N6bkyDuWdBNbtZj96xO9FzhyispqYY6BfXBHdHpk', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (25, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00BFED80 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzA5ODcsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.L2F_QhP7x2HM9Kvf0-3nkuQHjJiRLGQSJO0OHTDUFLo', 1)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (26, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00C04CE3 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (27, NULL, 0, N'127.0.0.1', 4, 1, 0, 4, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00CB642D AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (28, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0E00CB7B06 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (29, NULL, 0, N'127.0.0.1', 9, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00CF2592 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (30, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(0x0000AA0E00D17499 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (31, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(0x0000AA0E00D306F7 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (32, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(0x0000AA0E00D36ACB AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (33, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(0x0000AA0E00D5489E AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (34, NULL, 0, N'127.0.0.1', 10, 1, 0, 2, 345.0000, 444.0000, 50.0000, CAST(0x0000AA0E00D7B759 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (35, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0E00D7C533 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (36, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0E00DAC213 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (37, NULL, 0, N'127.0.0.1', 11, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0E00DAD1EB AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (38, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00DAFC8E AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (39, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00DB0962 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (40, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00DB1544 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (41, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00DB40C0 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (42, NULL, 0, N'127.0.0.1', 1, 1, 0, 1, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00DB530B AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (43, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00DC2467 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (44, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00DD85F1 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (45, NULL, 0, N'127.0.0.1', 12, 1, 0, 5, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0E00DDB236 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (46, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00DDDFD3 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (47, NULL, 0, N'127.0.0.1', 15, 1, 0, 3, 3332.0000, 898.0000, 50.0000, CAST(0x0000AA0E00DDF0D4 AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (48, NULL, 0, N'127.0.0.1', 22, 1, 0, 2, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0E00DF502D AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (49, NULL, 0, N'127.0.0.1', 13, 1, 0, 4, 333.0000, 234.0000, 50.0000, CAST(0x0000AA0F00AFF4EA AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
INSERT [dbo].[CheckIn] ([id], [UserEmailId], [PaymentReceived], [UserIp], [itemId], [Quantity], [Checkout], [Colorid], [Price], [OfferPrice], [DeliveryCharges], [CreateDate], [UpdateDate], [UserSessionId], [Active]) VALUES (50, NULL, 0, N'127.0.0.1', 8, 1, 0, 1, 125.0000, 25.0000, 50.0000, CAST(0x0000AA0F00B276BD AS DateTime), NULL, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 0)
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

INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (1, N'Rayon Kurti www', N'cheap rate Legging', 1, N'Green;Red;Blue;', 5, 0, 5, 2, 333.0000, 234.0000, 4, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (2, N'balck Kurti la', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 0, 5, 1, 345.0000, 444.0000, 4, N'../assets/product_img/4.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (3, N'Blue kurta', N'cheap rate kurti 1', 3, N'Green;Blue;Brown', 5, 0, 5, 1, 3332.0000, 898.0000, 4, N'../assets/product_img/2.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (4, N'Rayon Kurti', N'cheap rate kurti 1', 4, N'Blue;Red;Orance', 5, 0, 5, 1, 125.0000, 25.0000, 4, N'../assets/product_img/3.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (5, N'Rayon Kurti www', N'Popo', 5, N'Green;Red;Blue;', 5, 0, 1, 2, 333.0000, 234.0000, 4, N'../assets/product_img/4.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (6, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 0, 1, 1, 345.0000, 444.0000, 4, N'../assets/product_img/5.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (7, N'Blue kurta', N'cheap rate kurti 1', 7, N'Green;Red;Blue;', 5, 0, 5, 1, 3332.0000, 898.0000, 4, N'../assets/product_img/6.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (8, N'Rayon Kurti', N'cheap rate kurti 1', 1, N'Green;Blue;Brown', 5, 1, 4, 1, 125.0000, 25.0000, 4, N'../assets/product_img/7.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (9, N'Rayon Kurti www', N'cheap rate kurti 1', 1, N'Blue;Red;Orance', 5, 0, 5, 2, 333.0000, 234.0000, 4, N'../assets/product_img/8.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (10, N'balck Kurti la', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 0, 5, 1, 345.0000, 444.0000, 6, N'../assets/product_img/9.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (11, N'Blue kurta', N'cheap rate kurti 1', 3, N'Green;Red;Blue;', 5, 0, 5, 1, 3332.0000, 898.0000, 6, N'../assets/product_img/10.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (12, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Green;Blue;Brown', 5, 0, 5, 1, 125.0000, 25.0000, 6, N'../assets/product_img/11.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (13, N'Rayon Kurti www', N'cheap rate kurti 1', 4, N'Green;Red;Blue;', 5, 3, 2, 2, 333.0000, 234.0000, 7, N'../assets/product_img/12.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (14, N'balck Kurti la', N'cheap rate kurti 1', 7, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 7, N'../assets/product_img/13.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (15, N'Blue kurta', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 3332.0000, 898.0000, 7, N'../assets/product_img/14.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (16, N'Rayon Kurti', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 3, 2, 1, 125.0000, 25.0000, 10, N'../assets/product_img/15.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (17, N'balck Kurti la', N'cheap rate kurti 1', 4, N'Green;Blue;Brown', 5, 5, 0, 1, 345.0000, 444.0000, 13, N'../assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (18, N'Blue kurta', N'cheap rate kurti 1', 1, N'Blue;Red;Orance', 5, 5, 0, 1, 3332.0000, 898.0000, 10, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (19, N'Rayon Kurti', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 125.0000, 25.0000, 13, N'../assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (20, N'Blue kurta', N'cheap rate kurti 1', 4, N'Green;Red;Blue;', 5, 5, 0, 1, 3332.0000, 898.0000, 5, N'../assets/product_img/6.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (21, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 5, N'../assets/product_img/7.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (22, N'Rayon Kurti www', N'cheap rate kurti 1', 2, N'Blue;Red;Orance', 5, 4, 1, 2, 333.0000, 234.0000, 5, N'../assets/product_img/8.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (23, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 5, N'../assets/product_img/9.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (24, N'Blue kurta', N'cheap rate kurti 1', 1, N'Green;Red;Blue;', 5, 4, 0, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/10.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (25, N'Rayon Kurti', N'cheap rate kurti 1', 2, N'Green;Blue;Brown', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/11.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (26, N'Rayon Kurti www', N'cheap rate kurti 1', 3, N'Green;Red;Blue;', 5, 4, 0, 2, 333.0000, 234.0000, 1, N'../assets/product_img/12.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B00161A6EC AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (27, N'balck Kurti la', N'cheap rate kurti 1', 3, N'Blue;Red;Orance', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/13.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (28, N'Blue kurta', N'cheap rate kurti 1', 4, N'Blue;Red;Orance', 5, 2, 0, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/14.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (29, N'Rayon Kurti', N'cheap rate kurti 1', 5, N'Blue;Red;Orance', 5, 5, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/15.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (30, N'balck Kurti la', N'cheap rate kurti 1', 6, N'Green;Blue;Brown', 5, 5, 0, 1, 345.0000, 444.0000, 2, N'../assets/product_img/16.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (31, N'Blue kurta', N'cheap rate kurti 1', 7, N'Blue;Red;Orance', 5, 4, 0, 1, 3332.0000, 898.0000, 1, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
INSERT [dbo].[ItemMaster] ([ItemId], [ItemName], [ItemDescripton], [ColorId], [AvailableColor], [InitialQty], [AvailableQty], [ReserveQty], [SizeId], [Price], [OfferPrice], [ChildMenuId], [Image], [Color], [Brand], [detailId], [DeliveryCharges], [Active], [CreateDate], [UpdateDate]) VALUES (32, N'Rayon Kurti', N'cheap rate kurti 1', 6, N'Blue;Red;Orance', 5, 4, 0, 1, 125.0000, 25.0000, 2, N'../assets/product_img/1.jpg', N'red       ', N'Ruby      ', NULL, 50, 1, CAST(0x0000A8B001623FD8 AS DateTime), NULL)
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
SET IDENTITY_INSERT [dbo].[PaymentReceived] ON 

INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (1, 8, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(0x0000AA0E00CB9A80 AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (2, 4, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(0x0000AA0E00CB9A88 AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (3, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(0x0000AA0E00CB9A89 AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (4, 8, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(0x0000AA0E00CDDB3E AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (5, 4, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 125.0000, 25.0000, N'delhi.atul@gmail.com', CAST(0x0000AA0E00CDDB3E AS DateTime), 1)
INSERT [dbo].[PaymentReceived] ([PaymentId], [ItemId], [SessionId], [Quantity], [TotalPaymentAmount], [TotalOfferAmount], [ReceivedFormEmailId], [CreatedOn], [Active]) VALUES (6, 11, N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWFhYWEiLCJleHAiOjE1NTIzNzEwNjgsImlzcyI6Imxvd0NhcnQuY29tIiwiYXVkIjoibG93Q2FydC5jb20ifQ.9o2lK_uY9soVJGZY_TiXZRZoNRxCUD5dZSTf0x90oFI', 1, 3332.0000, 898.0000, N'delhi.atul@gmail.com', CAST(0x0000AA0E00CDDB3E AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[PaymentReceived] OFF
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
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_TotalPaymentAmount]  DEFAULT ((0)) FOR [TotalPaymentAmount]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[PaymentReceived] ADD  CONSTRAINT [DF_PaymentReceived_Active]  DEFAULT ((1)) FOR [Active]
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
