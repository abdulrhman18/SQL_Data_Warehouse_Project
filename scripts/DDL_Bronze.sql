/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Purpose:
    - This script creates all required tables in the 'bronze' schema.
    - If a table already exists, it is first dropped to avoid conflicts.
    - Run this script to reset/redefine the Bronze layer table structure.

Notes:
    - Make sure the 'bronze' schema exists before running this script.
    - Dropping tables will **delete all existing data**.
===============================================================================
*/

-----------------------------------------
-- Table: crm_cust_info (CRM Customer Info)
-----------------------------------------
-- Drop the table if it already exists
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

-- Create the table
CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,            -- Customer ID (Primary key candidate)
    cst_key             NVARCHAR(50),   -- Customer Key (business identifier)
    cst_firstname       NVARCHAR(50),   -- Customer First Name
    cst_lastname        NVARCHAR(50),   -- Customer Last Name
    cst_marital_status  NVARCHAR(50),   -- Marital status (e.g., Single, Married)
    cst_gndr            NVARCHAR(50),   -- Gender
    cst_create_date     DATE            -- Customer creation date
);
GO

-----------------------------------------
-- Table: crm_prd_info (CRM Product Info)
-----------------------------------------
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,            -- Product ID (Primary key candidate)
    prd_key      NVARCHAR(50),   -- Product Key (business identifier)
    prd_nm       NVARCHAR(50),   -- Product Name
    prd_cost     INT,            -- Cost of the product
    prd_line     NVARCHAR(50),   -- Product Line or Category
    prd_start_dt DATETIME,       -- Product Start Date
    prd_end_dt   DATETIME        -- Product End Date (if discontinued)
);
GO

-----------------------------------------
-- Table: crm_sales_details (CRM Sales Data)
-----------------------------------------
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),  -- Sales Order Number
    sls_prd_key  NVARCHAR(50),  -- Product Key (links to crm_prd_info)
    sls_cust_id  INT,           -- Customer ID (links to crm_cust_info)
    sls_order_dt INT,           -- Order Date (as INT, e.g., YYYYMMDD)
    sls_ship_dt  INT,           -- Ship Date
    sls_due_dt   INT,           -- Due Date
    sls_sales    INT,           -- Total Sales Amount
    sls_quantity INT,           -- Quantity Sold
    sls_price    INT            -- Unit Price
);
GO

-----------------------------------------
-- Table: erp_loc_a101 (ERP Locations)
-----------------------------------------
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),   -- Customer or Location ID
    cntry  NVARCHAR(50)    -- Country
);
GO

-----------------------------------------
-- Table: erp_cust_az12 (ERP Customer Info)
-----------------------------------------
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),   -- Customer ID
    bdate  DATE,           -- Birth Date
    gen    NVARCHAR(50)    -- Gender
);
GO

-----------------------------------------
-- Table: erp_px_cat_g1v2 (ERP Product Categories)
-----------------------------------------
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),   -- Category ID
    cat          NVARCHAR(50),   -- Main Category
    subcat       NVARCHAR(50),   -- Subcategory
    maintenance  NVARCHAR(50)    -- Maintenance Information
);
GO

/*
===============================================================================
End of Bronze Tables DDL Script
===============================================================================
*/
