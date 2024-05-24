CREATE
OR ALTER FUNCTION GetStudentEQFacultyNumber(@faculty_number VARCHAR(8)) RETURNS INT AS BEGIN RETURN (
    SELECT COUNT(*)
    FROM Student
    WHERE faculty_number = @faculty_number
);

END;