DECLARE @year INT,
    @day_of_week INT,
    @duration INT,
    @time TIME,
    @horarium_id INT,
    @subject_id INT,
    @semester_id INT,
    @hall_id INT,
    @lead_teacher_id INT;
DECLARE class_cursor CURSOR FOR
SELECT year,
    day_of_week,
    duration,
    time,
    horarium_id,
    subject_id,
    semester_id,
    hall_id,
    lead_teacher_id
FROM (
        VALUES (2023, 1, 1.5, '09:00:00', 8, 1, 1, 1, 1),
            (2023, 2, 2.0, '10:30:00', 2, 11, 1, 2, 2),
            (2023, 3, 1.5, '13:00:00', 3, 8, 1, 3, 3),
            (2023, 4, 1.0, '14:30:00', 4, 8, 1, 4, 4),
            (2023, 5, 2.5, '16:00:00', 5, 12, 1, 5, 5),
            (2023, 1, 1.0, '09:00:00', 6, 12, 2, 1, 6),
            (2023, 2, 2.0, '10:00:00', 7, 11, 2, 2, 7),
            (2023, 3, 1.5, '13:00:00', 8, 11, 2, 3, 8),
            (2023, 4, 1.5, '14:30:00', 9, 11, 2, 4, 9),
            (2023, 5, 2.0, '16:00:00', 10, 8, 2, 5, 10)
    ) AS ClassData (
        year,
        day_of_week,
        duration,
        time,
        horarium_id,
        subject_id,
        semester_id,
        hall_id,
        lead_teacher_id
    );
OPEN class_cursor;
FETCH NEXT
FROM class_cursor INTO @year,
    @day_of_week,
    @duration,
    @time,
    @horarium_id,
    @subject_id,
    @semester_id,
    @hall_id,
    @lead_teacher_id;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertClass @year = @year,
@day_of_week = @day_of_week,
@duration = @duration,
@time = @time,
@horarium_id = @horarium_id,
@subject_id = @subject_id,
@semester_id = @semester_id,
@hall_id = @hall_id,
@lead_teacher_id = @lead_teacher_id;
FETCH NEXT
FROM class_cursor INTO @year,
    @day_of_week,
    @duration,
    @time,
    @horarium_id,
    @subject_id,
    @semester_id,
    @hall_id,
    @lead_teacher_id;
END;
CLOSE class_cursor;
DEALLOCATE class_cursor;