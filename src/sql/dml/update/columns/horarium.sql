BEGIN
    ALTER TABLE university.dbo.Horarium 
    ADD CONSTRAINT uc_type UNIQUE (type);
END;
