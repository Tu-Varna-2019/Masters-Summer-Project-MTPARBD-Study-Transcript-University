CREATE OR ALTER TRIGGER Trigger_UpdateStudentGroupClass ON StudentGroupClass
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE EXISTS (
            SELECT 1
            FROM StudentGroupClass AS st
            WHERE st.studentgroup_id = i.studentgroup_id
              AND st.class_id = i.class_id
              AND NOT (UPDATE(studentgroup_id) AND UPDATE(class_id))
        )
    )
    BEGIN
        RAISERROR ('StudentGroupClass already exists!', 16, 1);
        RETURN; 
    END;

    IF (
        SELECT SUM(DATEDIFF(MINUTE, '00:00', c.duration))
        FROM StudentGroup AS sg
        INNER JOIN StudentGroupClass AS sgc ON sgc.studentgroup_id = sg.id
        INNER JOIN Class AS c ON sgc.class_id = c.id
        WHERE sg.id = i.studentgroup_id
    ) > (6 * 60)
    BEGIN
        RAISERROR ('Student working time exceeds 6!', 15, 0);
    END;

    PRINT 'StudentGroupClass provided values are correct! Moving on...';
END;
