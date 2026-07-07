# 🐦‍🔥 Project Phoenix
### Building an End-to-End Cloud Data Engineering Platform

## 📖 About the Project

Project Phoenix is a hands-on data engineering project designed to simulate a real-world enterprise data platform using modern cloud technologies.

The objective is to build an end-to-end data pipeline from data ingestion to reporting while following industry best practices, documenting every implementation step, troubleshooting challenges, and sharing key learnings.

This project focuses not only on building data pipelines but also on understanding the architecture, design decisions, cloud integrations, and production-ready implementation patterns used by modern data engineering teams.

---

## 🚀 Project Objectives

- Build a production-style cloud data engineering project
- Learn modern Snowflake features through hands-on implementation
- Integrate AWS services with Snowflake
- Build scalable and automated data pipelines
- Implement Change Data Capture (CDC)
- Automate incremental data loading
- Orchestrate workflows using cloud-native services
- Document implementation, troubleshooting, and learnings
- Create a portfolio project demonstrating practical data engineering skills

---

# 🛠️ Technology Stack

## Cloud

- Snowflake
- AWS S3
- Amazon SNS
- Amazon SQS

## Data Engineering

- Snowpipe
- Streams
- Tasks
- SQL
- ETL

## Upcoming Technologies

- dbt
- Apache Airflow
- AWS Glue
- Snowpark Python
- Power BI
- Python
- AI-assisted Data Engineering

---

# 🏗️ Project Architecture

```
                 Source Files (CSV)
                        │
                        ▼
                 Amazon S3 Bucket
                        │
          Object Created Event
                        │
                        ▼
                  Amazon SNS
                        │
                        ▼
        Snowflake Managed SQS Queue
                        │
                        ▼
                 Snowpipe Auto Ingest
                        │
                        ▼
                  RAW Layer
                        │
                        ▼
                 Streams (CDC)
                        │
                        ▼
                  MERGE Logic
                        │
                        ▼
                 SILVER Layer
                        │
                        ▼
                  GOLD Layer
                        │
                        ▼
                  Analytics / BI
```

---

# 📚 Learning Progress

| Day | Topic | Status |
|------|------------------------------|---------|
| Day 1 | Snowflake Setup & Data Loading | ✅ Completed |
| Day 2 | Streams, CDC, MERGE & Tasks | ✅ Completed |
| Day 3 | Snowpipe, S3, SNS & Auto Ingest | ✅ Completed |
| Day 4 | Event-Driven Data Pipeline | ✅ Completed |
| Day 5 | Coming Soon | 🚧 |

---

# 📂 Repository Structure

```
Project-Phoenix-Data-Engineering
│
├── architecture/
├── aws/
├── docs/
├── sample-data/
├── screenshots/
├── snowflake/
├── sql/
└── README.md
```

---

# 🎯 Features Implemented

- Snowflake Warehouse Setup
- Database & Schema Design
- Internal & External Stages
- File Formats
- COPY INTO
- Error Handling
- Change Data Capture (CDC)
- Streams
- MERGE
- Tasks
- AWS Storage Integration
- Amazon S3 Integration
- Snowpipe Auto Ingest
- Amazon SNS Integration
- Event-Driven Data Pipeline

---

# 📖 Documentation

This repository includes:

- Step-by-step implementation guides
- Architecture diagrams
- SQL scripts
- AWS configuration
- Snowflake configuration
- Troubleshooting guide
- Lessons learned
- Interview questions
- Project screenshots

---

# 💡 Key Learnings

Throughout this project, I am documenting not only the successful implementation but also the troubleshooting process, design decisions, and best practices followed while building a production-style data engineering solution.

---

# 🚀 Upcoming Enhancements

- Dynamic Tables
- Snowpark Python
- dbt
- Apache Airflow
- AWS Glue
- Data Quality Framework
- Audit Framework
- CI/CD Pipeline
- AI-assisted Monitoring
- Power BI Dashboard

---

# 🤝 Connect With Me

If you're interested in Snowflake, Cloud Data Engineering, or modern ETL architectures, feel free to connect and share your feedback.

Let's learn and grow together!

---

⭐ If you find this project useful, feel free to star the repository.
