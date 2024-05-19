-- Drop the constraint named 'uc_lead_teacher' 
ALTER TABLE university.dbo.Class DROP CONSTRAINT uc_lead_teacher;

-- Alter the table to remove the other unique constraint named 'UQ__Class__0B6247C57E0B57FC'
ALTER TABLE university.dbo.Class DROP CONSTRAINT UQ__Class__0B6247C57E0B57FC;
