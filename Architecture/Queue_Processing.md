# Queue Processing Architecture

## Overview

The solution uses queue-driven orchestration to control processing between Medallion layers.

Instead of directly chaining notebooks together, queue tables determine the next processing step.

This pattern improves reliability and supports incremental processing.

---

# Processing Flow

```text
Source File Uploaded
          │
          ▼
 Bronze Notebook
          │
          ▼
 Insert Queue Record
          │
          ▼
silver_refresh_queue
          │
          ▼
 Silver Notebook
          │
          ▼
 Insert Queue Record
          │
          ▼
gold_refresh_queue
          │
          ▼
 Gold Notebook
          │
          ▼
 Warehouse Refresh
```

---

## Bronze Queue Generation

After successful file ingestion:

Process:

1. File validation
2. Metadata capture
3. Bronze table update
4. Insert pending Silver request

Queue Record Example

| QueueId | EntityName | Status |
|----------|------------|----------|
| 1001 | Passenger_Loading | Pending |

---

## Silver Queue Processing

Silver notebook:

1. Reads pending records
2. Processes required entity
3. Updates Silver table
4. Creates Gold queue record

Status values:

- Pending
- Processing
- Completed
- Failed

---

## Gold Queue Processing

Gold notebook:

1. Reads Gold queue
2. Refreshes dimensions
3. Refreshes facts
4. Updates warehouse

---

## Failure Handling

### Bronze Failure

File remains available for reprocessing.

### Silver Failure

Queue status becomes:

```text
Failed
```

Record remains available for retry.

### Gold Failure

Warehouse remains unchanged until successful rerun.

---

## Benefits

### Resilience

Failures do not affect completed layers.

### Scalability

Additional entities can be added without redesigning pipelines.

### Auditability

Every execution can be tracked through queue records.

### Incremental Processing

Only changed datasets require downstream refresh.