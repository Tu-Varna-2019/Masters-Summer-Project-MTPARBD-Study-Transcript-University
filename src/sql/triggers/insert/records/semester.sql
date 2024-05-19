ALTER TRIGGER Trigger_InsertSemester
ON Semester
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @semester_number VARCHAR(50)

   SELECT @semester_number = semester_number FROM inserted;

   IF @semester_number IS NULL
   BEGIN
   	RAISERROR ('Semester must not be empty!',16,1);
   END
  ELSE IF @semester_number NOT IN (1,2)
  BEGIN
  	RAISERROR ('Semester has incorrect value! It must be one of: 1, 2',16,1);
  END
   ELSE
   BEGIN TRY
	   INSERT INTO Semester (semester_number)
	   SELECT semester_number FROM inserted;
	  PRINT 'Semester provided values are correct! Moving on...';
	     END TRY
  BEGIN CATCH

  PRINT 'Error occurred when trying to insert semester!';
 PRINT ERROR_MESSAGE();
END CATCH
END;
