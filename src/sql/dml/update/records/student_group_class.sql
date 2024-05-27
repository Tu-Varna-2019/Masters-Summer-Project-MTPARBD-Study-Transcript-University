DECLARE @id INT = 3,
@studentgroup_id INT = 8,
@class_id INT = 60

EXEC UpdateStudentGroupClass @id,
@studentgroup_id,
@class_id;
