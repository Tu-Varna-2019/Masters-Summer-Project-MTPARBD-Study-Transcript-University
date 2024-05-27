ALTER TRIGGER Trigger_PreInsertLocation ON Location INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;

DECLARE @building VARCHAR(100);

DECLARE @floor INT;

DECLARE @room VARCHAR(50);

DECLARE @full_name VARCHAR(50);

SELECT @building = building
FROM inserted;

SELECT @floor = floor
FROM inserted;

SELECT @room = room
FROM inserted;

SELECT @full_name = full_name
FROM inserted;

IF @room = ''
OR @full_name = ''
OR @building = ''
OR @floor IS NULL BEGIN RAISERROR ('Location params must not be empty!', 16, 1);

END
ELSE BEGIN TRY
INSERT INTO Location (room, full_name, building, floor)
SELECT room,
   full_name,
   building,
   floor
FROM inserted;

PRINT 'Location provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert Location!';

PRINT ERROR_MESSAGE();

END CATCH
END;