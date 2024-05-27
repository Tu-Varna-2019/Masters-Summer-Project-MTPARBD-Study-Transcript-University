CREATE
OR ALTER TRIGGER Trigger_InsertLocation ON Location INSTEAD OF
INSERT, UPDATE, DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @building VARCHAR(100),
   @floor INT,
   @room VARCHAR(50),
   @full_name VARCHAR(50);

SELECT @building = building,
   @floor = floor,
   @room = room,
   @full_name = full_name
FROM inserted;

IF @room = ''
OR @full_name = ''
OR @building = '' BEGIN RAISERROR ('Location params must not be empty!', 16, 1);

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
