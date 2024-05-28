CREATE
OR ALTER TRIGGER Trigger_InsertSpecialty ON Specialty AFTER
INSERT
     AS BEGIN
SET NOCOUNT ON;

DECLARE @name VARCHAR(50);

SELECT @name = name
FROM inserted;


PRINT 'Specialty provided values are correct! Moving on...';
END;
