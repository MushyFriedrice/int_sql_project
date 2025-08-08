# Intermediate SQL - Sales Analysis

## Overview
    {Insert over view}

## Business Questions
    1. **Customer segmentation analysis**
    2. **Cohort Analysis** : ( How do different customer groups generate revenue)
    3.

 ## Analysis approach
 
### 1. Customer Segmentation analysis
 - This dataset groups customers into three value segments based on their total spending. Each segment shows:
 - Total spending (sum of all purchases)
 - Total number of people
 - Average spending per person

🖥️ Query : [1_customer_segmentation.sql] (https://github.com/MushyFriedrice/int_sql_project/blob/main/Scripts/1_customer_segmentation.sql)

## 📊 Segmentation analysis

## Key Insights

1. **Revenue Contribution**
 - High-value customers contribute ~64% of total revenue while representing only ~23% of customers.
 - Mid-value customers contribute ~31% of revenue and are the largest group (~46% of customers).
 - Low-value customers contribute only ~2% of revenue despite being as numerous as high-value customers.

2. **Spending Behavior**
 - A high-value customer spends 31x more than a low-value customer on average.
 - Mid-value customers spend ~7.7x more than low-value customers.

3. **Customer Concentration**
 - The Pareto principle applies strongly: the top ~23% of customers (high-value) account for nearly two-thirds of the revenue.

## Recommendations

  **High-Value Segment**
  . Implement loyalty programs and VIP services to retain them.
  . Offer exclusive products and early access.

  **Mid-Value Segment**
  . Use targeted upselling and cross-selling to move them towards the high-value tier.
  . Personalized discounts on frequently purchased items.

  **Low-Value Segment**
  . Apply cost-efficient engagement (e.g., automated emails, seasonal offers).
  . Focus on volume-based promotions.
    
### 2. Cohort analysis
 - Tracked revenue and customer counts per cohort
 - Cohorts were grouped by year of first purchase
 - Analyzed customer retention at cohort level

🖥️ Query : [2_cohort_revenue.sql] (https://github.com/MushyFriedrice/int_sql_project/blob/main/Scripts/2_cohort_revenue.sql)

## 📊 Cohort Analysis – Customers & Revenue

### Findings

- **Customer Growth:**  
  - Customers grew steadily from 2015 (**2,825**) to a peak in 2022 (**9,010**).  
  - Sharp decline in 2024 (**1,402**) suggests reduced acquisition or market challenges.  

- **Revenue Trends:**  
  - Revenue peaked in 2019 (**₹22.24M**) and 2022 (**₹21.50M**).  
  - Significant dip in 2020 (**₹7.05M**) possibly linked to external disruptions.  

- **Average Revenue per Customer (ARPU):**  
  - Highest ARPU in 2016 (**₹2,896**) and 2019 (**₹2,868**).  
  - Decline after 2021, hitting a low in 2024 (**₹1,972**).  

- **Key Insights:**  
  - 2018–2022: Strong acquisition years with high total revenue.  
  - 2024: Drop in both customers & ARPU → focus needed on customer retention and monetization.

