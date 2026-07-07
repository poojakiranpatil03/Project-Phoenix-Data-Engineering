/*
===============================================================================
Project     : Project Phoenix
Author      : Pooja Kiran Patil
Description : Creates Stream for Change Data Capture (CDC).
===============================================================================
*/

USE WAREHOUSE RETAIL_WH;
USE DATABASE PROJECT_PHOENIX;
USE SCHEMA RAW;

CREATE OR REPLACE STREAM SALES_RAW_STREAM
ON TABLE SALES_RAW;

-- Verify
SHOW STREAMS;

SELECT *
FROM SALES_RAW_STREAM;
