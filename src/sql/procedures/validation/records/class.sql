CREATE OR ALTER PROCEDURE ValidateClass 
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

    IF (
        (SELECT COUNT(*) FROM Class WHERE lead_teacher_id = @lead_teacher_id) > 4
    )
    BEGIN
        RAISERROR ('Lead teacher has reached the maximum subject variants: 4!', 16, 1);
    END
    ELSE IF (
        NOT EXISTS (
            SELECT 1
            FROM SubjectTeacher AS st
            WHERE st.teacher_id = @lead_teacher_id
            AND st.subject_id = @subject_id
        )
    )
    BEGIN
        RAISERROR ('Leading teacher cannot teach the subject because he is not assigned to the respective teacher group for the subject!', 16, 0);
    END
    ELSE IF (
        @time <= '07:15' OR @time >= '20:00'
    )
    BEGIN
        RAISERROR ('Given time is prohibited, it is out of the approved time range (07:15 - 20:00)', 16, 0);
    END
    ELSE IF (
        EXISTS (
            SELECT 1
            FROM Class AS c
            WHERE 
                @year = c.year
                AND @day_of_week = c.day_of_week
                AND (
                    (@time < DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', c.time), c.duration))
                    AND (DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', @time), @duration) > c.time)
                )
        )
    )
    BEGIN
        RAISERROR ('Time is already occupied!', 16, 0);
    END
    ELSE IF (
        (SELECT SUM(DATEDIFF(MINUTE, '00:00', c.duration))
        FROM Teacher AS t
        INNER JOIN Class AS c ON t.id = c.lead_teacher_id
        WHERE c.lead_teacher_id = @lead_teacher_id
        ) > (8 * 60)
    )
    BEGIN
        RAISERROR ('Teacher working time exceeds 8 hours!', 16, 0);
    END
END;
