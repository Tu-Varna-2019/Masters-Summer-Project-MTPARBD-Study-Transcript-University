CREATE
OR ALTER PROCEDURE UpdateLocation @id INT,
@building VARCHAR(100),
@floor INT,
@room VARCHAR(50),
@full_name VARCHAR(50)

AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Location
SET building = @building,
floor = @floor,
room = @room,
full_name = @room
WHERE id = @id;

PRINT 'Location is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Location!';

PRINT ERROR_MESSAGE();

END CATCH
END;
