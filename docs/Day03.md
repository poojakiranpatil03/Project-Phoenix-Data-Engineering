🐦‍🔥 Project Phoenix | Day 3
 🚀 Building an End-to-End Snowflake Data Warehouse

Today's focus was on building a secure cloud ingestion pipeline by integrating AWS S3 with Snowflake using enterprise-grade authentication instead of access keys.

In today's session I implemented:
 ✅ Created an AWS account with Budget & Cost Alerts to monitor cloud spending
 ✅ Created and organized an Amazon S3 bucket with a structured landing layer (landing/sales)
 ✅ Uploaded source sales files to Amazon S3
 ✅ Created a Least-Privilege IAM Policy following security best practices
 ✅ Configured an IAM Role for Snowflake access to Amazon S3
 ✅ Built a Snowflake Storage Integration using IAM Role authentication
 ✅ Established a secure Trust Relationship between Snowflake and AWS
 ✅ Created an External Stage pointing to Amazon S3
 ✅ Successfully queried files stored in Amazon S3 directly from Snowflake using the External Stage

💡 One interesting learning:
Integrating Snowflake with Amazon S3 isn't just about creating an External Stage. The real foundation lies in securely establishing trust between Snowflake and AWS using Storage Integrations, IAM Roles, Trust Relationships, and the Principle of Least Privilege. This eliminates the need to store long-lived access keys while providing a scalable and secure architecture for cloud-based data ingestion.
Another valuable takeaway was that troubleshooting cloud integrations requires validating each layer independently—from IAM permissions and trust policies to storage integrations, stages, and finally the data itself. Systematic debugging is often more valuable than repeatedly changing configurations.
I'm really enjoying seeing how modern cloud data engineering extends beyond ETL development into cloud security, infrastructure, and architecture. Every layer plays an important role in building reliable and production-ready data pipelines.

Next up: Loading data into the RAW (Bronze) layer from Amazon S3, automating ingestion using Snowpipe, and designing an Enterprise Audit Framework as part of Project Phoenix.

LinkedIn Post : https://www.linkedin.com/posts/pooja-kiran-patil_snowflake-aws-amazons3-ugcPost-7478485911710781441-8zpn/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABUJavwBn3om7yVOtaEYFJ4p6BIlwfwZ2Mc
