CREATE
OR ALTER PROCEDURE InsertSubjectTeacher @subject_id INT,
@teacher_id INT AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.SubjectTeacher (subject_id, teacher_id)
VALUES (@subject_id, @teacher_id) PRINT 'SubjectTeacher is successfully added!';

END
END;