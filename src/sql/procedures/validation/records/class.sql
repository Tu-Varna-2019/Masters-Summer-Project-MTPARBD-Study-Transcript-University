CREATE
OR ALTER PROCEDURE ValidateClass @year INT,
@day_of_week INT,
@duration TIME,
@time TIME,
@horarium_id INT,
@subject_id INT,
@semester_id INT,
@hall_id INT,
@lead_teacher_id INT AS BEGIN -- Restrict lead teacher from teaching more than 4 different type of subjects --
IF (
    SELECT COUNT(*)
    from class
    where lead_teacher_id = @lead_teacher_id
) > 4 begin raiserror (
    'lead teacher has reached maximum subject variants: 4 !',
    16,
    1
)
end --check if lead teacher is part of the teacher group for the specific subject --
else if (
    select 1
    from subjectteacher as st
    where st.teacher_id = @lead_teacher_id
        and st.subject_id = @subject_id
) = 0 begin raiserror (
    'leading teacher cannot teach the subject, because he is not assigned to the respective teacher group for the subject!',
    16,
    0
)
end
else if (
    @time <= '7:15'
    or @time >= '20:00'
) begin raiserror (
    'given time is prohibited, it`s out of approved time range (7:15 - 20:00)',
    16,
    0
)
end
else if (
    select 1
    from class as c
    where @year = c.year
        and @day_of_week = c.day_of_week
    AND @time < DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', c.time), c.duration)
    AND DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', @time), @duration) > c.time
) > 0 begin raiserror ('time is already occupied!', 16, 0)
end
ELSE IF (
    SELECT SUM(DATEDIFF(MINUTE, '00:00', c.duration))
    FROM SubjectTeacher AS st
        INNER JOIN Teacher AS t ON (st.teacher_id = t.id)
        INNER JOIN Class AS c ON (t.id = c.lead_teacher_id)
    WHERE c.lead_teacher_id = @lead_teacher_id
) > (8 * 60) BEGIN RAISERROR ('Teacher working time exceeds 8!', 16, 0)
END
END;
