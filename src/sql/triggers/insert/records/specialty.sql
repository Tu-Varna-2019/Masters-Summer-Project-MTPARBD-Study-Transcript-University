CREATE TRIGGER Trigger_InsertSpecialty ON Specialty INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
DECLARE @name VARCHAR(50)
SELECT @name = name
FROM inserted;
IF @name = '' RAISERROR ('Specialty must not be empty!', 16, 1);
END;
BEGIN TRY
INSERT INTO Specialty (name)
SELECT name
FROM inserted;
PRINT 'Specialty provided values are correct! Moving on...';
END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert semester!';
PRINT ERROR_MESSAGE();
END CATCH;