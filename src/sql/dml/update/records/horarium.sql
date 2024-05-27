DECLARE @id INT = 2,
    @type VARCHAR(50) = 'lecture';

EXEC UpdateHorarium @id,
@type;
