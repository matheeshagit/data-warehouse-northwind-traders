create table DimProduct(
	ProductSK int identity(1,1) primary key,
	AlternateProductID int,
	CategoryID int foreign key references DimCategory(CategorySK),
	ProductName nvarchar(50),
	QuantityPerUnit nvarchar(50),
	UnitPrice money,
	discontinued bit,
	InsertDate DateTime,
	ModifiedDate DateTime
)