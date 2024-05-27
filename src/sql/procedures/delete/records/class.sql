CREATE OR ALTER PROCEDURE DeleteClass
    @class_id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Class
        WHERE id = @class_id;

        PRINT 'Class is successfully deleted!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Class!';
        PRINT ERROR_MESSAGE();
    END CATCH
END;
