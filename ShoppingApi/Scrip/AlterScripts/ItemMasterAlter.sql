ALTER  TABLE ItemMaster 
	ADD image1 varbinary(max),
	image2 varbinary(max),
	image3 varbinary(max)


	
---delete coloumn image and color from itemmaster
ALTER TABLE  ItemMaster DROP COLUMN  [image]
ALTER TABLE itemmaster DROP COLUMN  color

	---sample script for insert/update image
	
INSERT INTO itemmaster()
SELECT * FROM OPENROWSET(
  BULK N'C:\T-SQL-Enhancements-in-SQL-Server-2008.jpg', SINGLE_BLOB
) rs




 update itemmaster set image1= 
(SELECT  * FROM 
OPENROWSET(BULK N'D:\Personal\Photoes\DSC02548.JPG', SINGLE_BLOB)rs) where ItemId=40


--9th Augusr 2020

CREATE TABLE [dbo].[GroupMaster](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL CONSTRAINT [DF_GroupMaster_CreatedBy]  DEFAULT (N'NA'),
	[SupplierId] [int] NOT NULL CONSTRAINT [DF_GroupMaster_SupplierId]  DEFAULT ((0)),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_GroupMaster_CreateDate]  DEFAULT (getdate()),
	[ModifyDate] [datetime] NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_GroupMaster_Active]  DEFAULT ((1)),
 CONSTRAINT [PK_GroupMaster] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

alter table ItemMaster 
  ADD FOREIGN KEY (GroupId) REFERENCES GroupMaster(GroupId)  



  Go
create table PaymentMethod
(
	ID int primary key IDENTITY(1,1) NOT NULL,
	PaymentTypeName nvarchar(50),
	Active bit not null default 1


)

Go
insert into PaymentMethod (PaymentTypeName)
values('CashOnDelivery'),
( 'NetBanking')


Go

create table PaymentStatus 
(
	ID int primary key identity(1,1) not null,
	[Status] nvarchar(50) not null default 'Received'

)

Go


insert into PaymentStatus ([Status])
values('Received'),
('Pending'),
('Hold')


Go
alter table PaymentReceived
add PaymentMethodType int not null  default 1,
PaymentStatus int not null  default 1
foreign key (PaymentMethodType) references paymentmethod(ID),
 foreign  key (PaymentStatus) references PaymentStatus(ID) 



 GO

alter table PaymentReceived 
add ConsignmentNum nvarchar(max)
not null default '0000'

GO
  ALTER table ERRORLOGGING

 ADD  
 CONSTRAINT PK_ErorLogger_ID PRIMARY KEY CLUSTERED (ID)

 --NEED TO ADD IDENTITY CONSTRAINT MANUALLY IN THE TABLE

