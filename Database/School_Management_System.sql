CREATE DATABASE School_Management
GO
USE School_Management;

CREATE TABLE Classes(
subject_code VARCHAR(30),
name_subject VARCHAR(50),
room_number VARCHAR(10) DEFAULT 'undecided',
weekday VARCHAR(10) DEFAULT 'undecided',
time VARCHAR(10),
PRIMARY KEY(subject_code)
);


CREATE TABLE Staff(
id_staff VARCHAR(20),
name_staff VARCHAR(50),
gender VARCHAR(20),
PRIMARY KEY(id_staff),
CONSTRAINT CHK_gender_staff CHECK(gender IN('Male','Female'))
);


CREATE TABLE Student(
roll_no VARCHAR(20),
section VARCHAR(20),
name_student VARCHAR(50),
gender VARCHAR(20),
PRIMARY KEY(roll_no),
CONSTRAINT CHK_gender_student CHECK(gender IN('Male','Female'))
);

CREATE TABLE Teach(
id_staff VARCHAR(20) NOT NULL,
subject_code VARCHAR(30) NOT NULL,
PRIMARY KEY(id_staff,subject_code)
);

CREATE TABLE Study(
roll_no VARCHAR(20) NOT NULL,
subject_code VARCHAR(30) NOT NULL,
PRIMARY KEY(roll_no,subject_code)
);

CREATE TABLE Receipt(
r_id VARCHAR(10),
date DATE,
PRIMARY KEY(r_id)
);

CREATE TABLE Payment(
r_id VARCHAR(10),
roll_no VARCHAR(20),
amount INT,
paid_or_unpaid INT CHECK(paid_or_unpaid IN(0,1)),
PRIMARY KEY(r_id,roll_no)
);

CREATE TABLE Payroll(
r_id VARCHAR(10),
id_staff VARCHAR(20),
amount INT,
PRIMARY KEY(r_id,id_staff)
);
--> Integrity constraints
ALTER TABLE Teach ADD CONSTRAINT FK_ClassTeach
FOREIGN KEY (subject_code) REFERENCES Classes(subject_code)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Teach ADD CONSTRAINT FK_StaffTeach
FOREIGN KEY (id_staff) REFERENCES Staff(id_staff)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Study ADD CONSTRAINT FK_ClassStudy
FOREIGN KEY (subject_code) REFERENCES Classes(subject_code)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Study ADD CONSTRAINT FK_StudentStudy
FOREIGN KEY (roll_no) REFERENCES Student(roll_no)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Payment ADD CONSTRAINT FK_StudentPayment
FOREIGN KEY (roll_no) REFERENCES Student(roll_no)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Payment ADD CONSTRAINT FK_ReceiptPayment
FOREIGN KEY (r_id) REFERENCES Receipt(r_id)
ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE Payroll ADD CONSTRAINT FK_StaffPayroll
FOREIGN KEY (id_staff) REFERENCES Staff(id_staff)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Payroll ADD CONSTRAINT FK_ReceiptPayroll
FOREIGN KEY (r_id) REFERENCES Receipt(r_id)
ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Classes ALTER COLUMN name_subject VARCHAR(50) NOT NULL;
ALTER TABLE Staff ALTER COLUMN name_staff VARCHAR(50) NOT NULL;
ALTER TABLE Staff ALTER COLUMN gender VARCHAR(20) NOT NULL;
ALTER TABLE Student ALTER COLUMN name_student VARCHAR(50) NOT NULL;
ALTER TABLE Student ALTER COLUMN gender VARCHAR(20) NOT NULL;

 

ALTER TABLE Classes ADD CONSTRAINT UC_Class UNIQUE(room_number,weekday,time);



--->Input data
INSERT INTO Classes VALUES('IT01IU','Principle Database Management','A1-202','Friday','1 p.m');
INSERT INTO Classes VALUES('IT02IU','Principle Database Management LAB','LA1-605','Monday','8 a.m');
INSERT INTO Classes VALUES('IT03IU','Web Development','A1-404','Wednesday','8 a.m');
INSERT INTO Classes VALUES('IT04IU','Web Development LAB','LA1-606','Tuesday','8 a.m');
INSERT INTO Classes VALUES('IT05UN','Skills for Communicating Information','A2-408','Tuesday','1 p.m');
INSERT INTO Classes(subject_code,name_subject,room_number,time) VALUES('IT08IU','Computer Architecture','A1-404','1 p.m');
INSERT INTO Classes(subject_code, name_subject) VALUES('IT09IU','Computer Architecture LAB');
INSERT INTO Classes(subject_code, name_subject) VALUES('IT10IU','Introduction to Artificial Intelligence');
INSERT INTO Classes(subject_code, name_subject,weekday,time) VALUES ('IT11IU','Introduction to Artificial Intelligence LAB','Friday','8 a.m');
INSERT INTO Classes VALUES('PH03IU','Physics 3','A1-403','Tuesday', '1 p.m'); 
INSERT INTO Classes VALUES('PH01IU','Physics 1','A2-408','Wednesday', '1 p.m');


---> Insert Staff
INSERT INTO Staff VALUES('IT1','Duyen', 'female');
INSERT INTO Staff VALUES ('IT2','Ngoc','male');
INSERT INTO Staff VALUES ('IT3','Thanh','male');
INSERT INTO Staff VALUES ('BA1','Bill Gate', 'male');
INSERT INTO Staff VALUES ('BT1','Bruce Lee', 'male');
INSERT INTO Staff VALUES ('IE1','Batman', 'male');
INSERT INTO Staff VALUES ('CE1','Narkoth', 'male');
INSERT INTO Staff VALUES ('BT2','Yena', 'female');

INSERT INTO Teach VALUES('IT1','IT01IU');
INSERT INTO Teach VALUES('IT1','IT03IU');
INSERT INTO Teach VALUES ('IT2','IT02IU');
INSERT INTO Teach VALUES ('IT2','IT09IU');
INSERT INTO Teach VALUES ('IT3','IT03IU');
INSERT INTO Teach VALUES ('IT3','IT01IU');
INSERT INTO Teach VALUES('BA1','PH03IU');
INSERT INTO Teach VALUES('BA1','IT11IU');
INSERT INTO Teach VALUES('BT1','IT09IU');
INSERT INTO Teach VALUES('BT1','IT04IU');
INSERT INTO Teach VALUES('IE1','IT11IU');
INSERT INTO Teach VALUES('IE1','IT05UN');
INSERT INTO Teach VALUES('CE1','IT04IU');
INSERT INTO Teach VALUES('CE1','IT08IU');
INSERT INTO Teach VALUES('BT2','IT05UN');
INSERT INTO Teach VALUES('BT2','PH03IU');
INSERT INTO Teach VALUES('CE1','PH01IU');


---> Insert Student & Study
INSERT INTO Student VALUES('ITITIU13232','IT','Donald Trump','Male');

INSERT INTO Study VALUES('ITITIU13232','IT05UN');
INSERT INTO Study VALUES('ITITIU13232','IT01IU');
INSERT INTO Study VALUES('ITITIU13232','IT02IU');
INSERT INTO Study VALUES('ITITIU13232','IT03IU');
INSERT INTO Study VALUES('ITITIU13232','IT04IU');
INSERT INTO Study VALUES('ITITIU13232','PH01IU');

INSERT INTO Student VALUES('ITITIU14785','IT','Barack Obama','Male');

INSERT INTO Study VALUES('ITITIU14785','IT01IU');
INSERT INTO Study VALUES('ITITIU14785','IT01IU');
INSERT INTO Study VALUES('ITITIU14785','IT02IU');
INSERT INTO Study VALUES('ITITIU14785','IT09IU');
INSERT INTO Study VALUES('ITITIU14785','IT11IU');
INSERT INTO Study VALUES('ITITIU14785','IT08IU');

INSERT INTO Student VALUES('BABAIU15555','BA','Captain Marvel','Female');

INSERT INTO Study VALUES('BABAIU15555','PH03IU');
INSERT INTO Study VALUES('BABAIU15555','IT09IU');
INSERT INTO Study VALUES('BABAIU15555','IT04IU');
INSERT INTO Study VALUES('BABAIU15555','IT08IU');

INSERT INTO Student VALUES('CECEIU16542','CE','Iron Man','Male');

INSERT INTO Study VALUES('CECEIU16542','IT02IU');
INSERT INTO Study VALUES('CECEIU16542','PH03IU');
INSERT INTO Study VALUES('CECEIU16542','IT05UN');

INSERT INTO Student VALUES('IEIEIU18456','ISE','Hello Kitty','Female');

INSERT INTO Study VALUES('IEIEIU18456','IT02IU');
INSERT INTO Study VALUES('IEIEIU18456','IT04IU');

INSERT INTO Student VALUES('BTBTIU17562','BT','Kim Jong Un','Male');

INSERT INTO Study VALUES('BTBTIU17562','IT03IU');
INSERT INTO Study VALUES('BTBTIU17562','IT09IU');
INSERT INTO Study VALUES('BTBTIU17562','IT04IU');
INSERT INTO Study VALUES('BTBTIU17562','IT08IU');

INSERT INTO Student VALUES('BABAIU15234','BA','Jackie Chan','Male');

INSERT INTO Study VALUES('BABAIU15234','PH03IU');
INSERT INTO Study VALUES('BABAIU15234','IT05UN');
INSERT INTO Study VALUES('BABAIU15234','IT02IU');
INSERT INTO Study VALUES('BABAIU15234','IT01IU');

INSERT INTO Student VALUES('CECEIU17878','CE','Lionel Messi','Male');

INSERT INTO Study VALUES('CECEIU17878','IT05UN');
INSERT INTO Study VALUES('CECEIU17878','IT04IU');
INSERT INTO Study VALUES('CECEIU17878','IT11IU');

INSERT INTO Student VALUES('IEIEIU19236','ISE','Cristiano Ronaldo','Male');

INSERT INTO Study VALUES('IEIEIU19236','IT09IU');
INSERT INTO Study VALUES('IEIEIU19236','PH03IU');
INSERT INTO Study VALUES('IEIEIU19236','IT11IU');
INSERT INTO Study VALUES('IEIEIU19236','IT08IU');

INSERT INTO Student VALUES('BTBTIU18649','BT','Edogawa Conan','Male');

INSERT INTO Study VALUES('BTBTIU18649','IT11IU');
INSERT INTO Study VALUES('BTBTIU18649','IT04IU');
INSERT INTO Study VALUES('BTBTIU18649','IT02IU');


---> Insert Payment
INSERT INTO Receipt VALUES('T001','05/30/2020');
INSERT INTO Receipt VALUES('S002','05/30/2020');
INSERT INTO Receipt VALUES('S003','05/30/2020');
INSERT INTO Receipt VALUES('S004','05/30/2020');
INSERT INTO Receipt VALUES('S005','05/15/2020');
INSERT INTO Receipt VALUES('S006','05/15/2020');
INSERT INTO Receipt VALUES('S007','05/15/2020');
INSERT INTO Receipt VALUES('S008','05/15/2020');
INSERT INTO Receipt VALUES('S009','05/15/2020');
INSERT INTO Receipt VALUES('S010','05/15/2020');


INSERT INTO Receipt VALUES('T001','04/30/2020');
INSERT INTO Receipt VALUES('T002','04/30/2020');
INSERT INTO Receipt VALUES('T003','04/30/2020');
INSERT INTO Receipt VALUES('T004','05/1/2020');
INSERT INTO Receipt VALUES('T005','05/1/2020');
INSERT INTO Receipt VALUES('T006','05/1/2020');
INSERT INTO Receipt VALUES('T007','05/1/2020');
INSERT INTO Receipt VALUES('T008','05/1/2020');


--->Insert Payment
INSERT INTO Payment VALUES('S001','BABAIU15234','32540000',1);
INSERT INTO Payment VALUES('S002','CECEIU17878','23440000',1);
INSERT INTO Payment VALUES('S003','IEIEIU19236','20545000',0);
INSERT INTO Payment VALUES('S004','ITITIU14785','16330000',0);
INSERT INTO Payment VALUES('S005','BTBTIU17562','30243000',1);
INSERT INTO Payment VALUES('S006','CECEIU16542','36760000',1);
INSERT INTO Payment VALUES('S007','ITITIU13232','10240000',0);
INSERT INTO Payment VALUES('S008','IEIEIU18456','19530000',0);
INSERT INTO Payment VALUES('S009','BTBTIU18649','13400000',1);
INSERT INTO Payment VALUES('S010','BABAIU15555','24740000',0);


--->Insert Payroll
INSERT INTO Payroll VALUES('T001','BA1',47000000);
INSERT INTO Payroll VALUES('T002','BT1',55000000);
INSERT INTO Payroll VALUES('T003','BT2',60000000);
INSERT INTO Payroll VALUES('T004','CE1',45000000);
INSERT INTO Payroll VALUES('T005','IT2',67000000);
INSERT INTO Payroll VALUES('T006','IT1',66000000);
INSERT INTO Payroll VALUES('T007','IT3',64000000);
INSERT INTO Payroll VALUES('T008','IE1',40000000);


--->Update
SELECT * FROM Staff s, Classes c, Teach t
WHERE s.id_staff = t.id_staff AND c.subject_code = t.subject_code AND c.subject_code IN('PH01IU');
UPDATE Classes 
SET room_number = 'LA1-607', weekday ='Wednesday', time='1p.m'
WHERE name_subject = 'Computer Architecture LAB';
UPDATE Classes 
SET weekday ='Thursday'
WHERE subject_code = 'IT08IU';
UPDATE Classes 
SET room_number = 'LA1-606'
WHERE subject_code = 'IT11IU';
UPDATE Receipt
SET date = '04/20/2020'
WHERE r_id = 'S007';



SELECT * FROM Receipt;
SELECT * FROM Payment;
--->Delete data
DELETE FROM Receipt WHERE r_id ='T001' ;
DELETE FROM Payment WHERE roll_no = 'CECEIU17878';
DELETE FROM Classes WHERE subject_code = 'PH01IU';

---> Retrieve data
--->Staff will be having their id, name and classes they are teaching
SELECT s.id_staff, s.name_staff, c.subject_code,c.name_subject, c.room_number, c.weekday, c.time 
FROM Staff s, Classes c, Teach t
WHERE t.subject_code = c.subject_code AND t.id_staff = s.id_staff;

SELECT Staff.id_staff, Staff.name_staff, Classes.name_subject, Classes.room_number, Classes.weekday, Classes.time
FROM ((Staff 
INNER JOIN Teach ON Staff.id_staff = Teach.id_staff)
INNER JOIN Classes ON Classes.subject_code = Teach.subject_code);


---> Student will be having name, roll no, section, class
SELECT s.name_student, s.roll_no, s.section,c.subject_code,c.name_subject, c.room_number, c.weekday, c.time 
FROM Student s, Classes c, Study study
WHERE study.roll_no = s.roll_no AND c.subject_code = study.subject_code;

SELECT Student.name_student, Student.roll_no,Student.section,Classes.subject_code,Classes.name_subject, Classes.room_number, Classes.weekday, Classes.time
FROM ((Student
INNER JOIN Study ON Student.roll_no = Study.roll_no)
INNER JOIN Classes ON Classes.subject_code = Study.subject_code);

--->Another table containing section, subject and teacher information
SELECT s.section, c.name_subject, s1.id_staff, s1.name_staff, s1.gender
FROM Student s, Classes c, Staff s1, Teach t, Study s2
WHERE s2.roll_no = s.roll_no AND s2.subject_code = c.subject_code
AND c.subject_code = t.subject_code AND t.id_staff = s1.id_staff;


--->Next will be containing fee information for students
SELECT r.r_id AS Receipt_ID, s.roll_no AS Student_ID,s.name_student AS Student_Name, p.amount, r.date, p.paid_or_unpaid
FROM Payment p, Receipt r, Student s
WHERE p.r_id = r.r_id AND p.roll_no = s.roll_no;

---> One contains salary information for teachers
SELECT r.r_id AS Receipt_ID, s.id_staff AS Staff_ID, s.name_staff AS Staff_Name, p.amount, r.date
FROM Payroll p, Receipt r, Staff s
WHERE p.r_id = r.r_id and p.id_staff = s.id_staff;

--->Rooms are assigned to classes keeping in mind that there is no time clash of same room or lab
--->The class cannot be created when it has the same room, weekday, time with other class
INSERT INTO Classes VALUES('PH02IU','Physics 2','A1-404','Wednesday', '8 a.m'); 

--->The student cannot be created if he/she has another section
INSERT INTO Student VALUES('MAMAIU19009','MA','Daisy Robin','Female');
INSERT INTO Student VALUES('MAMAIU19009','BA','Daisy Robin','Female');


--->no student should be there who has not paid fee up to a particular date
---> list of students information and receipt information
SELECT r.r_id AS Receipt_ID, s.roll_no AS Student_ID,s.name_student AS Student_Name, p.amount, r.date, p.paid_or_unpaid
FROM Payment p, Receipt r, Student s
WHERE p.r_id = r.r_id AND p.roll_no = s.roll_no;

---> late deadline payment student
--- up to today
SELECT  r.r_id AS Receipt_ID, s.roll_no AS Student_ID,s.name_student AS Student_Name, p.amount, r.date, p.paid_or_unpaid
FROM Payment p, Receipt r, Student s
WHERE p.r_id = r.r_id AND p.roll_no = s.roll_no
AND r.date < GETDATE() AND p.paid_or_unpaid = 0;
--- up to particular day (05/26/2020)
SELECT  r.r_id AS Receipt_ID, s.roll_no AS Student_ID,s.name_student AS Student_Name, p.amount, r.date, p.paid_or_unpaid
FROM Payment p, Receipt r, Student s
WHERE p.r_id = r.r_id AND p.roll_no = s.roll_no
AND r.date < '05/26/2020' AND p.paid_or_unpaid = 0;


---> list of unpaid student not yet late deadline payment
SELECT s.name_student, s.roll_no, s.section,c.subject_code,c.name_subject, c.room_number, c.weekday, c.time, p.paid_or_unpaid
FROM Student s, Classes c, Study study, Payment p, Receipt r
WHERE study.roll_no = s.roll_no AND c.subject_code = study.subject_code
AND p.r_id = r.r_id AND p.roll_no = s.roll_no
AND r.date > GETDATE() AND p.paid_or_unpaid = 0;
---> list of paid student not yet late deadline payment
SELECT s.name_student, s.roll_no, s.section,c.subject_code,c.name_subject, c.room_number, c.weekday, c.time, p.paid_or_unpaid
FROM Student s, Classes c, Study study, Payment p, Receipt r
WHERE study.roll_no = s.roll_no AND c.subject_code = study.subject_code
AND p.r_id = r.r_id AND p.roll_no = s.roll_no
AND r.date > GETDATE() AND p.paid_or_unpaid = 1;

--->list of student not yet deadline payment
SELECT s.name_student, s.roll_no, s.section,c.subject_code,c.name_subject, c.room_number, c.weekday, c.time, p.paid_or_unpaid
FROM Student s, Classes c, Study study, Payment p, Receipt r
WHERE study.roll_no = s.roll_no AND c.subject_code = study.subject_code
AND p.r_id = r.r_id AND p.roll_no = s.roll_no
AND r.date > GETDATE();






SELECT * FROM Classes;
SELECT * FROM Staff;
SELECT * FROM Teach;
SELECT * FROM Student;
SELECT * FROM Study;
SELECT * FROM Receipt;
SELECT * FROM Payment;
SELECT * FROM Payroll;


ALTER TABLE Teach DROP CONSTRAINT FK_ClassTeach;
ALTER TABLE Teach DROP CONSTRAINT FK_StaffTeach;
ALTER TABLE Study DROP CONSTRAINT FK_ClassStudy;
ALTER TABLE Study DROP CONSTRAINT FK_StudentStudy;
ALTER TABLE Payroll DROP CONSTRAINT FK_StaffPayroll;
ALTER TABLE Payment DROP CONSTRAINT FK_StudentPayment;
ALTER TABLE Payroll DROP CONSTRAINT FK_ReceiptPayroll;
ALTER TABLE Payment DROP CONSTRAINT FK_ReceiptPayment;


DROP TABLE Staff;
DROP TABLE Classes;
DROP TABLE Study;
DROP TABLE Teach;
DROP TABLE Student;
DROP TABLE Receipt;
DROP TABLE Payroll;
DROP TABLE Payment;