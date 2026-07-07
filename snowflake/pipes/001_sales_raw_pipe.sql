/*
===============================================================================
Project     : Project Phoenix
Author      : Pooja Kiran Patil
Description : Creates Snowpipe for automatic ingestion.
===============================================================================
*/

USE WAREHOUSE RETAIL_WH;
USE DATABASE PROJECT_PHOENIX;
USE SCHEMA RAW;

CREATE OR REPLACE PIPE SALES_RAW_PIPE
AUTO_INGEST = TRUE
AS
COPY INTO PROJECT_PHOENIX.RAW.SALES_RAW
FROM @SALES_LANDING_STAGE
FILE_FORMAT = (
    FORMAT_NAME = SALES_CSV_FORMAT
);

-- Verify
SHOW PIPES;

DESC PIPE SALES_RAW_PIPE;

SELECT SYSTEM$PIPE_STATUS('SALES_RAW_PIPE');
