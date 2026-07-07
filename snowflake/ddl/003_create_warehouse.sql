/*
===============================================================================
Project     : Project Phoenix
Description : Creates the warehouse used for all project activities.
===============================================================================
*/

CREATE WAREHOUSE IF NOT EXISTS RETAIL_WH
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE;

USE WAREHOUSE RETAIL_WH;

-- Verify
SHOW WAREHOUSES;
