DECLARE @students TABLE (
        name VARCHAR(100),
        faculty_number VARCHAR(8),
        studentgroup_id INT
    );

INSERT INTO @students (name, faculty_number, studentgroup_id)
VALUES ('John Smith', '12345678', 1),
    ('Alice Johnson', '87654321', 2),
    ('Michael Brown', '98765432', 3),
    ('Emily Davis', '56789123', 4),
    ('David Wilson', '11112222', 5),
    ('Sarah Taylor', '99998888', 6),
    ('Jessica Martinez', '44443333', 7),
    ('Christopher Lee', '55559999', 8),
    ('Amanda White', '77778888', 9),
    ('Daniel Clark', '66665555', 10),
    ('Jennifer Garcia', '22221111',11 ),
    ('Matthew Rodriguez', '88889999', 1),
    ('Samantha Lopez', '33334444', 2),
    ('Robert Perez', '12121212', 3),
    ('Emma Harris', '98989898', 4),
    ('James Turner', '34343434', 5),
    ('Olivia Scott', '45454545', 6),
    ('Andrew King', '56565656', 7),
    ('Lauren Hall', '67676767', 8),
    ('William Adams', '78787878', 8);

DECLARE @name VARCHAR(100),
    @faculty_number VARCHAR(8),
    @studentgroup_id INT;

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
