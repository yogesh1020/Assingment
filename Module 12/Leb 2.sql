USE InternetSales
GO

use InternetSales EXEC sp_changedbowner 'sa'

CREATE PROCEDURE dbo.AddItemToCart
	@SessionID INT, 
@TimeAdded DATETIME, 
@CustomerKey INT, 
@ProductKey INT, 
@Quantity INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	INSERT INTO dbo.ShoppingCart 
	(
	SessionID, 
	TimeAdded, 
	CustomerKey, 
	ProductKey, 
	Quantity
	)
	VALUES 
	(
	@SessionID, 
	@TimeAdded, 
	@CustomerKey, 
	@ProductKey, 
	@Quantity
	)
END
GO


CREATE PROCEDURE dbo.DeleteItemFromCart
	@SessionID INT, 
	@ProductKey INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	DELETE FROM dbo.ShoppingCart   
	WHERE SessionID = @SessionID  
	AND ProductKey = @ProductKey
END
GO


CREATE PROCEDURE dbo.EmptyCart
	@SessionID INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	DELETE FROM dbo.ShoppingCart   WHERE SessionID = @SessionID
END
GO

declare @time datetime = getdate()
exec dbo.AddItemToCart 1,@time,2,3,1
exec dbo.AddItemToCart 1,@time,2,4,1
exec dbo.AddItemToCart 3,@time,2,3,1
exec dbo.AddItemToCart 3,@time,2,4,1

exec dbo.DeleteItemFromCart 1,3

exec dbo.DeleteItemFromCart 1,4

exec dbo.EmptyCart 3