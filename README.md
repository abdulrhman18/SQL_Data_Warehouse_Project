# Data Warehouse & ETL Project

## 📌 Project Overview
This project demonstrates the design and implementation of a **Data Warehouse system using SQL**, including the development of a complete **ETL (Extract, Transform, Load) pipeline**.

The goal of this project is to transform raw operational data into a structured **analytical data warehouse** that supports **reporting, analytics, and business intelligence**.

The project follows modern **Data Engineering and Data Warehousing practices**, including:

- Data modeling
- Data cleaning and transformation
- ETL pipeline design
- Structured data loading
- Analytical data modeling

The final data warehouse is designed to make **business reporting and dashboard creation easier and more efficient**.

---

# 🏗️ Data Warehouse Architecture

The project follows the **Medallion Architecture** with three layers:

### 1️⃣ Bronze Layer – Raw Data
- Stores raw data exactly as received from source systems
- Data is loaded using **BULK INSERT**
- No transformations are applied
- Serves as the historical source of truth

### 2️⃣ Silver Layer – Cleaned & Transformed Data
- Performs **data cleaning and transformation**
- Fixes data quality issues
- Standardizes formats
- Applies business logic

### 3️⃣ Gold Layer – Business Data Model
- Contains the **analytical data model**
- Designed using **Star Schema**
- Includes **Fact and Dimension tables**
- Optimized for **reporting and dashboards**

---

## 📂 Project Structure

```text
data-warehouse-project
│
├── datasets
│   ├── crm
│   └── erp
│
├── docs
│   ├── Data_Integration.png
│   ├── Data_Architecture.png
│   ├── Data_catalog.md
│   ├── Data_flow.png
│   └── Naming_conventions.md
│
├── scripts
│   ├── bronze
│   │   ├── Bulk_Insert_Bronze.sql
│   │   └── DDL_Bronze.sql
│   │
│   ├── silver
│   │   ├── DDL_Silver.sql
│   │   └── Transformation_Silver.sql
│   │
│   ├── gold
│   │   └── DDL_Gold.sql
│   │
│   └── eda
│       ├── EDA.sql
│       ├── customer_report.sql
│       └── product_report.sql
│
├── init_database
│
├── tests
│   ├── quality_checks_gold.sql
│   └── quality_check_silver.sql
│
└── README.md
```

### 📌 Folder Description

**datasets**  
Contains the raw datasets from different source systems:
- **crm** → Customer Relationship Management data  
- **erp** → Enterprise Resource Planning data  

**docs**  
Project documentation and architecture diagrams:
- Data architecture
- Data flow
- Data integration
- Naming conventions
- Data catalog

**scripts**  
All SQL scripts used to build and process the data warehouse.

- **bronze** → Raw data loading scripts  
- **silver** → Data cleaning and transformation scripts  
- **gold** → Analytical data model (fact & dimension tables)  
- **eda** → SQL queries used for exploratory data analysis and reports  

**init_database**  
Scripts used to initialize and configure the database.

**tests**  
Data quality validation scripts to ensure the integrity of the **Silver and Gold layers**.

---

If you want, I can also show you **how to add the architecture images in README so they appear visually on GitHub**, which makes the project **look much more professional for recruiters**.


---

# 🔄 ETL Pipeline

The ETL pipeline consists of three main stages:

## Extract
Data is extracted from multiple **source systems**:

- CRM system
- ERP system

The raw data is stored as **CSV files** and loaded into the **Bronze Layer**.

---

## Transform
In the **Silver Layer**, data is transformed by:

- Cleaning invalid records
- Handling missing values
- Standardizing data formats
- Removing duplicates
- Applying business logic

These transformations ensure **high data quality and consistency**.

---

## Load
The cleaned data is loaded into the **Gold Layer**, where:

- Fact tables store transactional data
- Dimension tables store descriptive attributes

This structure enables **fast analytical queries and business reporting**.

---

# ⭐ Data Model (Star Schema)

The final data warehouse uses a **Star Schema**, which is commonly used in **Business Intelligence systems**.

### Dimension Tables
- `dim_customers`
- `dim_products`
- `dim_dates`

### Fact Tables
- `fact_sales`

This design improves **query performance and simplifies analysis**.

---

# 🛠️ Technologies Used

- **SQL Server**
- **T-SQL**
- **ETL Pipelines**
- **Data Warehousing Concepts**
- **Star Schema Modeling**
- **Git & GitHub**

---

# 📊 Key Features

✔️ End-to-end **Data Warehouse implementation**  
✔️ Full **ETL pipeline** using SQL  
✔️ Multi-layer architecture (**Bronze → Silver → Gold**)  
✔️ Data cleaning and transformation  
✔️ Analytical **Star Schema design**  
✔️ Ready for **BI tools like Power BI or Tableau**

---

# 🚀 Future Improvements

Some potential future improvements include:

- Automating the ETL pipeline using **Airflow or SSIS**
- Adding **incremental data loading**
- Connecting the warehouse to **Power BI dashboards**
- Implementing **data quality checks**
- Scheduling automated data refresh


---

# 👨‍💻 Author

**Abdulrahman Ahmed**

Computer Science Graduate – Cairo University  
Aspiring **Data Analyst / Data Engineer**

Skills:
- SQL
- Python
- Power BI
- Data Analysis
- Data Warehousing

---

# ⭐ If you found this project helpful

Feel free to **star the repository** ⭐
