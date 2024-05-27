CREATE
OR ALTER PROCEDURE UpdateSubject @name VARCHAR(100) AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Subject (name)
VALUES (@name) PRINT 'Subject is successfully added!';

END
END;
