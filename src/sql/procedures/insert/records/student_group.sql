CREATE PROCEDURE InsertStudentGroup @group_number INT,
@course INT,
@specialty_id INT,
@mode_id INT,
@class_id INT AS BEGIN
SET NOCOUNT ON;
BEGIN
INSERT INTO dbo.StudentGroup (
        group_number,
        course,
        specialty_id,
        mode_id,
        class_id
    )
VALUES (
        @group_number,
        @course,
        @specialty_id,
        @mode_id,
        @class_id
    ) PRINT 'StudentGroup is successfully added!';
END
END;