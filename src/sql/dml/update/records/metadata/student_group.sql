BEGIN
ALTER TABLE university.dbo.StudentGroup -- DROP COLUMN class_id;
    DROP CONSTRAINT fk_specialty;

ALTER TABLE university.dbo.StudentGroup -- DROP COLUMN class_id;
    DROP CONSTRAINT fk_mode;

END;
