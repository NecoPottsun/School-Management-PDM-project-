---> List of student in a class
SELECT B2.class_id,B2.subject_code,B2.name_subject,s2.name_student,s2.roll_no  FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.subject_code,B1.name_subject,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no


SELECT B2.class_id,B2.subject_code,B2.name_subject,s2.name_student,s2.roll_no  FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.subject_code,B1.name_subject,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no AND B2.subject_code = 'IT02IU'


---> How many student in a class?
SELECT B2.class_id, B2.subject_code, B2.name_subject ,COUNT(B2.class_id) AS student_number FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.subject_code,B1.name_subject,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no 
GROUP BY B2.class_id,B2.subject_code, B2.name_subject

