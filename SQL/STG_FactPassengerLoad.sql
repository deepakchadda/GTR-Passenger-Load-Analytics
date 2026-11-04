CREATE TABLE WH_GTR.dbo.STG_FactPassengerLoad
(
    ServiceDate DATE,

    OriginCRS VARCHAR(3),
    DestinationCRS VARCHAR(3),

    CountStationCRS VARCHAR(3),

    TrainOperator VARCHAR(50),
    TrainOperatorBrand VARCHAR(50),

    FleetCode VARCHAR(20),

    UID VARCHAR(20),
    TrainID VARCHAR(20),

    TrainServiceCode VARCHAR(20),

    CallingPointNumber INT,

    NumberOfCars INT,
    StandardSeatingCapacity INT,
    MaximumStandingCapacity INT,
    FirstClassSeatingCapacity INT,

    NumberOfCounts INT,

    TotalLoad INT,
    TotalLoadPct DECIMAL(9,2)
);