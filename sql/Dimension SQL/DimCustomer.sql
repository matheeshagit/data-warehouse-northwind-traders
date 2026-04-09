create table DimCustomer(
	CustomerSK int identity(1,1) primary key,
	AlternateCustomerID char(5),
	CompanyName nvarchar(50),
	ContactName nvarchar(50),
	ContactTitle nvarchar(50),
	City nvarchar(50),
	Country nvarchar(50),
	AddressID int,
	Region nvarchar(50),
	Continent nvarchar(50),
	StartDate DateTime,
	EndDate DateTime,
	InsertDate DateTime,
	ModifiedDate DateTime
)