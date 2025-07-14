# 🚨 Banking Fraud Detection Dashboard

An **end-to-end fraud analysis project** using **SQL and Tableau** to identify, monitor, and visualize fraudulent transaction patterns across customers, merchants, regions, and transaction types for effective banking fraud mitigation.


---

## 📊 Project Overview

- **Goal:** Detect and visualize fraud patterns in banking transactions.
- **Tools Used:** MySQL, Tableau Public
- **Dataset:** Synthetic banking transactions
   - 1800 transactions
   - 80 customers
   - 30 merchants
   - 50 fraudulent transactions (2.78% fraud rate)

---

## 🚀 Workflow

1️⃣ **Data Preparation**
- Structured `customers`, `merchants`, and `transactions` tables using SQL.
- Loaded clean CSV data into MySQL.
- Performed EDA to identify fraud patterns.

2️⃣ **Fraud Detection Analysis (SQL)**
- Fraud distribution analysis
- High-value fraud detection
- Fraud trends by region, merchant, transaction type, hour, and amount buckets

3️⃣ **Visualization (Tableau)**
- Built an interactive **Banking Fraud Detection Dashboard**.
- KPI Cards: Total Transactions, Total Frauds, Fraud Rate.
- Detailed visual breakdowns:
   - Fraud by Region
   - Fraud by Merchant
   - Fraud by Hour
   - Fraud by Transaction Type
   - Fraud Trend Over Time
   - Fraud Amount Distribution
   - High-Risk Customers

4️⃣ **Interactivity**
- Filters for Region, Merchant, Transaction Type, and Date Range for dynamic exploration.

---

## 🗂️ Repository Contents

- `Banking_Fraud_Detection_Dashboard.twbx` - Interactive Tableau dashboard.
- `SQL_queries.sql` - All SQL queries used for EDA and fraud analysis.
- `transactions.csv`, `customers.csv`, `merchants.csv` (optional) - Datasets for local practice.
- `README.md` - Project documentation.

---

## 🔍 Key Insights

- Fraud rate: **2.78%**.
- Fraudulent transactions tend to cluster in certain regions and hours.
- High-value transactions are more prone to fraud.
- Specific merchants and customers have higher fraud involvement.

---

## 📌 Key SQL Query Example

```sql
SELECT 
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_frauds,
    ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions;
