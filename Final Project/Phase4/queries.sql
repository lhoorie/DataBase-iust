--1
GO
CREATE PROCEDURE allStudentsOfClass @cID int
AS
SELECT *
FROM student AS s
JOIN studentParticipants AS p ON p.studentID = s.studentID
WHERE p.classID = @cID;

EXEC allStudentsOfClass @cID = 1;

--2
GO
CREATE PROCEDURE allClassesOfStudent @sID int
AS
SELECT *
FROM class AS c
JOIN studentParticipants AS p ON p.classID = c.classID
WHERE p.studentID = @sID;

EXEC allClassesOfStudent @sID = 981111111;

--3
GO
CREATE PROCEDURE allTAsOfClas @cID int
AS
SELECT t.taID, t.firstName, t.lastName
FROM ta AS t
JOIN TAparticipants AS p ON p.taID = t.taID
WHERE p.classID = @cID;

EXEC allTAsOfClas @cID = 1;

--4
GO
CREATE PROCEDURE allClassesOfProfessor @pID int
AS
SELECT c.className
FROM professor AS p
JOIN class AS c ON c.professorID = p.professorID
WHERE p.professorID = @pID;

EXEC allClassesOfProfessor @pID = 201111111;

--5
CREATE PROCEDURE allHwOfClass @cID int
AS
SELECT u.hwID
FROM class AS c
JOIN TAparticipants AS p ON p.classID = c.classID
JOIN uploadedHWs AS u ON u.hwID = p.taID
WHERE c.classID = @cID;

EXEC allHwOfClass @cID = 1;

--6
CREATE PROCEDURE allAnswersOfHW @hwID int
AS
SELECT *
FROM ansHW AS a
WHERE a.hwID = @hwID;

EXEC allAnswersOfHW @hwID = 1;

--7
CREATE PROCEDURE TotalGrades
AS
SELECT a.studentID, AVG(grade) AS totalGrade
FROM ansHW AS a
GROUP BY a.studentID

EXEC TotalGrades;

--8
SELECT *
FROM attendanceList;

--9
SELECT *
FROM professor;

--10
SELECT *
FROM class;

--11
SELECT *
FROM class AS c
JOIN TAparticipants AS p ON p.classID = c.classID
JOIN ta AS t ON t.taID = p.taID
JOIN uploadedNotes AS u ON u.taID = t.taID
JOIN note AS n ON n.noteID = u.nID;

--12
SELECT *
FROM class AS c
JOIN TAparticipants AS p ON p.classID = c.classID
JOIN ta AS t ON t.taID = p.taID
JOIN uploadedQuizes AS u ON u.taID = t.taID
JOIN quiz AS q ON q.quizID = u.qID;

--13
SELECT *
FROM class AS c
WHERE MONTH(getdate()) - MONTH(c.classStart) < 5;

--14
SELECT *
FROM class AS c
WHERE MONTH(getdate()) - MONTH(c.classStart) > 4;

--15
CREATE PROCEDURE AGrades
AS
SELECT a.studentID, AVG(a.grade) AS totalGrade
FROM ansHW AS a
GROUP BY a.studentID
ORDER BY AVG(a.grade) DESC
HAVING AVG(a.grade) > 17;

EXEC TotalGrades;

--16
CREATE PROCEDURE SortGrades1
AS
SELECT a.studentID, AVG(a.grade) AS totalGrade
FROM ansHW AS a
GROUP BY a.studentID
ORDER BY AVG(a.grade) DESC

EXEC SortGrades1;

--17
CREATE PROCEDURE SortGrades2
AS
SELECT a.studentID, AVG(a.grade) AS totalGrade
FROM ansHW AS a
JOIN student AS s ON a.studentID = s.studentID
GROUP BY s.studentID
ORDER BY s.lastName DESC

EXEC SortGrades2;

