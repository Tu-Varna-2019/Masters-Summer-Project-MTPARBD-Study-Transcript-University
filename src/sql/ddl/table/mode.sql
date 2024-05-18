IF OBJECT_ID('university.dbo.Mode', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Mode (
id INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(50)
)
END
