# Snowflake Deployment Order

Execute the scripts in the following order:

1. ddl/001_create_database.sql
2. ddl/002_create_schemas.sql
3. ddl/003_create_warehouse.sql
4. ddl/004_create_raw_tables.sql
5. file_formats/001_sales_csv_format.sql
6. stages/001_internal_stage.sql
7. storage_integrations/001_storage_integration.sql
8. stages/002_external_stage.sql
9. pipes/001_sales_raw_pipe.sql
10. streams/001_sales_stream.sql
11. merge/001_merge_sales.sql
12. tasks/001_sales_merge_task.sql
