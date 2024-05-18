IF OBJECT_ID('university.dbo.Hall', 'U') IS NULL
BEGIN 
CREATE TABLE university.dbo.Hall (
id INT PRIMARY KEY IDENTITY(1,1),
capacity INT,
number_of_work_places INT,
location_id INT,
CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES Location (id)  ON DELETE  CASCADE
)
END