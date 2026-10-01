-- Customer Segmentation & Campaign Analysis
-- MySQL 8+

CREATE DATABASE IF NOT EXISTS customer_analytics;
USE customer_analytics;

DROP TABLE IF EXISTS customer_campaign_data;

CREATE TABLE customer_campaign_data (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Customer_ID VARCHAR(20),
    Date DATE,
    Age INT,
    City VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Campaign_ID VARCHAR(20),
    Campaign_Name VARCHAR(100),
    Channel VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Discount DECIMAL(5,2),
    Revenue DECIMAL(14,2),
    Campaign_Responded TINYINT,
    Converted TINYINT,
    Month VARCHAR(7),
    Order_Value DECIMAL(14,2)
);

-- Import customer_campaign_data.csv using MySQL Workbench Import Wizard.

-- 1. Overall KPIs
SELECT
    COUNT(DISTINCT Customer_ID) AS Customers,
    COUNT(DISTINCT Order_ID) AS Orders,
    ROUND(SUM(Revenue),2) AS Revenue,
    ROUND(AVG(Order_Value),2) AS Avg_Order_Value
FROM customer_campaign_data;

-- 2. Customer purchase summary
SELECT Customer_ID,
       COUNT(DISTINCT Order_ID) AS Frequency,
       ROUND(SUM(Revenue),2) AS Monetary
FROM customer_campaign_data
GROUP BY Customer_ID
ORDER BY Monetary DESC;

-- 3. Revenue by category
SELECT Category, ROUND(SUM(Revenue),2) AS Revenue,
       COUNT(DISTINCT Customer_ID) AS Customers
FROM customer_campaign_data
GROUP BY Category
ORDER BY Revenue DESC;

-- 4. Revenue by channel
SELECT Channel, ROUND(SUM(Revenue),2) AS Revenue,
       SUM(Campaign_Responded) AS Responses,
       SUM(Converted) AS Conversions
FROM customer_campaign_data
GROUP BY Channel
ORDER BY Revenue DESC;

-- 5. Campaign performance
SELECT Campaign_Name, Channel,
       COUNT(DISTINCT Customer_ID) AS Customers,
       SUM(Campaign_Responded) AS Responses,
       SUM(Converted) AS Conversions,
       ROUND(SUM(Revenue),2) AS Revenue
FROM customer_campaign_data
GROUP BY Campaign_Name, Channel
ORDER BY Revenue DESC;

-- 6. Campaign response and conversion rates
SELECT Campaign_Name,
       ROUND(SUM(Campaign_Responded)/COUNT(DISTINCT Customer_ID)*100,2) AS Response_Rate_Pct,
       ROUND(SUM(Converted)/NULLIF(SUM(Campaign_Responded),0)*100,2) AS Conversion_Rate_Pct
FROM customer_campaign_data
GROUP BY Campaign_Name
ORDER BY Conversion_Rate_Pct DESC;

-- 7. RFM base metrics
SELECT Customer_ID,
       DATEDIFF('2026-01-01', MAX(Date)) AS Recency,
       COUNT(DISTINCT Order_ID) AS Frequency,
       ROUND(SUM(Revenue),2) AS Monetary
FROM customer_campaign_data
GROUP BY Customer_ID;

-- 8. Monthly revenue
SELECT Month, ROUND(SUM(Revenue),2) AS Revenue,
       COUNT(DISTINCT Order_ID) AS Orders
FROM customer_campaign_data
GROUP BY Month
ORDER BY Month;

-- 9. Top customers
SELECT Customer_ID, ROUND(SUM(Revenue),2) AS Revenue,
       COUNT(DISTINCT Order_ID) AS Orders
FROM customer_campaign_data
GROUP BY Customer_ID
ORDER BY Revenue DESC
LIMIT 10;

-- 10. Customer conversion performance
SELECT Customer_ID,
       SUM(Campaign_Responded) AS Responses,
       SUM(Converted) AS Conversions,
       ROUND(SUM(Converted)/NULLIF(SUM(Campaign_Responded),0)*100,2) AS Conversion_Rate_Pct
FROM customer_campaign_data
GROUP BY Customer_ID
HAVING SUM(Campaign_Responded) > 0
ORDER BY Conversion_Rate_Pct DESC;

-- 11. Window function: rank customers within city
WITH city_customers AS (
    SELECT City, Customer_ID, SUM(Revenue) AS Revenue
    FROM customer_campaign_data
    GROUP BY City, Customer_ID
)
SELECT City, Customer_ID, ROUND(Revenue,2) AS Revenue,
       DENSE_RANK() OVER (PARTITION BY City ORDER BY Revenue DESC) AS City_Rank
FROM city_customers
ORDER BY City, City_Rank;

-- 12. Category x channel analysis
SELECT Category, Channel,
       ROUND(SUM(Revenue),2) AS Revenue,
       SUM(Converted) AS Conversions
FROM customer_campaign_data
GROUP BY Category, Channel
ORDER BY Revenue DESC;
