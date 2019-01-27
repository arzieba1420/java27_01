use AdventureWorks

-- polecenie 4
select * from sales.SalesOrderHeader
select year(OrderDate) as RokZamowienia, sum(TotalDue) as SumaOplat from sales.SalesOrderHeader group by year(OrderDate) order by RokZamowienia

--polecenie 5
select CustomerID as KlientID, sum(TotalDue) as SumaOplat from sales.SalesOrderHeader where year(OrderDate)=2002 group by CustomerID order by KlientID

--polecenie 6
select CustomerID as KlientID, sum(TotalDue) as SumaOplat from sales.SalesOrderHeader where OrderDate between '20030501' and '20030506' group by CustomerID order by KlientID

--polecenie 7
select CustomerID as KlientID, sum(TotalDue) as SumaOplat from sales.SalesOrderHeader where OrderDate between '20030501' and '20030506' group by CustomerID having sum(TotalDue)>40000 order by SumaOplat

--polecenie 8
select * from Production.Product
select * from Production.ProductSubcategory

select * from
Production.Product as pp
join Production.ProductSubcategory as pps on pp.ProductID = pps.ProductCategoryID

-- polecenie 9
select pp.ProductID, pp.Name, pp.Color, pps.Name as ProductSubcategoryName from
Production.Product as pp
join Production.ProductSubcategory as pps on pp.ProductID = pps.ProductCategoryID

--polecenie 10
select pps.Name as ProductSubcategoryName ,pp.ProductID, pp.Name, pp.Color  from
Production.Product as pp
join Production.ProductSubcategory as pps on pp.ProductID = pps.ProductCategoryID
order by ProductSubcategoryName, Name

--polecenie 11

select * from Production.ProductCategory


select ppc.Name as CategoryName, pps.Name as ProductSubcategoryName ,pp.ProductID, pp.Name, pp.Color  from
Production.Product as pp
join Production.ProductSubcategory as pps on pp.ProductID = pps.ProductCategoryID
join Production.ProductCategory as ppc on pp.ProductID = ppc.ProductCategoryID
order by ProductSubcategoryName

