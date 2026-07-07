# Amazon S3

Amazon S3 acts as the landing zone for incoming source files.

Files uploaded into the configured prefix trigger an Event Notification that starts the automatic ingestion process.

## Components

- S3 Bucket
- Folder Structure
- Event Notification

## Folder Structure

landing/
└── sales/

Only CSV files uploaded into this folder trigger Snowpipe.
