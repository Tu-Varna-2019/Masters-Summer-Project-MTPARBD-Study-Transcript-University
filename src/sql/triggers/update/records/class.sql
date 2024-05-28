CREATE
OR ALTER TRIGGER Trigger_UpdateClass ON Class INSTEAD OF
UPDATE AS BEGIN
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

SELECT @year = i.year,
    @day_of_week = i.day_of_week,
    @duration = i.duration,
    @time = i.time,
    @horarium_id = i.horarium_id,
    @subject_id = i.subject_id,
    @semester_id = i.semester_id,
    @hall_id = i.hall_id,
    @lead_teacher_id = i.lead_teacher_id
FROM inserted i;

BEGIN TRY EXEC ValidateClass @year,
@day_of_week,
@duration,
@time,
@horarium_id,
@subject_id,
@semester_id,
@hall_id,
@lead_teacher_id;

UPDATE c
SET c.year = i.year,
    c.day_of_week = i.day_of_week,
    c.duration = i.duration,
    c.time = i.time,
    c.horarium_id = i.horarium_id,
    c.subject_id = i.subject_id,
    c.semester_id = i.semester_id,
    c.hall_id = i.hall_id,
    c.lead_teacher_id = i.lead_teacher_id
FROM Class c
    INNER JOIN inserted i ON c.id = i.id;

PRINT 'Class data updated successfully!';

END TRY BEGIN CATCH PRINT 'Validation failed: ' + ERROR_MESSAGE();

END CATCH;

END;
