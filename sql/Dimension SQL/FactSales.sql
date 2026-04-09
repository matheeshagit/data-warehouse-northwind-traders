create table FactSales(
	OrderID int,
	ProductID int foreign key references DimProduct(ProductSK),
	CustomerID int foreign key references DimCustomer(CustomerSK),
	EmployeeID int foreign key references DimEmployee(EmployeeSK),
	ShipperID int foreign key references DimShipper(ShipperSK),
	UnitPrice money,
	Quantity money,
	Discount money,
	Freight money,
	OrderDate int foreign key references DimDate(DateSK),
	RequiredDate int foreign key references DimDate(DateSK),
	ShippedDate int foreign key references DimDate(DateSK),
	InsertDate datetime,
	ModifiedDate datetime
)