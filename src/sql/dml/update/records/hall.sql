DECLARE @id INT = 11,
    @capacity INT = 10,
    @number_of_work_places INT = 10,
    @location_id INT = 3;

EXEC UpdateHall @id,
@capacity,
@number_of_work_places,
@location_id;
