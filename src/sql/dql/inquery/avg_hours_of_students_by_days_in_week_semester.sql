SELECT
    day_of_week,
    AvgHours AS Average_Hours
FROM
    AvgHoursPerStudentPerDay
WHERE
    semester_id = 1
ORDER BY
    day_of_week;
