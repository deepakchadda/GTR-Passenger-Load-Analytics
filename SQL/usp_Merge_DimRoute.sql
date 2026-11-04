CREATE OR ALTER PROCEDURE dbo.usp_Merge_DimRoute
AS
BEGIN
    SET NOCOUNT ON;

    MERGE dbo.DimRoute AS T
    USING
    (
        SELECT DISTINCT
            O.StationKey AS OriginStationKey,
            D.StationKey AS DestinationStationKey,

            CONCAT(
                S.OriginCRS,
                '-',
                S.DestinationCRS
            ) AS RouteCode

        FROM dbo.STG_DimRoute S

        INNER JOIN dbo.DimStation O
            ON O.StationCRS = S.OriginCRS

        INNER JOIN dbo.DimStation D
            ON D.StationCRS = S.DestinationCRS

    ) AS S

    ON T.OriginStationKey = S.OriginStationKey
   AND T.DestinationStationKey = S.DestinationStationKey

    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT
        (
            OriginStationKey,
            DestinationStationKey,
            RouteCode,
            CreatedDate,
            UpdatedDate
        )
        VALUES
        (
            S.OriginStationKey,
            S.DestinationStationKey,
            S.RouteCode,
            SYSUTCDATETIME(),
            SYSUTCDATETIME()
        );

END;
GO