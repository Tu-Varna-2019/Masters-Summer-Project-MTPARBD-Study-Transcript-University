CREATE
OR ALTER PROCEDURE InsertClass @year INT,
@day_of_week INT,
@duration TIME,
@time TIME,
@horarium_id INT,
@subject_id INT,
@semester_id INT,
@hall_id INT,
@lead_teacher_id INT AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Class (
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
VALUES (
        @year,
        @day_of_week,
        @duration,
        @time,
        @horarium_id,
        @subject_id,
        @semester_id,
        @hall_id,
        @lead_teacher_id
    )

END
END;
