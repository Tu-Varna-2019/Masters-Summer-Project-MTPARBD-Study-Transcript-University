DECLARE @room_locations TABLE (
        room_number VARCHAR(10),
        full_name VARCHAR(100),
        building VARCHAR(50),
        floor INT
    );
INSERT INTO @room_locations (room_number, full_name, building, floor)
VALUES ('101TB', 'Faculty Lounge', 'Main Building', 1),
    (
        '102DS',
        'Discrete Structures Lab',
        'Science Building',
        2
    ),
    (
        '103BR',
        'Biology Research Room',
        'Science Building',
        2
    ),
    (
        '104PS',
        'Physics Seminar Room',
        'Main Building',
        2
    ),
    ('201CL', 'Chemistry Lab', 'Science Building', 2),
    (
        '202MT',
        'Mathematics Tutorial Room',
        'Mathematics Building',
        1
    ),
    (
        '203LLC',
        'Language Learning Center',
        'Language Building',
        1
    ),
    (
        '301HL',
        'History Lecture Hall',
        'Humanities Building',
        3
    ),
    ('204AS', 'Art Studio', 'Art Building', 2),
    (
        '205PR',
        'Psychology Testing Room',
        'Psychology Building',
        2
    );
DECLARE @room_number VARCHAR(10);
DECLARE @full_name VARCHAR(100);
DECLARE @building VARCHAR(50);
DECLARE @floor INT;
DECLARE location_cursor CURSOR FOR
SELECT room_number,
    full_name,
    building,
    floor
FROM @room_locations;
OPEN location_cursor;
FETCH NEXT
FROM location_cursor INTO @room_number,
    @full_name,
    @building,
    @floor;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertLocation @room_number = @room_number,
@full_name = @full_name,
@building = @building,
@floor = @floor;
FETCH NEXT
FROM location_cursor INTO @room_number,
    @full_name,
    @building,
    @floor;
END;
CLOSE location_cursor;
DEALLOCATE location_cursor;