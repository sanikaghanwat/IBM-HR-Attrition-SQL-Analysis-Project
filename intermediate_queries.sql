-- Age group-wise attrition by gender
SELECT
  CASE
    WHEN Age < 25 THEN '<25'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
  END AS AgeGroup,
  Gender,
  COUNT(*) AS Total,
  COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount
FROM hr_data
GROUP BY AgeGroup, Gender
ORDER BY AttritionCount DESC;

-- Attrition count by job role
SELECT JobRole, COUNT(*) AS AttritionCount
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY AttritionCount DESC;

-- Overtime impact on attrition
SELECT OverTime,
       COUNT(*) AS TotalEmployees,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount
FROM hr_data
GROUP BY OverTime;

-- Monthly income group vs attrition
SELECT
  CASE
    WHEN MonthlyIncome < 3000 THEN '<3000'
    WHEN MonthlyIncome BETWEEN 3000 AND 5000 THEN '3000-5000'
    WHEN MonthlyIncome BETWEEN 5001 AND 7000 THEN '5001-7000'
    WHEN MonthlyIncome BETWEEN 7001 AND 10000 THEN '7001-10000'
    ELSE '>10000'
  END AS IncomeGroup,
  COUNT(*) AS TotalEmployees,
  COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount
FROM hr_data
GROUP BY IncomeGroup
ORDER BY AttritionCount DESC;

-- WorkLifeBalance effect on attrition
SELECT WorkLifeBalance,
       COUNT(*) AS Total,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_data
GROUP BY WorkLifeBalance;

-- Distance from home and attrition
SELECT
  CASE
    WHEN DistanceFromHome < 10 THEN '<10'
    WHEN DistanceFromHome BETWEEN 10 AND 19 THEN '10-19'
    WHEN DistanceFromHome BETWEEN 20 AND 29 THEN '20-29'
    ELSE '30+'
  END AS DistanceGroup,
  COUNT(*) AS Total,
  COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
  ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_data
GROUP BY DistanceGroup
ORDER BY AttritionCount DESC;

-- Attrition count by Marital Status
SELECT MaritalStatus,
       COUNT(*) AS Total,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_data
GROUP BY MaritalStatus
ORDER BY AttritionRate DESC;
