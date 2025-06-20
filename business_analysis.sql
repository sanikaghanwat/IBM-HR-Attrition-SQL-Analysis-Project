-- Department-wise attrition rate
SELECT Department,
       COUNT(*) AS Total,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_data
GROUP BY Department
ORDER BY AttritionRate DESC;

-- Which education level has higher attrition?
SELECT Education,
       COUNT(*) AS Total,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_data
GROUP BY Education
ORDER BY AttritionRate DESC;

-- Average income vs Job Role
SELECT JobRole,
       ROUND(AVG(MonthlyIncome), 2) AS AvgIncome
FROM hr_data
GROUP BY JobRole
ORDER BY AvgIncome DESC;

-- Attrition by EnvironmentSatisfaction
SELECT EnvironmentSatisfaction,
       COUNT(*) AS Total,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_data
GROUP BY EnvironmentSatisfaction
ORDER BY AttritionRate DESC;
