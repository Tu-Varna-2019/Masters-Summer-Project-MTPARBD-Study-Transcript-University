CREATE OR ALTER PROCEDURE DeleteSpecialty
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Specialty
        WHERE id = @id;

        PRINT 'Specialty is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Specialty!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
