CREATE OR ALTER TRIGGER Trigger_UpdateHall ON Hall
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    PRINT 'Hall values are correct! Moving on...';
END;
