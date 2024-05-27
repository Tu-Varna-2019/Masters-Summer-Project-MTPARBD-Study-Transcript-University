IF OBJECT_ID('university.dbo.StudentGroup', 'U') IS NULL BEGIN CREATE TABLE university.dbo.StudentGroup (
    id INT PRIMARY KEY IDENTITY(1, 1),
    group_number INT NOT NULL,
    course INT
    NOT NULL,
    specialty_id INT
    NOT NULL,
    mode_id INT
    NOT NULL,
    CONSTRAINT fk_specialty FOREIGN KEY (specialty_id) REFERENCES Specialty (id) ON DELETE CASCADE,
    CONSTRAINT fk_mode FOREIGN KEY (mode_id) REFERENCES Mode (id) ON DELETE CASCADE
)
END
