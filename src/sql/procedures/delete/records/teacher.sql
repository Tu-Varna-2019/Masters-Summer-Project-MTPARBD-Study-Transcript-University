CREATE OR ALTER PROCEDURE DeleteTeacher
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Teacher
        WHERE id = @id;

        PRINT 'Teacher is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Teacher!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
