CREATE VIEW AvgHoursPerHallPerDay AS
SELECT h.id AS HallID,
    c.day_of_week,
    AVG(DATEDIFF(MINUTE, '00:00:00', c.duration) / 60.0) AS AvgHoursPerDay
FROM university.dbo.Hall h
    JOIN university.dbo.Class c ON h.id = c.hall_id
GROUP BY h.id,
    c.day_of_week;