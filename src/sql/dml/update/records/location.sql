DECLARE @id INT = 1,
@building VARCHAR(100) = 'Second building',
@floor INT = 2,
@room VARCHAR(50) = '101TB',
@full_name VARCHAR(50) = 'Faculty';



EXEC UpdateLocation @id,
@building,
@floor,
@room,
@full_name;
