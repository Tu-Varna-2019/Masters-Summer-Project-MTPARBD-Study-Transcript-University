CREATE
OR ALTER TRIGGER Trigger_InsertSubjectTeacher ON SubjectTeacher INSTEAD OF
INSERT , UPDATE, DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @subject_id INT,
    @teacher_id INT;

SELECT @subject_id = subject_id,
    @teacher_id = teacher_id
FROM inserted;

IF EXISTS (
    SELECT 1
    FROM SubjectTeacher
    WHERE subject_id = @subject_id
        AND teacher_id = @teacher_id
) BEGIN RAISERROR ('SubjectTeacher already exists!', 16, 1);

END
ELSE BEGIN BEGIN TRY
INSERT INTO SubjectTeacher (subject_id, teacher_id)
SELECT subject_id,
    teacher_id
FROM inserted;

PRINT 'SubjectTeacher provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert SubjectTeacher!';

PRINT ERROR_MESSAGE();

END CATCH
END;

END;
