CREATE TRIGGER Trigger_PreInsertStudent ON Student INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
DECLARE @name VARCHAR(50);
DECLARE @faculty_number VARCHAR(8);
DECLARE @studentgroup_id INT;
SELECT @name = name
FROM inserted;
SELECT @faculty_number = faculty_number
FROM inserted;
SELECT @studentgroup_id = studentgroup_id
FROM inserted;
IF LEN(@faculty_number) > 8
OR ISNUMERIC(@faculty_number) = 0 BEGIN RAISERROR ('Faculty number is incorrect!', 16, 1);
END
ELSE BEGIN TRY
INSERT INTO Student (
        studentgroup_id,
        name,
        faculty_number
            )
SELECT studentgroup_id,
    name,
    faculty_number
FROM inserted;
PRINT 'Student provided values are correct! Moving on...';
END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert Student!';
PRINT ERROR_MESSAGE();
END CATCH
END;