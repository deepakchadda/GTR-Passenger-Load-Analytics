# GTR Passenger Loading Analytics
## Object Inventory

This document contains the complete inventory of all Microsoft Fabric objects required to rebuild the solution.

---

# Workspace

| Object Type | Name |
|-------------|------|
| Workspace | GTR Passenger Loading - PROD |

---

# Lakehouses

| Object Type | Name | Purpose |
|-------------|------|---------|
| Lakehouse | LH_Bronze | Raw data ingestion |
| Lakehouse | LH_Silver | Cleansed and transformed data |
| Lakehouse | LH_Gold | Gold layer orchestration |

---

# Warehouse

| Object Type | Name |
|-------------|------|
| Warehouse | WH_GTR |

---

# Semantic Model

| Object Type | Name |
|-------------|------|
| Semantic Model | SM_GTR_PassengerLoad |

---

# Report

| Object Type | Name |
|-------------|------|
| Power BI Report | GTR Network Passenger Load Dashboard |

---

# Pipeline

| Object Type | Name |
|-------------|------|
| Data Pipeline | PL_GTR_Passenger_Load |

---

# Setup Notebooks

| Notebook |
|-----------|
| NB_00_Setp_Environment |
| NB_01_Setup_Broze |
| NB_02_Setup_Silver |
| NB_03_Setup_Gold |
| NB_04_Setup_Warehouse |

---

# Engineering Notebooks

## Utility

| Notebook |
|-----------|
| nb_common_utils |
| NB_03_00_Gold_Common |

---

## Bronze

| Notebook |
|-----------|
| NB_01_Bronze_Load |

---

## Silver

| Notebook |
|-----------|
| NB_02_Silver_Load |

---

## Gold

| Notebook |
|-----------|
| NB_03_01_Gold_Load_DimDate |
| NB_03_02_Gold_Load_DimStation |
| NB_03_03_Gold_Load_DimOperator |
| NB_03_04_Gold_Load_DimFleet |
| NB_03_05_Gold_Load_DimRoute |
| NB_03_06_Gold_Load_FactPassengerLoad |

---

## Gold Orchestrator

| Notebook |
|-----------|
| 03_Gold_Master |

---

# Lakehouse File Structure

## LH_Bronze

### Files

```text
Landing
Processed
Failed
```

### Tables

```text
bronze_passenger_loading
file_audit
file_watermark
silver_refresh_queue
```

---

## LH_Silver

### Files

```text
Files
```

### Tables

```text
silver_gtr_passenger_loading
silver_refresh_queue
```

---

## LH_Gold

### Files

```text
Files
```

### Tables

```text
gold_refresh_queue
```

---

# Warehouse Tables

## Dimension Tables

```text
DimDate
DimFleet
DimOperator
DimRoute
DimStation
```

---

## Fact Tables

```text
FactPassengerLoad
```

---

## Staging Tables

```text
STG_DimFleet
STG_DimOperator
STG_DimRoute
STG_DimStation
STG_FactPassengerLoad
```

---

# Stored Procedures

```text
usp_DeleteByRailPeriod

usp_Merge_DimFleet
usp_Merge_DimOperator
usp_Merge_DimRoute
usp_Merge_DimStation

usp_Merge_FactPassengerLoad
```

---

# Semantic Model Tables

```text
DimDate
DimFleet
DimOperator
DimRoute
DimStation
FactPassengerLoad
```

---

# Relationship Model

```text
FactPassengerLoad
    │
    ├── DateKey      → DimDate
    ├── FleetKey     → DimFleet
    ├── OperatorKey  → DimOperator
    ├── RouteKey     → DimRoute
    └── StationKey   → DimStation
```

---

# Refresh Flow

```text
Files/Landing
        │
        ▼
NB_01_Bronze_Load
        │
        ▼
LH_Bronze
        │
        ▼
NB_02_Silver_Load
        │
        ▼
LH_Silver
        │
        ▼
03_Gold_Master
        │
        ▼
WH_GTR
        │
        ▼
SM_GTR_PassengerLoad
        │
        ▼
GTR Network Passenger Load Dashboard
```

---

# Recovery Priority

Recreate these objects in the following order:

1. Workspace
2. Lakehouses
3. Warehouse
4. Setup Notebooks
5. Engineering Notebooks
6. Pipeline
7. Warehouse Objects
8. Semantic Model
9. Measures
10. Report

---

# Repository Location

```text
Documentation/Object_Inventory.md
```

This file serves as the master inventory and should be updated whenever a new notebook, table, stored procedure, semantic model object, or report page is added.