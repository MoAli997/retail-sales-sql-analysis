# 📊 Retail Sales Analysis SQL Project

## Project Overview

**Project Title:** Retail Sales Analysis  
**Database:** retail_sales  

This project demonstrates SQL skills used by data analysts to explore, clean, and analyze retail sales data.  
It includes database setup, data cleaning, exploratory data analysis (EDA), and answering business questions using SQL.

---

## 🎯 Objectives

- Set up a retail sales database  
- Perform data cleaning  
- Conduct exploratory data analysis (EDA)  
- Solve business problems using SQL  
- Extract insights about sales and customers  

---

## Database Structure

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

## Project Structure

```
retail-sales-sql-analysis/
│
├── retail_sales_analysis.sql
├── retail_sales.csv
└── README.md
```

---

#  1. Database Setup

```sql
DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
	transactions_id	INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(6),	
	age INT,
	category VARCHAR(15),
	quantity INT,
	price_per_unit INT,
	cogs FLOAT,	
	total_sale INT
);
```

---

#  2. Data Exploration & Cleaning

### 🔹 2.1 Record Count
```sql
SELECT COUNT(*) FROM retail_sales;
```

### 🔹 2.2 Unique Customers
```sql
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
```

### 🔹 2.3 Unique Categories
```sql
SELECT DISTINCT category FROM retail_sales;
```

### 🔹 2.4 Null Values Check
```sql
SELECT * FROM retail_sales 
WHERE 
	transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR
	customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL
	OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;
```

### 🔹 2.5 Remove Null Values
Rows containing null values in critical fields were removed to ensure data quality and avoid misleading analysis results.
```sql
DELETE FROM retail_sales 
WHERE 
	transactions_id IS NULL OR sale_date IS NULL OR sale_time IS NULL OR
	customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL
	OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;
```

---

# 📈 3. Data Analysis & Business Questions

## 3.1 Sales on specific date :  
Retrieve all transactions that occurred on 2022-11-05
```sql
SELECT * FROM retail_sales 
WHERE sale_date = '2022-11-05'
ORDER BY total_sale DESC;
```

## 3.2 Clothing sales in Nov 2022 : 
Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

```sql
SELECT * FROM retail_sales 
WHERE category = 'Clothing' 
AND quantity > 4 
AND sale_date >= '2022-11-01' 
AND sale_date < '2022-12-01';
```

## 3.3 Total sales per category
Calculate the total sales for each product category
```sql
SELECT category, SUM(total_sale) 
FROM retail_sales 
GROUP BY category;
```

## 3.4 Average age (Beauty category)
Calculate the total sales for each product category
```sql
SELECT category, ROUND(AVG(age),1) AS average_age 
FROM retail_sales 
WHERE category ='Beauty' 
GROUP BY category;
```

## 3.5 High-value transactions
Find the average age of customers who purchased items from the 'Beauty' category
```sql
SELECT * FROM retail_sales 
WHERE total_sale > 1000
ORDER BY total_sale ASC;
```

## 3.6 Transactions by gender & category
Retrieve all transactions where the total sale amount is greater than 1000
```sql
SELECT 
	gender, 
	category, 
	COUNT(transactions_id) AS total_transactions 
FROM retail_sales 
GROUP BY gender, category 
ORDER BY total_transactions DESC;
```

## 3.7 Best selling month in each year
Identify the best selling month in each year based on the highest average sales
```sql
SELECT * FROM 
	(SELECT 
		EXTRACT(YEAR FROM sale_date) AS year, 
		EXTRACT(MONTH FROM sale_date) AS month, 
		ROUND(AVG(total_sale),1) AS avg_sales, 
		RANK() OVER(
			PARTITION BY EXTRACT(YEAR FROM sale_date) 
			ORDER BY AVG(total_sale) DESC
		) AS rnk
	FROM retail_sales 
	GROUP BY year, month
) S
WHERE rnk = 1;
```

## 3.8 Top 5 customers
Identify the best selling month in each year based on the highest average sales
```sql
SELECT 
	customer_id, 
	SUM(total_sale) AS highest_total_sales 
FROM retail_sales 
GROUP BY customer_id 
ORDER BY highest_total_sales DESC 
LIMIT 5;
```

## 3.9 Unique customers per category
Retrieve the top 5 customers based on the highest total sales
```sql
SELECT 
	COUNT(DISTINCT customer_id) AS unique_customers,
	category
FROM retail_sales
GROUP BY category;
```

## 3.10 Sales by shift
Categorize transactions into shifts (Morning, Afternoon, Evening) and calculate the total number of orders in each shift per year
```sql
SELECT 
	EXTRACT(YEAR FROM sale_date) AS year,
	shift,
	COUNT(total_sale) 
FROM
	(SELECT 
		*,
		CASE
			WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
			WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END AS shift
 	FROM retail_sales
) S
GROUP BY year, shift
ORDER BY year, shift;
```

---

# 4. SQL Concepts Used

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

#  5. Key Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

---

#  6. Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

---

#  7. Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

---

#  Author

**Mohamed Aly**  
Aspiring Data Analyst | SQL | Python | Data Science  
