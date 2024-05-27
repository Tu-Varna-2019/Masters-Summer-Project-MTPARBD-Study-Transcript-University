CREATE
OR ALTER PROCEDURE InsertStudentGroup @group_number INT,
@course INT,
@specialty_id INT,
@mode_id INT AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.StudentGroup (
        group_number,
        course,
        specialty_id,
        mode_id
    )
VALUES (
        @group_number,
        @course,
        @specialty_id,
        @mode_id
    ) PRINT 'StudentGroup is successfully added!';

END
END;
