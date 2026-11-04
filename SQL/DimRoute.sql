CREATE TABLE WH_GTR.dbo.DimRoute
(
    RouteKey BIGINT IDENTITY NOT NULL,

    OriginStationKey BIGINT NOT NULL,
    DestinationStationKey BIGINT NOT NULL,

    RouteCode VARCHAR(7) NOT NULL,

    CreatedDate DATETIME2(6),
    UpdatedDate DATETIME2(6)
);