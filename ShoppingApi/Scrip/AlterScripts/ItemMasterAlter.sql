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


