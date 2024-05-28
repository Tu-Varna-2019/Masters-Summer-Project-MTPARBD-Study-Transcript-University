CREATE
OR ALTER TRIGGER Trigger_InsertSubjectTeacher ON SubjectTeacher AFTER 
INSERT,
    UPDATE AS BEGIN
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

END PRINT 'SubjectTeacher provided values are correct! Moving on...';

END;