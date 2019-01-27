select COUNT(*) as counter from Sales.SalesOrderHeader
select * from Sales.SalesOrderHeader
select SUM(TotalDue) from Sales.SalesOrderHeader where year(OrderDate) =2001
select SUM(TotalDue) from Sales.SalesOrderHeader where year(OrderDate) =2001 and CustomerID=442

