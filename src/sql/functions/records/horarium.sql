ALTER TRIGGER Trigger_InsertHorarium ON Horarium INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
DECLARE @type VARCHAR(50)
SELECT @type = type
FROM inserted;
IF @type NOT IN ('lecture', 'laboratory', 'coursework') BEGIN RAISERROR (
    'Type has incorrect value! It must be one of: lecture, laboratory, coursework',
    16,
    1
);
END
ELSE BEGIN TRY
INSERT INTO Horarium (type)
SELECT type
FROM inserted;
PRINT 'Horarium provided values are correct! Moving on...';
END TRY BEGIN CATCH PRINT 'Error occured when trying to insert horarium!';
PRINT ERROR_MESSAGE();
END CATCH
END;