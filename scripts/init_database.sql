/*
==============================================================
  Script Name : create_database.sql
  Project     : Modern Data Warehouse
  Author      : Abdulrahman Ahmed
  Description : 
      This script creates the Data Warehouse database and
      initializes the schema layers used in the Medallion
      Architecture (Bronze, Silver, Gold).

  Created On  : 2026
==============================================================

⚠️ WARNING:
This script will create a new database named 'DataWarehouse'.
Make sure that:
- The database does NOT already exist.
- You have the necessary permissions to create databases.
- The script is executed in the correct SQL Server environment.

It is recommended to run this script in a development environment first.
==============================================================
*/

--------------------------------------------------------------
-- Step 1: Check if the database already exists
--------------------------------------------------------------
IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'DataWarehouse'
)
BEGIN

    PRINT 'Creating DataWarehouse database...';

    ----------------------------------------------------------
    -- Step 2: Create the Data Warehouse database
    ----------------------------------------------------------
    CREATE DATABASE DataWarehouse;

END
ELSE
BEGIN
    PRINT 'Database "DataWarehouse" already exists. Creation skipped.';
END
GO

--------------------------------------------------------------
-- Step 3: Switch context to the DataWarehouse database
--------------------------------------------------------------
USE DataWarehouse;
GO

--------------------------------------------------------------
-- Step 4: Create Bronze Schema (Raw Data Layer)
-- Stores raw data ingested from source systems
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
    PRINT 'Schema "bronze" created.';
END
GO

--------------------------------------------------------------
-- Step 5: Create Silver Schema (Cleaned Data Layer)
-- Stores cleaned and transformed data
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
    PRINT 'Schema "silver" created.';
END
GO

--------------------------------------------------------------
-- Step 6: Create Gold Schema (Analytical Layer)
-- Stores fact and dimension tables for analytics
--------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
    PRINT 'Schema "gold" created.';
END
GO

--------------------------------------------------------------
-- Script Completed
--------------------------------------------------------------
PRINT 'Data Warehouse environment setup completed successfully.';
