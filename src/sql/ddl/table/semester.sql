IF OBJECT_ID('university.dbo.Semester', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Semester (
id INT PRIMARY KEY IDENTITY(1,1),
semester_number INT
)
END
