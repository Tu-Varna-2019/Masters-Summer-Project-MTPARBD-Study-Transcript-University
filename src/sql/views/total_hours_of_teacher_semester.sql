
CREATE PROCEDURE TotalHoursForTeacher
    @teacher_id INT,
    @semester_id INT
AS
BEGIN
    SELECT
        t.full_name,
        SUM(DATEDIFF(MINUTE, '00:00:00', c.duration) / 60.0) AS TotalHours
    FROM
        university.dbo.Class c
    JOIN
        university.dbo.Teacher t ON c.lead_teacher_id = t.id
    WHERE
        c.lead_teacher_id = @teacher_id AND
        c.semester_id = @semester_id
    GROUP BY
        t.full_name;
END;
