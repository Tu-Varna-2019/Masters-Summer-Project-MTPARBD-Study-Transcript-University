CREATE VIEW SearchView AS
SELECT
    cl.year AS SchoolYear,
    se.semester_number AS Semester,
    sp.name AS Specialty,
    sg.group_number AS GroupNumber,
    t.full_name AS Teacher,
    h.capacity AS HallCapacity,
    h.number_of_work_places AS WorkPlaces,
    loc.full_name AS Location
FROM university.dbo.Class cl
JOIN university.dbo.Semester se ON cl.semester_id = se.id
JOIN university.dbo.StudentGroupClass sgc ON cl.id = sgc.class_id
JOIN university.dbo.StudentGroup sg ON sgc.studentgroup_id = sg.id
JOIN university.dbo.Specialty sp ON sg.specialty_id = sp.id
JOIN university.dbo.Teacher t ON cl.lead_teacher_id = t.id
JOIN university.dbo.Hall h ON cl.hall_id = h.id
JOIN university.dbo.Location loc ON h.location_id = loc.id;
