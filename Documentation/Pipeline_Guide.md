# GTR Passenger Loading Analytics
## Pipeline Guide

---

# Pipeline

## Name

```text
PL_GTR_Passenger_Load
```

---

# Purpose

Orchestrates the complete end-to-end passenger loading solution.

---

# Execution Flow

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

# Activities

## Bronze Load

Notebook:

```text
NB_01_Bronze_Load
```

Functions:

- Read landing files
- Load Bronze tables
- Update file audit
- Update watermark
- Queue Silver refresh

---

## Silver Load

Notebook:

```text
NB_02_Silver_Load
```

Functions:

- Cleanse source data
- Standardize data
- Populate Silver table
- Queue Gold refresh

---

## Gold Load

Notebook:

```text
03_Gold_Master
```

Functions:

- Execute Gold notebooks
- Populate warehouse dimensions
- Populate warehouse fact table

---

# Gold Notebook Sequence

```text
NB_03_01_Gold_Load_DimDate
NB_03_02_Gold_Load_DimStation
NB_03_03_Gold_Load_DimOperator
NB_03_04_Gold_Load_DimFleet
NB_03_05_Gold_Load_DimRoute
NB_03_06_Gold_Load_FactPassengerLoad
```

---

# Dependencies

```text
Bronze Success
      ↓
Silver Success
      ↓
Gold Success
```

Failed activities stop downstream processing.

---

# Recovery

If failure occurs:

1. Identify failed notebook
2. Fix issue
3. Re-run failed notebook
4. Re-run remaining pipeline activities

---

# Export Location

```text
Pipelines/
└── PL_GTR_Passenger_Load
    ├── manifest.json
    └── PL_GTR_Passenger_Load.json
```