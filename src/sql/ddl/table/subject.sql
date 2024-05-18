IF OBJECT_ID('university.dbo.Subject', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Subject (
id INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(100),
teacher_id INT,
CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES Teacher (id) ON DELETE  CASCADE
)
END