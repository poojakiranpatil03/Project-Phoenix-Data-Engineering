# Amazon SQS

Amazon SQS acts as the message queue between Amazon SNS and Snowflake.

Snowflake continuously monitors the managed SQS queue and consumes notifications whenever new files arrive.

Using SQS prevents event loss and provides reliable message delivery.
