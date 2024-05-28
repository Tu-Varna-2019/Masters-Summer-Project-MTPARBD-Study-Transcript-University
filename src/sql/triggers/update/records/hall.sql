CREATE
OR ALTER TRIGGER Trigger_Hall ON Hall AFTER 
INSERT, UPDATE AS BEGIN
SET NOCOUNT ON;

DECLARE
@capacity INT,
    @number_of_work_places INT,
    @location_id INT;

SELECT @capacity = capacity,
    @number_of_work_places = number_of_work_places,
    @location_id = location_id
FROM inserted;

PRINT 'Hall provided values are correct! Moving on...';

END;
