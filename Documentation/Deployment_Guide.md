# GTR Passenger Loading Analytics
## Deployment Guide

---

# Purpose

This guide describes how to deploy the entire solution into a new Microsoft Fabric environment.

---

# Step 1 - Create Workspace

Create workspace:

```text
GTR Passenger Loading - PROD
```

---

# Step 2 - Create Lakehouses

Create:

```text
LH_Bronze
LH_Silver
LH_Gold
```

---

# Step 3 - Create Warehouse

Create:

```text
WH_GTR
```

---

# Step 4 - Import Setup Notebooks

Import:

```text
NB_00_Setp_Environment
NB_01_Setup_Broze
NB_02_Setup_Silver
NB_03_Setup_Gold
NB_04_Setup_Warehouse
```

---

# Step 5 - Run Setup Notebooks

Execute in order:

```text
NB_00_Setp_Environment

NB_01_Setup_Broze

NB_02_Setup_Silver

NB_03_Setup_Gold

NB_04_Setup_Warehouse
```

---

# Step 6 - Configure Bronze File Structure

Create folders:

```text
Files
├── Landing
├── Processed
└── Failed
```

---

# Step 7 - Upload Source Data

Upload source data to:

```text
LH_Bronze
└── Files
    └── Landing
```

---

# Step 8 - Import Engineering Notebooks

Import:

```text
NB_01_Bronze_Load

NB_02_Silver_Load

NB_03_00_Gold_Common

NB_03_01_Gold_Load_DimDate
NB_03_02_Gold_Load_DimStation
NB_03_03_Gold_Load_DimOperator
NB_03_04_Gold_Load_DimFleet
NB_03_05_Gold_Load_DimRoute
NB_03_06_Gold_Load_FactPassengerLoad

03_Gold_Master

nb_common_utils
```

---

# Step 9 - Import Pipeline

Import:

```text
PL_GTR_Passenger_Load
```

using exported JSON files.

---

# Step 10 - Execute Data Load

Run pipeline:

```text
PL_GTR_Passenger_Load
```

or manually run:

```text
NB_01_Bronze_Load

NB_02_Silver_Load

03_Gold_Master
```

---

# Step 11 - Create Semantic Model

Create:

```text
SM_GTR_PassengerLoad
```

Configuration:

```text
Source:
WH_GTR

Storage Mode:
Direct Lake
```

---

# Step 12 - Create Measures

Create all DAX measures documented in:

```text
Semantic_Model_Guide.md
```

---

# Step 13 - Rebuild Report

Create report:

```text
GTR Network Passenger Load Dashboard
```

Connect to:

```text
SM_GTR_PassengerLoad
```

---

# Step 14 - Validation

Validate:

- Bronze tables populated
- Silver tables populated
- Warehouse populated
- Semantic model refreshed
- Measures calculate correctly
- Dashboard displays data

---

# Deployment Checklist

- [ ] Workspace Created
- [ ] Lakehouses Created
- [ ] Warehouse Created
- [ ] Setup Notebooks Imported
- [ ] Setup Notebooks Executed
- [ ] Source Files Uploaded
- [ ] Engineering Notebooks Imported
- [ ] Pipeline Imported
- [ ] Pipeline Executed
- [ ] Semantic Model Created
- [ ] Measures Created
- [ ] Report Rebuilt
- [ ] Validation Completed