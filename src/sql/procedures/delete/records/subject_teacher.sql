CREATE OR ALTER PROCEDURE DeleteSubjectTeacher
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.SubjectTeacher
        WHERE id = @id;

        PRINT 'SubjectTeacher is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete SubjectTeacher!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
