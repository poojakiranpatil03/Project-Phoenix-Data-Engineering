/*
===============================================================================
Project     : Project Phoenix
Description : Creates schemas for different layers.
===============================================================================
*/

USE DATABASE PROJECT_PHOENIX;

CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS SILVER;
CREATE SCHEMA IF NOT EXISTS GOLD;

-- Verify
SHOW SCHEMAS;
