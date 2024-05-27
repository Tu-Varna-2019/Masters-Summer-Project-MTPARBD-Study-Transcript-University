CREATE
OR ALTER TRIGGER Trigger_InsertSpecialty ON Specialty INSTEAD OF
INSERT,
    UPDATE,
    DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @name VARCHAR(50);

SELECT @name = name
FROM inserted;

BEGIN TRY
INSERT INTO Specialty (name)
SELECT name
FROM inserted;

PRINT 'Specialty provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert semester!';

PRINT ERROR_MESSAGE();

END CATCH;

END;