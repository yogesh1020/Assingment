CREATE VIEW Sales.vOrders
   WITH SCHEMABINDING
   AS  
      SELECT SUM(UnitPrice*OrderQty*(1.00-UnitPriceDiscount)) AS Revenue,
         OrderDate, ProductID, COUNT_BIG(*) AS COUNT
      FROM Sales.SalesOrderDetail AS od, Sales.SalesOrderHeader AS o
      WHERE od.SalesOrderID = o.SalesOrderID
      GROUP BY OrderDate, ProductID;
	  go
	  create nonclustered index ix_OrderDetails
	  on Sales.SalesOrderDetail(SalesOrderID)


	  select * from Sales.vOrders

--	---------
	  ALTER DATABASE AdventureWorks2016
	SET QUERY_STORE CLEAR;

	----------------------

	SELECT C.Name AS 'ProductCategory', S.Name AS 'ProductSubcategory', P.ProductNumber, P.Name AS 'ProductName'
	FROM Production.ProductCategory AS C
		INNER JOIN Production.ProductSubcategory AS S
			ON S.ProductCategoryID = C.ProductCategoryID
		INNER JOIN Production.Product AS P
			ON P.ProductSubcategoryID = S.ProductSubcategoryID

-------------------

UPDATE STATISTICS sales.salesorderdetail
	WITH ROWCOUNT = 60000000, PAGECOUNT = 10000000;

