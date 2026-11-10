# GTR Passenger Load Analytics
## End-to-End Solution Architecture

### Overview

This solution is built using Microsoft Fabric and implements a Medallion Architecture (Bronze, Silver, Gold) pattern.

The objective is to ingest passenger load data, process it through multiple refinement layers, store analytical data in a warehouse, and expose it through a semantic model and Power BI reports.

---

## High Level Architecture

```text
┌─────────────────────┐
│ Source Excel Files  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Lakehouse Source    │
│ Folder              │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Bronze Pipeline     │
│ + Bronze Notebook   │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Bronze Tables       │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Silver Queue Table  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Silver Notebook     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Silver Tables       │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Gold Queue Table    │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Gold Notebook       │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Warehouse           │
│ Star Schema         │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Semantic Model      │
│ Direct Lake         │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Power BI Reports    │
└─────────────────────┘
```

---

## Component Responsibilities

### Source Layer

Stores raw business data files.

Examples:

- Station Data
- Route Data
- Fleet Data
- Passenger Loading Data

Files are uploaded into the Lakehouse Source folder.

---

### Bronze Layer

Purpose:

- Preserve source data
- Execute schema validation
- Capture ingestion metadata
- Maintain audit records

Outputs:

- Bronze Delta Tables
- Audit Records
- Queue Entries

---

### Silver Layer

Purpose:

- Data cleansing
- Standardization
- Business rule validation
- Data type transformations

Outputs:

- Conformed datasets
- Silver Delta Tables

---

### Gold Layer

Purpose:

- Dimensional modelling
- Fact table generation
- Business-ready analytics structures

Outputs:

- Warehouse Dimension Tables
- Warehouse Fact Tables

---

### Semantic Layer

Purpose:

Business consumption layer built using Direct Lake mode.

Advantages:

- No imports
- Near real-time analytics
- High performance reporting

---

### Reporting Layer

Power BI dashboards provide:

- Occupancy Analysis
- Route Analysis
- Station Analysis
- Operator Analysis

---

## Design Principles

### Medallion Architecture

Bronze → Silver → Gold

Provides:

- Traceability
- Data Quality
- Reusability
- Scalability

### Queue-Based Processing

Downstream layers are triggered through queue tables rather than direct dependencies.

Benefits:

- Decoupled processing
- Failure isolation
- Easier reruns
- Incremental refresh support

