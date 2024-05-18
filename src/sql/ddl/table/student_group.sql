IF OBJECT_ID('university.dbo.StudentGroup', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.StudentGroup (
id INT PRIMARY KEY IDENTITY(1,1),
group_number INT,
course INT,
specialty_id INT,
mode_id INT,
class_id INT,
CONSTRAINT fk_specialty FOREIGN KEY (specialty_id) REFERENCES Specialty (id)  ON DELETE  CASCADE,
CONSTRAINT fk_mode FOREIGN KEY (mode_id) REFERENCES Mode (id)  ON DELETE  CASCADE,
CONSTRAINT fk_class FOREIGN KEY (class_id) REFERENCES Class (id)  ON DELETE  CASCADE
)
END