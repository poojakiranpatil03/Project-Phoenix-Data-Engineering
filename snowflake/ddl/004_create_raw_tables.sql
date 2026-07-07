/*
===============================================================================
Project     : Project Phoenix
Description : Creates the RAW landing table.
===============================================================================
*/

USE DATABASE PROJECT_PHOENIX;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE SALES_RAW
(
    SALE_ID         VARCHAR,
    SALE_DATE       VARCHAR,
    STORE_ID        VARCHAR,
    PRODUCT_ID      VARCHAR,
    CUSTOMER_ID     VARCHAR,
    QUANTITY        VARCHAR,
    UNIT_PRICE      VARCHAR,
    TOTAL_AMOUNT    VARCHAR
);

-- Verify
DESC TABLE SALES_RAW;
