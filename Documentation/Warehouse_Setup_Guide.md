# GTR Passenger Loading Analytics
## Warehouse Setup Guide

---

# Overview

The warehouse is the enterprise reporting layer for the GTR Passenger Loading Analytics solution.

## Warehouse Name

```text
WH_GTR
```

Purpose:

- Store dimensional model
- Support Direct Lake Semantic Model
- Support Power BI reporting
- Separate reporting layer from transformation layer

---

# Architecture

```text
LH_Bronze
    ↓
LH_Silver
    ↓
WH_GTR
    ↓
SM_GTR_PassengerLoad
    ↓
GTR Network Passenger Load Dashboard
```

---

# Warehouse Objects

## Dimension Tables

### DimDate

Stores date attributes used for time intelligence.

### DimFleet

Stores train fleet information.

### DimOperator

Stores train operator information.

### DimRoute

Stores rail route information.

### DimStation

Stores station information.

---

## Fact Table

### FactPassengerLoad

Stores passenger load measurements and operational metrics.

---

## Staging Tables

### STG_DimFleet

Intermediate Fleet staging table.

### STG_DimOperator

Intermediate Operator staging table.

### STG_DimRoute

Intermediate Route staging table.

### STG_DimStation

Intermediate Station staging table.

### STG_FactPassengerLoad

Intermediate Fact staging table.

---

# Stored Procedures

## Data Refresh Procedures

```text
usp_Merge_DimFleet
usp_Merge_DimOperator
usp_Merge_DimRoute
usp_Merge_DimStation
usp_Merge_FactPassengerLoad
```

Purpose:

- Merge staging data
- Handle incremental loads
- Maintain dimensional model

---

## Maintenance Procedures

### usp_DeleteByRailPeriod

Used to remove existing data for a particular rail period before loading refreshed data.

---

# Data Load Sequence

```text
Load STG_DimFleet
    ↓
usp_Merge_DimFleet

Load STG_DimOperator
    ↓
usp_Merge_DimOperator

Load STG_DimRoute
    ↓
usp_Merge_DimRoute

Load STG_DimStation
    ↓
usp_Merge_DimStation

Load STG_FactPassengerLoad
    ↓
usp_Merge_FactPassengerLoad
```

---

# Validation Checks

## Dimension Validation

```sql
SELECT COUNT(*)*FROM dbo.DimDate;
SELECT*COUNT(*) FROM dbo.DimFleet;
SELECT COUNT(*) FROM dbo.DimOperator;
SELECT COUNT(*) FROM dbo.DimRoute;
SELECT COUNT(*) FROM dbo.DimStation;
```

## Fac* Validation

```sql
SELECT COUNT(*) FROM dbo.FactPassengerLoad;
```

---

# Dependencies

Warehouse requires:

- LH_Silver populated
- Gold notebooks executed successfully
- Stored procedures deployed
- Staging tables populated

---

# Recovery Steps

1. Create WH_GTR
2. Create staging tables
3. Create dimension tables
4. Create fact table
5. Create stored procedures
6. Execute Gold notebooks
7. Validate record counts