CREATE OR ALTER PROCEDURE DeleteMode
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Mode
        WHERE id = @id;

        PRINT 'Mode is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Mode!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
