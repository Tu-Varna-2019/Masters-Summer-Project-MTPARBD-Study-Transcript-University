CREATE OR ALTER TRIGGER Trigger_UpdateLocation ON Location
AFTER UPDATE
AS
BEGIN
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

    IF @room = '' OR @full_name = '' OR @building = ''
    BEGIN
        RAISERROR ('Location params must not be empty!', 16, 1);
    END;

    PRINT 'Location provided values are correct! Moving on...';
END;
