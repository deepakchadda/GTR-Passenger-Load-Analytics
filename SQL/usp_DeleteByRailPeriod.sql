CREATE OR ALTER PROCEDURE dbo.usp_DeleteByRailPeriod
    @RailPeriod VARCHAR(10)
AS
BEGIN

    DELETE FROM dbo.DimDate
    WHERE RailPeriod = @RailPeriod;

END;
