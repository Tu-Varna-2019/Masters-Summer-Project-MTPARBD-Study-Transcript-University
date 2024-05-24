CREATE
OR ALTER TRIGGER Trigger_InsertClass ON Class INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;

DECLARE @day_of_week INT,
    @duration TIME,
    @time TIME,
    @horarium_id INT,
    @subject_id INT,
    @semester_id INT,
    @hall_id INT,
    @lead_teacher_id INT;

SELECT @day_of_week = day_of_week,
    @duration = duration,
    @time = time,
    @horarium_id = horarium_id,
    @subject_id = subject_id,
    @semester_id = semester_id,
    @hall_id = hall_id,
    @lead_teacher_id = lead_teacher_id
FROM inserted;

-- Restrict lead teacher from teaching more than 4 different type of subjects --
IF (
    SELECT COUNT(*)
    FROM Class
    WHERE lead_teacher_id = @lead_teacher_id
) > 4 BEGIN RAISERROR (
    'Lead teacher has reached maximum subject variants: 4 !',
    16,
    1
)
END -- Check if lead teacher is part of the teacher group for the specific subject --
-- ELSE IF (
--     SELECT 1
--     FROM Class AS c
--         INNER JOIN Subject AS s ON (c.subject_id = s.id)
--     WHERE c.lead_teacher_id = @lead_teacher_id
--         AND s.teacher_id = @lead_teacher_id
-- ) > 0 BEGIN RAISERROR (
--     'Leading teacher cannot teach the subject, because he isnt assigned to the respective teacher group for the subject!',
--     16,
--     1
-- )
-- END
ELSE BEGIN BEGIN TRY
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

PRINT 'Class provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert Class!';

PRINT ERROR_MESSAGE();

END CATCH
END
END;