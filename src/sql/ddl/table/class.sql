IF OBJECT_ID('university.dbo.Class', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Class (
id INT PRIMARY KEY IDENTITY(1,
1),
year INT,
day_of_week INT,
duration FLOAT,
[time] TIME,
horarium_id INT,
subject_id INT,
semester_id INT,
hall_id INT,
lead_teacher_id INT UNIQUE,
CONSTRAINT fk_horarium FOREIGN KEY (horarium_id) REFERENCES Horarium (id) ON DELETE  CASCADE,
CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES Subject (id) ON DELETE  CASCADE,
CONSTRAINT fk_semester FOREIGN KEY (semester_id) REFERENCES Semester (id) ON DELETE  CASCADE,
CONSTRAINT fk_hall FOREIGN KEY (hall_id) REFERENCES Hall (id) ON DELETE CASCADE,
<-- TODO: create 1:1 constraint -->
CONSTRAINT uc_lead_teacher UNIQUE (lead_teacher_id)
)
END
