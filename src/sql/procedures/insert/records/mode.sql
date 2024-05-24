CREATE
OR ALTER PROCEDURE InsertMode @name VARCHAR(50) AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Mode (name)
VALUES (@name) PRINT 'Mode is successfully added!';

END
END;