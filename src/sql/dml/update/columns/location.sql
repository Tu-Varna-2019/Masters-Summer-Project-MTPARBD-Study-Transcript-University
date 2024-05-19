BEGIN
	ALTER TABLE university.dbo.Location 
	ALTER COLUMN floor INT;

    ALTER TABLE university.dbo.Location 
    ADD building VARCHAR(50);
   
    ALTER TABLE university.dbo.Location 
    ADD floor VARCHAR(50);
    
    ALTER TABLE university.dbo.Location
   ALTER COLUMN room_number VARCHAR(10);
END;
