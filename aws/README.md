# AWS Infrastructure

This folder documents all AWS resources used in Project Phoenix.

The goal of this implementation is to build a production-inspired, event-driven data ingestion pipeline using Amazon Web Services and Snowflake.

## AWS Services Used

- Amazon S3
- Amazon SNS
- Amazon SQS
- IAM
- Event Notifications

## High-Level Architecture

Amazon S3
        │
        ▼
Amazon SNS
        │
        ▼
Snowflake Managed SQS
        │
        ▼
Snowpipe
        │
        ▼
RAW Layer

Each subfolder contains the implementation details, configuration steps, and best practices for the respective AWS service.
