create DATABASE churn_db;

USE db_churn;

SELECT * FROM churn_data LIMIT 10;

SELECT 
    gender,
    COUNT(gender) AS total_count,
    (COUNT(gender) / (SELECT COUNT(*) FROM churn_data)) * 100 AS percentage
FROM churn_data
GROUP BY gender;


SELECT 
    customer_status,
    COUNT(customer_status) AS total_count,
    (COUNT(customer_status) / (SELECT COUNT(*) FROM churn_data)) * 100 AS percentage
FROM churn_data
GROUP BY customer_status;


SELECT 
    contract,
    COUNT(contract) AS total_count,
    (COUNT(contract) / (SELECT COUNT(*) FROM churn_data)) * 100 AS percentage
FROM churn_data
GROUP BY contract;


SELECT DISTINCT internet_type
FROM churn_data;



