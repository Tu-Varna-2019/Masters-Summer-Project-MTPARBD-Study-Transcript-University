CREATE OR ALTER PROCEDURE UpdateSubjectTeacher
    @id INT,
    @subject_id INT,
    @teacher_id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE dbo.SubjectTeacher
        SET
            subject_id = @subject_id,
            teacher_id = @teacher_id
        WHERE
            id = @id;

        PRINT 'SubjectTeacher is successfully updated!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to update SubjectTeacher!';
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
