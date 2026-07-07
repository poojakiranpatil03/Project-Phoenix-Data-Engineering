🐦‍🔥 Project Phoenix | Day 1
🚀 Building an End-to-End Snowflake Data Warehouse

Today I started building a complete Snowflake project from scratch to deepen my understanding of modern data engineering.

In today's session I implemented:
 ✅ Created Warehouse, Database and Schemas
 ✅ Designed a Raw Layer
 ✅ Created reusable File Formats
 ✅ Built an Internal Stage
 ✅ Loaded CSV files using COPY INTO
 ✅ Explored COPY_HISTORY
 ✅ Understood how Snowflake prevents duplicate file loads without using FORCE=TRUE

One interesting learning:
Snowflake tracks loaded files at the target table level, preventing accidental duplicate ingestion while still allowing the same file to be loaded into another table when required.

Looking forward to building CDC with Streams, Tasks, Snowpipe, dbt and more in the coming days.

LinkedIn Post : https://www.linkedin.com/posts/pooja-kiran-patil_snowflake-dataengineering-sql-share-7477791234292436995-ZhZW/?utm_source=share&utm_medium=member_desktop&rcm=ACoAABUJavwBn3om7yVOtaEYFJ4p6BIlwfwZ2Mc
