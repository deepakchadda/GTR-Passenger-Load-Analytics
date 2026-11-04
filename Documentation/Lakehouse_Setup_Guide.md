# Lakehouse Folder Structure

The solution uses both the Files and Tables areas of each Lakehouse.

---

## Bronze Lakehouse

### Name

```text
LH_GTR_Bronze
```

### Files Area

```text
Files
└── Source
    ├── PassengerLoad
    ├── Stations
    ├── Routes
    ├── Operators
    └── Fleet
```

Purpose:

- Landing zone for raw source files
- Original files retained for traceability
- Source for Bronze ingestion notebooks

### Tables Area

```text
Tables
├── BronzePassengerLoad
├── BronzeStation
├── BronzeRoute
├── BronzeOperator
├── BronzeFleet
└── BronzeLoadQueue
```

---

## Silver Lakehouse

### Name

```text
LH_GTR_Silver
```

### Files Area

```text
Files
└── Storage
```

Purpose:

- Intermediate transformed datasets
- Temporary processing outputs
- Staging area for Silver transformations

### Tables Area

```text
Tables
├── SilverPassengerLoad
├── SilverStation
├── SilverRoute
├── SilverOperator
├── SilverFleet
└── SilverLoadQueue
```

---

## Gold Lakehouse

### Name

```text
LH_GTR_Gold
```

### Files Area

```text
Files
└── Storage
```

Purpose:

- Curated business-ready datasets
- Gold layer exports
- Analytics-ready storage

### Tables Area

```text
Tables
├── DimDate
├── DimFleet
├── DimOperator
├── DimRoute
├── DimStation
├── FactPassengerLoad
└── GoldLoadQueue
```

---

# Warehouse Structure

### Name

```text
WH_GTR_Analytics
```

### Schema

```text
dbo
├── DimDate
├── DimFleet
├── DimOperator
├── DimRoute
├── DimStation
├── FactPassengerLoad
├── BronzeLoadQueue
├── SilverLoadQueue
└── GoldLoadQueue
```