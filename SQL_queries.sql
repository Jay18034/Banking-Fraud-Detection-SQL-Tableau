- SQL Queries for Banking Fraud Detection Project

-- 1️⃣ Fraud Distribution Overview
SELECT 
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_frauds,
    ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions;

-- 2️⃣ Fraud Count by Transaction Type
SELECT 
    transaction_type, 
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_frauds,
    ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions
GROUP BY transaction_type
ORDER BY fraud_percentage DESC;

-- 3️⃣ Fraud Count by Region
SELECT 
    c.region, 
    COUNT(*) AS total_transactions,
    SUM(t.is_fraud) AS total_frauds,
    ROUND(SUM(t.is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.region
ORDER BY fraud_percentage DESC;

-- 4️⃣ Fraud Count by Merchant
SELECT 
    m.merchant_name, 
    COUNT(*) AS total_transactions,
    SUM(t.is_fraud) AS total_frauds,
    ROUND(SUM(t.is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions t
JOIN merchants m ON t.merchant_id = m.merchant_id
GROUP BY m.merchant_name
ORDER BY fraud_percentage DESC
LIMIT 10;

-- 5️⃣ Fraud Distribution by Hour
SELECT 
    HOUR(transaction_time) AS transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_frauds,
    ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions
GROUP BY transaction_hour
ORDER BY transaction_hour;

-- 6️⃣ Fraud Trend Over Time (Monthly)
SELECT 
    DATE_FORMAT(transaction_date, '%Y-%m') AS month,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_frauds,
    ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions
GROUP BY month
ORDER BY month;

-- 7️⃣ High-Risk Customers by Fraud Count
SELECT 
    customer_id,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_frauds,
    ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions
GROUP BY customer_id
HAVING total_frauds > 1
ORDER BY total_frauds DESC
LIMIT 10;

-- 8️⃣ High-Value Transactions Likely to be Fraudulent
SELECT * FROM transactions
WHERE transaction_amount > 5000 AND is_fraud = 1
ORDER BY transaction_amount DESC;

-- 9️⃣ Fraud Amount Distribution (Bucketed Analysis)
SELECT 
    CASE 
        WHEN transaction_amount < 100 THEN '< 100'
        WHEN transaction_amount BETWEEN 100 AND 500 THEN '100-500'
        WHEN transaction_amount BETWEEN 501 AND 1000 THEN '501-1000'
        WHEN transaction_amount BETWEEN 1001 AND 5000 THEN '1001-5000'
        ELSE '> 5000'
    END AS amount_bucket,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS total_frauds,
    ROUND(SUM(is_fraud) / COUNT(*) * 100, 2) AS fraud_percentage
FROM transactions
GROUP BY amount_bucket
ORDER BY fraud_percentage DESC;
