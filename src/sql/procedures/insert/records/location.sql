CREATE
OR ALTER PROCEDURE InsertLocation @room VARCHAR(10),
@full_name VARCHAR(50),
@building VARCHAR(100),
@floor INT AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Location (room, full_name, building, floor)
VALUES (@room, @full_name, @building, @floor) PRINT 'Location is successfully added!';

END
END;