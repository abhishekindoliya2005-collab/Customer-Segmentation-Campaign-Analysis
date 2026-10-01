# Power BI Dashboard Plan

## Page 1 — Executive Overview
KPI cards:
- Total Customers
- Total Orders
- Total Revenue
- Average Order Value
- Campaign Response Rate
- Campaign Conversion Rate

Charts:
- Revenue by Customer Segment
- Customers by Segment
- Campaign Conversion Rate
- Monthly Revenue Trend

Slicers:
- Campaign
- Channel
- Category
- City
- Month

## Page 2 — RFM Customer Segmentation
Use the `customer_rfm_segments.csv` table.

Visuals:
- Customer count by segment
- Revenue by segment
- Average Recency by segment
- Average Frequency by segment
- Average Monetary value by segment

## Page 3 — Campaign Performance
Visuals:
- Revenue by campaign
- Response rate by campaign
- Conversion rate by campaign
- Revenue by channel
- Category x channel matrix

## Suggested DAX

Total Revenue = SUM(customer_campaign_data[Revenue])

Total Customers = DISTINCTCOUNT(customer_campaign_data[Customer_ID])

Total Orders = DISTINCTCOUNT(customer_campaign_data[Order_ID])

Average Order Value = DIVIDE([Total Revenue], [Total Orders])

Campaign Responses = SUM(customer_campaign_data[Campaign_Responded])

Campaign Conversions = SUM(customer_campaign_data[Converted])

Response Rate % =
DIVIDE([Campaign Responses], [Total Customers])

Conversion Rate % =
DIVIDE([Campaign Conversions], [Campaign Responses])
