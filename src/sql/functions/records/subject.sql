ALTER TRIGGER Trigger_InsertSubject ON Subject INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
DECLARE @name VARCHAR(100);
DECLARE @teacher_id INT;
SELECT @name = name
FROM inserted;
SELECT @teacher_id = teacher_id
FROM inserted;
BEGIN TRY
INSERT INTO Subject (teacher_id, name)
SELECT teacher_id,
    name
FROM inserted;
PRINT 'Subject provided values are correct! Moving on...';
END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert Subject!';
PRINT ERROR_MESSAGE();
END CATCH
END;