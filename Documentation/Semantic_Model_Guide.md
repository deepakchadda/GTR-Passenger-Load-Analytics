# GTR Passenger Loading Analytics
## Semantic Model Guide

---

# Semantic Model

## Name

```text
SM_GTR_PassengerLoad
```

## Storage Mode

```text
Direct Lake
```

---

# Data Source

```text
WH_GTR
```

---

# Tables

## Fact

```text
FactPassengerLoad
```

---

## Dimensions

```text
DimDate
DimFleet
DimOperator
DimRoute
DimStation
```

---

# Relationship Model

```text
DimDate
    │
    ├──────────┐
    │          │
DimFleet       │
    │          │
DimOperator    │
    │          │
DimRoute       │
    │          │
DimStation     │
    │          │
    ▼          ▼
FactPassengerLoad
```

---

# Measures

## Total Passenger Load

```DAX
Total Passenger Load =
SUM(FactPassengerLoad[TotalLoad])
```

---

## Total Capacity

```DAX
Total Capacity =
SUM(FactPassengerLoad[StandardSeatingCapacity])
+
SUM(FactPassengerLoad[FirstClassSeatingCapacity])
```

---

## Average Occupancy %

```DAX
Average Occupancy % =
DIVIDE(
    [Total Passenger Load],
    [Total Capacity]
)
```

---

## Total Train Services

```DAX
Total Train Services =
DISTINCTCOUNT(FactPassengerLoad[TrainID])
```

---

## Total Routes

```DAX
Total Routes =
DISTINCTCOUNT(DimRoute[RouteKey])
```

---

# Model Design Principles

- Star Schema
- Direct Lake Storage
- One-to-Many Relationships
- Single Fact Table Design
- Optimized for Reporting Performance

---

# Validation

Confirm:

- All tables loaded
- Relationships active
- Measures calculate correctly
- Direct Lake enabled

---

# Recreation Steps

1. Create semantic model from WH_GTR
2. Select Direct Lake
3. Create relationships
4. Create measures
5. Validate results
6. Publish changes