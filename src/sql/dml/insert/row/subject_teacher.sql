DECLARE @subject_id INT = 2,
    @teacher_id INT = 3;

EXEC InsertSubjectTeacher @subject_id,
@teacher_id;