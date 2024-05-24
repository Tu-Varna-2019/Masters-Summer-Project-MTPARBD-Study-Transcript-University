CREATE
OR ALTER PROCEDURE InsertHall @capacity INT,
@number_of_work_places INT,
@location_id INT AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.Hall (capacity, number_of_work_places, location_id)
VALUES (@capacity, @number_of_work_places, @location_id) PRINT 'Hall is successfully added!';

END
END;