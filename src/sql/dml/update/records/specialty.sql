DECLARE @specialties TABLE (name VARCHAR(100));
INSERT INTO @specialties (name)
VALUES ('Biomedical Engineering'),
    ('Environmental Science'),
    ('Digital Media Production'),
    ('Law and Legal Studies'),
    ('Computer Forensics and Cybersecurity'),
    ('Interior Architecture and Design'),
    ('Psychology'),
    ('Sustainable Energy Systems'),
    ('Graphic Design and Illustration'),
    ('Data Science and Analytics');
DECLARE @name VARCHAR(10);
DECLARE specialty_cursor CURSOR FOR
SELECT name
FROM @specialties;
OPEN specialty_cursor;
FETCH NEXT
FROM specialty_cursor INTO @name;
WHILE @@FETCH_STATUS = 0 BEGIN EXEC InsertSpecialty @name = @name;
FETCH NEXT
FROM specialty_cursor INTO @name;
END;
CLOSE specialty_cursor;
DEALLOCATE specialty_cursor;