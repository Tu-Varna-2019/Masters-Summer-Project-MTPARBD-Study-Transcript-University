IF OBJECT_ID('university.dbo.Location', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Location (
id INT PRIMARY KEY IDENTITY(1,1),
room_number INT,
full_name VARCHAR(100)
)
END