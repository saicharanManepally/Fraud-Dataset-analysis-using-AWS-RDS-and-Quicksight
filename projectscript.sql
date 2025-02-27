-- This query retrieves all columns and rows from the table
SELECT * FROM fraud;


-- Retrieves the count of distinct users from the table
SELECT COUNT(DISTINCT user_id) AS no_of_distinct_users
FROM fraud;


-- Calculates the average transaction amount from the table, rounded to 2 decimal places
SELECT CAST(AVG(transaction_amount) AS DECIMAL(10, 2)) AS Avg_transaction_amt
FROM fraud;


-- Creates a view to display the top 4 transaction types with the highest transaction counts from the table
CREATE VIEW transaction_type_count AS
SELECT TOP 4 transaction_type, COUNT(*) AS transaction_count
FROM fraud
GROUP BY transaction_type
ORDER BY transaction_count DESC;


-- Creates a view to display location-wise total transaction count and fraudulent transaction count
CREATE VIEW location_wise_total_trans_and_fraud_transactions AS
SELECT Location, COUNT(*) AS Total_Transactions,
       COUNT(CASE WHEN Fraud_Label = 1 THEN 1 END) AS Fraudulent_Transactions
FROM fraud
GROUP BY Location


-- Creates a view to display the count of transactions for each "Fraud_Label" in the table
CREATE VIEW fraud_trans_count AS
SELECT Fraud_Label, COUNT(*) AS Transaction_Count
FROM fraud
GROUP BY Fraud_Label;


-- Creates a view to display the count of fraudulent transactions for each "Transaction_Type" 
CREATE VIEW fraud_trans_by_type AS
SELECT Transaction_Type, COUNT(*) AS Fraudulent_Transactions
FROM fraud
WHERE Fraud_Label = 1
GROUP BY Transaction_Type;


-- Creates a view to display the top 100 users with the highest count of previous fraudulent activities
CREATE VIEW users_with_high_fraud_activities AS
SELECT TOP 100 User_ID, COUNT(Previous_Fraudulent_Activity) AS Total_Fraudulent_Activities
FROM fraud
GROUP BY User_ID
ORDER BY Total_Fraudulent_Activities DESC;


-- Creates a view to display the dates with the highest count of fraudulent transactions
CREATE VIEW no_of_fraudulent_activities_by_date AS
SELECT CAST(timestamp AS date) AS dt, COUNT(*) AS fraud_transactions
FROM fraud
GROUP BY CAST(timestamp AS date)
ORDER BY fraud_transactions DESC;


-- Creates a view to display the card types with the highest count of fraudulent activities 
CREATE VIEW count_of_fraud_trans_by_card_type AS
SELECT TOP 4 card_type, COUNT(fraud_label) AS fraudulent_activities
FROM fraud
WHERE fraud_label = 1
GROUP BY card_type
ORDER BY fraudulent_activities DESC;


-- Creates a view to display the count of transactions for each "Fraud_Label" in the table
CREATE VIEW fraud_trans_count AS
SELECT Fraud_Label, COUNT(*) AS Transaction_Count
FROM fraud
GROUP BY Fraud_Label;





