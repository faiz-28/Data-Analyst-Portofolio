-- ==================================================
-- Telco Customer Churn Analysis (SQL Case Study)
-- Tujuan: Mengidentifikasi faktor-faktor utama yang memengaruhi pelanggan berhenti berlangganan (churn)
-- Dataset: Telco Customer Churn - https://www.kaggle.com/datasets/blastchar/telco-customer-churn
-- Bahasa: MySQL
-- Penulis: Faiz Ardiansyah
-- Tanggal: Juni 2025
-- ==================================================

-- 1. Membuat database dan melihat isi tabel
CREATE DATABASE IF NOT EXISTS retention;
USE retention;

SELECT * FROM c LIMIT 10;
DESCRIBE c;

-- 2. Cek distribusi nilai Churn
SELECT COUNT(*) AS TotalChurnYes FROM c WHERE Churn = 'Yes';
SELECT COUNT(*) AS TotalChurnNo FROM c WHERE Churn = 'No';
SELECT DISTINCT Contract FROM c;

-- 3. Mengecek data null/kosong di kolom-kolom penting
-- (TotalCharges bisa berisi string kosong yang perlu ditangani)
-- (customerID dan TotalCharges dicek menggunakan TRIM)

SELECT 'customerID' AS Column_Name, COUNT(*) AS Null_Count FROM c WHERE TRIM(customerID) = ''
UNION ALL
SELECT 'gender', COUNT(*) FROM c WHERE TRIM(gender) = ''
UNION ALL
SELECT 'SeniorCitizen', COUNT(*) FROM c WHERE SeniorCitizen IS NULL
UNION ALL
SELECT 'Partner', COUNT(*) FROM c WHERE TRIM(Partner) = ''
UNION ALL
SELECT 'Dependents', COUNT(*) FROM c WHERE TRIM(Dependents) = ''
UNION ALL
SELECT 'tenure', COUNT(*) FROM c WHERE tenure IS NULL
UNION ALL
SELECT 'PhoneService', COUNT(*) FROM c WHERE TRIM(PhoneService) = ''
UNION ALL
SELECT 'MultipleLines', COUNT(*) FROM c WHERE TRIM(MultipleLines) = ''
UNION ALL
SELECT 'InternetService', COUNT(*) FROM c WHERE TRIM(InternetService) = ''
UNION ALL
SELECT 'OnlineSecurity', COUNT(*) FROM c WHERE TRIM(OnlineSecurity) = ''
UNION ALL
SELECT 'TechSupport', COUNT(*) FROM c WHERE TRIM(TechSupport) = ''
UNION ALL
SELECT 'Contract', COUNT(*) FROM c WHERE TRIM(Contract) = ''
UNION ALL
SELECT 'PaymentMethod', COUNT(*) FROM c WHERE TRIM(PaymentMethod) = ''
UNION ALL
SELECT 'MonthlyCharges', COUNT(*) FROM c WHERE MonthlyCharges IS NULL
UNION ALL
SELECT 'TotalCharges', COUNT(*) FROM c WHERE TRIM(TotalCharges) = ''
UNION ALL
SELECT 'Churn', COUNT(*) FROM c WHERE TRIM(Churn) = '';

-- 4. Cek data duplikat berdasarkan customerID
SELECT customerID, COUNT(*) AS Duplicate_Count
FROM c
GROUP BY customerID
HAVING COUNT(*) > 1;

-- ==========================
-- ANALISIS UTAMA (CHURN)
-- ==========================

-- 5. Korelasi churn terhadap jenis kontrak
SELECT COUNT(*) AS TotalChurn, Contract
FROM c
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY TotalChurn DESC;

-- 6. Rata-rata biaya bulanan pelanggan churn berdasarkan kontrak
SELECT Contract, AVG(MonthlyCharges) AS AvgMonthlyCharges, COUNT(*) AS TotalChurn
FROM c
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY AvgMonthlyCharges DESC;

-- 7. Segmentasi churn pada kontrak month-to-month & MonthlyCharges ≈ 73
SELECT COUNT(*) AS TotalChurn
FROM c
WHERE Contract = 'Month-to-month' AND Churn = 'Yes' AND MonthlyCharges BETWEEN 70 AND 75;

-- 8. Analisis layanan keamanan (OnlineSecurity) pada segmen tersebut
SELECT
    OnlineSecurity,
    COUNT(*) AS ChurnedCustomers,
    CAST(COUNT(*) AS REAL) * 100 / (
        SELECT COUNT(*)
        FROM c
        WHERE Contract = 'Month-to-month' AND Churn = 'Yes' AND MonthlyCharges BETWEEN 70 AND 75
    ) AS Percentage
FROM c
WHERE Contract = 'Month-to-month' AND Churn = 'Yes' AND MonthlyCharges BETWEEN 70 AND 75
GROUP BY OnlineSecurity
ORDER BY ChurnedCustomers DESC;

-- 9. Analisis jenis layanan internet pada segmen tersebut
SELECT
    InternetService,
    COUNT(*) AS ChurnedCustomers,
    CAST(COUNT(*) AS REAL) * 100 / (
        SELECT COUNT(*)
        FROM c
        WHERE Contract = 'Month-to-month' AND Churn = 'Yes' AND MonthlyCharges BETWEEN 70 AND 75
    ) AS Percentage
FROM c
WHERE Contract = 'Month-to-month' AND Churn = 'Yes' AND MonthlyCharges BETWEEN 70 AND 75
GROUP BY InternetService
ORDER BY ChurnedCustomers DESC;

-- 10. Distribusi churn berdasarkan durasi langganan (Tenure Bucket)
SELECT
    CASE
        WHEN Tenure <= 6 THEN '0-6 Months'
        WHEN Tenure BETWEEN 7 AND 12 THEN '7-12 Months'
        WHEN Tenure BETWEEN 13 AND 24 THEN '13-24 Months'
        ELSE '25+ Months'
    END AS TenureGroup,
    COUNT(*) AS ChurnedCustomers,
    CAST(COUNT(*) AS REAL) * 100 / (
        SELECT COUNT(*)
        FROM c
        WHERE Contract = 'Month-to-month' AND Churn = 'Yes' AND MonthlyCharges BETWEEN 70 AND 75
    ) AS Percentage
FROM c
WHERE Contract = 'Month-to-month' AND Churn = 'Yes' AND MonthlyCharges BETWEEN 70 AND 75
GROUP BY TenureGroup
ORDER BY TenureGroup;
