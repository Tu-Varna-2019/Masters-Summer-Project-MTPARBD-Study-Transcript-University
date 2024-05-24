BEGIN CREATE TABLE university.dbo.SubjectTeacher (
    id INT PRIMARY KEY IDENTITY(1, 1),
    subject_id INT NOT NULL,
    teacher_id INT NOT NULL,
    CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES Subject (id) ON DELETE NO ACTION,
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES Teacher (id) ON DELETE NO ACTION
)
END;