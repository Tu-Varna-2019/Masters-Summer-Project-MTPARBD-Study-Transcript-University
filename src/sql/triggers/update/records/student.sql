CREATE OR ALTER TRIGGER Trigger_UpdateStudent ON Student
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @name VARCHAR(50),
            @faculty_number VARCHAR(8),
            @studentgroup_id INT;

    SELECT @name = name,
           @faculty_number = faculty_number,
           @studentgroup_id = studentgroup_id
    FROM inserted;

    IF LEN(@faculty_number) > 8 OR ISNUMERIC(@faculty_number) = 0
    BEGIN
        RAISERROR ('Faculty number is incorrect!', 16, 1);
        RETURN;
    END;

    IF dbo.GetStudentEQFacultyNumber(@faculty_number) > 0
    BEGIN
        RAISERROR ('Faculty number already exists!', 16, 1);
        RETURN;
    END;

    PRINT 'Student provided values are correct! Moving on...';
END;
