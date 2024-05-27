CREATE
OR ALTER TRIGGER Trigger_InsertSubject ON Subject INSTEAD OF
INSERT , UPDATE, DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @name VARCHAR(100);

SELECT @name = name
FROM inserted;

IF (
    SELECT 1
    FROM Subject
    WHERE name = @name
) > 0 BEGIN RAISERROR('Subject already exists!', 16, 1)
END
ELSE BEGIN TRY
INSERT INTO Subject (name)
SELECT name
FROM inserted;

PRINT 'Subject provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert Subject!';

PRINT ERROR_MESSAGE();

END CATCH
END;
