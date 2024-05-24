ALTER TABLE university.dbo.Teacher
ALTER COLUMN studentgroup_id INT NOT NULL;

END;

ALTER TABLE university.dbo.Teacher DROP CONSTRAINT subject_id;