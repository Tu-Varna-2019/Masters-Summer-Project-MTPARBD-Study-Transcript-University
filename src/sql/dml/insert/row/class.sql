DECLARE @year INT = 2025,
@day_of_week INT = 2,
@duration TIME = '00:01:30',
@time TIME = '09:44:00',
@horarium_id INT = 1,
@subject_id INT = 1,
@semester_id INT = 2,
@hall_id INT = 5,
@lead_teacher_id INT = 2;


select *
    from class as c
    where @year = c.year
        and @day_of_week = c.day_of_week
    AND @time < DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', c.time), c.duration)
    AND DATEADD(SECOND, DATEDIFF(SECOND, '00:00:00', @time), @duration) > c.time;