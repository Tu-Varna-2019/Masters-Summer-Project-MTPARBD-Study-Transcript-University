DECLARE @subjects TABLE (
        name VARCHAR(100),
        teacher_id INT
    );
INSERT INTO @subjects (name, teacher_id)
VALUES ('Software Engineering', 1),
    ('Computer Science', 2),
    ('Electrical Engineering', 3),
    ('Mechanical Engineering', 4),
    ('Civil Engineering', 5),
    ('Physics', 6),
    ('Chemistry', 7),
    ('Biology', 8),
    ('Mathematics', 9),
    ('English Literature', 10);
DECLARE @name VARCHAR(100);
DECLARE @teacher_id VARCHAR(50);
DECLARE subject_cursor CURSOR FOR
SELECT name,
    teacher_id
FROM @subjects;
OPEN subject_cursor;
FETCH NEXT
FROM subject_cursor INTO @name,
    @teacher_id;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertSubject @name = @name,
@teacher_id = @teacher_id;
FETCH NEXT
FROM subject_cursor INTO @name,
    @teacher_id;
END;
CLOSE subject_cursor;
DEALLOCATE subject_cursor;