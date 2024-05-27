CREATE
OR ALTER PROCEDURE InsertStudentGroupClass @studentgroup_id INT,@class_id INT  AS BEGIN
SET NOCOUNT ON;

BEGIN
INSERT INTO dbo.StudentGroupClass (
     studentgroup_id,
     class_id
    )
VALUES (
     @studentgroup_id,
     @class_id
    ) PRINT 'StudentGroup is successfully added!';

END
END;
