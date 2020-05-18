SELECT * FROM Tuition;
SELECT * FROM Staff;
SELECT * FROM Student;


ALTER TABLE Student ADD section VARCHAR(20);
ALTER TABLE Tuition ADD deadline_date DATE;

UPDATE Tuition SET deadline_date = CONVERT(date,'30/05/2020',104) WHERE tuition_id IN('S001','S002','S003','S004');

UPDATE Tuition SET deadline_date = CONVERT(date,'15/05/2020',104) WHERE tuition_id IN('S005','S006','S007','S010');

UPDATE Tuition SET deadline_date = CONVERT(date,'30/04/2020',104) WHERE tuition_id IN('S008','S009');

UPDATE Student SET section = 'k15' WHERE roll_no LIKE '%15%';
UPDATE Student SET section = 'k16' WHERE roll_no LIKE '%16%';
UPDATE Student SET section = 'k17' WHERE roll_no LIKE '%17%';
UPDATE Student SET section = 'k18' WHERE roll_no LIKE '%18%';
UPDATE Student SET section = 'k19' WHERE roll_no LIKE '%19%';
UPDATE Student SET section = 'k13' WHERE roll_no LIKE '%13%';
UPDATE Student SET section = 'k14' WHERE roll_no LIKE '%14%';

CREATE TABLE Account(
username VARCHAR(20),
password VARCHAR(50),
admin INTEGER CHECK (admin IN(0,1)),
PRIMARY KEY (username,password)
);

INSERT INTO Account VALUES('admin', 'a123',1);
INSERT INTO Account VALUES('admin1', 'a234',1);

INSERT INTO Account VALUES('BABAIU15234', 'baiu15234',0);
INSERT INTO Account VALUES('BABAIU15555', 'baiu15555',0);
INSERT INTO Account VALUES('BTBTIU17562', 'btiu17562',0);
INSERT INTO Account VALUES('BTBTIU18649', 'btiu18649',0);
INSERT INTO Account VALUES('CECEIU16542', 'ceiu16542',0);
INSERT INTO Account VALUES('CECEIU17878', 'ceiu17878',0);
INSERT INTO Account VALUES('IEIEIU18456', 'ieiu18456',0);
INSERT INTO Account VALUES('IEIEIU19236', 'ieiu19236',0);
INSERT INTO Account VALUES('ITITIU13232', 'itiu13232',0);
INSERT INTO Account VALUES('ITITIU14785', 'itiu14785',0);

INSERT INTO Account VALUES('BA1', 'billgate',0);
INSERT INTO Account VALUES('BT1', 'brucelee',0);
INSERT INTO Account VALUES('BT2', 'yena',0);
INSERT INTO Account VALUES('CE1', 'narkoth',0);
INSERT INTO Account VALUES('IE1', 'batman',0);
INSERT INTO Account VALUES('IT1', 'duyen',0);
INSERT INTO Account VALUES('IT2', 'ngoc',0);
INSERT INTO Account VALUES('IT3', 'thanh',0);

SELECT * FROM Account;
SELECT * FROM Classes;
SELECT * FROM Course;
SELECT * FROM Staff;
SELECT * FROM Student;
SELECT * FROM Study;
SELECT * FROM Teach;
SELECT * FROM Tuition;
SELECT * FROM Student;


-- STAFF SALARY DISPLAY
SELECT id_staff, name_staff, salary FROM Staff WHERE id_staff = '';

--STUDENT TUITION FEE DISPLAY
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t WHERE s.tuition_id = t.tuition_id AND s.roll_no = '';
-- UNPAID/PAID STUDENT
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t
WHERE s.tuition_id = t.tuition_id AND paid_or_unpaid = 0;
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t
WHERE s.tuition_id = t.tuition_id AND paid_or_unpaid = 1;

--UNPAID/PAID Student late deadline according to today/ date 25/5/2020
--Unpaid
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t
WHERE s.tuition_id = t.tuition_id AND paid_or_unpaid = 0 AND t.deadline_date < GETDATE();
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t
WHERE s.tuition_id = t.tuition_id AND paid_or_unpaid = 0 AND t.deadline_date < '2020/5/25';
--Paid
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t
WHERE s.tuition_id = t.tuition_id AND paid_or_unpaid = 1 AND t.deadline_date < GETDATE();
SELECT s.roll_no, s.name_student, t.fee, t.deadline_date , t.paid_or_unpaid FROM Student s, Tuition t
WHERE s.tuition_id = t.tuition_id AND paid_or_unpaid = 1 AND t.deadline_date < '2020/5/25';


SELECT student.roll_no, student.name_student,c.room_number,c.weekday,c.time FROM Student student, Study study, Classes c 
WHERE student.roll_no = study.roll_no AND
study.subject_code = c.subject_code AND 
student.name_student LIKE '%Jackie%'

SELECT student.roll_no, student.name_student,course.name_subject,c.room_number,c.weekday,c.time FROM Student student, Study study, Classes c, Course course
WHERE student.roll_no = study.roll_no AND
study.subject_code = c.subject_code AND 
course.subject_code = c.subject_code AND
student.name_student LIKE '%Jackie%'

