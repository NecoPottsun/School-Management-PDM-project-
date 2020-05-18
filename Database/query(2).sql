CREATE TABLE Classes(
class_id VARCHAR(30),
subject_code VARCHAR(30),
room_number VARCHAR(10) DEFAULT 'undecided',
weekday VARCHAR(10) DEFAULT 'undecided',
time VARCHAR(10) CHECK(time IN('8 a.m','10 a.m','1 p.m', '3 p.m','none')) DEFAULT 'none',
PRIMARY KEY(class_id),	
CONSTRAINT FK_CourseClasses
FOREIGN KEY (subject_code) REFERENCES Course(subject_code) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT UC_Class UNIQUE(room_number,weekday,time)
);
CREATE TABLE Teach(
id_staff VARCHAR(20),
class_id VARCHAR(30) NOT NULL,
PRIMARY KEY(id_staff,class_id),
CONSTRAINT FK_ClassesTeach
FOREIGN KEY (class_id) REFERENCES Classes(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FK_StaffTeach
FOREIGN KEY (id_staff) REFERENCES Staff(id_staff) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Study(
roll_no VARCHAR(20) NOT NULL,
class_id VARCHAR(30) NOT NULL,
PRIMARY KEY(roll_no,class_id),
CONSTRAINT FK_ClassesStudy
FOREIGN KEY (class_id) REFERENCES Classes(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FK_StudentStudy
FOREIGN KEY (roll_no) REFERENCES Student(roll_no) ON UPDATE CASCADE ON DELETE CASCADE	
);



INSERT INTO Classes VALUES('ITIT18IU01','IT01IU','A1-202','Friday','1 p.m');
INSERT INTO Classes VALUES('ITIT18IU02','IT02IU','LA1-605','Monday','8 a.m');
INSERT INTO Classes VALUES('ITIT17IU03','IT03IU','A1-404','Wednesday','8 a.m');
INSERT INTO Classes VALUES('ITIT17IU04','IT04IU','LA1-606','Tuesday','8 a.m');
INSERT INTO Classes VALUES('ITIT18UN05','IT05UN','A2-408','Tuesday','1 p.m');
INSERT INTO Classes VALUES('ITIT18IU08','IT08IU','B-701','Thursday','1 p.m');
INSERT INTO Classes VALUES('ITIT18IU09','IT09IU','LA1-607','Wednesday','1 p.m');
INSERT INTO Classes VALUES('ITIT17IU10','IT10IU','A2-301','Sunday','8 a.m');
INSERT INTO Classes VALUES ('ITIT17IU11','IT11IU','LA1-607','Friday','8 a.m');
INSERT INTO Classes VALUES('ITIT18IU03','PH03IU','A1-403','Tuesday', '1 p.m'); 
INSERT INTO Classes VALUES('ITIT19IU01','PH01IU','A2-408','Wednesday', '1 p.m');

INSERT INTO Study VALUES('ITITIU13232','ITIT18UN05');
INSERT INTO Study VALUES('ITITIU13232','ITIT18IU01');
INSERT INTO Study VALUES('ITITIU13232','ITIT18IU02');
INSERT INTO Study VALUES('ITITIU13232','ITIT17IU03');
INSERT INTO Study VALUES('ITITIU13232','ITIT17IU04');	
INSERT INTO Study VALUES('ITITIU13232','ITIT19IU01');



INSERT INTO Study VALUES('ITITIU14785','ITIT18IU01');
INSERT INTO Study VALUES('ITITIU14785','ITIT18IU01');
INSERT INTO Study VALUES('ITITIU14785','ITIT18IU02');
INSERT INTO Study VALUES('ITITIU14785','ITIT18IU09');
INSERT INTO Study VALUES('ITITIU14785','ITIT17IU11');
INSERT INTO Study VALUES('ITITIU14785','ITIT18IU08');


INSERT INTO Study VALUES('BABAIU15555','ITIT18IU03');
INSERT INTO Study VALUES('BABAIU15555','ITIT18IU09');
INSERT INTO Study VALUES('BABAIU15555','ITIT17IU04');
INSERT INTO Study VALUES('BABAIU15555','ITIT18IU08');

INSERT INTO Study VALUES('CECEIU16542','ITIT18IU02');
INSERT INTO Study VALUES('CECEIU16542','ITIT18IU03');
INSERT INTO Study VALUES('CECEIU16542','ITIT18UN05');

INSERT INTO Study VALUES('IEIEIU18456','ITIT18IU02');
INSERT INTO Study VALUES('IEIEIU18456','ITIT17IU04');


INSERT INTO Study VALUES('BTBTIU17562','ITIT17IU03');
INSERT INTO Study VALUES('BTBTIU17562','ITIT18IU09');
INSERT INTO Study VALUES('BTBTIU17562','ITIT17IU04');
INSERT INTO Study VALUES('BTBTIU17562','ITIT18IU08');


INSERT INTO Study VALUES('BABAIU15234','ITIT18IU03');
INSERT INTO Study VALUES('BABAIU15234','ITIT18UN05');
INSERT INTO Study VALUES('BABAIU15234','ITIT18IU02');
INSERT INTO Study VALUES('BABAIU15234','ITIT18IU01');

INSERT INTO Study VALUES('CECEIU17878','ITIT18UN05');
INSERT INTO Study VALUES('CECEIU17878','ITIT17IU04');
INSERT INTO Study VALUES('CECEIU17878','ITIT17IU11');

INSERT INTO Study VALUES('IEIEIU19236','ITIT18IU09');
INSERT INTO Study VALUES('IEIEIU19236','ITIT18IU03');
INSERT INTO Study VALUES('IEIEIU19236','ITIT17IU11');
INSERT INTO Study VALUES('IEIEIU19236','ITIT18IU08');

INSERT INTO Study VALUES('BTBTIU18649','ITIT17IU11');
INSERT INTO Study VALUES('BTBTIU18649','ITIT17IU04');
INSERT INTO Study VALUES('BTBTIU18649','ITIT18IU02');



INSERT INTO Teach VALUES('IT1','ITIT18IU01');
INSERT INTO Teach VALUES('IT1','ITIT17IU03');
INSERT INTO Teach VALUES ('IT2','ITIT18IU02');
INSERT INTO Teach VALUES ('IT2','ITIT18IU09');
INSERT INTO Teach VALUES ('IT3','ITIT17IU03');
INSERT INTO Teach VALUES ('IT3','ITIT18IU01');
INSERT INTO Teach VALUES('BA1','ITIT18IU03');
INSERT INTO Teach VALUES('BA1','ITIT17IU11');
INSERT INTO Teach VALUES('BT1','ITIT18IU09');
INSERT INTO Teach VALUES('BT1','ITIT17IU04');
INSERT INTO Teach VALUES('IE1','ITIT17IU11');
INSERT INTO Teach VALUES('IE1','ITIT18UN05');
INSERT INTO Teach VALUES('CE1','ITIT17IU04');
INSERT INTO Teach VALUES('CE1','ITIT18IU08');
INSERT INTO Teach VALUES('BT2','ITIT18UN05');
INSERT INTO Teach VALUES('BT2','ITIT18IU03');
INSERT INTO Teach VALUES('CE1','ITIT19IU01');

SELECT * FROM Course;
SELECT * FROM Classes;
SELECT * FROM Study;
SELECT * FROM Teach;


--Display schedule info for student: roll_no,class_id,subject_code, name_subject, credit, room_number, weekday,time
SELECT s.roll_no, classes.class_id, c.subject_code, c.name_subject, c.credit, classes.room_number, classes.weekday, classes.time
FROM Student s, Course c, Classes classes , Study study
WHERE s.roll_no = study.roll_no AND study.class_id = classes.class_id AND classes.subject_code = c.subject_code 
AND s.roll_no = '';

--Display schedule info for teacher: staff_id,class_id,subject_code, name_subject, credit, room_number, weekday,time
SELECT s.id_staff, classes.class_id, c.subject_code, c.name_subject, c.credit, classes.room_number, classes.weekday, classes.time
FROM Staff s, Course c, Classes classes , Teach t
WHERE s.id_staff = t.id_staff AND t.class_id= classes.class_id AND classes.subject_code = c.subject_code 
AND s.id_staff = '';



--Staff will be having their id, name and classes they are teaching
SELECT * FROM Staff;
SELECT * FROM Teach;
SELECT * FROM Classes;
SELECT * FROM Course;

SELECT s.id_staff, s.name_staff,A2.name_subject,A2.room_number, A2.weekday, A2.time
FROM Staff s 
INNER JOIN (SELECT t.id_staff,A1.subject_code,A1.name_subject, A1.room_number, A1.weekday, A1.time FROM Teach t 
			INNER JOIN 
					(SELECT c1.name_subject,c2.class_id,c2.subject_code,c2.room_number,c2.weekday,c2.time FROM Course c1 
					INNER JOIN  Classes c2 
					ON c1.subject_code = c2.subject_code) AS A1
			ON t.class_id = A1.class_id) AS A2
ON s.id_staff = A2.id_staff

--> How many classes do teachers teach?
SELECT s.id_staff, s.name_staff, COUNT(s.id_staff) AS No_of_class
FROM Staff s 
INNER JOIN (SELECT t.id_staff,A1.subject_code,A1.name_subject, A1.room_number, A1.weekday, A1.time FROM Teach t 
			INNER JOIN 
					(SELECT c1.name_subject,c2.class_id,c2.subject_code,c2.room_number,c2.weekday,c2.time FROM Course c1 
					INNER JOIN  Classes c2 
					ON c1.subject_code = c2.subject_code) AS A1
			ON t.class_id = A1.class_id) AS A2
ON s.id_staff = A2.id_staff
GROUP BY s.id_staff, s.name_staff

---> Student will be having name, roll no, section, class 
SELECT s2.roll_no, s2.name_student ,s2.section, B2.name_subject, B2.room_number, B2.weekday, B2.time FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.name_subject,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no 
ORDER BY section 

---> How many classes do students take?
SELECT s2.roll_no, s2.name_student, COUNT(s2.roll_no) AS registerNo FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.name_subject,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no 
GROUP BY s2.roll_no, s2.name_student

---> what is tuition status of a student ? 
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t WHERE s.tuition_id = t.tuition_id AND s.roll_no = 'BABAIU15234'
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s
INNER JOIN Tuition t
ON s.tuition_id = t.tuition_id AND s.roll_no = 'BABAIU15234'











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



