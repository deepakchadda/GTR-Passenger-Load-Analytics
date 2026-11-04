# GTR Passenger Load Analytics
## Semantic Model Documentation

## Overview

The semantic model follows a Star Schema design.

### Fact Table

- FactPassengerLoad

### Dimension Tables

- DimDate
- DimFleet
- DimOperator
- DimRoute
- DimStation

---

# Data Model Diagram

```text
                      DimDate
                         |
                         |
                         |
DimFleet ---------- FactPassengerLoad ---------- DimOperator
                         |
                         |
                         |
                      DimRoute
                         |
                         |
                    DimStation
```

---

# Fact Table

## FactPassengerLoad

Stores passenger loading measurements and operational train service data.

### Columns

| Column | Description |
|----------|-------------|
| PassengerLoadKey | Surrogate key |
| DateKey | Foreign key to DimDate |
| FleetKey | Foreign key to DimFleet |
| OperatorKey | Foreign key to DimOperator |
| RouteKey | Foreign key to DimRoute |
| CountStationKey | Station reference |
| TrainID | Train identifier |
| TrainServiceCode | Train service code |
| CallingPointNumber | Calling point sequence |
| NumberOfCars | Number of cars in consist |
| NumberOfCounts | Number of counts collected |
| StandardSeatingCapacity | Standard seating capacity |
| FirstClassSeatingCapacity | First class seating capacity |
| MaximumStandingCapacity | Maximum standing capacity |
| TotalLoad | Total passengers onboard |
| TotalLoadPct | Occupancy percentage |
| UID | Unique service identifier |
| CreatedDate | Record creation timestamp |
| UpdatedDate | Record update timestamp |

### Grain

One record per train service count measurement.

---

# Dimension Tables

## DimDate

Calendar dimension used for time-based reporting.

### Columns

| Column | Description |
|----------|-------------|
| DateKey | Surrogate key |
| FullDate | Calendar date |
| DayOfMonth | Day number |
| DayOfWeekName | Weekday name |
| CalendarMonth | Month number |
| MonthName | Month name |
| QuarterNumber | Quarter |
| CalendarYear | Year |
| RailPeriod | Rail reporting period |

### Usage

Supports:

- Daily reporting
- Monthly reporting
- Quarterly reporting
- Annual reporting
- Rail period analysis

---

## DimFleet

Fleet dimension.

### Columns

| Column | Description |
|----------|-------------|
| FleetKey | Surrogate key |
| FleetCode | Fleet code |
| CreatedDate | Created timestamp |
| UpdatedDate | Updated timestamp |

### Usage

Used to analyse passenger loads by rolling stock fleet.

---

## DimOperator

Train Operating Company dimension.

### Columns

| Column | Description |
|----------|-------------|
| OperatorKey | Surrogate key |
| TrainOperator | Operator name |
| TrainOperatorBrand | Brand name |
| CreatedDate | Created timestamp |
| UpdatedDate | Updated timestamp |

### Usage

Used for operator-level performance reporting.

---

## DimRoute

Route dimension.

### Columns

| Column | Description |
|----------|-------------|
| RouteKey | Surrogate key |
| RouteCode | Route identifier |
| OriginStationKey | Origin station |
| DestinationStationKey | Destination station |
| CreatedDate | Created timestamp |
| UpdatedDate | Updated timestamp |

### Usage

Used for route and journey analysis.

---

## DimStation

Station dimension.

### Columns

| Column | Description |
|----------|-------------|
| StationKey | Surrogate key |
| StationCRS | CRS station code |
| StationName | Station name |
| CreatedDate | Created timestamp |
| UpdatedDate | Updated timestamp |

### Usage

Used for station performance analysis.

---

# Relationships

| From Table | Column | To Table | Column | Cardinality |
|------------|---------|----------|---------|-------------|
| FactPassengerLoad | DateKey | DimDate | DateKey | Many-to-One |
| FactPassengerLoad | FleetKey | DimFleet | FleetKey | Many-to-One |
| FactPassengerLoad | OperatorKey | DimOperator | OperatorKey | Many-to-One |
| FactPassengerLoad | RouteKey | DimRoute | RouteKey | Many-to-One |

---

# Measures

## Total Passenger Load

```DAX
Total Passenger Load =
SUM(FactPassengerLoad[TotalLoad])
```

## Total Capacity

```DAX
Total Capacity =
SUM(FactPassengerLoad[StandardSeatingCapacity])
+
SUM(FactPassengerLoad[FirstClassSeatingCapacity])
```

## Average Occupancy %

```DAX
Average Occupancy % =
DIVIDE(
    [Total Passenger Load],
    [Total Capacity]
)
```

## Total Train Services

```DAX
Total Train Services =
DISTINCTCOUNT(FactPassengerLoad[TrainID])
```

## Total Routes

```DAX
Total Routes =
DISTINCTCOUNT(DimRoute[RouteKey])
```

---

# Model Design Considerations

- Star Schema implementation
- Direct Lake storage mode
- Optimized for Power BI reporting
- Supports route, fleet, station and operator analysis
- Supports daily, monthly and annual trend reporting
- Designed for Microsoft Fabric Warehouse and Direct Lake semantic model

---

# Technology Stack

- Microsoft Fabric
- OneLake
- Fabric Warehouse
- Direct Lake Semantic Model
- Power BI
- DAX