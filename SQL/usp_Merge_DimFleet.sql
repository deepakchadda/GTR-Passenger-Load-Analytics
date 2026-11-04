CREATE OR ALTER PROCEDURE dbo.usp_Merge_DimFleet
AS
BEGIN
    SET NOCOUNT ON;

    MERGE dbo.DimFleet AS T
    USING
    (
        SELECT DISTINCT
            FleetCode
        FROM dbo.STG_DimFleet
        WHERE FleetCode IS NOT NULL
    ) S
    ON T.FleetCode = S.FleetCode

    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT
        (
            FleetCode,
            CreatedDate,
            UpdatedDate
        )
        VALUES
        (
            S.FleetCode,
            SYSUTCDATETIME(),
            SYSUTCDATETIME()
        );

END;
GO
