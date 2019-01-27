use AdventureWorks

select * from sales.SalesOrderHeader
select * from sales.SalesOrderDetail
select * from sales.Customer

--z³¹czenie tabel (wszystkie kolumny)
select * 
from Sales.SalesOrderHeader 
join Sales.SalesOrderDetail on Sales.SalesOrderHeader.SalesOrderID = Sales.SalesOrderDetail.SalesOrderID

--korzystanie z etykiet
select * 
from Sales.SalesOrderHeader as soh
join Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID

--z sortowaniem
select * 
from Sales.SalesOrderHeader as soh
join Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID
order by soh.SalesOrderID, sod.SalesOrderDetailID

--ograniczenie wybierania konkretnych kolumn + etykiety
select soh.SalesOrderID as NumerZamowienia, sod.SalesOrderDetailID as NumerSzczegolowZamowienia
from Sales.SalesOrderHeader as soh
join Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID
order by soh.SalesOrderID, sod.SalesOrderDetailID

--z³¹czenie wielu tabel
select soh.SalesOrderID as NumerZamowienia, sod.SalesOrderDetailID as NumerSzczegolowZamowienia, sc.CustomerID as NumerKlienta
from Sales.SalesOrderHeader as soh
join Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID
join sales.Customer as sc on soh.CustomerID = sc.CustomerID
order by soh.SalesOrderID, sod.SalesOrderDetailID, NumerKlienta


--przyk³ad - z³¹czenie dwóch tabel
select sc.CustomerID as NumerKlienta, soh.SalesOrderID as NumerZamowienia from
sales.Customer as sc
join sales.SalesOrderHeader as soh on sc.CustomerID=soh.CustomerID

--left join
select sc.CustomerID as NumerKlienta, soh.SalesOrderID as NumerZamowienia from
sales.Customer as sc
left join sales.SalesOrderHeader as soh 
on sc.CustomerID=soh.CustomerID
where soh.SalesOrderID is null

--subquery
select * from sales.Customer
select distinct CustomerID from Sales.SalesOrderHeader --bez powtórzeñ

select CustomerID as NumerKlienta, AccountNumber as NumerKontaKlienta
 from sales.Customer
 where CustomerID in (
 select distinct CustomerID 
 from Sales.SalesOrderHeader
 )


 SELECT * FROM Person.Contact
 use arzieba
 SELECT * FROM Forum.Topics

 use AdventureWorks
 select * from Person.Contact
 select top 10 * from Person.Contact where LastName='Anderson' 
 select * from HumanResources.Employee
 select distinct Title from HumanResources.Employee;

 select CustomerID, count(*) as Cnt from sales.SalesOrderHeader group by CustomerID order by Cnt desc

 select * from sales.SalesOrderDetail
 select * from sales.SalesOrderHeader
 select * from sales.Customer