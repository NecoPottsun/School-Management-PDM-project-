
---> Student will be having name, roll no, section, class// What is class schedule of a student?
SELECT s.roll_no,s.name_student, classes.class_id, c.subject_code, c.name_subject, c.credit, classes.room_number, classes.weekday, classes.time 
FROM Student s, Course c, Classes classes , Study study
WHERE s.roll_no = study.roll_no AND study.class_id = classes.class_id AND classes.subject_code = c.subject_code AND s.roll_no='BABAIU15234';


SELECT s2.roll_no, s2.name_student ,B2.class_id, B2.subject_code,B2.name_subject,B2.credit,B2.room_number, B2.weekday, B2.time FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.subject_code,B1.name_subject,B1.credit,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no AND s2.roll_no = 'BABAIU15234'


--Staff will be having their id, name and classes they are teaching // what is class schedule of teacher?
SELECT s.id_staff,s.name_staff, classes.class_id, c.subject_code, c.name_subject, c.credit, classes.room_number, classes.weekday, classes.time
FROM Staff s, Course c, Classes classes , Teach t
WHERE s.id_staff = t.id_staff AND t.class_id= classes.class_id AND classes.subject_code = c.subject_code AND s.id_staff = 'IT1'


SELECT s.id_staff, s.name_staff,A2.class_id,A2.subject_code,A2.name_subject,A2.credit,A2.room_number, A2.weekday, A2.time
FROM Staff s 
INNER JOIN (SELECT t.id_staff,A1.class_id,A1.subject_code,A1.name_subject,A1.credit, A1.room_number, A1.weekday, A1.time FROM Teach t 
			INNER JOIN 
					(SELECT c1.name_subject,c2.class_id,c2.subject_code,c1.credit,c2.room_number,c2.weekday,c2.time FROM Course c1 
					INNER JOIN  Classes c2 
					ON c1.subject_code = c2.subject_code) AS A1
			ON t.class_id = A1.class_id) AS A2
ON s.id_staff = A2.id_staff AND s.id_staff = 'IT1'



--- khoi sua cung duoc :))
Select * from Staff where gender='male' and name_staff like '%Lee%'
SELECT * FROM Staff WHERE gender IN('male') AND name_staff LIKE '%Lee%';

SELECT * FROM Student;
Select * from Student where gender='male' and  name_student like '%chan%' and section='k15'
SELECT * FROM Student WHERE gender IN('male') AND name_student like '%chan%' and section IN ('k15')
