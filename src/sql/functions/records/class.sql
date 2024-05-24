ALTER TRIGGER Trigger_InsertClass ON Class INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
BEGIN BEGIN TRY
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