alter proc Marketing.GetAvailableModelsAsXML
as 
begin
select p.ProductID,p.ProductName,p.ListPrice,p.Color,p.SellStartDate ,pm.ProductModelID,pm.ProductModel from Marketing.Product as p
join Marketing.ProductModel pm
on p.ProductModelID =pm.ProductModelID
order by p.SellStartDate ,p.ProductName asc
for xml Raw('AvailableModel') , elements , root('AvailableModels')
end

exec Marketing.GetAvailableModelsAsXML


create proc sales.UpdateSalesTerritoriesByXML
@SalespersonMods xml	
as
begin
	update Sales.SalesPerson set TerritoryID = @SalespersonMods  where BusinessEntityID = 1
	for xml auto

end

