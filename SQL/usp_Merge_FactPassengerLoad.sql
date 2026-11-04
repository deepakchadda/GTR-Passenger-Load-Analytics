CREATE OR ALTER PROCEDURE dbo.usp_Merge_FactPassengerLoad
AS
BEGIN

    SET NOCOUNT ON;

    MERGE dbo.FactPassengerLoad AS T

    USING
    (
        SELECT

            DD.DateKey,

            DR.RouteKey,

            DO.OperatorKey,

            DF.FleetKey,

            DS.StationKey AS CountStationKey,

            S.UID,
            S.TrainID,

            S.TrainServiceCode,

            S.CallingPointNumber,

            S.NumberOfCars,
            S.StandardSeatingCapacity,
            S.MaximumStandingCapacity,
            S.FirstClassSeatingCapacity,

            S.NumberOfCounts,

            S.TotalLoad,
            S.TotalLoadPct

        FROM dbo.STG_FactPassengerLoad S

        INNER JOIN dbo.DimDate DD
            ON DD.FullDate = S.ServiceDate

        INNER JOIN dbo.DimRoute DR
            ON DR.RouteCode =
               CONCAT(
                    S.OriginCRS,
                    '-',
                    S.DestinationCRS
               )

        INNER JOIN dbo.DimOperator DO
            ON DO.TrainOperator = S.TrainOperator
           AND DO.TrainOperatorBrand = S.TrainOperatorBrand

        INNER JOIN dbo.DimFleet DF
            ON DF.FleetCode = S.FleetCode

        INNER JOIN dbo.DimStation DS
            ON DS.StationCRS = S.CountStationCRS

    ) S

    ON  T.DateKey = S.DateKey
    AND T.UID = S.UID
    AND T.CountStationKey = S.CountStationKey

    WHEN NOT MATCHED THEN

        INSERT
        (
            DateKey,
            RouteKey,
            OperatorKey,
            FleetKey,
            CountStationKey,

            UID,
            TrainID,

            TrainServiceCode,

            CallingPointNumber,

            NumberOfCars,
            StandardSeatingCapacity,
            MaximumStandingCapacity,
            FirstClassSeatingCapacity,

            NumberOfCounts,

            TotalLoad,
            TotalLoadPct,

            CreatedDate,
            UpdatedDate
        )

        VALUES
        (
            S.DateKey,
            S.RouteKey,
            S.OperatorKey,
            S.FleetKey,
            S.CountStationKey,

            S.UID,
            S.TrainID,

            S.TrainServiceCode,

            S.CallingPointNumber,

            S.NumberOfCars,
            S.StandardSeatingCapacity,
            S.MaximumStandingCapacity,
            S.FirstClassSeatingCapacity,

            S.NumberOfCounts,

            S.TotalLoad,
            S.TotalLoadPct,

            SYSUTCDATETIME(),
            SYSUTCDATETIME()
        );

END;
GO