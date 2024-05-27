CREATE
OR ALTER TRIGGER Trigger_InsertClass ON Class INSTEAD OF
INSERT, UPDATE, DELETE AS BEGIN
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
END --Check if lead teacher is part of the teacher group for the specific subject --
ELSE IF (
    SELECT COUNT(1)
    FROM SubjectTeacher AS st
        INNER JOIN Subject AS s ON (st.subject_id = s.id)
        INNER JOIN Class AS c ON (s.id = c.subject_id)
    WHERE c.lead_teacher_id = @lead_teacher_id
        AND st.teacher_id != @lead_teacher_id
) > 0 BEGIN RAISERROR (
    'Leading teacher cannot teach the subject, because he is not assigned to the respective teacher group for the subject!',
    15,
    0
)
END
ELSE IF (
     @time <= '7:15'
        OR @time >= '20:00'
)  BEGIN RAISERROR (
    'Given time is prohibited, it`s out of approved time range (7:15 - 20:00)',
    15,
    0
)
END
ELSE IF (
    SELECT COUNT(1)
    FROM Class AS c
    WHERE @time >= c.time
        AND @time <= DATEADD(
            SECOND,
            DATEDIFF(SECOND, '00:00:00', c.time) + DATEDIFF(SECOND, '00:00:00', c.duration),
            c.time
        )
) > 0 BEGIN RAISERROR ('Time is already occupied!', 15, 0)
END
ELSE IF (
    SELECT SUM(DATEDIFF(MINUTE, '00:00', c.duration))
    FROM SubjectTeacher AS st
        INNER JOIN Teacher AS t ON (st.teacher_id = t.id)
        INNER JOIN Class AS c ON (t.id = c.lead_teacher_id)
    WHERE c.lead_teacher_id = @lead_teacher_id
) > (8 * 60) BEGIN RAISERROR ('Teacher working time exceeds 8!', 15, 0)
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
