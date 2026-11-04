CREATE TABLE WH_GTR.dbo.DimOperator
(
    OperatorKey BIGINT IDENTITY NOT NULL,

    TrainOperator      VARCHAR(50) NOT NULL,
    TrainOperatorBrand VARCHAR(50) NOT NULL,

    CreatedDate DATETIME2(6),
    UpdatedDate DATETIME2(6)
);