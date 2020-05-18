


--- Class id, subject code, name subject, credit, weekday, time, room, staff name

SELECT A2.class_id, c.subject_code, c.name_subject, c.credit, A2.weekday, A2.time, A2.room_number FROM Course c
INNER JOIN (SELECT cl.class_id,cl.subject_code,cl.weekday,cl.time,cl.room_number,A1.name_staff FROM Classes cl,(SELECT t.class_id, s.name_staff FROM Teach t INNER JOIN Staff s ON t.id_staff = s.id_staff) AS A1 
			WHERE cl.class_id = A1.class_id) AS A2
ON A2.subject_code = c.subject_code


--- Class id,subject code,name subject,credit
SELECT cl.class_id, c.subject_code, c.name_subject, c.credit FROM Course c,Classes cl
WHERE c.subject_code = cl.subject_code 


--- ADD 
INSERT INTO Study VALUES (roll_no, class_id)
--- DROP 
DELETE FROM Study WHERE roll_no = ... AND class_id = ...