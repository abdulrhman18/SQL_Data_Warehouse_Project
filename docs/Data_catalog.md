# Gold Layer Data Catalog

## Overview

The **Gold Layer** represents the **business-ready analytical layer** of the data warehouse.  
It contains curated and optimized datasets designed specifically for **business intelligence, reporting, and analytical workloads**.

Data in this layer is structured using a **dimensional modeling approach**, consisting of:

- **Dimension tables** → Provide descriptive attributes for business entities.
- **Fact tables** → Store measurable business events and transactional metrics.

These tables are optimized for **analytical queries, dashboards, and reporting tools such as Power BI and Excel**.

---

# Tables in the Gold Layer

## 1. gold.dim_customers

### Description
The `dim_customers` table stores enriched customer information, combining data from multiple sources to provide a comprehensive view of customer attributes including demographic and geographic details.

This dimension enables detailed customer-level analysis across sales and reporting processes.

### Columns

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| customer_key | INT | Surrogate key uniquely identifying each customer record in the dimension table. |
| customer_id | INT | Unique numerical identifier assigned to each customer from the source system. |
| customer_number | NVARCHAR(50) | Business identifier used to track and reference the customer across systems. |
| first_name | NVARCHAR(50) | Customer’s first name. |
| last_name | NVARCHAR(50) | Customer’s last name or family name. |
| country | NVARCHAR(50) | Country where the customer resides (e.g., Australia, United States). |
| marital_status | NVARCHAR(50) | Customer marital status such as Married or Single. |
| gender | NVARCHAR(50) | Gender of the customer (Male, Female, or n/a if unknown). |
| birthdate | DATE | Customer date of birth stored in `YYYY-MM-DD` format. |
| create_date | DATE | Date when the customer record was initially created in the system. |

---

# 2. gold.dim_products

### Description
The `dim_products` table contains detailed information about products including classification, category hierarchy, pricing, and product lifecycle attributes.

This dimension supports product-level analysis such as **category performance, pricing trends, and product line reporting**.

### Columns

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| product_key | INT | Surrogate key uniquely identifying each product record. |
| product_id | INT | Internal identifier assigned to the product. |
| product_number | NVARCHAR(50) | Alphanumeric product code used for identification and inventory tracking. |
| product_name | NVARCHAR(50) | Descriptive name of the product including characteristics such as model, color, or size. |
| category_id | NVARCHAR(50) | Identifier representing the product category. |
| category | NVARCHAR(50) | High-level product classification (e.g., Bikes, Components). |
| subcategory | NVARCHAR(50) | More detailed product grouping within the category. |
| maintenance_required | NVARCHAR(50) | Indicates whether the product requires maintenance (Yes or No). |
| cost | INT | Base cost of the product expressed in monetary units. |
| product_line | NVARCHAR(50) | Product line or series classification (e.g., Road, Mountain). |
| start_date | DATE | Date when the product became available for sale. |

---

# 3. gold.fact_sales

### Description
The `fact_sales` table stores transactional sales data and represents the **core business activity of product sales**.

Each record corresponds to a **sales transaction line item**, linking customers and products through surrogate keys.

This fact table supports key analytical metrics such as:

- Total sales revenue
- Sales volume
- Product performance
- Customer purchasing behavior

### Columns

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| order_number | NVARCHAR(50) | Unique identifier representing the sales order (e.g., SO54496). |
| product_key | INT | Foreign key linking the transaction to the `dim_products` table. |
| customer_key | INT | Foreign key linking the transaction to the `dim_customers` table. |
| order_date | DATE | Date when the order was placed. |
| shipping_date | DATE | Date when the product was shipped to the customer. |
| due_date | DATE | Date when payment for the order was due. |
| sales_amount | INT | Total sales value for the transaction line item. |
| quantity | INT | Number of product units sold in the transaction. |
| price | INT | Unit price of the product at the time of sale. |

---

# Data Model Relationship

The Gold Layer follows a **Star Schema design**, where the fact table connects to multiple dimension tables.


dim_customers
|
|
fact_sales
|
|
dim_products


### Relationship Overview

- `fact_sales.customer_key` → `dim_customers.customer_key`
- `fact_sales.product_key` → `dim_products.product_key`

This design enables efficient analytical queries such as:

- Sales by product category
- Revenue by country
- Customer purchasing behavior
- Product performance analysis

---

# Summary

The Gold Layer provides a **highly structured, business-friendly representation of the data warehouse**.  

By organizing data into **dimension and fact tables**, it enables efficient analytical workflows and supports decision-making across business intelligence platforms.
