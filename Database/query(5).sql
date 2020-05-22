CREATE TABLE Department (major VARCHAR(5), Name VARCHAR(50), PRIMARY KEY(major)); 

INSERT INTO Department VALUES ('IT','Information Technology');
INSERT INTO Department VALUES ('BA','Business Administration');
INSERT INTO Department VALUES ('BT','BioTechnology');
INSERT INTO Department VALUES ('EE','Electrical Engineering');
INSERT INTO Department VALUES ('ISE','Industrial Engineering & Management');
INSERT INTO Department VALUES ('CE','Civil Engineering');
INSERT INTO Department VALUES ('MA','Mathematics');
INSERT INTO Department VALUES ('PH','Physics');
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
SELECT * FROM Course;

SELECT * FROM Student;
ALTER TABLE Student
ALTER COLUMN major VARCHAR(5);

ALTER TABLE Student
ADD CONSTRAINT FK_DepartmentStudent FOREIGN KEY (major) REFERENCES Department(major);

ALTER TABLE Course
ADD CONSTRAINT FK_DepartmentCourse FOREIGN KEY (major) REFERENCES Department(major);