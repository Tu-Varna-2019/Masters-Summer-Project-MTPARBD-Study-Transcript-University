SELECT
    day_of_week,
    AvgHoursPerDay AS Average_Hours_Per_Day
FROM
    AvgHoursPerHallPerDay
WHERE
    HallID = 11
ORDER BY
    day_of_week;
