📌 Project Overview
This project analyzes customer purchasing behavior and marketing campaign performance to identify high-value customers, loyal customers, at-risk customers, campaign response patterns, and revenue trends.
The project follows an end-to-end data analytics workflow using SQL, Excel, Python, and Power BI.
The main business objective is to convert customer transaction data into actionable insights that can support customer targeting, campaign planning, and resource allocation.
🎯 Business Problem
A company wants to understand its customer base and improve the effectiveness of its marketing campaigns.
The analysis focuses on questions such as:
- Which customers generate the most revenue?
- Which customers purchase frequently?
- Which customers may be at risk of becoming inactive?
- Which customer segments contribute the most revenue?
- Which campaigns receive the highest response?
- Which campaigns have better conversion rates?
- Which marketing channels perform better?
- How does revenue change over time?
- How can campaigns be better targeted to different customer groups?
🛠️ Tools & Technologies
Tool	Purpose
SQL / MySQL	Data extraction, aggregation and analysis
Excel	Data validation and summary analysis
Python	RFM preparation and customer segmentation
Power BI	Interactive dashboard and visualization
GitHub	Project documentation and version control


📊 Dataset
The project uses a synthetic dataset containing 2,200 transactions from 650 customers across 2025.
Main Dataset Fields
Field	Description
Order_ID	Unique order identifier
Customer_ID	Unique customer identifier
Date	Transaction date
Age	Customer age
City	Customer city
Product_ID	Product identifier
Category	Product category
Campaign_ID	Campaign identifier
Campaign_Name	Marketing campaign
Channel	Marketing channel
Quantity	Units purchased
Unit_Price	Price per unit
Discount	Discount applied
Revenue	Revenue generated
Campaign_Responded	Whether customer responded
Converted	Whether customer converted


Note: The dataset is synthetic and was created specifically for portfolio and interview practice. It does not contain real customer information.

🔄 Project Workflow
Raw Transaction Data
        ↓
Data Cleaning & Validation
        ↓
Customer-Level Aggregation
        ↓
RFM Analysis
        ↓
Customer Segmentation
        ↓
Campaign Performance Analysis
        ↓
Power BI Dashboard
        ↓
Business Insights
        ↓
Recommendations
👥 Customer Segmentation — RFM Analysis
The project uses RFM analysis to understand customer behavior.
Recency
Measures how recently a customer made a purchase.
A lower number of days means the customer purchased more recently.
Frequency
Measures how often a customer purchased.
Higher frequency indicates more regular purchasing behavior.
Monetary
Measures how much revenue a customer generated.
Higher monetary value indicates a higher-value customer.
Customer Segments
Customers are grouped into practical business segments:
Segment	Meaning
Champions	Recent, frequent and high-value customers
Loyal Customers	Customers with consistent purchasing behavior
Potential Loyalists	Recently active customers with potential to become loyal
At Risk	Previously active customers whose recent activity has declined
Hibernating	Low recent and low-frequency customers
Need Attention	Customers requiring further analysis or engagement


📢 Campaign Analysis
The project evaluates marketing campaigns using:
- Number of customers reached
- Campaign responses
- Conversions
- Response rate
- Conversion rate
- Revenue
- Marketing channel
Campaigns included
- Summer Sale
- Festival Offer
- Loyalty Rewards
- New Customer Offer
- Weekend Flash Sale
- Win Back Campaign
📈 Dashboard
The project includes a dashboard preview:
<img width="2512" height="1705" alt="customer_campaign_dashboard" src="https://github.com/user-attachments/assets/2ab17492-80e6-429d-9e0f-42c6a59361f3" />

 
Dashboard KPIs

- Total Customers
- Total Orders
- Total Revenue
- Average Order Value
- Campaign Response Rate
- Campaign Conversion Rate
Dashboard Views
1. Customer Segmentation
Shows the number and revenue contribution of different customer segments.
2. Campaign Conversion
Compares conversion rates across marketing campaigns.
3. Revenue by Segment
Shows which customer segments contribute the most revenue.
4. Monthly Revenue Trend
Tracks changes in revenue throughout the year.
The detailed Power BI dashboard structure is available in:
dashboard/powerbi_dashboard_plan.md
🗄️ SQL Analysis
The SQL file contains queries for:
1. Overall business KPIs
2. Customer purchase frequency
3. Revenue by product category
4. Revenue by marketing channel
5. Campaign performance
6. Campaign response rate
7. Campaign conversion rate
8. RFM base metrics
9. Monthly revenue
10. Top customers
11. Customer conversion performance
12. Customer ranking using window functions
13. Category and channel performance
Example SQL Query
SELECT
    Campaign_Name,
    Channel,
    COUNT(DISTINCT Customer_ID) AS Customers,
    SUM(Campaign_Responded) AS Responses,
    SUM(Converted) AS Conversions,
    ROUND(SUM(Revenue), 2) AS Revenue
FROM customer_campaign_data
GROUP BY Campaign_Name, Channel
ORDER BY Revenue DESC;
This query compares campaigns based on customer reach, response, conversion, and revenue.
📐 Power BI Measures
Total Revenue
Total Revenue =
SUM(customer_campaign_data[Revenue])
Total Customers
Total Customers =
DISTINCTCOUNT(customer_campaign_data[Customer_ID])
Total Orders
Total Orders =
DISTINCTCOUNT(customer_campaign_data[Order_ID])
Average Order Value
Average Order Value =
DIVIDE([Total Revenue], [Total Orders])
Campaign Response Rate
Response Rate % =
DIVIDE(
    SUM(customer_campaign_data[Campaign_Responded]),
    [Total Customers]
)
Campaign Conversion Rate
Conversion Rate % =
DIVIDE(
    SUM(customer_campaign_data[Converted]),
    SUM(customer_campaign_data[Campaign_Responded])
)
🔍 Key Insights
The analysis helps identify:
- High-value customer segments contributing a large share of revenue.
- Customers with frequent purchasing behavior who can be targeted for loyalty initiatives.
- At-risk customers who may benefit from re-engagement campaigns.
- Campaigns with relatively stronger response and conversion rates.
- Differences between marketing channels.
- Categories and customer segments contributing more revenue.
- Monthly changes in customer purchasing activity.
These insights can help a business move from mass marketing toward more targeted customer engagement.
💡 Business Recommendations
1. Focus on High-Value Customers
Use personalized offers and loyalty campaigns to retain high-value customers.
2. Re-engage At-Risk Customers
Identify customers with declining recent activity and test targeted win-back campaigns.
3. Segment Campaign Audiences
Different customer segments should receive campaigns based on their purchasing behavior rather than receiving the same offer.
4. Compare Marketing Channels
Use response and conversion metrics to identify channels that deserve further testing.
5. Monitor Customer Value
Track changes in Recency, Frequency and Monetary value to identify changes in customer behavior.
6. Test Campaigns Before Scaling
Campaign performance should ideally be validated through controlled experiments such as A/B testing before making large-scale marketing decisions.
📁 Repository Structure
Customer_Segmentation_Campaign_Analysis/
│
├── README.md
│
├── data/
│   ├── customer_campaign_data.csv
│   ├── customer_rfm_segments.csv
│   ├── campaign_performance.csv
│   └── segment_summary.csv
│
├── excel/
│   └── customer_campaign_analysis.xlsx
│
├── sql/
│   └── customer_campaign_analysis.sql
│
├── dashboard/
│   ├── customer_campaign_dashboard.png
│   └── powerbi_dashboard_plan.md
│
└── docs/
    └── project_report.md
🚀 How to Run the Project
Step 1 — Load the Dataset
Use:
data/customer_campaign_data.csv
Step 2 — Run SQL Analysis
Open:
sql/customer_campaign_analysis.sql
Create the MySQL database and import the transaction data.
Step 3 — Review Excel Analysis
Open:
excel/customer_campaign_analysis.xlsx
The workbook contains:
- Transactions
- RFM Segments
- Campaign Performance
- Segment Summary
- Monthly Trend
Step 4 — Build the Power BI Dashboard
Import the relevant CSV files into Power BI.
Use:
dashboard/powerbi_dashboard_plan.md
for the dashboard structure and DAX measures.
📚 Skills Demonstrated
Technical Skills
- SQL
- MySQL
- Excel
- Power BI
- DAX
- Python
- Data Cleaning
- RFM Analysis
- Customer Segmentation
- Data Visualization
- Window Functions
- KPI Development
Analytical Skills
- Customer Behavior Analysis
- Campaign Performance Analysis
- Trend Analysis
- Business Problem Solving
- Data Interpretation
- Data-Driven Decision Making
🎤 Interview Explanation
"I worked on a customer segmentation and campaign analysis project where I analyzed 2,200 transactions from 650 customers. I used RFM analysis to segment customers based on recency, frequency and monetary value. I then analyzed campaign response and conversion rates across different campaigns and channels using SQL. Finally, I created a Power BI dashboard to visualize customer segments, revenue contribution, campaign performance and monthly trends. The objective was to identify valuable customers, customers at risk of becoming inactive, and opportunities to improve campaign targeting."

⚠️ Limitations
- The dataset is synthetic.
- Campaign performance is observational and does not prove causation.
- Campaign cost data is not included, so ROI cannot be calculated.
- Customer Lifetime Value is not modeled.
- A/B testing data is not available.
- Real-world customer behavior would require additional variables and validation.
🔮 Future Improvements
The project can be extended by adding:
- Customer Lifetime Value (CLV)
- Churn prediction
- Campaign ROI
- A/B testing
- Customer propensity modeling
- Personalized campaign recommendations
- Predictive customer segmentation
👤 Author
Abhishek Indoliya
B.Tech – Metallurgical & Materials Engineering
IIT Patna
Skills: SQL | Excel | Power BI | Python | Data Analysis
