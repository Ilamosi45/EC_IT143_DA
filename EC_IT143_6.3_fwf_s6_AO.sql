SELECT ContactName,
       SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) AS AdHoc_FirstName,
       dbo.fn_GetFirstName(ContactName) AS UDF_FirstName
FROM dbo.t_w3_schools_customers;