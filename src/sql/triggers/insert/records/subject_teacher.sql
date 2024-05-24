CREATE
OR ALTER TRIGGER Trigger_InsertSubjectTeacher ON SubjectTeacher INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;

DECLARE @subject_id INT,
    @teacher_id INT;

SELECT @subject_id = subject_id,
    @teacher_id = teacher_id
FROM inserted;

-- IF @subject_id = '' RAISERROR ('SubjectTeacher name must not be empty!', 16, 1);,teacher_id
-- END;
BEGIN TRY
INSERT INTO SubjectTeacher (subject_id, teacher_id)
SELECT subject_id,
    teacher_id
FROM inserted;

PRINT 'SubjectTeacher provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert semester!';

PRINT ERROR_MESSAGE();

END CATCH
END;