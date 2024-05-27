
DECLARE @id INT = 1,
@subject_id INT = 2,
@teacher_id INT = 3;

EXEC UpdateSubjectTeacher @id,
@subject_id,
@teacher_id;
