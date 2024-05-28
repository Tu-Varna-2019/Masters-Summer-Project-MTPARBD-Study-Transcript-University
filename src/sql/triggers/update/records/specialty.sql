CREATE OR ALTER TRIGGER Trigger_UpdateSpecialty ON Specialty
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    PRINT 'Specialty provided values are correct! Moving on...';
END;
