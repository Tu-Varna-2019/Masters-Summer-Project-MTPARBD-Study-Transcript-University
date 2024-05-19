ALTER PROCEDURE ValidateInsertLocation
@type VARCHAR(100)

AS
BEGIN
	SET NOCOUNT ON;

   IF @type IS NULL 
   BEGIN 
   	RAISERROR ('Type must not be empty!',16,1);
   RETURN 1;
   END;
  ELSE IF @type NOT IN ('lecture', 'laboratory','coursework')
  BEGIN 
   	RAISERROR ('Type has incorrect value! It must be one of: lecture, laboratory, coursework',16,1);
   RETURN 1;
   END;
   
   PRINT 'Horarium provided values are correct! Moving on...';
   RETURN 0;
END;

CREATE PROCEDURE InsertHorarium
@type VARCHAR(50)

AS
BEGIN
    SET NOCOUNT ON;
      DECLARE @validateHorarium INT;
   
   EXEC @validateHorarium = ValidateInsertHorarium @type

   IF @validateHorarium = 0
   BEGIN TRY
    INSERT INTO dbo.Horarium (type)
    VALUES (@type)
    PRINT 'Horarium is successfully added!';
   END TRY
  BEGIN CATCH
 
  PRINT 'Error occured when trying to insert horarium!';
 PRINT ERROR_MESSAGE();
END CATCH
END;