DECLARE @year INT,
    @day_of_week INT,
    @duration TIME,
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
        VALUES             
            (2024, 1, '01:30:00', '09:00:00', 1, 1, 1, 11, 1),
    (2024, 2, '01:30:00', '10:30:00', 2, 2, 1, 12, 2),
    (2024, 3, '01:30:30', '13:00:30', 1, 3, 1, 13, 3),
    (2024, 4, '01:30:00', '14:30:00', 3, 4, 1, 14, 4),
    (2024, 5, '01:30:00', '16:00:00', 2, 5, 1, 15, 5),
    (2024, 6, '01:30:00', '09:30:00', 2, 6, 2, 16, 6),
    (2024, 7, '01:30:00', '10:00:00', 2, 7, 2, 17, 7),
    (2024, 8, '01:30:00', '13:00:00', 3, 8, 2, 18, 8),
    (2024, 9, '01:30:00', '14:30:00', 3, 9, 2, 19, 9),
    (2024, 10, '00:01:30', '16:01:30', 1, 10, 2, 15, 10),
            (2023, 1, '01:30:00', '09:00:00', 1, 1, 1, 11, 1),
    (2023, 2, '01:30:00', '10:30:00', 2, 2, 1, 12, 2),
    (2023, 3, '01:30:30', '13:00:30', 1, 3, 1, 13, 3),
    (2023, 4, '01:30:00', '14:30:00', 3, 4, 1, 14, 4),
    (2023, 5, '01:30:00', '16:00:00', 2, 5, 1, 15, 5),
    (2023, 6, '01:30:00', '09:30:00', 2, 6, 2, 16, 6),
    (2023, 7, '01:30:00', '10:00:00', 2, 7, 2, 17, 7),
    (2023, 8, '01:30:00', '13:00:00', 3, 8, 2, 18, 8),
    (2023, 9, '01:30:00', '14:30:00', 3, 9, 2, 19, 9),
    (2023, 10, '00:01:30', '16:01:30', 1, 10, 2, 15, 10)
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
@lead_teacher_id = @lead_teacher_id FETCH NEXT
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