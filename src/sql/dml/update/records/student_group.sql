DECLARE @id INT = 4,
    @group_number INT = 14,
    @course INT = 2,
    @specialty_id INT = 2,
    @mode INT = 1;

EXEC UpdateStudentGroup @id,
@group_number,
@course,
@specialty_id,
@mode;