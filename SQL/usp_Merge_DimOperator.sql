CREATE OR ALTER PROCEDURE dbo.usp_Merge_DimOperator
AS
BEGIN
    SET NOCOUNT ON;

    MERGE dbo.DimOperator AS T
    USING
    (
        SELECT DISTINCT
            TrainOperator,
            TrainOperatorBrand
        FROM dbo.STG_DimOperator
        WHERE TrainOperator IS NOT NULL
          AND TrainOperatorBrand IS NOT NULL
    ) AS S
    ON  T.TrainOperator = S.TrainOperator
    AND T.TrainOperatorBrand = S.TrainOperatorBrand

    WHEN NOT MATCHED BY TARGET
    THEN
        INSERT
        (
            TrainOperator,
            TrainOperatorBrand,
            CreatedDate,
            UpdatedDate
        )
        VALUES
        (
            S.TrainOperator,
            S.TrainOperatorBrand,
            SYSUTCDATETIME(),
            SYSUTCDATETIME()
        );

END;
GO