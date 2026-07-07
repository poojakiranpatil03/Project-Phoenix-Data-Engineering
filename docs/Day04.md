🐦‍🔥 Project Phoenix | Day 4
 🚀 Building an End-to-End Snowflake Data Warehouse
Today's session focused on implementing a fully automated, event-driven data ingestion pipeline using Snowpipe Auto-Ingest and AWS event notifications.

In today's session I implemented:
 ✅ Created Snowpipe for continuous data ingestion
 ✅ Understood the difference between manual Snowpipe (ALTER PIPE ... REFRESH) and Auto-Ingest Snowpipe
 ✅ Enabled AUTO_INGEST = TRUE for real-time file processing
 ✅ Configured Amazon SNS for event-driven notifications
 ✅ Integrated Snowflake with AWS SNS using AWS_SNS_TOPIC
 ✅ Generated and applied Snowflake IAM policies for secure cross-account access
 ✅ Configured Amazon S3 Event Notifications for automatic file arrival events
 ✅ Successfully built an end-to-end event-driven ingestion pipeline
 ✅ Validated automatic ingestion by uploading new files to S3 without executing any SQL commands

💡 One interesting learning:
Building cloud-native data pipelines isn't just about writing SQL—it requires understanding how different cloud services communicate securely. One of the biggest learnings today was troubleshooting cross-account permissions between Snowflake and AWS. We encountered multiple integration challenges, including IAM policies, SNS subscriptions, and event notifications. Rather than taking shortcuts, we systematically validated every component until we identified the root cause and successfully achieved fully automated ingestion.
Watching a newly uploaded file appear in the RAW table without running COPY INTO or ALTER PIPE ... REFRESH was incredibly satisfying—it demonstrated the power of event-driven architectures in modern data engineering.

Next up: Building the Silver layer, implementing data quality validations, audit logging, and transforming raw data into business-ready datasets.

LinkedIn Post : https://www.linkedin.com/posts/pooja-kiran-patil_snowflake-dataengineering-clouddataengineering-share-7479601791102291968-C0hw/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABUJavwBn3om7yVOtaEYFJ4p6BIlwfwZ2Mc
