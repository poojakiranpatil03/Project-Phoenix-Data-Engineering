# 🐦‍🔥 Project Phoenix

# Day 3 - Building an Event-Driven Data Ingestion Pipeline with Snowpipe & Amazon S3

---

# Objective

The objective of Day 3 was to extend the data ingestion process beyond Snowflake's internal storage by integrating Amazon S3 with Snowflake.

Instead of manually uploading files into an Internal Stage, we implemented a cloud-native ingestion mechanism using External Stages and Snowpipe. This laid the foundation for an automated, scalable, and production-ready data ingestion architecture.

By the end of this session, data stored in Amazon S3 was successfully loaded into Snowflake using Snowpipe.

---

# Concepts Covered

- Amazon S3
- Storage Integration
- IAM Role & Trust Relationship
- External Stage
- Snowpipe
- AUTO_INGEST
- COPY INTO
- ALTER PIPE REFRESH
- COPY_HISTORY

---

# Why is this needed?

In production environments, source files are rarely uploaded directly into Snowflake.

Instead, they are typically delivered to cloud storage platforms such as Amazon S3, Azure Blob Storage, or Google Cloud Storage.

Snowflake connects securely to these storage services using Storage Integrations and External Stages, enabling scalable and secure cloud-native ingestion.

Snowpipe further automates this process by continuously monitoring cloud storage for newly arriving files.

---

# Architecture

```
                 CSV Files
                     │
                     ▼
              Amazon S3 Bucket
                     │
                     ▼
         Storage Integration
                     │
                     ▼
             External Stage
                     │
                     ▼
                Snowpipe
                     │
                     ▼
             SALES_RAW Table
```

---

# Snowflake Objects Created

| Object | Purpose |
|---------|----------|
| Storage Integration | Secure authentication with Amazon S3 |
| External Stage | References files stored in S3 |
| Snowpipe | Automates data ingestion |
| Named File Format | Defines CSV parsing rules |

---

# Step-by-Step Implementation

## Step 1

Created an Amazon S3 bucket to store incoming source files.

Purpose:

Provide external cloud storage that simulates a production landing zone.

---

## Step 2

Uploaded sample sales data files to Amazon S3.

Purpose:

Create the source data for Snowflake ingestion.

---

## Step 3

Created a Storage Integration.

Purpose:

Allow Snowflake to securely access the S3 bucket without embedding AWS credentials.

---

## Step 4

Configured the IAM Role and Trust Relationship.

Purpose:

Authorize Snowflake to assume the IAM role and access the required S3 location.

---

## Step 5

Created an External Stage.

Purpose:

Reference files stored in Amazon S3 directly from Snowflake.

---

## Step 6

Created a reusable CSV File Format.

Purpose:

Ensure consistent parsing of incoming CSV files.

---

## Step 7

Created Snowpipe.

Purpose:

Automate data loading from the External Stage into the RAW table.

Initially, the pipe was executed using:

```sql
ALTER PIPE SALES_RAW_PIPE REFRESH;
```

to discover and process existing files already present in the stage.

---

## Step 8

Verified the data load.

Validated:

- Records successfully loaded
- COPY_HISTORY
- Pipe execution
- Table contents

---

# Verification

Successfully loaded:

- sales_day1.csv
- sales_day2.csv
- sales_day3.csv

Verified all records were available inside:

```
PROJECT_PHOENIX.RAW.SALES_RAW
```

---

# Key Learnings

One important observation was that Snowpipe remembers which files have already been processed.

Uploading the same file multiple times does not create duplicate records because Snowflake maintains load history internally.

Only newly discovered files are processed unless a manual reload is explicitly requested.

Another important learning was understanding the difference between manual refresh and Auto-Ingest.

Executing:

```sql
ALTER PIPE SALES_RAW_PIPE REFRESH;
```

discovers files that already exist in the External Stage.

It does not enable automatic monitoring of future file arrivals.

---

# Best Practices

- Use Storage Integrations instead of embedding AWS credentials.
- Organize S3 folders using meaningful prefixes.
- Reuse named File Formats.
- Validate ingestion using COPY_HISTORY.
- Use dedicated warehouses for project workloads.

---

# Production Considerations

Production environments generally rely on event-driven architectures rather than manually refreshing Snowpipe.

Instead of executing ALTER PIPE REFRESH, Amazon S3 event notifications trigger Snowpipe automatically whenever a new file arrives.

This architecture minimizes latency and removes the need for scheduled polling.

The implementation of Auto-Ingest using Amazon SNS and Amazon SQS will be completed in the next phase of Project Phoenix.

---

# Interview Questions

### What is a Storage Integration?

### Why do we use an External Stage instead of an Internal Stage?

### How does Snowflake authenticate with Amazon S3?

### What is the purpose of Snowpipe?

### Why doesn't Snowpipe reload previously processed files?

### What is ALTER PIPE REFRESH used for?

### What is the difference between manual Snowpipe and Auto-Ingest Snowpipe?

### Why should Storage Integrations be preferred over AWS access keys?

---

# Summary

Day 3 marked the transition from manual data loading to cloud-native data ingestion.

By integrating Amazon S3 with Snowflake through Storage Integrations, External Stages, and Snowpipe, we built a scalable ingestion framework capable of loading data directly from cloud storage.

This implementation laid the foundation for the fully automated event-driven pipeline that would be completed in the following session using Amazon SNS and Amazon SQS.

---

# Beyond the Implementation

Building a cloud-native data platform involves more than loading files into a database. It requires designing secure integrations between cloud services while ensuring scalability, maintainability, and operational simplicity.

Understanding how Snowflake interacts with cloud object storage is a fundamental step toward building production-ready data engineering solutions.

---

## 📢 LinkedIn Learning Journal

I have also documented the key learnings from this day's implementation on LinkedIn as part of my #ProjectPhoenix learning journey.

🔗 **LinkedIn Post:**  
 https://www.linkedin.com/posts/pooja-kiran-patil_snowflake-aws-amazons3-ugcPost-7478485911710781441-8zpn/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABUJavwBn3om7yVOtaEYFJ4p6BIlwfwZ2Mc

The LinkedIn post provides a concise summary of the day's accomplishments, while this GitHub documentation includes the complete implementation details, technical explanations, and lessons learned.

---

## Author's Note

Project Phoenix is a hands-on learning initiative where I am designing and building an end-to-end cloud data engineering platform using Snowflake, AWS, and modern data engineering tools.

This repository documents not only the final implementation but also the architecture decisions, troubleshooting journey, best practices, and key learnings gained throughout the project. The objective is to build a practical portfolio while developing a deeper understanding of production-ready data engineering concepts.
