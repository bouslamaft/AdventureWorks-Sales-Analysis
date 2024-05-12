-- Dim customer
Select c.CustomerID , p.FirstName , p.LastName , p.Title ,    st.Name as TerritoryName, 
st.CountryRegionCode as CountryRegionName , st.[group] as groupGeography into Dim_Customer
from [Sales].[Customer] as c
left join [Sales].[SalesTerritory] as st 
on c.TerritoryID = st.TerritoryID 
left join [Person].[Person] as p 
on c.PersonID = p.BusinessEntityID 

-----------------------------------------------------------------------------------------

--DimProduct
select p.ProductID , p.[Name] , p.ListPrice, p.Color, pc.[name] as
CategoryName , psc.[name] as SubCategoryName , p.[Weight] , p.Size into Dim_Product 
from Production.Product as p 
left join Production.ProductSubcategory as psc
on p.ProductSubcategoryID = psc.ProductSubcategoryID
left join Production.ProductCategory as pc
on psc.ProductCategoryID = pc.ProductCategoryID 
--------------------------------------------------------------------------------------------

--DimDate
select   soh.SalesOrderID as DateID,soh.OrderDate,  DATEPART(year , soh.OrderDate)as "Year", 
DATEPART(quarter, soh.OrderDate) as "Quarter" , DATEPART(month, soh.OrderDate) as Month, 
datepart(day, soh.OrderDate) as dayOfMonth , datepart(weekday, soh.OrderDate) as DayOfWeek 
into Dim_Date
from Sales.SalesOrderHeader soh
----------------------------------------------------------------------------------------------

--DimSalesPerson 
select sp.BusinessEntityID as SalesPersonID , p.FirstName, p.LastName ,p.Title , e.Gender,
st.CountryRegionCode as CountryRegionCode, st.[Group] as 'group' into Dim_SalesPerson
from [Sales].[SalesPerson] as sp 
left join [HumanResources].[Employee] as e
on sp.BusinessEntityID = e.BusinessEntityID 
left join [Person].[Person] as p 
on e.BusinessEntityID = p.BusinessEntityID
left join [Sales].[SalesTerritory] as st 
on sp.TerritoryID = st.TerritoryID ; 
-------------------------------------------------------------------------------------------

--FactSales 
select sod.ProductID , soh.CustomerID , soh.SalesPersonID, d.OrderDate as order_date, d.DateID, soh.ShipDate,
sod.OrderQty , sod.UnitPrice , sod.UnitPriceDiscount , sod.LineTotal , p.StandardCost , (sod.UnitPrice - p.StandardCost ) as UnitProfit
,soh.OrderDate into Fact_Sales
from Sales.SalesOrderDetail as sod 
left  join Sales.SalesOrderHeader as soh 
on sod.SalesOrderID  = soh.SalesOrderID 
left join Production.Product as p 
on sod.ProductID = p.ProductID 
left join dim_date as d  
on soh.OrderDate  = d.OrderDate  and soh.SalesOrderID = d.DateID; 
