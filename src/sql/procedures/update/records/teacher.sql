CREATE
OR ALTER PROCEDURE UpdateTeacher @id INT,
@full_name VARCHAR(100) AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Teacher
SET full_name = @full_name
WHERE id = @id;

PRINT 'Teacher is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Teacher!';

PRINT ERROR_MESSAGE();

END CATCH;

END;