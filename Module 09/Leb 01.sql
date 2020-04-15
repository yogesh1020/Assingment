---1
alter proc Reports.GetProductColors
with exec as owner
as
begin
select distinct Color from Marketing.Product
where Color is not null
end

exec Reports.GetProductColors



alter proc Reports.GetProductsAndModels
with exec as owner
as 
begin
select pr.ProductID,pr.ProductName,pr.ProductNumber,pr.SellStartDate,pr.SellEndDate,pr.Color ,pm.ProductModelID from Marketing.Product as pr
inner join Marketing.ProductModel as pm
on pr.ProductModelID = pm.ProductModelID
end

exec Reports.GetProductsAndModels

--2

use AdventureWorks

alter proc  spGetProductsByColor
@color nvarchar(15)
as
begin 
select * from Production.Product
where (color = @color) or (Color is not null and @color is null)
order by Name
end

exec spGetProductsByColor null



