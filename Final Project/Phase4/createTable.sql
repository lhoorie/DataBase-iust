CREATE TABLE systemTable(
	systemID int NOT NULL PRIMARY KEY
);
CREATE TABLE supporter(
	supporterID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL,

	systemID int NOT NULL FOREIGN KEY REFERENCES systemTable(systemID)
);
CREATE TABLE student(
	studentID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL
);
CREATE TABLE professor(
	professorID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL,

	addID int NOT NULL FOREIGN KEY REFERENCES supporter(supporterID)
	--lessonList varchar(100) NOT NULL,
	--attendanceList varchar(100) NOT NULL
);
CREATE TABLE sessionFile(
	sessionID int NOT NULL PRIMARY KEY,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE note(
	noteID int NOT NULL PRIMARY KEY,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE quiz(
	quizID int NOT NULL PRIMARY KEY,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE hw(
	hwID int NOT NULL PRIMARY KEY,
	deadLine date NOT NULL,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE ta(
	taID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL,

	addID int NOT NULL FOREIGN KEY REFERENCES supporter(supporterID),
	--uploadedHWID int NOT NULL FOREIGN KEY REFERENCES hw(hwID), 
	--uploadedNoteID int NOT NULL FOREIGN KEY REFERENCES note(noteID),
	--uploadedQuizID int NOT NULL FOREIGN KEY REFERENCES quiz(quizID)
	--providedLessons varchar(100) NOT NULL
);
CREATE TABLE uploadedNotes(
	nID int NOT NULL FOREIGN KEY REFERENCES note(noteID),
	taID int NOT NULL FOREIGN KEY REFERENCES ta(taID)
);
CREATE TABLE uploadedHWs(
	hwID int NOT NULL FOREIGN KEY REFERENCES hw(hwID),
	taID int NOT NULL FOREIGN KEY REFERENCES ta(taID)
);
CREATE TABLE uploadedQuizes(
	qID int NOT NULL FOREIGN KEY REFERENCES quiz(quizID),
	taID int NOT NULL FOREIGN KEY REFERENCES ta(taID)
);
CREATE TABLE class(
	classID int NOT NULL PRIMARY KEY,
	classSessionFile int NOT NULL FOREIGN KEY REFERENCES sessionFile(sessionID),
	professorID int NOT NULL FOREIGN KEY REFERENCES professor(professorID),
	--taList varchar(50) NOT NULL,
	className varchar(50) NOT NULL,
	--studentsList varchar(50) NOT NULL,
	classDate1 int NOT NULL,
	classDate2 int NOT NULL,
	classStartTime time NOT NULL,
	classFinishTime time NOT NULL,
	classStart date NOT NULL
);
CREATE TABLE sessionTable(
	sessionID int NOT NULL PRIMARY KEY,
	classID int NOT NULL FOREIGN KEY REFERENCES class(classID),
	sessionFileID int NOT NULL FOREIGN KEY REFERENCES sessionFile(sessionID),
	sessionDate date NOT NULL
);
CREATE TABLE attendanceList(
	sessionID int NOT NULL FOREIGN KEY REFERENCES sessionTable(sessionID),
	studentID int NOT NULL FOREIGN KEY REFERENCES student(studentID),
	isPresent bit
);
CREATE TABLE studentParticipants(
	studentID int NOT NULL FOREIGN KEY REFERENCES student(studentID),
	classID int NOT NULL FOREIGN KEY REFERENCES class(classID)
);
CREATE TABLE TAparticipants(
	taID int NOT NULL FOREIGN KEY REFERENCES ta(taID),
	classID int NOT NULL FOREIGN KEY REFERENCES class(classID)
);
CREATE TABLE ansHW(
	ansID int NOT NULL FOREIGN KEY REFERENCES student(studentID),
	studentID int NOT NULL FOREIGN KEY REFERENCES student(studentID),
	hwID int NOT NULL FOREIGN KEY REFERENCES hw(hwID),
	--ansFile file NOT NULL,
	grade float
);

GO
INSERT INTO systemTable(systemID)
VALUES
	(1),
	(2),
	(3),
	(4);

GO
INSERT INTO supporter(supporterID , firstName , lastName , email , systemID)
VALUES
	(1, 'fName1' , 'lName1' , 'email1@gmail.com' , 1),
	(2, 'fName2' , 'lName2' , 'email2@gmail.com' , 2),
	(3, 'fName3' , 'lName3' , 'email3@gmail.com' , 3),
	(4, 'fName4' , 'lName4' , 'email4@gmail.com' , 4);

GO
INSERT INTO student(studentID , firstName , lastName , email)
VALUES	
	(981111111 , 'fName1' , 'lName1' , 'email1@gmail.com'),
	(982222222 , 'fName2' , 'lName2' , 'email2@gmail.com'),
	(983333333 , 'fName3' , 'lName3' , 'email3@gmail.com'),
	(984444444 , 'fName4' , 'lName4' , 'email4@gmail.com');

GO
INSERT INTO professor(professorID , firstName , lastName , email , addID)
VALUES
	(201111111 , 'fName1' , 'lName1' , 'email1@gmail.com' , 1),
	(202222222 , 'fName2' , 'lName2' , 'email2@gmail.com' , 2),
	(203333333 , 'fName3' , 'lName3' , 'email3@gmail.com' , 3),
	(204444444 , 'fName4' , 'lName4' , 'email4@gmail.com' , 4);

GO
INSERT INTO sessionFile(sessionID , uploadTime , uploadDate)
VALUES
	(1 , TIMEFROMPARTS(8,30,0,0,0) , datefromparts(2021,6,11)),
	(2 , TIMEFROMPARTS(9,30,0,0,0) , datefromparts(2021,2,10)),
	(3 , TIMEFROMPARTS(7,30,0,0,0) , datefromparts(2021,5,9)),
	(4 , TIMEFROMPARTS(6,30,0,0,0) , datefromparts(2021,4,2));

GO
INSERT INTO note(noteID , uploadTime , uploadDate)
VALUES
	(1 , TIMEFROMPARTS(12,30,0,0,0) , datefromparts(2021,6,11)),
	(2 , TIMEFROMPARTS(10,30,0,0,0) , datefromparts(2021,2,10)),
	(3 , TIMEFROMPARTS(9,30,0,0,0) , datefromparts(2021,5,9)),
	(4 , TIMEFROMPARTS(21,30,0,0,0) , datefromparts(2021,4,2));

GO
INSERT INTO quiz(quizID , uploadTime , uploadDate)
VALUES
	(1 , TIMEFROMPARTS(8,30,0,0,0) , datefromparts(2021,6,11)),
	(2 , TIMEFROMPARTS(9,30,0,0,0) , datefromparts(2021,2,10)),
	(3 , TIMEFROMPARTS(7,30,0,0,0) , datefromparts(2021,5,9)),
	(4 , TIMEFROMPARTS(6,30,0,0,0) , datefromparts(2021,4,2));

GO
INSERT INTO hw(hwID , deadLine , uploadTime , uploadDate)
VALUES
	(1 , TIMEFROMPARTS(9,0,0,0,0) , TIMEFROMPARTS(8,30,0,0,0) , datefromparts(2021,6,11)),
	(2 , TIMEFROMPARTS(10,30,0,0,0) , TIMEFROMPARTS(9,30,0,0,0) , datefromparts(2021,2,10)),
	(3 , TIMEFROMPARTS(7,30,0,0,0) , TIMEFROMPARTS(7,29,0,0,0) , datefromparts(2021,5,9)),
	(4 , TIMEFROMPARTS(8,30,0,0,0) , TIMEFROMPARTS(6,30,0,0,0) , datefromparts(2021,4,2));

GO
INSERT INTO ta(taID , firstName , lastName , email, addID)
VALUES
	(971111111 , 'fName1' , 'lName1' , 'email1@gmail.com', 1),
	(972222222 , 'fName2' , 'lName2' , 'email2@gmail.com', 2),
	(973333333 , 'fName3' , 'lName3' , 'email3@gmail.com', 3),
	(974444444 , 'fName4' , 'lName4' , 'email4@gmail.com', 4);

GO
INSERT INTO uploadedNotes(nID , taID)
VALUES
	(1 , 971111111),
	(2 , 972222222),
	(3 , 973333333),
	(4 , 974444444);

GO
INSERT INTO uploadedHWs(hwID , taID)
VALUES
	(1 , 971111111),
	(2 , 972222222),
	(3 , 973333333),
	(4 , 974444444);

GO
INSERT INTO uploadedQuizes(qID , taID)
VALUES
	(1 , 971111111),
	(2 , 972222222),
	(3 , 973333333),
	(4 , 974444444);

GO
INSERT INTO class(classID , classSessionFile , professorID , className , classDate1, classDate2 , classStartTime, classFinishTime, classStart)
VALUES
	(1 , 1 , 201111111 , 'Clsss1' , 1 , 3 , TIMEFROMPARTS(8,30,0,0,0), TIMEFROMPARTS(10,30,0,0,0), datefromparts(2022 , 7 , 1)),
	(2 , 2 , 202222222 , 'Clsss2' , 2 , 4 , TIMEFROMPARTS(9,30,0,0,0), TIMEFROMPARTS(11,30,0,0,0), datefromparts(2022 , 7 , 1)),
	(3 , 3 , 203333333 , 'Clsss3' , 1 , 3 , TIMEFROMPARTS(10,30,0,0,0), TIMEFROMPARTS(12,30,0,0,0), datefromparts(2022 , 7 , 1)),
	(4 , 4 , 204444444 , 'Clsss4' , 2 , 4 , TIMEFROMPARTS(11,30,0,0,0), TIMEFROMPARTS(13,30,0,0,0), datefromparts(2022 , 7 , 1));
GO
INSERT INTO sessionTable(sessionID , classID , sessionFileID , sessionDate)
VALUES
	(1 , 1 , 1 , datefromparts(2022 , 7 , 1)),
	(2 , 2 , 2 , datefromparts(2022 , 7 , 2)),
	(3 , 3 , 3 , datefromparts(2022 , 7 , 3)),
	(4 , 4 , 4 , datefromparts(2022 , 7 , 4));

GO
INSERT INTO attendanceList(sessionID , studentID , isPresent)
VALUES
	(1 , 981111111 , 1),
	(2 , 982222222 , 0),
	(3 , 983333333 , 1),
	(4 , 984444444 , 0);

GO
INSERT INTO studentParticipants(studentID , classID)
VALUES
	(981111111 , 1),
	(982222222 , 2),
	(983333333 , 3),
	(984444444 , 4);

GO
INSERT INTO TAparticipants(taID , classID)
VALUES
	(971111111 , 1),
	(972222222 , 2),
	(973333333 , 3),
	(974444444 , 4);

INSERT INTO ansHW(ansID , studentID , hwID , grade)
VALUES
	(9811111112 , 981111111 , 1 , 20),
	(9822222223 , 982222222 , 2 , 18),
	(9833333334 , 983333333 , 3 , 19),
	(9844444445 , 984444444 , 4 , 16);


--ALTER

ALTER TABLE student
ADD SSN bigint;

SELECT * FROM student;

SELECT * FROM quiz;

ALTER TABLE quiz
ADD quizTime time;


--UPDATE
SELECT * FROM student;

UPDATE student
SET email = 's1@gmail.com'
WHERE student.studentID = 981111111;

SELECT * FROM professor;

UPDATE professor
SET firstName = 'Dr fName1'
WHERE professor.professorID = 201111111;

--DELETE

SELECT * FROM TAparticipants;
DELETE FROM TAparticipants
WHERE classID = 1;

SELECT * FROM student;

DELETE FROM class
WHERE classID = 1;


--CONSTRAINT
ALTER TABLE class
ADD CONSTRAINT classTimes CHECK (classStartTime < classFinishTime);

ALTER TABLE student
ADD CONSTRAINT sIDLength CHECK ( LENGTH(studentID) = 8 );

ALTER TABLE class
DROP CONSTRAINT classTimes;

ALTER TABLE student
DROP CONSTRAINT sIDLength;


--VIEW

CREATE VIEW [allTAsOfClass]
AS
SELECT t.taID, t.firstName, t.lastName
FROM ta AS t
JOIN TAparticipants AS p ON p.taID = t.taID
WHERE p.classID = 1;

SELECT * FROM [allTAsOfClass];

CREATE VIEW [AGrades]
AS
SELECT a.studentID, AVG(a.grade) AS totalGrade
FROM ansHW AS a
GROUP BY a.studentID
ORDER BY AVG(a.grade) DESC
HAVING AVG(a.grade) > 17;

SELECT * FROM [AGrades];

--TRIGGER

GO
CREATE TRIGGER T1
ON student
AFTER INSERT
BEGIN
 INSERT INTO attendanceList
 VALUES( 0, 1, 0) 
END


