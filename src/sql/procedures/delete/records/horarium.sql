CREATE OR ALTER PROCEDURE DeleteHorarium
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Horarium
        WHERE id = @id;

        PRINT 'Horarium is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Horarium!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
