DECLARE @halls TABLE (
        capacity VARCHAR(10),
        number_of_work_places VARCHAR(100),
        location_id VARCHAR(50),
        floor INT
    );
INSERT INTO @halls (capacity, number_of_work_places, location_id)
VALUES (31, 10, 1),
    (22, 22, 2),
    (10, 3, 3),
    (2, 0, 4),
    (33, 12, 5),
    (202, 3, 6),
    (12, 6, 7),
    (66, 3, 8),
    (11, 10, 9),
    (9, 8, 10);
DECLARE @capacity VARCHAR(10);
DECLARE @number_of_work_places VARCHAR(100);
DECLARE @location_id VARCHAR(50);
DECLARE location_cursor CURSOR FOR
SELECT capacity,
    number_of_work_places,
    location_id
FROM @halls;
OPEN location_cursor;
FETCH NEXT
FROM location_cursor INTO @capacity,
    @number_of_work_places,
    @location_id;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertHall @capacity = @capacity,
@number_of_work_places = @number_of_work_places,
@location_id = @location_id;
FETCH NEXT
FROM location_cursor INTO @capacity,
    @number_of_work_places,
    @location_id;
END;
CLOSE location_cursor;
DEALLOCATE location_cursor;