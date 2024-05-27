CREATE OR ALTER PROCEDURE DeleteSemester
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Semester
        WHERE id = @id;

        PRINT 'Semester is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Semester!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
