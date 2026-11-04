CREATE TABLE WH_GTR.dbo.DimFleet
(
    FleetKey BIGINT IDENTITY NOT NULL,

    FleetCode VARCHAR(20) NOT NULL,

    CreatedDate DATETIME2(6),
    UpdatedDate DATETIME2(6)
);