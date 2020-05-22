CREATE TABLE Tuition(
tuition_id INTEGER IDENTITY(1,1),
paid_or_unpaid INTEGER CHECK (paid_or_unpaid IN (0,1)),
deadline_date DATE,
PRIMARY KEY(tuition_id)
);

CREATE TABLE Pay(
roll_no VARCHAR(20),
tuition_id INTEGER,
Amount_per_credit INTEGER,
Amount INTEGER,
PRIMARY KEY (roll_no,tuition_id),
CONSTRAINT FK_StudentPay FOREIGN KEY (roll_no) REFERENCES Student(roll_no) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FK_TuitionPay FOREIGN KEY (tuition_id) REFERENCES Tuition(tuition_id) ON UPDATE CASCADE ON DELETE CASCADE
);
SELECT * FROM Student;
SELECT * FROM Tuition;

INSERT INTO Tuition(paid_or_unpaid) VALUES(1);
INSERT INTO Tuition(paid_or_unpaid) VALUES(1);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0);
INSERT INTO Tuition(paid_or_unpaid) VALUES(1);
INSERT INTO Tuition(paid_or_unpaid) VALUES(1);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0);
INSERT INTO Tuition(paid_or_unpaid) VALUES(1);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0);


UPDATE Tuition SET deadline_date = CONVERT(date,'30/05/2020',104) WHERE tuition_id IN(1,2,3,4);

UPDATE Tuition SET deadline_date = CONVERT(date,'15/05/2020',104) WHERE tuition_id IN(5,6,7,10);

UPDATE Tuition SET deadline_date = CONVERT(date,'30/04/2020',104) WHERE tuition_id IN(8,9,11,12);

INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('BABAIU15234',1,5000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('BABAIU15555',2,1000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('BTBTIU17562',3,1000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('BTBTIU18649',4,3000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('CECEIU16542',5,2000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('CECEIU17878',6,1000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('IEIEIU18456',7,1000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('IEIEIU19236',8,1000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('ITITIU13232',9,1000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('ITITIU14785',10,1000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('ITITUN17007',11,6000000);
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES('ITITUN17008',12,6000000);
SELECT * FROM Student;


---> add a new student 
INSERT INTO Student VALUES(...);
INSERT INTO Tuition(paid_or_unpaid) VALUES(0,'30/05/2020');
INSERT INTO Pay(roll_no,tuition_id,Amount_per_credit) VALUES ('',AN INTEGER,1000000);
INSERT INTO Admin VALUES(..,0); --- CREATE NEW ACCOUNT FOR STUDENT WITH USERNAME AND PASSWORD ARE HIS/HER ROLL_NO

UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = ...)
)
WHERE tuition_id = ... ;
UPDATE PAY SET 
Amount = 0 
WHERE Amount IS NULL;

SELECT * FROM Tuition;
SELECT * FROM Study;
SELECT * FROM Pay;
---

----------------------- add mon hoc----------------
INSERT INTO Study VALUES();
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = ...)
)
WHERE tuition_id = ... ;
UPDATE PAY SET 
Amount = 0 
WHERE Amount IS NULL;


--- TUITION INFO OF STUDENT
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Tuition;
SELECT * FROM Pay;
SELECT s.roll_no,s.name_student, A.Amount, A.deadline_date, A.paid_or_unpaid FROM Student s
INNER JOIN (SELECT t.tuition_id,p.roll_no,p.Amount,t.deadline_date,t.paid_or_unpaid FROM Tuition t, Pay p WHERE t.tuition_id = p.tuition_id) AS A
ON s.roll_no = A.roll_no and roll_no='';


--SELECT s.roll_no, A1.credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 

------------------------------- vi du add mon cua 1 hoc sinh--------------------------------------------
--- tkb cua hoc sinh
SELECT s.roll_no,s.name_student, classes.class_id, c.subject_code, c.name_subject, c.credit, classes.room_number, classes.weekday, classes.time, c.credit
FROM Student s, Course c, Classes classes , Study study
WHERE s.roll_no = study.roll_no AND study.class_id = classes.class_id AND classes.subject_code = c.subject_code AND s.roll_no='IEIEIU18456';

--- add mon hoc
INSERT INTO Study VALUES('IEIEIU18456','ITIT17IU03');
--- hoc phi cu (luc chua add mon)
SELECT * FROM Pay WHERE roll_no ='IEIEIU18456';
--- update hoc phi moi
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.roll_no = 'IEIEIU18456')
)
WHERE roll_no = 'IEIEIU18456' 


UPDATE PAY SET 
Amount = 0 
WHERE Amount IS NULL;

--- coi lai hoc phi moi
SELECT * FROM Pay WHERE roll_no ='IEIEIU18456';


--- tong credit
SELECT A2.roll_no,A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.roll_no = 'IEIEIU18456'


SELECT Student.name_student, Study.class_id
FROM Student
LEFT JOIN Study
ON Student.roll_no = Study.roll_no

-------- Add major to course
SELECT * FROM Course;
ALTER TABLE Course
ADD major VARCHAR(5);

-- update
UPDATE Course SET 
major = 'IT'
WHERE subject_code LIKE 'IT%';

UPDATE Course SET 
major = 'PH'
WHERE subject_code LIKE 'PH%';

-------Filter: class_id, subject_code, name_subject,credit,weekday,time,room_number,staff_name
SELECT * FROM Course;
SELECT A2.class_id, c.subject_code, c.name_subject, c.credit, A2.weekday, A2.time, A2.room_number, A2.name_staff FROM Course c
INNER JOIN (SELECT cl.class_id,cl.subject_code,cl.weekday,cl.time,cl.room_number,A1.name_staff FROM Classes cl,(SELECT t.class_id, s.name_staff FROM Teach t INNER JOIN Staff s ON t.id_staff = s.id_staff) AS A1 
			WHERE cl.class_id = A1.class_id) AS A2
ON A2.subject_code = c.subject_code AND c.major = 'PH';

SELECT * FROM Classes;
SELECT * FROM Classes WHERE subject_code LIKE 'PH%';
SELECT * FROM Teach WHERE class_id = 'ITIT18IU03';
SELECT class_id, COUNT(class_id) FROM Teach GROUP BY class_id;

DELETE Teach;

INSERT INTO Teach VALUES('IT1','ITIT18IU01');
INSERT INTO Teach VALUES('IT1','ITIT17IU03');
INSERT INTO Teach VALUES ('IT2','ITIT18IU02');
INSERT INTO Teach VALUES ('IT2','ITIT18IU09');
INSERT INTO Teach VALUES('BA1','ITIT18IU03');
INSERT INTO Teach VALUES('BA1','ITIT17IU11');
INSERT INTO Teach VALUES('BT1','ITIT17IU04');
INSERT INTO Teach VALUES('IE1','ITIT18UN05');
INSERT INTO Teach VALUES('CE1','ITIT18IU08');
INSERT INTO Teach VALUES('CE1','ITIT19IU01');
SELECT * FROM Teach;

SELECT * FROM Pay;

ALTER TABLE Teach ADD CONSTRAINT UC_class_id UNIQUE(class_id) --- add unique key for class_id in teach
ALTER TABLE Pay ADD CONSTRAINT UC_roll_no UNIQUE(roll_no) --- add unique key for roll_no in pay
ALTER TABLE Pay ADD CONSTRAINT UC_tuition_id UNIQUE(tuition_id) --- add unique key for tuition_id in pay


INSERT INTO Teach VALUES('IE1','ITIT19IU01');
SELECT * FROM Study;
SELECT class_id, COUNT(class_id) FROM Study GROUP BY class_id;


SELECT s2.roll_no, s2.name_student ,B2.class_id, B2.subject_code,B2.name_subject,B2.credit,B2.room_number, B2.weekday, B2.time FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.subject_code,B1.name_subject,B1.credit,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no;


SELECT s2.roll_no,B2.weekday, B2.time, COUNT(s2.roll_no) FROM Student s2
INNER JOIN (SELECT s1.roll_no,B1.class_id,B1.subject_code,B1.name_subject,B1.credit,B1.room_number,B1.weekday,B1.time FROM Study s1
			INNER JOIN 
				(SELECT c1.class_id, c1.room_number,c1.subject_code,c1.time,c1.weekday,c2.name_subject,c2.credit FROM Classes c1 
				INNER JOIN Course c2 ON c1.subject_code = c2.subject_code) AS B1
			ON B1.class_id = s1.class_id) AS B2
ON s2.roll_no = B2.roll_no 
GROUP BY B2.weekday,B2.time,s2.roll_no,s2.roll_no
HAVING COUNT(s2.roll_no) >= 2

SELECT s.roll_no, classes.class_id, c.subject_code, c.name_subject, c.credit, classes.room_number, classes.weekday, classes.time
FROM Student s, Course c, Classes classes , Study study
WHERE s.roll_no = study.roll_no AND study.class_id = classes.class_id AND classes.subject_code = c.subject_code AND s.roll_no = 'CECEIU16542'
;

DELETE Study;

INSERT INTO Study VALUES('ITITIU13232','ITIT18UN05');
INSERT INTO Study VALUES('ITITIU13232','ITIT18IU01');
INSERT INTO Study VALUES('ITITIU13232','ITIT18IU02');
INSERT INTO Study VALUES('ITITIU13232','ITIT17IU03');
INSERT INTO Study VALUES('ITITIU13232','ITIT17IU04');	
INSERT INTO Study VALUES('ITITIU13232','ITIT19IU01');



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

INSERT INTO Study VALUES('IEIEIU18456','ITIT18IU02');
INSERT INTO Study VALUES('IEIEIU18456','ITIT17IU04');


INSERT INTO Study VALUES('BTBTIU17562','ITIT17IU03');
INSERT INTO Study VALUES('BTBTIU17562','ITIT18IU09');
INSERT INTO Study VALUES('BTBTIU17562','ITIT17IU04');
INSERT INTO Study VALUES('BTBTIU17562','ITIT18IU08');


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

SELECT