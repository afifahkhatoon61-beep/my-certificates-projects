create  DATABASE sales_analytics;

USE sales_analytics;

-- Heading: Data Import Verification
SELECT COUNT(*) FROM sales_data;

-- Heading: Region-Wise Sales & Profit Analysis
SELECT `Region`,
       SUM(`Sales`) AS total_sales,
       SUM(`Profit`) AS total_profit
FROM sales_data
GROUP BY `Region`
ORDER BY total_sales DESC;


-- Heading: Top 10 Best-Selling Products
SELECT `Product Name`,
       SUM(`Sales`) AS total_sales
FROM sales_data
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


-- Heading: Monthly Sales Trend
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS month,
       SUM(`Sales`) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY month;



-- Heading: Category-Wise Profitability
SELECT `Category`,
       SUM(`Sales`) AS total_sales,
       SUM(`Profit`) AS total_profit,
       ROUND(SUM(`Profit`) / SUM(`Sales`) * 100, 2) AS profit_margin_pct
FROM sales_data
GROUP BY `Category`
ORDER BY total_profit DESC;



-- Loss-Making Sub-Categories
SELECT `Sub-Category`,
       SUM(`Profit`) AS total_profit
FROM sales_data
GROUP BY `Sub-Category`
HAVING SUM(`Profit`) < 0
ORDER BY total_profit ASC;


-- Product Ranking within Each Category (Window Function)
SELECT `Category`,
       `Product Name`,
       SUM(`Sales`) AS total_sales,
       RANK() OVER (PARTITION BY `Category` ORDER BY SUM(`Sales`) DESC) AS category_rank
FROM sales_data
GROUP BY `Category`, `Product Name`
ORDER BY `Category`, category_rank
LIMIT 30;