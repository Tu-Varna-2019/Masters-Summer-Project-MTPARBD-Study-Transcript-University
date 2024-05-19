ALTER TRIGGER Trigger_InsertClass ON Class INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
IF (
    SELECT COUNT(*)
    FROM inserted
    WHERE year IS NULL
        OR time IS NULL
        OR duration IS NULL
        OR day_of_week IS NULL
) > 0 BEGIN RAISERROR ('Class params must not be empty!', 16, 1);
END
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