CREATE PROCEDURE dbo.UpdateDimShipper
@ShipperID int,
@CompanyName nvarchar(50)
AS
BEGIN

IF NOT EXISTS(
    SELECT ShipperSK
    FROM dbo.DimShipper
    WHERE AlternateShipperID = @ShipperID
)
BEGIN
    INSERT INTO dbo.DimShipper
    (AlternateShipperID, CompanyName, InsertDate, ModifiedDate)
    VALUES
    (@ShipperID, @CompanyName, GETDATE(), GETDATE())
END

IF EXISTS(
    SELECT ShipperSK
    FROM dbo.DimShipper
    WHERE AlternateShipperID = @ShipperID
)
BEGIN
    UPDATE dbo.DimShipper
    SET CompanyName = @CompanyName,
        ModifiedDate = GETDATE()
    WHERE AlternateShipperID = @ShipperID
END

END

