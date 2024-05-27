CREATE
OR ALTER PROCEDURE UpdateHorarium @id INT,
@type VARCHAR(50)
AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Horarium
SET type = @type
WHERE id = @id;

PRINT 'Horarium is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Horarium!';

PRINT ERROR_MESSAGE();

END CATCH
END;
