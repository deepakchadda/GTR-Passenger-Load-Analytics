# GTR Passenger Loading Analytics

Microsoft Fabric end-to-end analytics solution for processing, transforming, modelling, and reporting passenger loading data across the Govia Thameslink Railway (GTR) network.

---

# Project Overview

This project demonstrates the implementation of a modern Microsoft Fabric Medallion Architecture using:

- Microsoft Fabric Lakehouses
- Fabric Notebooks
- Fabric Pipelines
- Fabric Warehouse
- Direct Lake Semantic Models
- Power BI Reporting
- GitHub Source Control

The solution ingests raw passenger loading data, applies business transformations, builds an analytical warehouse model, and delivers reporting through Power BI.

---

# Solution Architecture

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

# Microsoft Fabric Components

## Lakehouses

| Layer | Object |
|---------|---------|
| Bronze | LH_Bronze |
| Silver | LH_Silver |
| Gold | LH_Gold |

### Bronze Lakehouse

Raw data ingestion layer.

Features:

- Landing folder
- Processed folder
- Failed folder
- File auditing
- Incremental processing controls

### Silver Lakehouse

Business cleansing and transformation layer.

Features:

- Data standardisation
- Data quality controls
- Refresh queue management

### Gold Lakehouse

Business orchestration layer.

Features:

- Gold refresh queue
- Warehouse integration

---

## Warehouse

### Warehouse Name

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

### Fact Table

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

## Semantic Model

### Semantic Model Name

```text
SM_GTR_PassengerLoad
```

### Storage Mode

```text
Direct Lake
```

Benefits:

- Near real-time reporting
- No scheduled dataset refresh
- Simplified architecture
- Improved performance

---

## Reporting

### Dashboard

```text
GTR Network Passenger Load Dashboard
```

### Key Metrics

- Total Passenger Load
- Total Capacity
- Average Occupancy %
- Total Train Services
- Total Routes

### Analysis Areas

- Passenger Trends
- Occupancy Analysis
- Route Performance
- Station Performance
- Fleet Utilisation

---

# Data Pipeline

### Pipeline

```text
PL_GTR_Passenger_Load
```

Execution Flow:

```text
NB_01_Bronze_Load
        │
        ▼
NB_02_Silver_Load
        │
        ▼
03_Gold_Master
```

---

# Notebook Inventory

## Setup Notebooks

```text
NB_00_Setp_Environment
NB_01_Setup_Broze
NB_02_Setup_Silver
NB_03_Setup_Gold
NB_04_Setup_Warehouse
```

## Engineering Notebooks

### Utility

```text
nb_common_utils
NB_03_00_Gold_Common
```

### Bronze

```text
NB_01_Bronze_Load
```

### Silver

```text
NB_02_Silver_Load
```

### Gold

```text
NB_03_01_Gold_Load_DimDate
NB_03_02_Gold_Load_DimStation
NB_03_03_Gold_Load_DimOperator
NB_03_04_Gold_Load_DimFleet
NB_03_05_Gold_Load_DimRoute
NB_03_06_Gold_Load_FactPassengerLoad
```

### Gold Master

```text
03_Gold_Master
```

---

# Repository Structure

```text
GTR-Passenger-Load-Analytics
│
├── README.md
│
├── Architecture
│
├── Documentation
│   ├── Architecture_Guide.md
│   ├── Data_Dictionary.md
│   ├── Deployment_Guide.md
│   ├── Environment_Inventory.md
│   ├── Lakehouse_Setup_Guide.md
│   ├── Object_Inventory.md
│   ├── Pipeline_Guide.md
│   ├── Semantic_Model_Guide.md
│   ├── Troubleshooting_Guide.md
│   └── Warehouse_Setup_Guide.md
│
├── Notebooks
│
├── Pipelines
│
├── SQL
│
├── SemanticModel
│
└── Reports
```

---

# Deployment

To recreate this solution:

1. Create Fabric Workspace
2. Create Lakehouses
3. Create Warehouse
4. Import Setup Notebooks
5. Execute Setup Notebooks
6. Upload source data
7. Import Engineering Notebooks
8. Import Pipeline
9. Execute Pipeline
10. Create Semantic Model
11. Create Power BI Report

See:

```text
Documentation/Deployment_Guide.md
```

for detailed deployment instructions.

---

# Technologies Used

- Microsoft Fabric
- OneLake
- Fabric Lakehouse
- Fabric Warehouse
- Spark Notebooks
- Fabric Pipelines
- Direct Lake Semantic Models
- Power BI
- SQL
- GitHub

---

# Key Features

✅ End-to-End Medallion Architecture

✅ Automated Data Pipeline

✅ Incremental Data Processing

✅ File Audit Tracking

✅ Watermark Control

✅ Queue-Based Processing

✅ Direct Lake Semantic Model

✅ Power BI Dashboarding

✅ Environment Recovery Documentation

✅ GitHub Version Control

---

# Learning Objectives

This project demonstrates practical experience with:

- Microsoft Fabric Data Engineering
- Lakehouse Architecture
- Data Warehousing
- Dimensional Modelling
- ETL/ELT Processing
- Direct Lake Semantic Models
- Pipeline Orchestration
- Power BI Analytics
- GitHub Repository Management

---

# Author

**Deepak Chadda**

Senior Database Developer

Microsoft Fabric Data Engineering Portfolio Project

---

# License

This repository is intended for learning, demonstration, and portfolio purposes.