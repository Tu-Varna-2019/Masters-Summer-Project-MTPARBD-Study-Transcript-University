ALTER PROCEDURE InsertStudent
@name VARCHAR(100),
@faculty_number VARCHAR(8),
@studentgroup_id INT

AS
BEGIN
    SET NOCOUNT ON;
      DECLARE @validateStudent INT;
     
   IF @name IS NULL OR @faculty_number IS NULL OR @studentgroup_id IS NULL 
   BEGIN 
   	RAISERROR ('All student params are required!',16,1);
   RETURN;
   END
   

   EXEC @validateStudent = ValidateInsertStudent @name, @faculty_number

   IF @validateStudent = 0
   BEGIN TRY
    INSERT INTO dbo.Student (name, faculty_number, studentgroup_id)
    VALUES (@name, @faculty_number, @studentgroup_id)
    PRINT 'Student is successfully added!';
   END TRY
  BEGIN CATCH
 
  PRINT 'Error occured when trying to insert student!';
 PRINT ERROR_MESSAGE();
END CATCH
END;


CREATE PROCEDURE ValidateInsertStudent
@name VARCHAR(100),
@faculty_number VARCHAR(8)

AS
BEGIN
	SET NOCOUNT ON;
  DECLARE @validateFacultyNumber INT;

   IF @name IS NULL OR @faculty_number IS NULL 
   BEGIN 
   	RAISERROR ('All student params are required!',16,1);
   RETURN 1;
   END;
   
   EXEC @validateFacultyNumber = ValidateStudentFacultyNumber @faculty_number;
  
  IF @validateFacultyNumber = 0
  BEGIN
   PRINT 'Student provided values are not empty! Moving on...';
   RETURN 0;
  END;

END;


CREATE PROCEDURE ValidateStudentFacultyNumber
@faculty_number VARCHAR(8)

AS
BEGIN
	SET NOCOUNT ON;

	IF LEN(@faculty_number) != LEN(TRY_CONVERT(INT,@faculty_number))
   BEGIN 
   	RAISERROR ('Faculty number of student is incorrect!',16,1);
   RETURN 1;
   END;
   
   PRINT 'Faculty number of student is correct! Moving on...';
   RETURN 0;

END;