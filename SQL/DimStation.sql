CREATE TABLE WH_GTR.dbo.DimStation
(
    StationKey BIGINT NOT NULL IDENTITY,

    StationCRS VARCHAR(3) NOT NULL,
    StationName VARCHAR(100) NOT NULL,

    CreatedDate DATETIME2(6),
    UpdatedDate DATETIME2(6)
);