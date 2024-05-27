CREATE
OR ALTER PROCEDURE UpdateStudentGroupClass @id INT,
@studentgroup_id INT,
@class_id INT AS BEGIN
SET NOCOUNT ON;

BEGIN TRY
UPDATE dbo.StudentGroupClass
SET studentgroup_id = @studentgroup_id,
    class_id = @class_id
WHERE id = @id;

PRINT 'StudentGroupClass is successfully updated!';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to update StudentGroupClass!';

PRINT ERROR_MESSAGE();

END CATCH
END;