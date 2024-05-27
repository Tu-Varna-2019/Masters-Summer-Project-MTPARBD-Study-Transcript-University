--ALTER TABLE university.dbo.Class DROP CONSTRAINT uc_lead_teacher;
--ALTER TABLE university.dbo.Class DROP CONSTRAINT UQ__Class__0B6247C57E0B57FC;

-- iBEGIN
-- iALTER TABLE Class
-- iDROP CONSTRAINT fk_horarium;
-- i
-- iALTER TABLE Class
-- iDROP CONSTRAINT fk_subject_class
-- i
-- iALTER TABLE Class
-- iDROP CONSTRAINT fk_semester;
-- i
-- iALTER TABLE Class
-- iDROP CONSTRAINT fk_hall;
-- i
-- iALTER TABLE Class
-- iDROP CONSTRAINT fk_lead_teacher;
-- iEND


ALTER TABLE dbo.Class
DROP 	CONSTRAINT UQ__Class__0B6247C5B1D7DAAA;
--ADD CONSTRAINT fk_lead_teacher
--FOREIGN KEY (lead_teacher_id)
--REFERENCES Teacher (id);
