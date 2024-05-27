CREATE OR ALTER PROCEDURE DeleteStudentGroup
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.StudentGroup
        WHERE id = @id;

        PRINT 'StudentGroup is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete StudentGroup!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
