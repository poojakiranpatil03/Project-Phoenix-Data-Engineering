/*
===============================================================================
Project     : Project Phoenix
Author      : Pooja Kiran Patil
Description : Creates an Internal Stage for loading files into Snowflake.
Created On  : July 2026
===============================================================================
*/

USE WAREHOUSE RETAIL_WH;
USE DATABASE PROJECT_PHOENIX;
USE SCHEMA RAW;

CREATE OR REPLACE STAGE SALES_INTERNAL_STAGE
COMMENT = 'Internal stage for manually uploading sales files';

-- Verify
SHOW STAGES;
LIST @SALES_INTERNAL_STAGE;
