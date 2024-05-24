ALTER TRIGGER Trigger_PreInsertHall ON Hall INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
DECLARE @capacity INT;
DECLARE @number_of_work_places INT;
DECLARE @location_id INT;
SELECT @capacity = capacity
FROM inserted;
SELECT @number_of_work_places = number_of_work_places
FROM inserted;
SELECT @location_id = location_id
FROM inserted;
BEGIN TRY
INSERT INTO Hall (location_id, capacity, number_of_work_places)
SELECT location_id,
    capacity,
    number_of_work_places
FROM inserted;
PRINT 'Hall provided values are correct! Moving on...';
END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert Hall!';
PRINT ERROR_MESSAGE();
END CATCH
END;