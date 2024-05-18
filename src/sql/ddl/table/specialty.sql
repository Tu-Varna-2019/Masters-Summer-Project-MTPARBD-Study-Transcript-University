IF OBJECT_ID('university.dbo.Specialty', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Specialty (
id INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(100)
)
END