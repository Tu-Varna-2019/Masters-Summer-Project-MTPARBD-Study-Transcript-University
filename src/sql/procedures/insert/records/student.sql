CREATE
OR ALTER PROCEDURE InsertStudent @name VARCHAR(100),
@faculty_number VARCHAR(8),
@studentgroup_id INT AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Student (name, faculty_number, studentgroup_id)
VALUES (@name, @faculty_number, @studentgroup_id) PRINT 'Student is successfully added!';

END
END;