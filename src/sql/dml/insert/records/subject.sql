DECLARE @subjects TABLE (name VARCHAR(100));

INSERT INTO @subjects (name)
VALUES ('Software Engineering'),
    ('Computer Science'),
    ('Electrical Engineering'),
    ('Mechanical Engineering'),
    ('Civil Engineering'),
    ('Physics'),
    ('Chemistry'),
    ('Biology'),
    ('Mathematics'),
    ('English Literature');

DECLARE @name VARCHAR(100);

DECLARE subject_cursor CURSOR FOR
SELECT name
FROM @subjects;

OPEN subject_cursor;

FETCH NEXT
FROM subject_cursor INTO @name;

WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertSubject @name = @name;

FETCH NEXT
FROM subject_cursor INTO @name;

END;

CLOSE subject_cursor;

DEALLOCATE subject_cursor;