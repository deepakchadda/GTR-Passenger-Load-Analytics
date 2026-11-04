# GTR Passenger Loading Analytics
## Data Dictionary

---

# Bronze Tables

## bronze_passenger_loading

Raw passenger loading data received from source files.

---

## file_audit

Tracks every processed file.

| Column | Description |
|----------|-------------|
| FileName | Processed file name |
| LoadDate | Processing date |
| Status | Processing status |
| RecordCount | Number of records loaded |

---

## file_watermark

Stores incremental processing information.

| Column | Description |
|----------|-------------|
| FileName | Source file |
| WatermarkDate | Last processed timestamp |

---

## silver_refresh_queue

Queue table used to trigger Silver processing.

---

# Silver Tables

## silver_gtr_passenger_loading

Cleaned and standardized passenger load data.

### Business Purpose

Provides validated operational passenger data for analytics processing.

---

## silver_refresh_queue

Controls downstream refresh activity.

---

# Warehouse Tables

# DimDate

Date dimension.

| Column | Description |
|----------|-------------|
| DateKey | Surrogate key |
| FullDate | Calendar date |
| MonthName | Month name |
| CalendarYear | Year |
| Quarter | Quarter |

---

# DimFleet

Fleet dimension.

| Column | Description |
|----------|-------------|
| FleetKey | Surrogate key |
| FleetCode | Fleet identifier |

---

# DimOperator

Operator dimension.

| Column | Description |
|----------|-------------|
| OperatorKey | Surrogate key |
| OperatorName | Train operator |

---

# DimRoute

Route dimension.

| Column | Description |
|----------|-------------|
| RouteKey | Surrogate key |
| OriginStation | Route start |
| DestinationStation | Route end |

---

# DimStation

Station dimension.

| Column | Description |
|----------|-------------|
| StationKey | Surrogate key |
| StationCode | CRS code |
| StationName | Station name |

---

# FactPassengerLoad

Fact table containing passenger measurements.

| Column | Description |
|----------|-------------|
| DateKey | Date dimension key |
| FleetKey | Fleet dimension key |
| OperatorKey | Operator dimension key |
| RouteKey | Route dimension key |
| StationKey | Station dimension key |
| TotalLoad | Passenger count |
| TotalLoadPct | Occupancy percentage |
| StandardSeatingCapacity | Standard seating capacity |
| FirstClassSeatingCapacity | First class capacity |

---

# Business Metrics

## Total Passenger Load

Total passengers counted.

Calculation:

```text
SUM(TotalLoad)
```

---

## Total Capacity

Available train capacity.

Calculation:

```text
Standard Capacity
+
First Class Capacity
```

---

## Average Occupancy %

Train utilization percentage.

Calculation:

```text
Total Passenger Load
÷
Total Capacity
```

---

## Total Train Services

Count of unique train services.

---

## Total Routes

Count of unique routes.