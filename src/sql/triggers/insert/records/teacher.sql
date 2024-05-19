ALTER  TRIGGER Trigger_InsertTeacher ON Teacher INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
DECLARE @full_name VARCHAR(50)
SELECT @full_name = full_name
FROM inserted;
IF @full_name = '' RAISERROR ('Teacher must not be empty!', 16, 1);
END;
BEGIN TRY
INSERT INTO Teacher (full_name)
SELECT full_name
FROM inserted;
PRINT 'Teacher provided values are correct! Moving on...';
END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert semester!';
PRINT ERROR_MESSAGE();
END CATCH;