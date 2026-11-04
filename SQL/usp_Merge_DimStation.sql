CREATE PROCEDURE dbo.usp_Merge_DimStation
AS
BEGIN

    MERGE dbo.DimStation AS target
    USING dbo.STG_DimStation AS source
        ON target.StationCRS = source.StationCRS

    WHEN MATCHED
        AND target.StationName <> source.StationName
    THEN
        UPDATE SET
            StationName = source.StationName,
            UpdatedDate = CURRENT_TIMESTAMP

    WHEN NOT MATCHED
    THEN
        INSERT
        (
            StationCRS,
            StationName,
            CreatedDate,
            UpdatedDate
        )
        VALUES
        (
            source.StationCRS,
            source.StationName,
            CURRENT_TIMESTAMP,
            CURRENT_TIMESTAMP
        );

END;