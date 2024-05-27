CREATE OR ALTER PROCEDURE DeleteHall
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Hall
        WHERE id = @id;

        IF @@ROWCOUNT > 0
        BEGIN
            PRINT 'Hall is successfully deleted!';
        END
        ELSE
        BEGIN
            PRINT 'No records were deleted for Hall with ID: ' + CAST(@id AS VARCHAR(10));
        END
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to delete Hall!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
