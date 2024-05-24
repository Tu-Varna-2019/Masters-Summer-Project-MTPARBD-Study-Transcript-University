CREATE
OR ALTER PROCEDURE InsertSpecialty @name VARCHAR(100) AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Specialty (name)
VALUES (@name) PRINT 'Specialty is successfully added!';

END
END;