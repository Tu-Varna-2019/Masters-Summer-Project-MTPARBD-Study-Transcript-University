CREATE OR ALTER TRIGGER Trigger_UpdateStudentGroup ON StudentGroup
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @group_number INT,
            @course INT,
            @specialty_id INT;

    SELECT @group_number = group_number,
           @course = course,
           @specialty_id = specialty_id
    FROM inserted;

    IF @course NOT IN (1, 2, 3, 4)
    BEGIN
        RAISERROR ('Course has incorrect value! It must be one of: 1, 2, 3, 4', 16, 1);
        RETURN;
    END;

    IF EXISTS (
        SELECT 1
        FROM StudentGroup
        WHERE group_number = @group_number
            AND specialty_id = @specialty_id
    )
    BEGIN
        RAISERROR ('Group number already exists!', 16, 1);
        RETURN;
    END;

    IF EXISTS (
        SELECT 1
        FROM StudentGroup
        WHERE specialty_id = @specialty_id
            AND course = @course
    )
    BEGIN
        RAISERROR ('Student group already exists with the same course!', 16, 1);
        RETURN;
    END;

    PRINT 'StudentGroup provided values are correct! Moving on...';
END;
