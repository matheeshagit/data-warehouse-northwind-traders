create table DimShipper(
	ShipperSK int identity(1,1) primary key,
	AlternateShipperID int,
	CompanyName nvarchar(50),
	InsertDate DateTime,
	ModifiedDate DateTime
)