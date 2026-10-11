CREATE TRIGGER dbo.tr_t_w3_schools_customers_AfterUpdate
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET t.last_modified_date = GETDATE(),
        t.last_modified_by = SUSER_NAME() -- Tracks the database/server user
    FROM dbo.t_w3_schools_customers t
    INNER JOIN inserted i ON t.CustomerID = i.CustomerID; 
END;