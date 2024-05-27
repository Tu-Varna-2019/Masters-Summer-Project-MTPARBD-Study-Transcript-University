CREATE
OR ALTER PROCEDURE UpdateHall @id INT,
@capacity INT,
@number_of_work_places INT,
@location_id INT AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.Hall
SET capacity = @capacity,
    number_of_work_places = @number_of_work_places,
    location_id = @location_id
WHERE id = @id;

PRINT 'Hall is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update Hall!';

PRINT ERROR_MESSAGE();

END CATCH;

END;