# Data Warehouse & ETL Project

## 📌 Project Overview

This project demonstrates the design and implementation of a **Data Warehouse system** using **SQL**, including the development of a complete **ETL (Extract, Transform, Load) pipeline**.

The goal of this project is to transform raw operational data into a structured **analytical data warehouse** that supports **reporting and business intelligence**.

The project follows modern data engineering practices such as **data modeling, data transformation, and structured data loading**.

---

## 🎯 Project Objectives

- Design a **Data Warehouse architecture**
- Build a structured **ETL pipeline**
- Clean and transform **raw data**
- Load data into **Fact and Dimension tables**
- Enable efficient **analytical queries**

---

## 🏗️ Architecture

The project follows the **Medallion Architecture** approach:

### 🥉 Bronze Layer (Raw Data)
Raw data imported from source systems without modification.

### 🥈 Silver Layer (Cleaned Data)
Data is cleaned, standardized, and transformed.

### 🥇 Gold Layer (Data Warehouse)
Data is structured into **Fact and Dimension tables** optimized for analytics.

---

## 🗂️ Data Warehouse Model

The warehouse is designed using a **Star Schema**.

### Dimension Tables

- `Dim_Customers`
- `Dim_Products`
- `Dim_Date`
- `Dim_Stores`

### Fact Tables

- `Fact_Sales`

The fact table stores measurable business events, while dimension tables provide descriptive context.

---

## 🔄 ETL Process

### 1️⃣ Extract
Data is extracted from the source datasets.

### 2️⃣ Transform

The transformation process includes:

- Data cleaning
- Handling missing values
- Standardizing formats
- Creating surrogate keys
- Data normalization

### 3️⃣ Load
The transformed data is loaded into the **Data Warehouse tables**.

---

## 🛠️ Tools & Technologies

- **SQL Server**
- **SQL**
- **Data Modeling**
- **ETL Pipelines**
- **GitHub**
