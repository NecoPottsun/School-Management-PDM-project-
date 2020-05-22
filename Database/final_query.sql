---------------------------------------CREATE TABLE QUERIES---------------------------------------
CREATE TABLE Course(
subject_code VARCHAR(30),
name_subject VARCHAR(50) NOT NULL,
credit INTEGER,
major VARCHAR(5),
PRIMARY KEY(subject_code)
);



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

CREATE TABLE Student(
roll_no VARCHAR(20),
major VARCHAR(5),
name_Student VARCHAR(50),
gender VARCHAR(20),
section VARCHAR(20),
PRIMARY KEY(roll_no),
CONSTRAINT CHK_gender_Student CHECK(gender IN('Male','Female'))
);

CREATE TABLE Department (major VARCHAR(5), Name VARCHAR(50), PRIMARY KEY(major)); 
ALTER TABLE Student
ADD CONSTRAINT FK_DepartmentStudent FOREIGN KEY (major) REFERENCES Department(major);

ALTER TABLE Course
ADD CONSTRAINT FK_DepartmentCourse FOREIGN KEY (major) REFERENCES Department(major);

CREATE TABLE Staff(
id_staff VARCHAR(20),
name_staff VARCHAR(50),
gender VARCHAR(20),
salary INTEGER,
PRIMARY KEY(id_staff),
CONSTRAINT CHK_gender_staff CHECK(gender IN('Male','Female'))
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

CREATE TABLE Account(
username VARCHAR(20),
password VARCHAR(50),
admin INTEGER CHECK (admin IN(0,1)),
PRIMARY KEY (username,password)
);

---------------------------------------INSERT QUERIES---------------------------------------
----------Department--------- 
INSERT INTO Department VALUES ('IT','Information Technology');
INSERT INTO Department VALUES ('BA','Business Administration');
INSERT INTO Department VALUES ('BT','BioTechnology');
INSERT INTO Department VALUES ('EE','Electrical Engineering');
INSERT INTO Department VALUES ('ISE','Industrial Engineering & Management');
INSERT INTO Department VALUES ('CE','Civil Engineering');
INSERT INTO Department VALUES ('MA','Mathematics');
INSERT INTO Department VALUES ('PH','Physics');

----------Course--------- 

INSERT INTO Course VALUES('IT01IU','Principle Database Management',2,'IT');
INSERT INTO Course VALUES('IT02IU','Principle Database Management LAB',2,'IT');
INSERT INTO Course VALUES('IT03IU','Web Development',2,'IT');
INSERT INTO Course VALUES('IT04IU','Web Development LAB','IT');
INSERT INTO Course VALUES('IT05UN','Skills for Communicating Information','IT');
INSERT INTO Course VALUES('IT08IU','Computer Architecture',2,'IT');
INSERT INTO Course VALUES('IT09IU','Computer Architecture LAB',2,'IT');
INSERT INTO Course VALUES('IT10IU','Introduction to Artificial Intelligence',2,'IT');
INSERT INTO Course VALUES ('IT11IU','Introduction to Artificial Intelligence LAB',2,'IT');
INSERT INTO Course VALUES('PH03IU','Physics 3', 4,'PH'); 
INSERT INTO Course VALUES('PH01IU','Physics 1', 2,'PH');
INSERT INTO Course VALUES('BAIU01','Business Analys',2,'BA');
INSERT INTO Course VALUES('BAIU02','Human Management',4,'BA');
INSERT INTO Course VALUES('EEIU01','Materials',4,'EE');
INSERT INTO Course VALUES('EEIU02','Achitect',2,'EE');
INSERT INTO Course VALUES('BTIU01','Medicine',2,'BT');
INSERT INTO Course VALUES('BTIU02','Device',4,'BT');
INSERT INTO Course VALUES('CEIU01','Computer Edit',2,'CE');
INSERT INTO Course VALUES('CEIU02','Teamwork',4,'CE');
INSERT INTO Course VALUES('ISEIU01','Dance',2,'ISE');
INSERT INTO Course VALUES('ISEIU02','How to represent',4,'ISE');
INSERT INTO Course VALUES ('MA01IU','Calculus 1',4,'MA');
INSERT INTO Course VALUES ('MA02IU','Calculus 2',4,'MA');
INSERT INTO Course VALUES ('MA03IU','Calculus 3',4,'MA');

----------Classes---------
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
INSERT INTO Classes VALUES ('BABA17IU12','BAIU01','A1-206','Monday','8 a.m');
INSERT INTO Classes VALUES ('BABA16IU13','BAIU02','A1-304','Tuesday','8 a.m');
INSERT INTO Classes VALUES ('BTBT17IU14','BTIU01','A1-506','Friday','1 p.m');
INSERT INTO Classes VALUES ('BTBT19IU15','BTIU02','A1-402','Saturday','1 p.m');
INSERT INTO Classes VALUES ('CECE18IU16','CEIU01','A2-302','Monday','8 a.m');
INSERT INTO Classes VALUES ('CECE19IU17','CEIU02','A2-203','Thursday','1 p.m');
INSERT INTO Classes VALUES ('EEEE19IU18','EEIU01','A2-206','Wednesday','8 a.m');
INSERT INTO Classes VALUES ('EEEE17IU19','EEIU02','A2-314','Friday','8 a.m');
INSERT INTO Classes VALUES ('ISEIU18IU20','ISEIU01','A1-307','Thursday','1 p.m');
INSERT INTO Classes VALUES ('ISEIU19IU21','ISEIU02','A2-413','Tuesday','8 a.m');
INSERT INTO Classes VALUES ('MAMA19IU22','MA01IU','A1-403','Tuesday','8 a.m');
INSERT INTO Classes VALUES ('MAMA18IU23','MA02IU','A2-303','Wednesday','1 p.m');
INSERT INTO Classes VALUES ('MAMA18IU24','MA03IU','A2-205','Monday','1 p.m');

-------------Student------------
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('ITITIU13232','IT','Donald Trump','Male');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('ITITIU14785','IT','Barack Obama','Male');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('BABAIU15555','BA','Captain Marvel','Female');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('CECEIU16542','CE','Iron Man','Male');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('IEIEIU18456','ISE','Hello Kitty','Female');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('BTBTIU17562','BT','Kim Jong Un','Male');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('BABAIU15234','BA','Jackie Chan','Male');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('CECEIU17878','CE','Lionel Messi','Male');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('IEIEIU19236','ISE','Cristiano Ronaldo','Male');
INSERT INTO Student(roll_no,major,name_student,gender) VALUES('BTBTIU18649','BT','Edogawa Conan','Male');
INSERT INTO Student VALUES('ITITUN17007','IT','Susaka Ishiki','Female', 'k17')
INSERT INTO Student VALUES('ITITUN17008','IT','Sawano Hiroyuki','Male', 'k17')

UPDATE Student SET section = 'k15' WHERE roll_no LIKE '%15%';
UPDATE Student SET section = 'k16' WHERE roll_no LIKE '%16%';
UPDATE Student SET section = 'k17' WHERE roll_no LIKE '%17%';
UPDATE Student SET section = 'k18' WHERE roll_no LIKE '%18%';
UPDATE Student SET section = 'k19' WHERE roll_no LIKE '%19%';
UPDATE Student SET section = 'k13' WHERE roll_no LIKE '%13%';
UPDATE Student SET section = 'k14' WHERE roll_no LIKE '%14%';

----------Pay-----------

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


----Update payment for students----------
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 1)
)
WHERE tuition_id = 1 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 2)
)
WHERE tuition_id = 2 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 3)
)
WHERE tuition_id = 3 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 4)
)
WHERE tuition_id = 4 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 5)
)
WHERE tuition_id = 5 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 6)
)
WHERE tuition_id = 6 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 7)
)
WHERE tuition_id = 7 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 8)
)
WHERE tuition_id = 8 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 9)
)
WHERE tuition_id = 9 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 10)
)
WHERE tuition_id = 10 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 11)
)
WHERE tuition_id = 11 ;
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 12)
)
WHERE tuition_id = 12 ;


UPDATE PAY SET 
Amount = 0 
WHERE Amount IS NULL;

----------Tuition--------- 

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


----------Study---------

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

INSERT INTO Study VALUES('IEIEIU18456','ITIT17IU03');

----------Staff--------- 

INSERT INTO Staff VALUES('IT1','Duyen', 'female',47000000);
INSERT INTO Staff VALUES ('IT2','Ngoc','male',55000000);
INSERT INTO Staff VALUES ('IT3','Thanh','male',60000000);
INSERT INTO Staff VALUES ('BA1','Bill Gate', 'male',45000000);
INSERT INTO Staff VALUES ('BT1','Bruce Lee', 'male',67000000);
INSERT INTO Staff VALUES ('IE1','Batman', 'male',66000000);
INSERT INTO Staff VALUES ('CE1','Narkoth', 'male',64000000);
INSERT INTO Staff VALUES ('BT2','Yena', 'female',40000000);
INSERT INTO Staff VALUES('EE1','Azula','female',47000000);
INSERT INTO Staff VALUES('EE2','Zuko','male',55000000);
INSERT INTO Staff VALUES('ISE1','Mika','female',64000000);
INSERT INTO Staff VALUES('MA1','Kuro','male',64000000);

----------Teach--------- 

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
INSERT INTO Teach VALUES('BA1','BABA17IU12');
INSERT INTO Teach VALUES('BA1','BABA16IU13');
INSERT INTO Teach VALUES('BT1','BTBT19IU15');
INSERT INTO Teach VALUES('CE1','CECE19IU17');
INSERT INTO Teach VALUES('CE1','CECE18IU16');
INSERT INTO Teach VALUES('IE1','ISEIU18IU20');
INSERT INTO Teach VALUES('EE1','EEEE17IU19');
INSERT INTO Teach VALUES('EE2','EEEE19IU18');
INSERT INTO Teach VALUES('IT2','ISEIU19IU20');
INSERT INTO Teach VALUES('ISE1','ISEIU19IU21');
INSERT INTO Teach VALUES('MA1','MAMA19IU22');
INSERT INTO Teach VALUES('MA1','MAMA18IU23');
INSERT INTO Teach VALUES('MA1','MAMA18IU24');


----------Account--------- 
INSERT INTO Account VALUES('admin', 'a123',1);
INSERT INTO Account VALUES('admin1', 'a234',1);

INSERT INTO Account VALUES('BABAIU15234', LOWER('BABAIU15234'),0);
INSERT INTO Account VALUES('BABAIU15555', LOWER('BABAIU15555'),0);
INSERT INTO Account VALUES('BTBTIU17562', LOWER('BTBTIU17562'),0);
INSERT INTO Account VALUES('BTBTIU18649', LOWER('BTBTIU18649'),0);
INSERT INTO Account VALUES('CECEIU16542', LOWER('CECEIU16542'),0);
INSERT INTO Account VALUES('CECEIU17878', LOWER('CECEIU17878'),0);
INSERT INTO Account VALUES('IEIEIU18456', LOWER('IEIEIU18456'),0);
INSERT INTO Account VALUES('IEIEIU19236', LOWER('IEIEIU19236'),0);
INSERT INTO Account VALUES('ITITIU13232', LOWER('ITITIU13232'),0);
INSERT INTO Account VALUES('ITITIU14785', LOWER('ITITIU14785'),0);

INSERT INTO Account VALUES('BA1', 'billgate',0);
INSERT INTO Account VALUES('BT1', 'brucelee',0);
INSERT INTO Account VALUES('BT2', 'yena',0);
INSERT INTO Account VALUES('CE1', 'narkoth',0);
INSERT INTO Account VALUES('IE1', 'batman',0);
INSERT INTO Account VALUES('IT1', 'duyen',0);
INSERT INTO Account VALUES('IT2', 'ngoc',0);
INSERT INTO Account VALUES('IT3', 'thanh',0);

---------------------------------------UPDATE DATA QUERIES(used in GUI) example---------------------------------------
---Change the room_number of class whose id = 'BABA16IU13' from A1-304 to A1-202
UPDATE Classes SET class_id = 'BABA16IU13', subject_code = 'BAIU02', room_number='A1-202' , weekday='Tuesday', time='8 a.m' WHERE class_id = 'BABA16IU13'
---Change the credit of course whose id = 'BAIU01' from 2 to 4
UPDATE course SET subject_code='BAIU01' ,name_subject='Business Analys', credit= 4, major='BA' WHERE subject_code = 'BAIU01'
---Change the salary of staff whose id_staff = 'BA1' from 45000000 to 50000000
UPDATE Staff SET name_staff='Bill Gate', gender='male',salary= 50000000 WHERE id_staff = 'BA1';
---Change the password of account whose username = 'BABAIU15234' from babaiu15234 to 15234
UPDATE Account SET  username='BABAIU15234',password= '15234' WHERE username= 'BABAIU15234' and password='babaiu15234';
---Change the gender of student whose roll_no = 'BABAIU15555' from female to male
UPDATE Student SET  major ='BA', name_student='Captain Marvel', gender='male',section='k15' WHERE roll_no = 'BABAIU15555'
---Change teacher of a course whose id_staff = 'IT1' from ITIT18IU08 to ITIT18IU08
UPDATE Teach SET class_id = 'ITIT18IU08' ,id_staff = 'IT1' WHERE id_staff = 'IT1' AND class_id = 'ITIT18IU08'
---Change tuition status whose tuition_id = 3 FROM unpaid to paid
UPDATE Tuition SET  paid_or_unpaid=1  WHERE tuition_id= 3
----Update payment of Pay 
UPDATE Pay SET 
Amount = ( Amount_per_credit* (SELECT A2.Total_credit FROM Pay p INNER JOIN (
SELECT s.roll_no, SUM(A1.credit) AS Total_credit FROM Study s, (SELECT c1.class_id,c2.subject_code,c2.credit FROM Classes c1,Course c2 WHERE c1.subject_code = c2.subject_code) AS A1 WHERE s.class_id = A1.class_id 
GROUP BY s.roll_no) 
AS A2 ON A2.roll_no = p.roll_no AND p.tuition_id = 1)
)
WHERE tuition_id = 1 ;
UPDATE PAY SET 
Amount = 0 
WHERE Amount IS NULL;

---------------------------------------DELETE DATA QUERIES(used in GUI) example---------------------------------------
DELETE FROM Account WHERE username = ''
DELETE FROM Account WHERE username = ''
DELETE FROM Account WHERE username = ''
DELETE FROM Account WHERE username = ''
DELETE FROM Account WHERE username = ''
DELETE FROM Account WHERE username = ''

---------------------------------------RETRIEVE DATA QUERIES---------------------------------------
SELECT * FROM Account;
SELECT * FROM Classes;
SELECT * FROM Course;
SELECT * FROM Pay;
SELECT * FROM Staff;
SELECT * FROM Student;
SELECT * FROM Study;
SELECT * FROM Teach;
SELECT * FROM Tuition;