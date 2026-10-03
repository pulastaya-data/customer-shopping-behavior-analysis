# 🛍️ Customer Shopping Behavior Analysis

## 📌 Project Overview

An end-to-end data analytics project focused on understanding customer shopping behavior and identifying actionable business insights from consumer purchase data.

The project analyzes customer demographics, purchasing patterns, product performance, discounts, subscriptions, reviews, payment methods, shipping preferences, and purchase frequency.

The analysis is performed using **Python, SQL, and Power BI**, followed by a business-focused report containing key findings and recommendations.

---

## 🎯 Business Problem

A leading retail company wants to better understand its customers' shopping behavior in order to improve sales, customer satisfaction, and long-term loyalty.

The management team has observed differences in purchasing patterns across:

- Customer demographics
- Product categories
- Sales channels
- Discounts
- Reviews
- Seasons
- Payment preferences
- Subscription status
- Purchase frequency

The primary business question is:

> **How can the company leverage consumer shopping data to identify trends, improve customer engagement, and optimize marketing and product strategies?**

---

## 🎯 Project Objectives

The project aims to:

- Understand the demographic profile of customers
- Analyze purchasing patterns and customer behavior
- Identify high-performing products and categories
- Analyze revenue contribution across customer segments
- Examine the relationship between discounts and purchase behavior
- Compare subscribers and non-subscribers
- Analyze customer purchase frequency and previous purchases
- Understand payment and shipping preferences
- Evaluate customer review patterns
- Identify actionable business opportunities

---

## 🗂️ Dataset

The dataset contains **3,900 customer shopping transactions** and includes information related to customers, products, purchases, reviews, subscriptions, discounts, and payment behavior.

### Key Features

| Feature                  | Description                    |
| ------------------------ | ------------------------------ |
| `customer_id`            | Unique customer identifier     |
| `age`                    | Customer age                   |
| `gender`                 | Customer gender                |
| `item_purchased`         | Product purchased              |
| `category`               | Product category               |
| `purchase_amount`        | Purchase amount in USD         |
| `location`               | Customer location              |
| `size`                   | Product size                   |
| `color`                  | Product color                  |
| `season`                 | Season of purchase             |
| `review_rating`          | Customer review rating         |
| `subscription_status`    | Subscription status            |
| `shipping_type`          | Shipping method                |
| `discount_applied`       | Whether a discount was applied |
| `previous_purchases`     | Number of previous purchases   |
| `payment_method`         | Payment method                 |
| `frequency_of_purchases` | Customer purchase frequency    |

Additional analytical features such as `age_group`, `purchase_frequency_days`, `is_subscriber`, and `has_discount` were created during the Python data preparation stage.

---

# 🛠️ Tools & Technologies

### Programming & Analysis

- Python
- Pandas
- NumPy

### Data Visualization

- Matplotlib
- Seaborn

### Database & SQL

- MySQL
- SQL
- CTEs
- Window Functions
- Aggregate Functions
- Subqueries

### Business Intelligence

- Microsoft Power BI
- DAX

### Documentation & Version Control

- Git
- GitHub
- Jupyter Notebook

---

# 🔄 Project Workflow

```text
Raw Dataset
     │
     ▼
Data Cleaning & Validation
     │
     ▼
Feature Engineering
     │
     ▼
Exploratory Data Analysis
     │
     ├───────────────┐
     ▼               ▼
   SQL Analysis   Power BI
     │               │
     └───────┬───────┘
             ▼
      Business Insights
             │
             ▼
      Recommendations
             │
             ▼
       Final Report
```
