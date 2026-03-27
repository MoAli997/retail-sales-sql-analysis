-- Retail Sales Analysis SQL Project

-- A. Database Setup

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

SELECT * FROM retail_sales order by transactions_id asc;

SELECT COUNT(*) FROM retail_sales;


-- B. Data Exploration & Cleaning

-- Record Count: Determine the total number of records in the dataset.

SELECT COUNT(*) FROM retail_sales;

-- Customer Count: Find out how many unique customers are in the dataset.

SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Category Count: Identify all unique product categories in the dataset.

SELECT DISTINCT category FROM retail_sales;

-- Null Value Check: Check for any null values in the dataset and delete records with missing data.

SELECT * FROM 
	retail_sales 
WHERE 
	transactions_id	IS NULL OR sale_date IS NULL OR sale_time IS NULL OR
	customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL
	OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;

-- Rows containing null values in critical fields were removed to ensure data quality and avoid misleading analysis results.

DELETE FROM 
	retail_sales 
WHERE 
	transactions_id	IS NULL OR sale_date IS NULL OR sale_time IS NULL OR
	customer_id IS NULL OR gender IS NULL OR age IS NULL OR category IS NULL
	OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL OR total_sale IS NULL;

-- C. Data Analysis & Findings

-- The following SQL queries were developed to answer specific business questions:

-- 1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:

SELECT * FROM retail_sales WHERE sale_date = '2022-11-05'
ORDER BY total_sale DESC;

-- 2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT * FROM retail_sales WHERE category = 'Clothing' AND quantity > 4 AND sale_date >= '2022-11-01' AND sale_date < '2022-12-01';

-- 3. Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT category, SUM(total_sale) from  retail_sales GROUP BY category;

-- 4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

SELECT category, round(AVG(age),1) as Average_age FROM retail_sales WHERE category ='Beauty' Group by category;

-- 5. Write a SQL query to find all transactions where the total_sale is greater than 1000.:

SELECT * FROM retail_sales WHERE total_sale > 1000
ORDER BY total_sale ASC;

-- 6. Write a SQL query to find the total number of transactions (transactions_id) made by each gender in each category.:

SELECT 
	gender, 
	category, 
	COUNT(transactions_id) AS total_transactions 
FROM retail_sales 
GROUP BY gender, category 
ORDER BY total_transactions DESC;

-- 7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

SELECT * FROM 
	(SELECT EXTRACT
		(YEAR FROM sale_date) as year, 
		EXTRACT (MONTH FROM sale_date) AS month, 
		round(AVG(total_sale),1) AS Avg_Sales, 
		RANK() OVER( PARTITION BY EXTRACT(YEAR FROM sale_date) 
					 ORDER BY AVG(total_sale) DESC ) AS rnk
	FROM retail_sales 
	GROUP BY year, month) S
WHERE rnk = 1;


-- 8. Write a SQL query to find the top 5 customers based on the highest total sales :

SELECT 
	customer_id, 
	SUM(total_sale) AS highest_total_sales 
FROM retail_sales 
GROUP BY customer_id 
ORDER BY highest_total_sales DESC 
LIMIT 5;

-- 9. Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT 
	COUNT(DISTINCT customer_id) as unique_customers,
	category
FROM retail_sales
GROUP BY category;

-- 10. Write a SQL query to create each shift and total number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17) in each year:

SELECT 
	EXTRACT(YEAR from sale_date) AS year,
	shift,
	COUNT(total_sale) 
FROM
	(SELECT 
		*,
		CASE
			WHEN EXTRACT(HOUR from sale_time) < 12 THEN 'Morning'
			WHEN EXTRACT(HOUR from sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
			ELSE 'Evening'
		END as shift
 	FROM retail_sales) S
GROUP BY year, shift
ORDER BY year, shift;

-- End of Project 

