IF OBJECT_ID('university.dbo.Teacher', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Teacher (
id INT PRIMARY KEY IDENTITY(1,1),
full_name VARCHAR(100)
)
END