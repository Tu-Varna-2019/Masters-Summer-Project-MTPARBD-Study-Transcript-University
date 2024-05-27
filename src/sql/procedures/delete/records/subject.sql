CREATE OR ALTER PROCEDURE DeleteSubject
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Subject
        WHERE id = @id;

        PRINT 'Subject is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Subject!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
