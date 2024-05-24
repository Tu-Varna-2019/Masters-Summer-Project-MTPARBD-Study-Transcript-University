DECLARE @group_number INT,
        @course INT,
        @specialty_id INT,
        @mode_id INT,
        @class_id INT;

DECLARE @StudentGroupData TABLE (
        group_number INT,
        course INT,
        specialty_id INT,
        mode_id INT,
        class_id INT
    );

INSERT INTO @StudentGroupData (
        group_number,
        course,
        specialty_id,
        mode_id,
        class_id
    )
VALUES (1, 1, 1, 1, 13),
    (2, 2, 1, 2, 15),
    (3, 3, 2, 1, 17),
    (4, 4, 3, 1, 18),
    (5, 2, 4, 1, 19),
    (6, 1, 5, 1, 20),
    (7, 2, 6, 1, 21),
    (8, 3, 7, 1, 22),
    (9, 4, 8, 1, 23),
    (10, 2, 9, 2, 24),
    (11, 2, 10, 2, 25);

DECLARE group_cursor CURSOR FOR
SELECT group_number,
    course,
    specialty_id,
    mode_id,
    class_id
FROM @StudentGroupData;

OPEN group_cursor;

FETCH NEXT FROM group_cursor INTO @group_number,
    @course,
    @specialty_id,
    @mode_id,
    @class_id;

WHILE @@FETCH_STATUS = 0 
BEGIN 
    EXEC InsertStudentGroup 
        @group_number = @group_number,
        @course = @course,
        @specialty_id = @specialty_id,
        @mode_id = @mode_id,
        @class_id = @class_id;

    FETCH NEXT FROM group_cursor INTO @group_number,
        @course,
        @specialty_id,
        @mode_id,
        @class_id;
END;

CLOSE group_cursor;
DEALLOCATE group_cursor;
