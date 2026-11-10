# Processing Framework

## Design Philosophy

The solution uses a metadata and queue-driven framework.

Each layer performs a specific responsibility and delegates downstream processing through queue tables.

## Queue Tables

### silver_refresh_queue

Used to request Silver processing after Bronze ingestion.

Columns:

- QueueId
- EntityName
- Status
- CreatedDate
- ProcessedDate

Statuses:

- Pending
- Processing
- Completed
- Failed

### gold_refresh_queue

Used to request Gold processing after Silver transformations.

Columns:

- QueueId
- EntityName
- Status
- CreatedDate
- ProcessedDate

Statuses:

- Pending
- Processing
- Completed
- Failed

## Benefits

- Decoupled architecture
- Retry capability
- Controlled execution
- Auditability
- Easier troubleshooting