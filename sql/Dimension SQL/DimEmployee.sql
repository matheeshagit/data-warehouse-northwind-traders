create table DimEmployee(
	EmployeeSK int identity(1,1) primary key,
	AlternateEmployeeID int,
	EmployeeName nvarchar(50),
	Title nvarchar(50),
	City nvarchar(50),
	Country nvarchar(50),
	ReportsTo int,
	InsertDate DateTime,
	ModifiedDate DateTime
)