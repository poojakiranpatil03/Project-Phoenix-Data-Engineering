# Amazon SNS

Amazon SNS (Simple Notification Service) broadcasts file arrival notifications.

Snowflake subscribes to the SNS topic through a managed SQS queue.

## Why SNS?

SNS enables one event to be delivered to multiple subscribers.

Examples

- Snowflake
- AWS Lambda
- Email
- Additional SQS Queues
