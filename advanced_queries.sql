-- Top 3 earners per JobRole
SELECT * FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY JobRole ORDER BY MonthlyIncome DESC) AS Ranks
  FROM hr_data
) AS Ranked
WHERE Ranks <= 3;

-- Attrition % by Department and Gender
SELECT Department, Gender,
       COUNT(*) AS Total,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_data
GROUP BY Department, Gender
ORDER BY AttritionRate DESC;

-- Employees with above average income and attrition
SELECT *
FROM hr_data
WHERE MonthlyIncome > (SELECT AVG(MonthlyIncome) FROM hr_data)
  AND Attrition = 'Yes';
