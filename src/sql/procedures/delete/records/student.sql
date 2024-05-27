CREATE OR ALTER PROCEDURE DeleteStudent
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Student
        WHERE id = @id;

        PRINT 'Student is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Student!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
