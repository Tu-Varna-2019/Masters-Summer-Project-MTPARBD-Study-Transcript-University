ALTER TRIGGER Trigger_InsertStudentGroup ON StudentGroup INSTEAD OF
INSERT AS BEGIN
SET NOCOUNT ON;
DECLARE @group_number INT
DECLARE @course INT
SELECT @group_number = group_number
FROM inserted;
SELECT @course = course
FROM inserted;
IF @course NOT IN (1, 2, 3, 4) BEGIN RAISERROR (
    'Course has incorrect value! It must be one of: 1, 2, 3, 4',
    16,
    1
)
END
ELSE IF (
    SELECT COUNT(*)
    FROM StudentGroup
    WHERE group_number = @group_number
) > 0 BEGIN RAISERROR (
    'Group number already exists!',
    16,
    1
)
END
ELSE BEGIN TRY
INSERT INTO StudentGroup (
        group_number,
        course,
        specialty_id,
        mode_id,
        class_id
    )
SELECT group_number,
    course,
    specialty_id,
    mode_id,
    class_id
FROM inserted;
PRINT 'StudentGroup provided values are correct! Moving on...';
END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert StudentGroup!';
PRINT ERROR_MESSAGE();
END CATCH
END;