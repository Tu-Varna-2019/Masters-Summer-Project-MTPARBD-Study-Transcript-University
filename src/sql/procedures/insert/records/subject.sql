CREATE PROCEDURE InsertSubject @name VARCHAR(100),
@teacher_id INT AS BEGIN
SET NOCOUNT ON;
BEGIN
INSERT INTO dbo.Subject (name, teacher_id)
VALUES (@name, @teacher_id) PRINT 'Subject is successfully added!';
END
END;