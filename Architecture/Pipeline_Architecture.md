# Pipeline Architecture

## Overview

Microsoft Fabric Pipelines orchestrate notebook execution across all Medallion layers.

The pipeline is responsible for coordinating movement from Bronze through Gold.

---

# Pipeline Flow

```text
Start
  │
  ▼
Validate Source Files
  │
  ▼
Execute Bronze Notebook
  │
  ▼
Validate Bronze Load
  │
  ▼
Execute Silver Notebook
  │
  ▼
Validate Silver Load
  │
  ▼
Execute Gold Notebook
  │
  ▼
Warehouse Refresh
  │
  ▼
Semantic Model Refresh
  │
  ▼
End
```

---

# Pipeline Stages

## Stage 1

Source Validation

Checks:

- File Exists
- Schema Valid
- Duplicate Prevention

---

## Stage 2

Bronze Processing

Activities:

- Raw ingestion
- Metadata creation
- Audit logging
- Queue creation

Outputs:

- Bronze Tables
- Audit Records

---

## Stage 3

Silver Processing

Activities:

- Data cleansing
- Standardization
- Rule validation

Outputs:

- Silver Tables

---

## Stage 4

Gold Processing

Activities:

- Dimension loading
- Fact loading
- Warehouse updates

Outputs:

- Warehouse Objects

---

## Stage 5

Analytics Refresh

Activities:

- Semantic Model update
- Report availability

Outputs:

- Reporting Dataset

---

# Monitoring

Execution monitoring includes:

- Start Time
- End Time
- Duration
- Records Processed
- Success Status
- Error Messages

---

# Recovery Strategy

### Bronze

Reprocess source files.

### Silver

Re-run failed queue items.

### Gold

Re-run warehouse refresh process.

---

# Future Enhancements

### Incremental Refresh

Process only changed source files.

### Metadata Framework

Configuration-driven execution.

### CI/CD

Deployment Pipelines integration.

### Automated Data Quality

Pre-load and post-load validation checks.