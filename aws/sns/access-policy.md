# SNS Access Policy

The SNS topic policy allows Snowflake to subscribe to the topic.

It also allows Amazon S3 to publish notifications whenever new files are uploaded.

## Key Permissions

- SNS:Publish
- SNS:Subscribe
- SNS:GetTopicAttributes

During implementation, the Snowflake-generated IAM policy was merged into the SNS Topic Policy to allow successful subscription.
