CREATE OR ALTER PROCEDURE DeleteLocation
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Location
        WHERE id = @id;

        PRINT 'Location is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Location!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
