
CREATE VIEW AvgHoursPerStudentPerDay AS
SELECT
    c.semester_id,
    c.day_of_week,
    AVG(DATEDIFF(MINUTE, '00:00:00', c.duration) / 60.0) AS AvgHours
FROM
    university.dbo.Class c
JOIN
    university.dbo.StudentGroupClass sgc ON c.id = sgc.class_id
GROUP BY
    c.semester_id,
    c.day_of_week;
