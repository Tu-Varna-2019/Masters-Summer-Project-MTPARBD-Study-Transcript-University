CREATE OR ALTER TRIGGER Trigger_InsertStudentGroupClass ON StudentGroupClass
AFTER  INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @studentgroup_id INT,
            @class_id INT;

    SELECT @studentgroup_id = studentgroup_id,
           @class_id = class_id
    FROM inserted;

    IF EXISTS (
        SELECT 1
        FROM StudentGroupClass
        WHERE studentgroup_id = @studentgroup_id
          AND class_id = @class_id
    )
    BEGIN
        RAISERROR ('StudentGroupClass already exists!', 16, 1);
    END;
    ELSE IF (
        SELECT SUM(DATEDIFF(MINUTE, '00:00', c.duration))
        FROM StudentGroup AS sg
        INNER JOIN StudentGroupClass AS sgc ON sgc.studentgroup_id = sg.id
        INNER JOIN Class AS c ON sgc.class_id = c.id
        WHERE sg.id = @studentgroup_id
    ) > (6 * 60)
    BEGIN
        RAISERROR ('Student working time exceeds 6!', 15, 0);
    END;

    PRINT 'StudentGroupClass provided values are correct! Moving on...';
END;
