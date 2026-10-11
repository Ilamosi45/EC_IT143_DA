-- Scalar Function to Extract First Name
CREATE FUNCTION dbo.fn_GetFirstName (@ContactName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN CASE 
        WHEN CHARINDEX(' ', TRIM(@ContactName)) > 0 
        THEN SUBSTRING(TRIM(@ContactName), 1, CHARINDEX(' ', TRIM(@ContactName)) - 1)
        ELSE TRIM(@ContactName)
    END;
END;
GO

-- Scalar Function to Extract Last Name
CREATE FUNCTION dbo.fn_GetLastName (@ContactName NVARCHAR(100))
RETURNS NVARCHAR(50)
AS
BEGIN
    RETURN CASE 
        WHEN CHARINDEX(' ', TRIM(@ContactName)) > 0 
        THEN SUBSTRING(TRIM(@ContactName), CHARINDEX(' ', TRIM(@ContactName)) + 1, LEN(@ContactName))
        ELSE ''
    END;
END;