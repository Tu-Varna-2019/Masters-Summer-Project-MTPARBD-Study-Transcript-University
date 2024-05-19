ALTER  PROCEDURE InsertHorarium
@type VARCHAR(50)

AS
BEGIN
    SET NOCOUNT ON;
   
   BEGIN
    INSERT INTO dbo.Horarium (type)
    VALUES (@type)
    PRINT 'Horarium is successfully added!';
   END
END;