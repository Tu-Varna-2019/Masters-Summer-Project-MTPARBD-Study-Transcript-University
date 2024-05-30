CREATE NONCLUSTERED INDEX idx_class_teacher_semester ON university.dbo.Class(lead_teacher_id, semester_id);

CREATE NONCLUSTERED INDEX idx_class_hall_day ON university.dbo.Class(hall_id, day_of_week);

CREATE NONCLUSTERED INDEX idx_class_semester_day ON university.dbo.Class(semester_id, day_of_week);

CREATE NONCLUSTERED INDEX idx_class_lead_teacher_id ON university.dbo.Class(lead_teacher_id);