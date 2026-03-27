# 📊 Retail Sales Analysis SQL Project

## 📌 Project Overview

**Project Title:** Retail Sales Analysis  
**Level:** Beginner  
**Database:** retail_sales  

This project demonstrates SQL skills and techniques used by data analysts to explore, clean, and analyze retail sales data.  
It includes database setup, data cleaning, exploratory data analysis (EDA), and answering business-driven questions using SQL.

---

## 🎯 Objectives

- Set up a retail sales database  
- Perform data cleaning by handling missing values  
- Conduct exploratory data analysis (EDA)  
- Answer real-world business questions using SQL  
- Extract insights about sales performance, customer behavior, and product trends  

---

## 🗂️ Database Structure

The dataset is stored in a table called `retail_sales` with the following columns:

- `transactions_id` – Unique transaction ID  
- `sale_date` – Date of transaction  
- `sale_time` – Time of transaction  
- `customer_id` – Unique customer identifier  
- `gender` – Customer gender  
- `age` – Customer age  
- `category` – Product category  
- `quantity` – Quantity purchased  
- `price_per_unit` – Price per item  
- `cogs` – Cost of goods sold  
- `total_sale` – Total transaction amount  

---

## 🧹 Data Cleaning

- Checked for missing/null values across all columns  
- Removed rows with null values in critical fields  

> This ensures clean and reliable data for analysis and avoids misleading results.

---

## 📈 Data Analysis

The project answers several business questions using SQL:

### 🔹 Sales Analysis
- Sales on a specific date  
- High-value transactions (sales > 1000)  
- Monthly sales trends  

### 🔹 Customer Analysis
- Unique customer count  
- Top 5 customers by total spending  
- Customer distribution across categories  

### 🔹 Category Analysis
- Total sales per category  
- Average customer age per category  

### 🔹 Time-Based Analysis
- Best-selling month in each year using `RANK()`  
- Sales distribution by shifts (Morning, Afternoon, Evening)  

---

## 🧠 SQL Concepts Used

- DDL (CREATE, DROP)  
- DML (SELECT, DELETE)  
- Aggregate Functions (`SUM`, `AVG`, `COUNT`)  
- Filtering (`WHERE`)  
- Grouping (`GROUP BY`)  
- Sorting (`ORDER BY`)  
- Date Functions (`EXTRACT`)  
- Conditional Logic (`CASE WHEN`)  
- Window Functions (`RANK() OVER`)  
- Subqueries  

---

## 🔍 Key Findings

- **Customer Demographics:**  
  Customers span multiple age groups with activity across categories such as Clothing and Beauty.

- **High-Value Transactions:**  
  Several transactions exceed 1000, indicating premium purchases and high-value customers.

- **Sales Trends:**  
  Monthly analysis reveals fluctuations in sales, helping identify peak-performing months.

- **Customer Insights:**  
  A small number of customers contribute significantly to total revenue.

---

## 📊 Reports Generated

- **Sales Summary:**  
  Overview of total sales, category performance, and customer distribution  

- **Trend Analysis:**  
  Monthly and shift-based sales insights  

- **Customer Insights:**  
  Top customers and unique customer counts per category  

---

## 🏗️ Project Structure

```
retail-sales-sql-analysis/
│
├── retail_sales_analysis.sql
└── README.md
```

---

## 🚀 How to Run

1. Create the table using the SQL script  
2. Insert your dataset into the `retail_sales` table  
3. Execute the queries step by step  
4. Analyze outputs to extract insights  

---

## 📌 Conclusion

This project provides a strong foundation in SQL for data analysis.  
It demonstrates how to:

- Clean and prepare data  
- Perform exploratory analysis  
- Answer business questions using SQL  

The insights generated from this project can support better decision-making by understanding:

- Sales patterns  
- Customer behavior  
- Product performance  

---

## 💡 Author

**Mohamed Aly**  
Aspiring Data Analyst | SQL | Python | Data Science  
