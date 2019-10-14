USE [Shopping]
GO
/****** Object:  Table [dbo].[AvailableQty]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[CategoryMasterObselete]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[CheckIn]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[ColorMaster]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[ErrorLogging]    Script Date: 10/14/2019 11:56:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogging](
	[id] [int] NOT NULL,
	[ErrorDescription] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 10/14/2019 11:56:36 AM ******/
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
	[Brand] [nvarchar](max) NULL,
	[detailId] [nvarchar](50) NULL,
	[DeliveryCharges] [int] NULL,
	[Active] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Image1] [varbinary](max) NULL,
	[Image2] [varbinary](max) NULL,
	[Image3] [varbinary](max) NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[OTPMaster]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[PaymentReceived]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[SizeMaster]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  Table [dbo].[UserSession]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[authenticate]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllItems]    Script Date: 10/14/2019 11:56:36 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetItemDetail]    Script Date: 10/14/2019 11:56:36 AM ******/
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
