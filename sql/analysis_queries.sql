SELECT COUNT(*) AS total_records
FROM innomatics.default.sales_dataset;


-- Overall Sales Performance
SELECT
  SUM(Sales_Amount)          AS total_sales_revenue,
  SUM(Quantity_Sold)         AS total_quantity_sold,
  COUNT(*)                   AS total_sales_records,
  COUNT(DISTINCT Product_ID) AS distinct_products
FROM innomatics.default.sales_dataset;

-- Top 5 Products
SELECT
  Product_ID,
  ROUND(SUM(Sales_Amount), 2) AS total_sales_revenue,
  SUM(Quantity_Sold)          AS total_quantity_sold
FROM innomatics.default.sales_dataset
GROUP BY Product_ID
ORDER BY total_sales_revenue DESC
LIMIT 5;

--Regional Performance
SELECT
  Region,
  ROUND(SUM(Sales_Amount), 2) AS total_sales_revenue,
  SUM(Quantity_Sold)          AS total_quantity_sold
FROM innomatics.default.sales_dataset
GROUP BY Region
ORDER BY total_sales_revenue DESC;

-- Monthly Sales Trend
SELECT
  DATE_FORMAT(Sale_Date, 'yyyy-MM') AS sales_month,
  ROUND(SUM(Sales_Amount), 2)       AS total_sales_revenue
FROM innomatics.default.sales_dataset
GROUP BY DATE_FORMAT(Sale_Date, 'yyyy-MM')
ORDER BY sales_month;

-- Category contribution 
SELECT
  Product_Category,
  ROUND(SUM(Sales_Amount), 2) AS total_sales_revenue,
  ROUND(SUM(Sales_Amount) * 100.0 / SUM(SUM(Sales_Amount)) OVER (), 2) AS pct_of_total
FROM innomatics.default.sales_dataset
GROUP BY Product_Category
ORDER BY total_sales_revenue DESC;

SELECT MIN(Sale_Date) AS first_sale, MAX(Sale_Date) AS last_sale
FROM innomatics.default.sales_dataset;



SELECT
  Product_ID,
  Product_Category,
  ROUND(SUM(Sales_Amount), 2) AS revenue,
  SUM(Quantity_Sold)          AS units
FROM innomatics.default.sales_dataset
WHERE Product_ID IN (1099, 1089)
GROUP BY Product_ID, Product_Category
ORDER BY Product_ID, revenue DESC;


