DECLARE @teachers TABLE (full_name VARCHAR(100));
INSERT INTO @teachers (full_name)
VALUES ('John Doe'),
    ('Jane Smith'),
    ('Michael Johnson'),
    ('Emily Davis'),
    ('Sarah Brown'),
    ('David Martinez'),
    ('Jennifer Lee'),
    ('Christopher Taylor'),
    ('Jessica Rodriguez'),
    ('Matthew Wilson');
DECLARE @full_name VARCHAR(10);
DECLARE teacher_cursor CURSOR FOR
SELECT full_name
FROM @teachers;
OPEN teacher_cursor;
FETCH NEXT
FROM teacher_cursor INTO @full_name;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertTeacher @full_name = @full_name;
FETCH NEXT
FROM teacher_cursor INTO @full_name;
END;
CLOSE teacher_cursor;
DEALLOCATE teacher_cursor;