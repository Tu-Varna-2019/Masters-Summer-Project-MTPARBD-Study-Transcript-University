IF OBJECT_ID('university.dbo.Class', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Class (
    id INT PRIMARY KEY IDENTITY(1, 1),
    year INT NOT NULL,
    day_of_week INT NOT NULL,
    duration TIME NOT NULL,
    [time] TIME NOT NULL,
    horarium_id INT NOT NULL,
    subject_id INT NOT NULL,
    semester_id INT NOT NULL,
    hall_id INT NOT NULL,
    lead_teacher_id INT UNIQUE NOT NULL,
    CONSTRAINT fk_horarium FOREIGN KEY (horarium_id) REFERENCES Horarium (id),
    CONSTRAINT fk_subject_class FOREIGN KEY (subject_id) REFERENCES Subject (id),
    CONSTRAINT fk_semester FOREIGN KEY (semester_id) REFERENCES Semester (id),
    CONSTRAINT fk_hall FOREIGN KEY (hall_id) REFERENCES Hall (id),
    CONSTRAINT fk_lead_teacher UNIQUE (lead_teacher_id)
)
END