/*
===============================================================================
Project     : Project Phoenix
Author      : Pooja Kiran Patil
Description : Creates External Stage referencing Amazon S3.
===============================================================================
*/

USE WAREHOUSE RETAIL_WH;
USE DATABASE PROJECT_PHOENIX;
USE SCHEMA RAW;

CREATE OR REPLACE STAGE SALES_LANDING_STAGE
URL='s3://project-phoenix-sales-data/landing/sales/'
STORAGE_INTEGRATION = S3_PROJECT_PHOENIX_INT
FILE_FORMAT = SALES_CSV_FORMAT;

-- Verify
DESC STAGE SALES_LANDING_STAGE;

LIST @SALES_LANDING_STAGE;
