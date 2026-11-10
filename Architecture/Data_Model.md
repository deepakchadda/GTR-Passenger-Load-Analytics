# Data Warehouse Data Model

## Overview

The warehouse follows a Star Schema design.

Dimensions contain descriptive attributes.

Fact tables contain measurable business metrics.

---

# Star Schema

```text

                    DimDate
                       │
                       │
                       ▼

DimOperator ──► FactPassengerLoad ◄── DimRoute
                       ▲
                       │

      DimStation ◄─────┼─────► DimFleet

```

---

# Fact Table

## FactPassengerLoad

Grain:

One record per:

- Date
- Route
- Station
- Operator
- Fleet

Measures:

- Passenger_Count
- Capacity
- Occupancy_Percentage
- Standing_Passengers

---

# Dimension Tables

## DimDate

Attributes:

- DateKey
- CalendarDate
- DayName
- MonthName
- Quarter
- Year

---

## DimStation

Attributes:

- StationKey
- StationCode
- StationName
- Region

---

## DimRoute

Attributes:

- RouteKey
- RouteCode
- RouteName

---

## DimOperator

Attributes:

- OperatorKey
- OperatorCode
- OperatorName

---

## DimFleet

Attributes:

- FleetKey
- FleetCode
- FleetDescription

---

# Relationships

| Table | Relationship |
|---------|-------------|
| FactPassengerLoad | DimDate |
| FactPassengerLoad | DimStation |
| FactPassengerLoad | DimRoute |
| FactPassengerLoad | DimOperator |
| FactPassengerLoad | DimFleet |

---

# Reporting Capabilities

This model supports:

- Occupancy analysis
- Route performance
- Fleet utilization
- Station analysis
- Operator performance
- Trend analysis

---

# Design Considerations

### Star Schema

Selected because:

- High reporting performance
- Simplified DAX calculations
- Direct Lake optimization

### Surrogate Keys

Dimension tables use surrogate keys for warehouse consistency.

### Conformed Dimensions

Shared dimensions enable consistent calculations across reports.