CREATE PROCEDURE dbo.UpdateDimProduct
@ProductID int,
@CategoryID int,
@productName nvarchar(50),
@quantityPerUnit nvarchar(50),
@unitPrice money,
@discontinued int
AS
BEGIN

IF NOT EXISTS(
    SELECT ProductSK
    FROM dbo.DimProduct
    WHERE AlternateProductID = @ProductID
)
BEGIN
    INSERT INTO dbo.DimProduct
    (AlternateProductID, CategoryID, ProductName, QuantityPerUnit,UnitPrice, discontinued, InsertDate, ModifiedDate)
    VALUES
    (@ProductID, @CategoryID, @productName,@quantityPerUnit,@unitPrice,@discontinued  , GETDATE(), GETDATE())
END

IF EXISTS(
    SELECT ProductSK
    FROM dbo.DimProduct
    WHERE AlternateProductID = @ProductID
)
BEGIN
    UPDATE dbo.DimProduct
    SET CategoryID = @CategoryID,
        ProductName = @productName,
        QuantityPerUnit = @quantityPerUnit,
        UnitPrice = @unitPrice,
        discontinued = @discontinued,
        ModifiedDate = GETDATE()
    WHERE AlternateProductID = @ProductID
END

END

