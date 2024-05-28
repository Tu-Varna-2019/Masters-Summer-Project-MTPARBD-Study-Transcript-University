
DECLARE @id INT = 24,
@subject_id INT = 1,
@teacher_id INT = 4;

EXEC UpdateSubjectTeacher @id,
@subject_id,
@teacher_id;
