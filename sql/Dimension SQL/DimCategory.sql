create table DimCategory(
	CategorySK int identity(1,1) primary key,
	AlternateCategoryID int,
	CategoryName nvarchar(50),
	Description nvarchar(700),
	InsertDate DateTime,
	ModifiedDate DateTime
)