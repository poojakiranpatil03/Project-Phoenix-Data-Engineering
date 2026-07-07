/*
===============================================================================
Project     : Project Phoenix
Description : Named CSV File Format.
===============================================================================
*/

USE DATABASE PROJECT_PHOENIX;
USE SCHEMA RAW;

CREATE OR REPLACE FILE FORMAT SALES_CSV_FORMAT
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"';

-- Verify
SHOW FILE FORMATS;
