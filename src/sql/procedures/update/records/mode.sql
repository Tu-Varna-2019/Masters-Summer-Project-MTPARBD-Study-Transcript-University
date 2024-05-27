CREATE
OR ALTER PROCEDURE UpdateMode @id INT,
@name VARCHAR(50) AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Mode
SET name = @name
WHERE id = @id;

PRINT 'Mode is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Mode!';

PRINT ERROR_MESSAGE();

END CATCH
END;