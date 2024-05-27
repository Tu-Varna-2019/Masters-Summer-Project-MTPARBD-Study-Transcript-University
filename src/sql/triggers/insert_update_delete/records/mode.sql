CREATE
OR ALTER TRIGGER Trigger_InsertMode ON Mode INSTEAD OF
INSERT,
    UPDATE,
    DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @name VARCHAR(50)
SELECT @name = name
FROM inserted;

IF @name NOT IN ('regular', 'part') BEGIN RAISERROR (
    'Mode has incorrect value! It must be one of: regular, part',
    16,
    1
);

END
ELSE BEGIN TRY
INSERT INTO Mode (name)
SELECT name
FROM inserted;

PRINT 'Mode provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert mode!';

PRINT ERROR_MESSAGE();

END CATCH
END;