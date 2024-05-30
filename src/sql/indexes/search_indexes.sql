
CREATE NONCLUSTERED INDEX idx_class_year_semester ON university.dbo.Class(year, semester_id);
CREATE NONCLUSTERED INDEX idx_studentgroup_specialty ON university.dbo.StudentGroup(specialty_id);
CREATE NONCLUSTERED INDEX idx_teacher_fullname ON university.dbo.Teacher(full_name);
CREATE NONCLUSTERED INDEX idx_hall_location ON university.dbo.Hall(location_id);
