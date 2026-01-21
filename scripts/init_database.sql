-- Create Database and Schemas

/*
This code checks if the datawarehouse database exists, drops it if found, and then recreates it fresh, then creates the schemas.

⚠️ Caution: Dropping and recreating a database will permanently erase all existing data, schemas, and objects inside it. Use this script only in development or testing environments, and never run it on a production database unless you are absolutely certain you want to lose all stored information.

*/


-- Step 1: Create the main database
-- The IF NOT EXISTS clause ensures that the database is only created
-- if it does already exist, it drops it, preventing errors or duplication.
CREATE DATABASE IF NOT EXISTS DataWarehouse;
DO $$
BEGIN
   IF EXISTS (SELECT FROM pg_database WHERE datname = 'datawarehouse') THEN
      EXECUTE 'DROP DATABASE datawarehouse';
   END IF;

   EXECUTE 'CREATE DATABASE datawarehouse';
END
$$;




-- Step 2: Create schemas within the database
-- Schemas are logical containers used to organize tables, views,
-- and other database objects. They help structure data into layers.

-- Bronze schema:
-- This layer typically stores raw, unprocessed data exactly as it is ingested.
CREATE SCHEMA Bronze;

-- Silver schema:
-- This layer usually contains cleaned, transformed, and standardized data.
-- It serves as an intermediate stage between raw and curated datasets.
CREATE SCHEMA Silver;

-- Gold schema:
-- This layer holds curated, aggregated, and business-ready data.
-- It is optimized for analytics, reporting, and decision-making.
CREATE SCHEMA Gold;
