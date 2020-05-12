SELECT * FROM Tuition;
SELECT * FROM Staff;
SELECT * FROM Student;

ALTER TABLE Tuition ADD deadline_date DATE;

UPDATE Tuition SET deadline_date = CONVERT(date,'30/05/2020',104) WHERE tuition_id IN('S001','S002','S003','S004');

UPDATE Tuition SET deadline_date = CONVERT(date,'15/05/2020',104) WHERE tuition_id IN('S005','S006','S007','S010');

UPDATE Tuition SET deadline_date = CONVERT(date,'30/04/2020',104) WHERE tuition_id IN('S008','S009');

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
