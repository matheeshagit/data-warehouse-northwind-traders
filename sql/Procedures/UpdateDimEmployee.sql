CREATE PROCEDURE dbo.UpdateDimEmployee
@EmployeeID int,
@EmployeeName nvarchar(50),
@title nvarchar(50),
@city nvarchar(50),
@country nvarchar(50),
@reportsTo int
AS
BEGIN

IF NOT EXISTS(
    SELECT EmployeeSK
    FROM dbo.DimEmployee
    WHERE AlternateEmployeeID = @EmployeeID
)
BEGIN
    INSERT INTO dbo.DimEmployee
    (AlternateEmployeeID, EmployeeName, Title, City, Country, ReportsTo, InsertDate, ModifiedDate)
    VALUES
    (@EmployeeID, @EmployeeName, @title, @city, @country, @reportsTo, GETDATE(), GETDATE())
END

IF EXISTS(
    SELECT EmployeeSK
    FROM dbo.DimEmployee
    WHERE AlternateEmployeeID = @EmployeeID
)
BEGIN
    UPDATE dbo.DimEmployee
    SET EmployeeName = @EmployeeName,
        Title = @title,
        City = @city,
        Country = @country,
        ReportsTo = @reportsTo,
        ModifiedDate = GETDATE()
    WHERE AlternateEmployeeID = @EmployeeID
END

END