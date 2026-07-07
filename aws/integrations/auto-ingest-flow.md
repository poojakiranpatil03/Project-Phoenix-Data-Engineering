# Snowpipe Auto-Ingest Flow

1. A CSV file is uploaded into Amazon S3.

2. Amazon S3 generates an ObjectCreated event.

3. The event is sent to Amazon SNS.

4. Amazon SNS broadcasts the notification.

5. Snowflake's managed SQS queue receives the notification.

6. Snowpipe detects the message.

7. Snowpipe loads the new file into PROJECT_PHOENIX.RAW.SALES_RAW.

Result

No manual COPY INTO command is required.
