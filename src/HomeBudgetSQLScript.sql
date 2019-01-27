use arzieba
select * from Budget.BudgetEntries

--tworzenie struktury programu HomeBudget

	--Tworzenie schematu
	create schema Budget

	--Tworzenie tabeli
	create table Budget.BudgetEntries(
	ID int identity primary key,
	EntryDate datetime not null default getdate(),
	EntryName nvarchar(512) not null,
	Amount money not null	
	);
	
	--test
	insert into Budget.BudgetEntries(EntryName, Amount)
	values ('wyp³ata', 3285)

	--balance check
	select sum(Amount) as Balance from Budget.BudgetEntries

	select top 10 * from Budget.BudgetEntries order by ID desc

	select * from Budget.BudgetEntries where ID not in 
	(select top((select COUNT(*) from Budget.BudgetEntries ) -10 )ID from Budget.BudgetEntries)


	select top 10 * from Budget.