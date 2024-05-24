-- BEGIN
-- ALTER TABLE university.dbo.Location
-- ALTER COLUMN floor INT;
-- ALTER TABLE university.dbo.Location
-- ADD building VARCHAR(50);
-- ALTER TABLE university.dbo.Location
-- ADD floor VARCHAR(50);
-- ALTER TABLE university.dbo.Location
-- ALTER COLUMN room VARCHAR(10);
-- END;
BEGIN
ALTER TABLE university.dbo.Location
ADD building VARCHAR(100) NOT NULL;

ALTER TABLE university.dbo.Location
ADD floor INT NOT NULL;

END