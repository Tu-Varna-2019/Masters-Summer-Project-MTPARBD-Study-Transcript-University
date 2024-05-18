IF OBJECT_ID('university.dbo.Student', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Student (
id INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(50),
faculty_number VARCHAR (8),
studentgroup_id INT,
CONSTRAINT fk_studentgroup FOREIGN KEY (studentgroup_id) REFERENCES StudentGroup(id) ON DELETE  CASCADE 
);
END