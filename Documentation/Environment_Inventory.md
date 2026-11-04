# GTR Passenger Loading Analytics
## Environment Inventory

Last Updated: November 2026

---

# Workspace

| Property | Value |
|-----------|---------|
| Workspace Name | GTR Passenger Loading - PROD |
| Platform | Microsoft Fabric |
| Storage Mode | Direct Lake |

---

# Workspace Structure

```text
GTR Passenger Loading - PROD
│
├── Source
│   └── LH_Bronze
│
├── Storage
│   ├── LH_Silver
│   ├── LH_Gold
│   └── WH_GTR
│
├── Setup
│
├── Engineering
│
├── Pipelines
│
├── Semantic Models
│
└── Reporting
```

---

# Source Layer

## Lakehouse

```text
LH_Bronze
```

### Tables

```text
dbo.bronze_passenger_loading
dbo.file_audit
dbo.file_watermark
dbo.silver_refresh_queue
```

### File Structure

```text
Files
├── Landing
├── Processed
└── Failed
```

### Purpose

| Object | Description |
|----------|-------------|
| bronze_passenger_loading | Raw passenger loading data |
| file_audit | File processing audit records |
| file_watermark | Incremental load tracking |
| silver_refresh_queue | Silver layer refresh control |

---

# Storage Layer

## Lakehouse

```text
LH_Silver
```

### Tables

```text
dbo.silver_gtr_passenger_loading
dbo.silver_refresh_queue
```

### Purpose

Provides cleansed and standardized passenger loading data.

---

## Lakehouse

```text
LH_Gold
```

### Tables

```text
dbo.gold_refresh_queue
```

### Purpose

Gold orchestration and refresh management.

---

# Warehouse

## Name

```text
WH_GTR
```

### Dimension Tables

```text
DimDate
DimFleet
DimOperator
DimRoute
DimStation
```

### Fact Tables

```text
FactPassengerLoad
```

### Staging Tables

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

### Purpose

| Procedure | Description |
|------------|------------|
| usp_DeleteByRailPeriod | Removes existing period data before reload |
| usp_Merge_DimFleet | Loads Fleet dimension |
| usp_Merge_DimOperator | Loads Operator dimension |
| usp_Merge_DimRoute | Loads Route dimension |
| usp_Merge_DimStation | Loads Station dimension |
| usp_Merge_FactPassengerLoad | Loads FactPassengerLoad |

---

# Setup Notebooks

```text
NB_00_Setp_Environment
NB_01_Setup_Broze
NB_02_Setup_Silver
NB_03_Setup_Gold
NB_04_Setup_Warehouse
```

### Purpose

Used to build the entire Fabric environment from scratch.

---

# Engineering Notebooks

## Utility

```text
nb_common_utils
NB_03_00_Gold_Common
```

## Bronze

```text
NB_01_Bronze_Load
```

## Silver

```text
NB_02_Silver_Load
```

## Gold

```text
NB_03_01_Gold_Load_DimDate
NB_03_02_Gold_Load_DimStation
NB_03_03_Gold_Load_DimOperator
NB_03_04_Gold_Load_DimFleet
NB_03_05_Gold_Load_DimRoute
NB_03_06_Gold_Load_FactPassengerLoad
```

## Gold Master

```text
03_Gold_Master
```

---

# Pipeline

## Name

```text
PL_GTR_Passenger_Load
```

### Execution Flow

```text
NB_01_Bronze_Load
        ↓
NB_02_Silver_Load
        ↓
03_Gold_Master
```

Pipeline export location:

```text
Pipelines/
└── PL_GTR_Passenger_Load
```

---

# Semantic Model

## Name

```text
SM_GTR_PassengerLoad
```

### Storage Mode

```text
Direct Lake
```

### Tables

```text
DimDate
DimFleet
DimOperator
DimRoute
DimStation
FactPassengerLoad
```

---

# Report

## Name

```text
GTR Network Passenger Load Dashboard
```

### Data Source

```text
SM_GTR_PassengerLoad
```

### Key Metrics

```text
Total Passenger Load
Total Capacity
Average Occupancy %
Total Train Services
Total Routes
```

---

# End-to-End Architecture

```text
Landing Files
        │
        ▼
LH_Bronze
│
├── bronze_passenger_loading
├── file_audit
├── file_watermark
└── silver_refresh_queue
        │
        ▼
LH_Silver
│
├── silver_gtr_passenger_loading
└── silver_refresh_queue
        │
        ▼
LH_Gold
│
└── gold_refresh_queue
        │
        ▼
WH_GTR
│
├── DimDate
├── DimFleet
├── DimOperator
├── DimRoute
├── DimStation
└── FactPassengerLoad
        │
        ▼
SM_GTR_PassengerLoad
        │
        ▼
GTR Network Passenger Load Dashboard
```

---

# Environment Recovery Checklist

- [ ] Create Workspace
- [ ] Create LH_Bronze
- [ ] Create LH_Silver
- [ ] Create LH_Gold
- [ ] Create WH_GTR

- [ ] Run NB_00_Setp_Environment
- [ ] Run NB_01_Setup_Broze
- [ ] Run NB_02_Setup_Silver
- [ ] Run NB_03_Setup_Gold
- [ ] Run NB_04_Setup_Warehouse

- [ ] Upload source files to LH_Bronze/Files/Landing

- [ ] Import Engineering notebooks
- [ ] Import pipeline

- [ ] Execute Bronze load
- [ ] Execute Silver load
- [ ] Execute Gold load

- [ ] Create Semantic Model
- [ ] Create DAX Measures
- [ ] Recreate Report

- [ ] Validate Results