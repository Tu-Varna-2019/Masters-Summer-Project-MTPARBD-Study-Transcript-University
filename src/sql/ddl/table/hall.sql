IF OBJECT_ID('university.dbo.Hall', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Hall (
    id INT PRIMARY KEY IDENTITY(1, 1),
    capacity INT NOT NULL,
    number_of_work_places INT NOT NULL,
    location_id INT NOT NULL,
    CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES Location (id)
)
END
