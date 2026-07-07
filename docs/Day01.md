# 🐦‍🔥 Project Phoenix

# Day 1 - Setting Up Snowflake & Building the Foundation

---

# Objective

The primary objective of Day 1 was to build the foundation of our cloud data engineering project by creating the core Snowflake objects required for data ingestion.

Instead of directly loading data, we focused on understanding how Snowflake organizes compute, storage, and databases while preparing the environment for future cloud integrations.

By the end of this session, we successfully created our first data warehouse and performed our first production-style data load.

---

# Concepts Covered

- Snowflake Architecture
- Virtual Warehouse
- Database
- Schema
- Internal Stage
- File Format
- COPY INTO
- COPY_HISTORY
- Data Loading

---

# Why is this needed?

Before building any data pipeline, we need an environment capable of storing and processing data.

Snowflake separates storage from compute, allowing warehouses to process data independently of where the data is stored.

Understanding these building blocks is essential before implementing more advanced concepts like Streams, Tasks and Snowpipe.

---

# Snowflake Objects Created

| Object | Purpose |
|---------|----------|
| RETAIL_WH | Virtual Warehouse used for computation |
| PROJECT_PHOENIX | Database |
| RAW Schema | Landing area for raw data |
| Internal Stage | Temporary file storage |
| CSV File Format | Defines how CSV files are parsed |
| SALES_RAW | Landing table |

---

# Implementation Steps

## Step 1

Created a dedicated warehouse.

Purpose:

Provide compute resources for executing SQL statements.

---

## Step 2

Created the PROJECT_PHOENIX database.

Purpose:

Store all project-related objects separately from system databases.

---

## Step 3

Created the RAW schema.

Purpose:

Store data exactly as received from the source system.

No transformations are applied in this layer.

---

## Step 4

Created an Internal Stage.

Purpose:

Store files inside Snowflake before loading them.

---

## Step 5

Created a named CSV File Format.

Purpose:

Centralize file parsing configuration so multiple COPY commands can reuse the same definition.

---

## Step 6

Loaded the CSV file using COPY INTO.

Purpose:

Bulk load source data into the RAW table.

---

## Step 7

Verified the data load.

Validated:

- Row count
- Data quality
- COPY_HISTORY

---

# Key Learning

One interesting observation was that Snowflake remembers previously loaded files.

Executing COPY INTO multiple times against the same staged file does not reload duplicate data unless FORCE = TRUE is specified.

This built-in mechanism helps prevent accidental duplicate ingestion.

---

# Best Practices

- Use dedicated warehouses for projects.
- Keep RAW data unchanged.
- Create reusable File Formats.
- Validate loads using COPY_HISTORY.
- Avoid FORCE = TRUE unless reprocessing is intended.

---

# Production Considerations

In production environments:

- Internal Stages are generally replaced by External Stages.
- Data typically arrives from cloud storage such as Amazon S3.
- Loading is automated using Snowpipe rather than manual COPY INTO commands.

These concepts will be implemented in later phases of Project Phoenix.

---

# Interview Questions

### What is the difference between a Warehouse and a Database?

### Why do we create a named File Format?

### What is COPY_HISTORY used for?

### Why doesn't COPY INTO reload the same file?

### What is the purpose of the RAW layer?

---

# Summary

Day 1 established the foundation for Project Phoenix.

We created the core Snowflake objects required for data ingestion and learned how Snowflake loads data efficiently while preventing duplicate file ingestion.

This foundation will be extended in the upcoming sessions by introducing Change Data Capture (CDC), Streams, Tasks, and cloud-native data ingestion using AWS.

# Published on LinkedIn : 

LinkedIn Post : https://www.linkedin.com/posts/pooja-kiran-patil_snowflake-dataengineering-sql-share-7477791234292436995-ZhZW/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABUJavwBn3om7yVOtaEYFJ4p6BIlwfwZ2Mc
