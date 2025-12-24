# E-commerce Sales & Customer Behavior Analysis (SQL)

## Business Problem
The objective of this project is to analyze e-commerce sales data to understand revenue trends, customer purchasing behavior, and product performance using SQL on a relational database. The insights are intended to support data-driven business and operational decisions.

## Dataset Overview
- Relational database with 5 tables: customers, orders, order_items, products, payments
- 50,000+ order item records and 25,000+ orders
- Covers multiple years of transactional data
- Includes cancelled orders and failed payments for realistic analysis

## SQL Techniques Used
- INNER and LEFT JOINs
- Common Table Expressions (CTEs)
- Window functions
- Aggregations and filtering
- Date-based analysis

## Key Business Questions Answered
- How is monthly revenue trending over time?
- What is the average order value (AOV)?
- Do repeat customers contribute more revenue than one-time buyers?
- Which product categories drive the highest revenue?
- What is the order cancellation rate?
- Which payment methods have higher failure rates?

## Key Insights
- Repeat customers represent a smaller portion of users but contribute the majority of total revenue
- Monthly revenue shows a consistent upward trend with seasonal fluctuations
- Electronics category generates the highest revenue among all product categories
- Order cancellation rate is close to 10%, indicating potential fulfillment or logistics issues
- Digital payment methods show lower failure rates compared to cash-based options

## Business Recommendations
- Invest in customer retention programs to maximize repeat purchases
- Optimize logistics and fulfillment processes to reduce cancellations
- Focus promotions on high-revenue product categories
- Improve payment reliability by prioritizing low-failure payment methods
