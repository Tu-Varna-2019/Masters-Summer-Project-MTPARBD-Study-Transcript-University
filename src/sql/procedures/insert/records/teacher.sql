CREATE
OR ALTER PROCEDURE InsertTeacher @full_name VARCHAR(100) AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Teacher (full_name)
VALUES (@full_name) PRINT 'Teacher is successfully added!';

END
END;