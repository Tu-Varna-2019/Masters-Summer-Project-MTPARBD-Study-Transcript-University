CREATE
OR ALTER TRIGGER Trigger_Hall ON Hall INSTEAD OF
INSERT, UPDATE, DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @capacity INT,
    @number_of_work_places INT,
    @location_id INT;

SELECT @capacity = capacity,
    @number_of_work_places = number_of_work_places,
    @location_id = location_id
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
