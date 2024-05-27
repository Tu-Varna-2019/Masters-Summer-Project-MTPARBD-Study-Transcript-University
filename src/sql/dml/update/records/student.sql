DECLARE @id INT = 1,
    @name VARCHAR(50) = 'Jane Doe',
    @faculty_number VARCHAR(8) = '33111112',
    @studentgroup_id INT = 13

EXEC UpdateStudent @id,
@name,@faculty_number,@studentgroup_id;
