# 🐦‍🔥 Project Phoenix

# Day 2 - Implementing Change Data Capture (CDC) using Streams, MERGE & Tasks

---

# Objective

The objective of Day 2 was to transform our manual data loading process into an incremental data pipeline by implementing Change Data Capture (CDC).

Instead of processing the entire dataset every time, we explored how Snowflake captures only the changed records and applies them efficiently to downstream tables.

By the end of this session, we successfully implemented Streams, MERGE, and Tasks to build an automated incremental loading process.

---

# Concepts Covered

- Change Data Capture (CDC)
- Streams
- METADATA Columns
- MERGE
- Tasks
- Incremental Loading
- Pipeline Automation

---

# Why is this needed?

Reloading an entire dataset every day is inefficient and expensive.

Modern data engineering focuses on processing only the data that has changed since the previous execution.

Snowflake Streams make this possible by tracking table changes without duplicating the underlying data.

Combined with MERGE and Tasks, they provide a simple yet powerful mechanism for building incremental data pipelines.

---

# Architecture

```

Source Table
│
▼
Snowflake Stream
│
▼
MERGE Statement
│
▼
Target Table
│
▼
Snowflake Task

```

---

# Snowflake Objects Created

| Object | Purpose |
|---------|----------|
| Stream | Tracks INSERT, UPDATE and DELETE operations |
| Target Table | Stores processed records |
| MERGE Statement | Performs incremental updates |
| Task | Automates pipeline execution |

---

# Step-by-Step Implementation

## Step 1

Created a Stream on the RAW table.

Purpose:

Track all changes occurring in the source table.

---

## Step 2

Performed INSERT operations.

Observed:

Streams captured newly inserted rows.

---

## Step 3

Performed UPDATE operations.

Observed:

An UPDATE operation generated two records inside the Stream:

- DELETE
- INSERT

This represents the old version and the new version of the row.

---

## Step 4

Performed DELETE operations.

Observed:

Deleted rows appeared inside the Stream with the appropriate metadata.

---

## Step 5

Explored Stream Metadata Columns.

The following metadata columns were used:

- METADATA$ACTION
- METADATA$ISUPDATE

These columns help identify the type of change captured by the Stream.

---

## Step 6

Created a MERGE statement.

Purpose:

Synchronize the target table using only incremental changes captured by the Stream.

---

## Step 7

Created a Task.

Purpose:

Automate execution of the MERGE process.

Instead of manually executing SQL, Snowflake Tasks schedule and execute pipelines automatically.

---

# Verification

Validated that:

✅ INSERT operations reached the target table

✅ UPDATE operations correctly modified existing rows

✅ DELETE operations removed the corresponding records

✅ MERGE processed only incremental changes

✅ Tasks executed successfully

---

# Key Learnings

One of the biggest learnings was understanding that Snowflake Streams do not store another copy of the changed data.

Instead, they maintain a change log on the source table and expose only the incremental records required for downstream processing.

Another important observation was that an UPDATE operation is internally represented as a DELETE followed by an INSERT.

Understanding this behavior is essential while building production-grade CDC pipelines.

---

# Best Practices

- Create Streams only on source tables that require change tracking.
- Consume Streams regularly to avoid unnecessary backlog.
- Use MERGE instead of DELETE + INSERT logic.
- Automate pipelines using Tasks.
- Validate metadata columns before implementing business logic.

---

# Production Considerations

In enterprise environments:

- Streams are commonly used for incremental ETL pipelines.
- MERGE operations synchronize dimension and fact tables.
- Tasks orchestrate automated data processing.
- CDC significantly reduces processing time and compute cost compared to full reloads.

---

# Interview Questions

### What is Change Data Capture (CDC)?

### How do Snowflake Streams work?

### Why doesn't a Stream duplicate the source table?

### Why is an UPDATE represented as DELETE + INSERT?

### What is the purpose of METADATA$ACTION?

### What is METADATA$ISUPDATE?

### When would you use MERGE instead of INSERT?

### How do Snowflake Tasks automate pipelines?

### What happens after a Stream is consumed?

### What are the advantages of incremental loading?

---

# Summary

Day 2 introduced one of the most important concepts in modern data engineering—Change Data Capture.

Using Streams, MERGE, and Tasks, we transformed a manual data loading process into an automated incremental pipeline capable of efficiently processing only changed data.

This significantly improves scalability, reduces compute costs, and forms the foundation for production-grade ETL architectures.

---

# Beyond the Implementation

Implementing CDC is not just about capturing data changes—it is about designing pipelines that scale efficiently as data volumes grow.

By processing only incremental changes instead of full datasets, organizations reduce compute costs, improve processing times, and enable near real-time analytics.

Snowflake's combination of Streams, MERGE, and Tasks provides a simple yet powerful framework for building reliable and maintainable cloud-native data pipelines.

# Real-World Scenario

Imagine a banking application where millions of customer transactions are processed every day.

Reloading the entire transaction history after every change would be inefficient.

Instead, Streams capture only the newly inserted, updated, or deleted records.

A scheduled Task executes a MERGE statement that synchronizes the reporting tables with only the incremental changes.

This approach minimizes compute costs while ensuring that downstream systems always have the latest data.

# Published on LinkedIn

LinkedIn Post : https://www.linkedin.com/posts/pooja-kiran-patil_snowflake-dataengineering-clouddataengineering-share-7478096078609760256-49RT/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABUJavwBn3om7yVOtaEYFJ4p6BIlwfwZ2Mc
