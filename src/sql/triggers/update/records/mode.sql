CREATE
OR ALTER TRIGGER Trigger_InsertMode ON Mode AFTER 
INSERT,
    UPDATE
     AS BEGIN
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
PRINT 'Mode provided values are correct! Moving on...';

END;
