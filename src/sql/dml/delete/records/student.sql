DECLARE @students TABLE (
        name VARCHAR(100),
        faculty_number VARCHAR(8),
        studentgroup_id INT,
        floor INT
    );
INSERT INTO @students (name, faculty_number, studentgroup_id)
VALUES ('John Smith', '12345678', 8),
    ('Alice Johnson', '87654321', 10),
    ('Michael Brown', '98765432', 12),
    ('Emily Davis', '56789123', 9),
    ('David Wilson', '11112222', 11),
    ('Sarah Taylor', '99998888', 15),
    ('Jessica Martinez', '44443333', 7),
    ('Christopher Lee', '55559999', 13),
    ('Amanda White', '77778888', 14),
    ('Daniel Clark', '66665555', 16),
    ('Jennifer Garcia', '22221111', 8),
    ('Matthew Rodriguez', '88889999', 10),
    ('Samantha Lopez', '33334444', 12),
    ('Robert Perez', '12121212', 7),
    ('Emma Harris', '98989898', 15),
    ('James Turner', '34343434', 9),
    ('Olivia Scott', '45454545', 11),
    ('Andrew King', '56565656', 13),
    ('Lauren Hall', '67676767', 16),
    ('William Adams', '78787878', 17);
DECLARE @name VARCHAR(10);
DECLARE @faculty_number VARCHAR(100);
DECLARE @studentgroup_id VARCHAR(50);
DECLARE student_cursor CURSOR FOR
SELECT name,
    faculty_number,
    studentgroup_id
FROM @students;
OPEN student_cursor;
FETCH NEXT
FROM student_cursor INTO @name,
    @faculty_number,
    @studentgroup_id;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertStudent @name = @name,
@faculty_number = @faculty_number,
@studentgroup_id = @studentgroup_id;
FETCH NEXT
FROM student_cursor INTO @name,
    @faculty_number,
    @studentgroup_id;
END;
CLOSE student_cursor;
DEALLOCATE student_cursor;