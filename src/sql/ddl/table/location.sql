CREATE TABLE university.dbo.Location (
    id INT PRIMARY KEY IDENTITY(1, 1),
    building VARCHAR(100) NOT NULL,
    floor INT NOT NULL,
    room VARCHAR(8) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
);