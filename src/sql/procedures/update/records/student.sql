CREATE OR ALTER PROCEDURE UpdateStudent
    @id INT,
    @name VARCHAR(50),
    @faculty_number VARCHAR(8),
    @studentgroup_id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE dbo.Student
        SET
            name = @name,
            faculty_number = @faculty_number,
            studentgroup_id = @studentgroup_id
        WHERE
            id = @id;

        PRINT 'Student is successfully updated!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to update Student!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
