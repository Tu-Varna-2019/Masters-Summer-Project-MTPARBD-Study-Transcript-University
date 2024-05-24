IF OBJECT_ID('university.dbo.Horarium', 'U') IS NULL BEGIN CREATE TABLE university.dbo.Horarium (
    id INT PRIMARY KEY IDENTITY(1, 1),
    type VARCHAR(50) UNIQUE NOT NULL
)
END