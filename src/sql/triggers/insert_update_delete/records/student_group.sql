CREATE
OR ALTER TRIGGER Trigger_InsertStudentGroup ON StudentGroup INSTEAD OF
INSERT,
    UPDATE,
    DELETE AS BEGIN
SET NOCOUNT ON;

DECLARE @group_number INT,
    @course INT,
    @specialty_id INT;

SELECT @group_number = group_number,
    @course = course,
    @specialty_id = specialty_id
FROM inserted;

IF @course NOT IN (1, 2, 3, 4) BEGIN RAISERROR (
    'Course has incorrect value! It must be one of: 1, 2, 3, 4',
    16,
    1
)
END
ELSE IF (
    SELECT 1
    FROM StudentGroup
    WHERE group_number = @group_number
        AND specialty_id = @specialty_id
) > 0 BEGIN RAISERROR (
    'Group number already exists!',
    16,
    1
)
END
ELSE IF (
    SELECT 1
    FROM StudentGroup
    WHERE specialty_id = @specialty_id
        AND course = @course
) > 0 BEGIN RAISERROR (
    'Student group already exists with the same course!',
    16,
    1
)
END
ELSE BEGIN TRY
INSERT INTO StudentGroup (
        group_number,
        course,
        specialty_id,
        mode_id
    )
SELECT group_number,
    course,
    specialty_id,
    mode_id
FROM inserted;

PRINT 'StudentGroup provided values are correct! Moving on...';

END TRY BEGIN CATCH PRINT 'Error occurred when trying to insert StudentGroup!';

PRINT ERROR_MESSAGE();

END CATCH
END;