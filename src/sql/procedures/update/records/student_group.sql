CREATE
OR ALTER PROCEDURE UpdateStudentGroup @id INT,
@group_number INT,
@course INT,
@specialty_id INT,
@mode INT AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.StudentGroup
SET group_number = @group_number,
    course = @course,
    specialty_id = @specialty_id,
    mode_id = @mode
WHERE id = @id;

PRINT 'StudentGroup is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update StudentGroup!';

PRINT ERROR_MESSAGE();

END CATCH
END;