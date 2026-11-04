# GTR Passenger Loading Analytics
## Architecture Guide

---

# Business Problem

The objective of this solution is to analyze passenger loading across the GTR rail network and provide business users with reliable insights into:

- Passenger demand
- Route utilization
- Fleet utilization
- Station performance
- Capacity management
- Occupancy trends

The solution automates ingestion, transformation, dimensional modeling, and reporting using Microsoft Fabric.

---

# Technology Stack

| Component | Technology |
|------------|------------|
| Data Platform | Microsoft Fabric |
| Data Storage | OneLake |
| Data Processing | Spark Notebooks |
| Data Warehouse | Fabric Warehouse |
| Semantic Layer | Direct Lake Semantic Model |
| Reporting | Power BI |
| Source Files | CSV Files |
| Version Control | GitHub |

---

# Architecture Overview

```text
Source Files
       │
       ▼
LH_Bronze
       │
       ▼
LH_Silver
       │
       ▼
LH_Gold
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

# Medallion Architecture

The solution follows the Medallion Architecture pattern.

## Bronze Layer

Purpose:

- Raw data ingestion
- Preserve source data
- File auditing
- Incremental load tracking

Lakehouse:

```text
LH_Bronze
```

Folders:

```text
Landing
Processed
Failed
```

Tables:

```text
bronze_passenger_loading
file_audit
file_watermark
silver_refresh_queue
```

---

## Silver Layer

Purpose:

- Data cleansing
- Data standardization
- Business rule application

Lakehouse:

```text
LH_Silver
```

Tables:

```text
silver_gtr_passenger_loading
silver_refresh_queue
```

---

## Gold Layer

Purpose:

- Warehouse orchestration
- Refresh management

Lakehouse:

```text
LH_Gold
```

Tables:

```text
gold_refresh_queue
```

---

# Warehouse Layer

Warehouse:

```text
WH_GTR
```

Dimensions:

```text
DimDate
DimFleet
DimOperator
DimRoute
DimStation
```

Fact Table:

```text
FactPassengerLoad
```

---

# Semantic Model

Semantic Model:

```text
SM_GTR_PassengerLoad
```

Storage Mode:

```text
Direct Lake
```

Benefits:

- Near real-time reporting
- No dataset import
- Reduced refresh complexity
- Improved performance

---

# Reporting Layer

Report:

```text
GTR Network Passenger Load Dashboard
```

Provides:

- Passenger trend analysis
- Occupancy analysis
- Route performance
- Fleet utilization
- Station performance

---

# Orchestration

Pipeline:

```text
PL_GTR_Passenger_Load
```

Workflow:

```text
Bronze Load
      ↓
Silver Load
      ↓
Gold Load
      ↓
Warehouse
      ↓
Semantic Model
      ↓
Dashboard
```

---

# Design Decisions

## Direct Lake

Selected because:

- Native Fabric architecture
- Faster implementation
- Lower maintenance
- Better performance

## Warehouse-Based Reporting

Selected because:

- Star schema design
- Simplified reporting
- Better scalability

## Queue-Based Processing

Refresh queues provide:

- Controlled processing
- Decoupling between layers
- Easy troubleshooting
- Better monitoring