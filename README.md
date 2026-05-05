# Data Warehouse & ETL Project – Northwind Traders

## 📌 Overview
This project demonstrates the design and implementation of a Data Warehouse solution using the Northwind Traders dataset. The goal was to transform raw operational data into structured, analysis-ready data.

## 🏗️ Architecture
![Architecture](images/architecture.jpg)

## ⚙️ Tools & Technologies
- Microsoft SQL Server
- SQL Server Integration Services (SSIS)
- SQL Server Data Tools (SSDT)
- CSV Data Sources

## 🔄 ETL Process
- Extracted data from CSV files and source systems
- Loaded data into a staging layer
- Transformed and loaded into Data Warehouse tables

Key implementations:
- Slowly Changing Dimensions (SCD)
- Lookup transformations for surrogate keys
- Full load & incremental load strategies

## 🧱 Data Model
- Fact and Dimension tables
- Star schema design

## 🎯 Key Outcomes
- Improved data consistency through staging layer
- Enabled historical tracking using SCD
- Prepared data for analytical processing

## 🚀 Next Steps
This warehouse was later extended with OLAP cubes and Power BI dashboards for analytics.
