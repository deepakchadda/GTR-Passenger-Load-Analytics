CREATE TABLE WH_GTR.dbo.FactPassengerLoad
(
    PassengerLoadKey BIGINT IDENTITY NOT NULL,

    DateKey INT NOT NULL,
    RouteKey BIGINT NOT NULL,
    OperatorKey BIGINT NOT NULL,
    FleetKey BIGINT NOT NULL,
    CountStationKey BIGINT NOT NULL,

    UID VARCHAR(20) NOT NULL,
    TrainID VARCHAR(20) NOT NULL,

    TrainServiceCode VARCHAR(20),

    CallingPointNumber INT,

    NumberOfCars INT,
    StandardSeatingCapacity INT,
    MaximumStandingCapacity INT,
    FirstClassSeatingCapacity INT,

    NumberOfCounts INT,

    TotalLoad INT,
    TotalLoadPct DECIMAL(9,2),

    CreatedDate DATETIME2(6),
    UpdatedDate DATETIME2(6)
);