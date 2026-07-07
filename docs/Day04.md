# Day 04 - Building an Event-Driven Snowpipe Pipeline with SNS & SQS

## 🎯 Objective

Today's goal was to transform the data ingestion process from manual loading into a fully event-driven pipeline.

Whenever a new CSV file is uploaded into Amazon S3, Snowflake should automatically detect the file and load it into the RAW layer without any manual intervention.

This is one of the most important milestones in Project Phoenix because it closely resembles how production-grade cloud data platforms ingest files in real time.

---

# Architecture

S3 Bucket
      │
      ▼
Amazon SNS Topic
      │
      ▼
Snowflake Managed SQS Queue
      │
      ▼
Snowpipe
      │
      ▼
RAW Table

---

# What I Built

## Amazon SNS

Created a Standard SNS Topic.

Purpose:

- Receive object creation notifications from Amazon S3
- Broadcast notifications to subscribed systems
- Act as the event broker between S3 and Snowflake

---

## Amazon SQS

Created an SQS Queue.

Purpose:

- Receive notifications from SNS
- Deliver notifications reliably
- Buffer events before Snowflake consumes them

---

## Amazon S3 Event Notification

Configured an Event Notification on the S3 bucket.

Configuration:

Prefix:
landing/sales/

Suffix:
.csv

Event:
ObjectCreated

Destination:
SNS Topic

Result:

Only CSV files uploaded into the landing/sales/ folder trigger notifications.

---

## Snowpipe

Recreated the existing pipe using AUTO_INGEST.

```sql
CREATE OR REPLACE PIPE SALES_RAW_PIPE
AUTO_INGEST = TRUE
AWS_SNS_TOPIC = '<SNS Topic ARN>'
AS
COPY INTO PROJECT_PHOENIX.RAW.SALES_RAW
FROM @SALES_LANDING_STAGE
FILE_FORMAT = (
    FORMAT_NAME = SALES_CSV_FORMAT
);
```

---

## Automatic Data Loading

Uploaded:

sales_day5.csv

Result:

The file was automatically detected and loaded into the RAW table.

No COPY INTO command was executed manually.

Snowpipe handled the ingestion automatically.

---

# Verification Steps

Verified:

- SNS Topic created successfully
- SQS Queue subscribed successfully
- Snowpipe recreated with AUTO_INGEST
- S3 Event Notification configured
- Notification Channel generated
- sales_day5.csv automatically loaded

---

# 🏆 Milestone Achieved

✅ Successfully implemented a fully event-driven ingestion pipeline.

Uploading a file to Amazon S3 now automatically triggers:

Amazon S3 → SNS → Snowflake Managed SQS → Snowpipe → RAW Table

This marks the completion of Project Phoenix's automated ingestion layer and lays the foundation for building the Silver and Gold layers.

---

# Challenges Faced

This implementation required several troubleshooting iterations before the pipeline became fully operational.

Some of the issues encountered included:

- SNS Topic validation failures
- Authorization errors while subscribing Snowflake
- Missing SNS Subscribe permissions
- Pending SNS Subscription confirmations
- Incorrect Event Notification destination
- AUTO_INGEST missing from the original pipe
- CSV File Format corrections
- Snowflake Notification Integration compatibility issues
- Multiple policy updates before successful subscription
- S3 Event Notification pointing to the old SNS Topic

Each issue helped build a deeper understanding of how Snowflake and AWS integrate behind the scenes.

---

# Key Learnings

## Why SNS?

SNS enables event broadcasting.

One notification can be delivered to multiple subscribers simultaneously.

Example:

- Snowflake
- Lambda
- Email
- Another SQS Queue
- Monitoring System

---

## Why SQS?

SQS provides durability and reliable message delivery.

Snowflake consumes notifications from a managed SQS queue instead of polling Amazon S3 continuously.

---

## Why Snowpipe?

Snowpipe enables serverless continuous data ingestion.

Benefits include:

- Near real-time loading
- No scheduling required
- Reduced warehouse usage
- Event-driven architecture
- Automatic scaling

---

## Production Insight

In enterprise environments:

Amazon S3 is only responsible for storing files.

SNS broadcasts events.

SQS guarantees delivery.

Snowpipe automatically loads data.

This decoupled architecture is scalable, resilient, and cost-efficient.

---

# Next Steps

Day 05

- Validate incremental ingestion
- Explore COPY_HISTORY
- Monitor Snowpipe load history
- Build Silver Layer transformations
- Begin production-grade data modeling

---

## 📢 LinkedIn Learning Journal

I have also documented the key learnings from this day's implementation on LinkedIn as part of my #ProjectPhoenix learning journey.

🔗 **LinkedIn Post:**  
https://www.linkedin.com/posts/pooja-kiran-patil_snowflake-dataengineering-clouddataengineering-share-7479601791102291968-C0hw/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABUJavwBn3om7yVOtaEYFJ4p6BIlwfwZ2Mc

The LinkedIn post provides a concise summary of the day's accomplishments, while this GitHub documentation includes the complete implementation details, technical explanations, and lessons learned.

---

## Author's Note

Project Phoenix is a hands-on learning initiative where I am designing and building an end-to-end cloud data engineering platform using Snowflake, AWS, and modern data engineering tools.

This repository documents not only the final implementation but also the architecture decisions, troubleshooting journey, best practices, and key learnings gained throughout the project. The objective is to build a practical portfolio while developing a deeper understanding of production-ready data engineering concepts.
