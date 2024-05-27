CREATE
OR ALTER TRIGGER Trigger_InsertStudent ON Student INSTEAD OF
INSERT , UPDATE, DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @name VARCHAR(50),
    @faculty_number VARCHAR(8),
    @studentgroup_id INT;

SELECT @name = name,
    @faculty_number = faculty_number,
    @studentgroup_id = studentgroup_id
FROM inserted;

IF LEN(@faculty_number) > 8
OR ISNUMERIC(@faculty_number) = 0 BEGIN RAISERROR ('Faculty number is incorrect!', 16, 1);

END
ELSE IF dbo.GetStudentEQFacultyNumber(@faculty_number) > 0 BEGIN RAISERROR ('Faculty number already exists!', 16, 1);

END
ELSE BEGIN BEGIN TRY
INSERT INTO Student (studentgroup_id, name, faculty_number)
SELECT studentgroup_id,
    name,
    faculty_number
FROM inserted;

PRINT 'Student provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert Student!';

PRINT ERROR_MESSAGE();

END CATCH;

END
END;
