/*
===============================================================================
Project     : Project Phoenix
Author      : Pooja Kiran Patil
Description : Creates Storage Integration for Amazon S3.
===============================================================================
*/

USE WAREHOUSE RETAIL_WH;

CREATE OR REPLACE STORAGE INTEGRATION S3_PROJECT_PHOENIX_INT
TYPE = EXTERNAL_STAGE
STORAGE_PROVIDER = S3
ENABLED = TRUE
STORAGE_ALLOWED_LOCATIONS = (
    's3://project-phoenix-sales-data/landing/sales/'
);

-- Retrieve IAM information required in AWS
DESC STORAGE INTEGRATION S3_PROJECT_PHOENIX_INT;
