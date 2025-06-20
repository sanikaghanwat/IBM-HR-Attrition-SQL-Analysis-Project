-- View first 10 rows
SELECT * FROM hr_data LIMIT 10;

-- Column names and data types
DESCRIBE hr_data;

-- Check total number of rows
SELECT COUNT(*) FROM hr_data;

-- Check max and min age
SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge FROM hr_data;

-- Rename weird column if needed (already done)
ALTER TABLE hr_data CHANGE `Age` Age INT;

-- Distinct values in categorical columns
SELECT DISTINCT BusinessTravel FROM hr_data;
SELECT DISTINCT Department FROM hr_data;
SELECT DISTINCT EducationField FROM hr_data;
SELECT DISTINCT JobRole FROM hr_data;
SELECT DISTINCT MaritalStatus FROM hr_data;

-- Average values of numerical columns
SELECT 
    AVG(DistanceFromHome) AS AvgDistance, 
    AVG(MonthlyIncome) AS AvgIncome, 
    AVG(YearsAtCompany) AS AvgYears 
FROM hr_data;

-- Gender distribution
SELECT Gender, COUNT(*) AS Count FROM hr_data GROUP BY Gender;

-- Attrition rate
SELECT 
    Attrition, COUNT(*) AS Count,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM hr_data), 2) AS Percentage
FROM hr_data
GROUP BY Attrition;
