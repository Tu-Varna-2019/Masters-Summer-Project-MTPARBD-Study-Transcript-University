CREATE OR ALTER TRIGGER Trigger_UpdateSemester ON Semester
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @semester_number VARCHAR(50);
    SELECT @semester_number = semester_number FROM inserted;

    IF @semester_number NOT IN (1, 2)
    BEGIN
        RAISERROR ('Semester has incorrect value! It must be one of: 1, 2', 16, 1);
    END;

    PRINT 'Semester provided values are correct! Moving on...';
END;
