WITH CTE_Compare AS (
    SELECT SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS AdHoc,
           dbo.fn_GetFirstName(ContactName) AS UDF
    FROM dbo.t_w3_schools_customers
    WHERE CHARINDEX(' ', ContactName) > 0
)
SELECT * FROM CTE_Compare WHERE AdHoc <> UDF; -- Target: 0 rows returned