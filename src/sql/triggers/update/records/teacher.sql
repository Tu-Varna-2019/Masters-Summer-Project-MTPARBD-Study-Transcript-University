CREATE OR ALTER TRIGGER Trigger_UpdateTeacher ON Teacher
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @full_name VARCHAR(100);
    SELECT @full_name = full_name FROM inserted;

    IF @full_name = ''
    BEGIN
        RAISERROR ('Teacher name must not be empty!', 16, 1);
    END;

    PRINT 'Teacher provided values are correct! Moving on...';
END;
