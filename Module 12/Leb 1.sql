

CREATE TABLE dbo.ShoppingCart
(SessionID INT NOT NULL,
TimeAdded DATETIME NOT NULL,
CustomerKey INT NOT NULL,
ProductKey INT NOT NULL,
Quantity INT NOT NULL
PRIMARY KEY NONCLUSTERED (SessionID, ProductKey)) 
WITH  (MEMORY_OPTIMIZED = ON,  DURABILITY = SCHEMA_AND_DATA);

declare @time datetime = getdate() 
insert into dbo.ShoppingCart values(1,@time ,2,3,1) ,(1,@time,2,4,1)

select * from dbo.ShoppingCart