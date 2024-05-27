CREATE OR ALTER PROCEDURE DeleteStudentGroupClass
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.StudentGroupClass
        WHERE id = @id;

        PRINT 'StudentGroupClass is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete StudentGroupClass!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
