CREATE
OR ALTER PROCEDURE UpdateSubject @id INT,
@name VARCHAR(100) AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Subject
SET name = @name
WHERE id = @id;

PRINT 'Subject is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Subject!';

PRINT ERROR_MESSAGE();

END CATCH;

END;