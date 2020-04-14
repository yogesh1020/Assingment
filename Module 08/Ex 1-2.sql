--1
CREATE VIEW
Production.OnlineProducts
AS
SELECT p.ProductID, p.Name, p.ProductNumber , p.Color  AS Color,
CASE p.DaysToManufacture
WHEN 0 THEN 'In stock' 
WHEN 1 THEN 'Overnight'
WHEN 2 THEN '2 to 3 days delivery'
ELSE 'Call us for a quote'
END AS Availability,
p.Size, p.SizeUnitMeasureCode , p.ListPrice AS Price, p.Weight
FROM Production.Product AS p
WHERE p.SellEndDate IS NULL AND p.SellStartDate IS NOT NULL;
GO




CREATE VIEW
Production.AvailableModels
AS
SELECT p.ProductID , p.Name, pm.ProductModelID , pm.Name as Product_Model
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm
ON p.ProductModelID = pm.ProductModelID
WHERE p.SellEndDate IS NULL
AND p.SellStartDate IS NOT NULL;
GO

select * from Production.OnlineProducts

select  * from Production.AvailableModels

--2
alter view person.details
as
select PersonType , FirstName ,LastName from Person.Person

insert into Person.details values('SC' ,'Yogesh','Bhojani')