CREATE
OR ALTER PROCEDURE UpdateSpecialty @id INT,
@name VARCHAR(50) AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Specialty
SET name = @name
WHERE id = @id;

PRINT 'Specialty is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Specialty!';

PRINT ERROR_MESSAGE();

END CATCH
END;