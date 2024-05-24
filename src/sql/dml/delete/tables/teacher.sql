IF OBJECT_ID('university.dbo.Teacher', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Teacher (
    id INT PRIMARY KEY IDENTITY(1, 1),
    full_name VARCHAR(100)
)
END IF OBJECT_ID('university.dbo.Subject', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Subject (
    id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(100),
    teacher_id INT,
    CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES Teacher (id) ON DELETE CASCADE
)
END IF OBJECT_ID('university.dbo.Location', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Location (
    id INT PRIMARY KEY IDENTITY(1, 1),
    room INT,
    full_name VARCHAR(100)
)
END IF OBJECT_ID('university.dbo.Hall', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Hall (
    id INT PRIMARY KEY IDENTITY(1, 1),
    capacity INT,
    number_of_work_places INT,
    location_id INT,
    CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES Location (id) ON DELETE CASCADE
)
END IF OBJECT_ID('university.dbo.Semester', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Semester (
    id INT PRIMARY KEY IDENTITY(1, 1),
    semester_number INT
)
END IF OBJECT_ID('university.dbo.Horarium', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Horarium (
    id INT PRIMARY KEY IDENTITY(1, 1),
    type VARCHAR(50)
)
END IF OBJECT_ID('university.dbo.Specialty', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Specialty (
    id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(100)
)
END IF OBJECT_ID('university.dbo.Mode', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Mode (
    id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(50)
)
END IF OBJECT_ID('university.dbo.Class', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Class (
    id INT PRIMARY KEY IDENTITY(1, 1),
    year INT,
    day_of_week INT,
    duration FLOAT,
    [time] TIME,
    horarium_id INT,
    subject_id INT,
    semester_id INT,
    hall_id INT,
    lead_teacher_id INT UNIQUE,
    CONSTRAINT fk_horarium FOREIGN KEY (horarium_id) REFERENCES Horarium (id) ON DELETE CASCADE,
    CONSTRAINT fk_subject FOREIGN KEY (subject_id) REFERENCES Subject (id) ON DELETE CASCADE,
    CONSTRAINT fk_semester FOREIGN KEY (semester_id) REFERENCES Semester (id) ON DELETE CASCADE,
    CONSTRAINT fk_hall FOREIGN KEY (hall_id) REFERENCES Hall (id) ON DELETE CASCADE,
    < -- TODO: create 1:1 constraint -->
    CONSTRAINT uc_lead_teacher UNIQUE (lead_teacher_id)
)
END IF OBJECT_ID('university.dbo.StudentGroup', 'U') IS NULL BEGIN CREATE TABLE university.dbo.StudentGroup (
    id INT PRIMARY KEY IDENTITY(1, 1),
    group_number INT,
    course INT,
    specialty_id INT,
    mode_id INT,
    class_id INT,
    CONSTRAINT fk_specialty FOREIGN KEY (specialty_id) REFERENCES Specialty (id) ON DELETE CASCADE,
    CONSTRAINT fk_mode FOREIGN KEY (mode_id) REFERENCES Mode (id) ON DELETE CASCADE,
    CONSTRAINT fk_class FOREIGN KEY (class_id) REFERENCES Class (id) ON DELETE CASCADE
)
END IF OBJECT_ID('university.dbo.Student', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Student (
    id INT PRIMARY KEY IDENTITY(1, 1),
    name VARCHAR(50),
    faculty_number VARCHAR (8),
    studentgroup_id INT,
    CONSTRAINT fk_studentgroup FOREIGN KEY (studentgroup_id) REFERENCES StudentGroup(id) ON DELETE CASCADE
);

END