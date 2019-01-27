--liczenie wierszy
select * from Person.Contact
select COUNT(*) as counter from Person.Contact where Title = 'Mr.' 

--kto zosta³ ostatnio dopisany
select max(contactID) as MaxContactID from Person.Contact
select min(contactID) as MinContactID from Person.Contact

--kiedy modyfikowany
select min(ModifiedDate) as MinModDate from Person.Contact
select max(ModifiedDate) as MaxModDate from Person.Contact

--najd³u¿szy czas dostawy (ró¿nica dat) + sortowanie + maksymalna wartoœæ
select * from Sales.SalesOrderHeader
select DATEDIFF(day, OrderDate,ShipDate) as NumberOfDays from Sales.SalesOrderHeader order by NumberOfDays desc
select Max(DATEDIFF(day, OrderDate,ShipDate)) as NumberOfDays from Sales.SalesOrderHeader 

--nulle w funkcjach  funkcje agreguj¹ce (funkcje nie bior¹ pod uwagê p[ustychn  kolumn)
select * from Sales.SpecialOffer where MaxQty is not null
select * from Sales.SpecialOffer where MaxQty is  null

--suma i œrednia z kolumn
select sum(MaxQty) from Sales.SpecialOffer
select avg(MaxQty) from sales.SpecialOffer

--gdy chcemy uwzgledniæ nulle w obliczeniach ISNULL zamienia nulle na podan¹ wartoœæ
select * from Sales.SpecialOffer
select avg(isnull(MaxQty,0)) from Sales.SpecialOffer

select * from Sales.SalesOrderDetail
select * from sales.SalesOrderHeader



--grupowanie (ile razy wartoœæ w kolumnie wyst¹pi³a + sortowanie), sumowanie wartosci w pogrupowanych kolumnach
select COUNT(*) as counter from sales.SalesOrderHeader 
select CustomerID, count(*) as CntOrders from sales.SalesOrderHeader group by CustomerID order by CntOrders desc  --liczenie wierszy

select SalesOrderID, sum(OrderQty) as CntOrdersSum from sales.SalesOrderDetail group by SalesOrderID order by CntOrdersSum desc --sumowanie


--u¿ycie warunku HAVING zamiast WHERE
select CustomerID, max(orderdate) from sales.SalesOrderHeader group by CustomerID order by CustomerID
select CustomerID, count(*) as CntOrders from sales.SalesOrderHeader group by CustomerID having count(*)>=5 order by CntOrders 



--wyci¹gniêcie roku z daty (mo¿na stosowaæ inne przedzia³y czasu)
select YEAR(OrderDate) as OrderYear, count(*) as CntOrders from sales.SalesOrderHeader group by year(OrderDate) order by OrderYear
select Month(OrderDate) as OrderMonth, DATENAME(MONTH,OrderDate) count(*) as CntOrders from sales.SalesOrderHeader group by month(OrderDate), datename(month,OrderDate) order by OrderMonth





