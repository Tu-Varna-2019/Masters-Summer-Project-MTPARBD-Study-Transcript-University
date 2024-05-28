CREATE OR ALTER TRIGGER Trigger_UpdateSubject ON Subject
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @name VARCHAR(100);
    SELECT @name = name FROM inserted;

    IF (
        SELECT 1
        FROM Subject
        WHERE name = @name
    ) > 0
    BEGIN
        RAISERROR ('Subject already exists!', 16, 1);
        RETURN;
    END;

    PRINT 'Subject provided values are correct! Moving on...';
END;
