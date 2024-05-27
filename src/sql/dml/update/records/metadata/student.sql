-- BEGIN
-- ALTER TABLE university.dbo.Student
-- ALTER COLUMN name VARCHAR(100) NOT NULL;
-- ALTER TABLE university.dbo.Student
-- ALTER COLUMN faculty_number VARCHAR(8) NOT NULL;
-- ALTER TABLE university.dbo.Student
-- ALTER COLUMN studentgroup_id INT NOT NULL;
-- END;
--

BEGIN
ALTER TABLE Student
DROP CONSTRAINT fk_studentgroup
END
