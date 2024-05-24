CREATE
OR ALTER PROCEDURE InsertSemester @semester_number INT AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Semester (semester_number)
VALUES (@semester_number) PRINT 'Semester is successfully added!';

END
END;