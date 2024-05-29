CREATE OR ALTER PROCEDURE SearchClasses
    @SchoolYear INT = NULL,
    @Semester INT = NULL,
    @Specialty NVARCHAR(100) = NULL,
    @GroupNumber INT = NULL,
    @Teacher NVARCHAR(100) = NULL,
    @HallCapacity INT = NULL
AS
BEGIN
    SELECT *
    FROM university.dbo.SearchView
    WHERE
        (@SchoolYear IS NULL OR SchoolYear = @SchoolYear) AND
        (@Semester IS NULL OR Semester = @Semester) AND
        (@Specialty IS NULL OR Specialty LIKE '%' + @Specialty + '%') AND
        (@GroupNumber IS NULL OR GroupNumber = @GroupNumber) AND
        (@Teacher IS NULL OR Teacher LIKE '%' + @Teacher + '%') AND
        (@HallCapacity IS NULL OR HallCapacity = @HallCapacity);
END
