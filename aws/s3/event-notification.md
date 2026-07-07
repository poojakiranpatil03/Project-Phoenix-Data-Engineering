# S3 Event Notification

## Purpose

Automatically notify Snowflake whenever a new file arrives.

## Configuration

Event

ObjectCreated

Prefix

landing/sales/

Suffix

.csv

Destination

Amazon SNS Topic

## Result

Whenever a new CSV file is uploaded into the configured folder, Amazon S3 publishes an event to Amazon SNS.
