# GTR Passenger Loading Analytics
## Troubleshooting Guide

---

# Notebook Issues

## Notebook Not Found

Error:

```text
MagicUsageError
Cannot read notebook
```

Cause:

Incorrect notebook path or notebook name.

Resolution:

Verify:

```text
Workspace
Folder
Notebook Name
```

and ensure no leading or trailing spaces exist.

---

## %run Command Failure

Cause:

Notebook path incorrectly specified.

Resolution:

Use the full notebook path and verify the notebook exists.

---

## Lakehouse Not Attached

Error:

```text
UnsupportedOperationException

No default context found
```

Cause:

Notebook is not attached to a Lakehouse.

Resolution:

Attach the required Lakehouse before running Spark SQL statements.

---

# Pipeline Issues

## Pipeline Activity Failure

Cause:

Dependent notebook failed.

Resolution:

1. Open pipeline run history.
2. Identify failed activity.
3. Correct notebook issue.
4. Re-run failed activity.

---

## Capacity Issues

Symptoms:

- Pipeline hangs
- Notebook queued
- Session creation delays

Cause:

Fabric Trial capacity limitations.

Resolution:

Run activities individually or wait for capacity availability.

---

# Warehouse Issues

## Merge Procedure Failure

Cause:

Missing staging data.

Resolution:

Verify:

```sql
SELECT COUNT(*)
FROM STG_DimStation
*``

before executing merge procedu*es.

---

## Fact*Load Failure

Cause:

Required*dimensions not populated.

Resolut*on:

*un dimension notebooks before:

``*text
NB_03_06_Gold_Load_FactPassen*er*oad
```

---

# Semantic Model Iss*es

*# Data Not Refreshing

Cause*

Direct Lake caching.

Resolution*

*. Refresh semantic model.
2. Refre*h*report.
3. Re-open*report.

---

## Missing Relations*ips

Symptoms:

- Incorrect*totals
- Blank charts*- Duplicate values

Resolution:

V*lidate*all dimension-to*fact relationships.

---

# Report*Issues

##*Tiles Showing*Blank Data

Cause:

Semantic model*not refreshed.

Resolution:

Refre*h semantic model and reload*report.

---

## Occupancy % Appe*rs Incorrect

Validate measure*

```DAX
Average Occupancy % =
*IVIDE(
    [Total Passenger Load],*   *[Total Capacity]
)
```

Validate*warehouse data before troubleshoot*ng*report visuals.

---

# Deployment*Issues

## Setup Notebook*Failure

Run*setup notebooks in order:

```text*NB_*0_Setp_Environment
NB_01_Setup_Bro*e
NB_02_Setup*Silver
NB_03_Setup_Gold*NB_04_Setup_Warehouse
``*

Do not skip*steps.

---

# Recovery Checklist
*If*the entire environment must*be rebuilt:

1. Follow*Deployment_Guide.md
*. Follow Object_Inventory.md
*. Run Setup notebooks
4. Import En*ineering notebooks
5. Import*Pipeline
6. Build Semantic Model*7. Recreate Report
8. Validate*end-to-end processing