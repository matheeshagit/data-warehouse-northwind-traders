CREATE PROCEDURE dbo.UpdateDimCategory
@CategoryID int,
@CategoryName nvarchar(50),
@description nvarchar(max)
AS
BEGIN

IF NOT EXISTS(
    SELECT CategorySK
    FROM dbo.DimCategory
    WHERE AlternateCategoryID = @CategoryID
)
BEGIN
    INSERT INTO dbo.DimCategory
    (AlternateCategoryID, CategoryName, Description, InsertDate, ModifiedDate)
    VALUES
    (@CategoryID, @CategoryName, @description, GETDATE(), GETDATE())
END

IF EXISTS(
    SELECT CategorySK
    FROM dbo.DimCategory
    WHERE AlternateCategoryID = @CategoryID
)
BEGIN
    UPDATE dbo.DimCategory
    SET CategoryName = @CategoryName,
        Description = @description,
        ModifiedDate = GETDATE()
    WHERE AlternateCategoryID = @CategoryID
END

END