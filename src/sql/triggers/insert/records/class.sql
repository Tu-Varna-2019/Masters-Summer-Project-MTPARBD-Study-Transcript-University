CREATE
OR ALTER TRIGGER Trigger_InsertClass ON Class INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;

DECLARE @year INT,
    @day_of_week INT,
    @duration TIME,
    @time TIME,
    @horarium_id INT,
    @subject_id INT,
    @semester_id INT,
    @hall_id INT,
    @lead_teacher_id INT;

SELECT @year = year,
    @day_of_week = day_of_week,
    @duration = duration,
    @time = time,
    @horarium_id = horarium_id,
    @subject_id = subject_id,
    @semester_id = semester_id,
    @hall_id = hall_id,
    @lead_teacher_id = lead_teacher_id
FROM inserted;

BEGIN TRY EXEC ValidateClass @year,
@day_of_week,
@duration,
@time,
@horarium_id,
@subject_id,
@semester_id,
@hall_id,
@lead_teacher_id;

INSERT INTO Class (
        year,
        day_of_week,
        duration,
        time,
        horarium_id,
        subject_id,
        semester_id,
        hall_id,
        lead_teacher_id
    )
SELECT year,
    day_of_week,
    duration,
    time,
    horarium_id,
    subject_id,
    semester_id,
    hall_id,
    lead_teacher_id
FROM inserted;

PRINT 'Class data is valid! Moving on...'
END TRY BEGIN CATCH PRINT 'Validation failed: ' + ERROR_MESSAGE();

END CATCH;

END;