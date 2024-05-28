CREATE OR ALTER TRIGGER Trigger_UpdateHorarium ON Horarium
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @type VARCHAR(50);
    SELECT @type = type FROM inserted;

    IF @type NOT IN ('lecture', 'laboratory', 'coursework')
    BEGIN
        RAISERROR ('Type has incorrect value! It must be one of: lecture, laboratory, coursework', 16, 1);
    END;

    PRINT 'Horarium provided values are correct! Moving on...';
END;
