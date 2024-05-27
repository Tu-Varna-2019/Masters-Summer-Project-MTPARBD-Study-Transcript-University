DECLARE @group_number INT,
    @course INT,
    @specialty_id INT,
    @mode_id INT;

DECLARE @StudentGroupData TABLE (
        group_number INT,
        course INT,
        specialty_id INT,
        mode_id INT
    );

INSERT INTO @StudentGroupData (
        group_number,
        course,
        specialty_id,
        mode_id
    )
VALUES (1, 1, 1, 1),
    (2, 2, 1, 2),
    (3, 3, 2, 1),
    (4, 4, 3, 1),
    (5, 2, 4, 1),
    (6, 1, 5, 1),
    (7, 2, 6, 1),
    (8, 3, 7, 1),
    (9, 4, 8, 1),
    (10, 2, 9, 2),
    (11, 2, 10, 2);

DECLARE group_cursor CURSOR FOR
SELECT group_number,
    course,
    specialty_id,
    mode_id
FROM @StudentGroupData;

OPEN group_cursor;

FETCH NEXT
FROM group_cursor INTO @group_number,
    @course,
    @specialty_id,
    @mode_id;

WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertStudentGroup @group_number = @group_number,
@course = @course,
@specialty_id = @specialty_id,
@mode_id = @mode_id;

FETCH NEXT
FROM group_cursor INTO @group_number,
    @course,
    @specialty_id,
    @mode_id;

END;

CLOSE group_cursor;

DEALLOCATE group_cursor;
