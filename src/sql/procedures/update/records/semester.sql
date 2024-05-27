CREATE
OR ALTER PROCEDURE UpdateSemester @id INT,
@semester_number INT AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Semester
SET semester_number = @semester_number
WHERE id = @id;

PRINT 'Semester is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Semester!';

PRINT ERROR_MESSAGE();

END CATCH
END;
