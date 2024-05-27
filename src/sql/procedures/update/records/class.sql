CREATE OR ALTER PROCEDURE UpdateClass
    @class_id INT,
    @year INT,
    @day_of_week INT,
    @duration TIME,
    @time TIME,
    @horarium_id INT,
    @subject_id INT,
    @semester_id INT,
    @hall_id INT,
    @lead_teacher_id INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE dbo.Class
        SET
            year = @year,
            day_of_week = @day_of_week,
            duration = @duration,
            [time] = @time,
            horarium_id = @horarium_id,
            subject_id = @subject_id,
            semester_id = @semester_id,
            hall_id = @hall_id,
            lead_teacher_id = @lead_teacher_id
        WHERE id = @class_id;

        PRINT 'Class is successfully updated!';
    END TRY
    BEGIN CATCH
        PRINT 'Error occurred when trying to update Class!';
        PRINT ERROR_MESSAGE();
    END CATCH
END;
