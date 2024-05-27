BEGIN CREATE TABLE university.dbo.StudentGroupClass (
    id INT PRIMARY KEY IDENTITY(1, 1),
    studentgroup_id INT NOT NULL,
    class_id INT NOT NULL,
    CONSTRAINT fk_studentgroupsc FOREIGN KEY (studentgroup_id) REFERENCES StudentGroup (id)  ,
    CONSTRAINT fk_classsc FOREIGN KEY (class_id) REFERENCES Class (id)
)
END;
