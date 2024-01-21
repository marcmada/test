-- 1.
CREATE DATABASE Universitate
COLLATE SQL_Romanian_CP1250_CS_AS;

USE Universitate;

--/*
drop database Universitate;
drop table Note;
drop table Student;
drop table Orase;
drop table Grupa;
drop table Materie; 
*/

-- 2.
-- Orase: id, denumire
CREATE TABLE Orase (
	Id int IDENTITY(1,1) Primary Key,
	Denumire nvarchar (30) NOT NULL
);

-- Grupa: id, denumire
CREATE TABLE Grupa (
	Id int IDENTITY(1,1) Primary Key,
	Denumire nvarchar (30) NOT NULL
);

-- Student: id, grupa, oras, nume, prenume
CREATE TABLE Student (
	Id int IDENTITY(1,1) Primary Key,
	Id_Grupa int NOT NULL,
	Id_Oras int NOT NULL,
	Nume nvarchar (30) NOT NULL,
	Prenume nvarchar (30) NOT NULL
);

-- Materie: id, nume
CREATE TABLE Materie (
	Id int IDENTITY(1,1) Primary Key,
	Nume nvarchar (30) NOT NULL
);

-- Note: id, student, materie, nota
CREATE TABLE Note (
	Id int IDENTITY(1,1) Primary Key,
	Id_Student int NOT NULL,
	Id_Materie int NOT NULL,
	Nota real NOT NULL
);

-- 3.
-- Student
ALTER TABLE Student
ADD CONSTRAINT Id_Grupa_in_Student_FK
FOREIGN KEY (Id_Grupa)
REFERENCES Grupa(Id);

ALTER TABLE Student
ADD CONSTRAINT Id_Oras_in_Student_FK
FOREIGN KEY (Id_Oras)
REFERENCES Orase(Id);

-- Note
ALTER TABLE Note
ADD CONSTRAINT Id_Student_in_Note_FK
FOREIGN KEY (Id_Student)
REFERENCES Student(Id);

ALTER TABLE Note
ADD CONSTRAINT Id_Materie_in_Note_FK
FOREIGN KEY (Id_Materie)
REFERENCES Materie(Id);

-- 4.
-- Orase
INSERT INTO Orase
VALUES (N'Ploiești');
INSERT INTO Orase
VALUES (N'Pitești');
INSERT INTO Orase
VALUES (N'Constanța');
INSERT INTO Orase
VALUES (N'București');
INSERT INTO Orase
VALUES (N'Călărași');
INSERT INTO Orase
VALUES (N'Iași');
INSERT INTO Orase
VALUES (N'Slobozia');
INSERT INTO Orase
VALUES (N'Sibiu');
INSERT INTO Orase
VALUES (N'Cluj-Napoca');
INSERT INTO Orase
VALUES (N'Brașov');
INSERT INTO Orase
VALUES (N'Fetești');
INSERT INTO Orase
VALUES (N'Satu-Mare');
INSERT INTO Orase
VALUES (N'Oradea');
INSERT INTO Orase
VALUES (N'Cernavodă');

-- Grupa
INSERT INTO Grupa
VALUES ('A');
INSERT INTO Grupa
VALUES ('B');
INSERT INTO Grupa
VALUES ('C');
INSERT INTO Grupa
VALUES ('D');

-- Materie
INSERT INTO Materie
VALUES (N'Geometrie');
INSERT INTO Materie
VALUES (N'Algebră');
INSERT INTO Materie
VALUES (N'Statistică');
INSERT INTO Materie
VALUES (N'Trigonometrie');
INSERT INTO Materie
VALUES (N'Muzică');
INSERT INTO Materie
VALUES (N'Desen');
INSERT INTO Materie
VALUES (N'Sport');
INSERT INTO Materie
VALUES (N'Filozofie');
INSERT INTO Materie
VALUES (N'Literatură');
INSERT INTO Materie
VALUES (N'Engleză');
INSERT INTO Materie
VALUES (N'Fizică');
INSERT INTO Materie
VALUES (N'Franceză');
INSERT INTO Materie
VALUES (N'Chimie');

-- Student
-- Grupa A
INSERT INTO Student
VALUES (1, 1, N'Popescu', N'Mihai');
INSERT INTO Student
VALUES (1, 4, N'Ionescu', N'Andrei');
INSERT INTO Student
VALUES (1, 3, N'Ionescu', N'Andreea');
INSERT INTO Student
VALUES (1, 5, N'Dinu', N'Nicolae');

-- Grupa B
INSERT INTO Student
VALUES (2, 14, N'Constantin', N'Ionuț');
INSERT INTO Student
VALUES (2, 6, N'Simion', N'Mihai');
INSERT INTO Student
VALUES (2, 14, N'Constantinescu', N'Ana-Maria');
INSERT INTO Student
VALUES (2, 6, N'Amăriuței', N'Eugen');
INSERT INTO Student
VALUES (2, 8, N'Știrbei', N'Alexandru');

-- Grupa C
INSERT INTO Student
VALUES (3, 10, N'Dumitru', N'Angela');
INSERT INTO Student
VALUES (3, 13, N'Dumitrache', N'Ion');
INSERT INTO Student
VALUES (3, 13, N'Șerban', N'Maria-Magdalena');
INSERT INTO Student
VALUES (3, 9, N'Chelaru', N'Violeta');
INSERT INTO Student
VALUES (3, 9, N'Sandu', N'Daniel');

-- Grupa D
INSERT INTO Student
VALUES (4, 12, N'Marinache', N'Alin');
INSERT INTO Student
VALUES (4, 12, N'Panait', N'Vasile');
INSERT INTO Student
VALUES (4, 11, N'Popa', N'Mirela');
INSERT INTO Student
VALUES (4, 11, N'Dascălu', N'Daniel Ștefan');
INSERT INTO Student
VALUES (4, 11, N'Georgescu', N'Marian');
INSERT INTO Student
VALUES (4, 1, N'Dumitrașcu', N'Marius');
INSERT INTO Student
VALUES (4, 4, N'Dinu', N'Ionela');

-- Note
-- Grupa A
INSERT INTO Note
VALUES (1, 13, 7);
INSERT INTO Note
VALUES (1, 11, 4);
INSERT INTO Note
VALUES (1, 12, 7);
INSERT INTO Note
VALUES (1, 11, 6);

INSERT INTO Note
VALUES (2, 2, 5);
INSERT INTO Note
VALUES (2, 3, 9);
INSERT INTO Note
VALUES (2, 5, 6);
INSERT INTO Note
VALUES (2, 11, 9);
INSERT INTO Note
VALUES (2, 13, 10);
INSERT INTO Note
VALUES (2, 7, 8);

INSERT INTO Note
VALUES (3, 7, 1);
INSERT INTO Note
VALUES (3, 9, 2);
INSERT INTO Note
VALUES (3, 12, 9);
INSERT INTO Note
VALUES (3, 7, 5);
INSERT INTO Note
VALUES (3, 9, 4);
INSERT INTO Note
VALUES (3, 9, 7);

INSERT INTO Note
VALUES (4, 13, 8);
INSERT INTO Note
VALUES (4, 2, 9);
INSERT INTO Note
VALUES (4, 3, 10);

-- Grupa B
INSERT INTO Note
VALUES (5, 2, 10);
INSERT INTO Note
VALUES (5, 7, 10);
INSERT INTO Note
VALUES (5, 11, 8);

INSERT INTO Note
VALUES (6, 11, 8);
INSERT INTO Note
VALUES (6, 2, 8);
INSERT INTO Note
VALUES (6, 7, 3);
INSERT INTO Note
VALUES (6, 7, 3);
INSERT INTO Note
VALUES (6, 7, 1);
INSERT INTO Note
VALUES (6, 7, 1);

INSERT INTO Note
VALUES (7, 7, 5);
INSERT INTO Note
VALUES (7, 11, 8);
INSERT INTO Note
VALUES (7, 2, 2);
INSERT INTO Note
VALUES (7, 2, 5);

INSERT INTO Note
VALUES (8, 2, 6);
INSERT INTO Note
VALUES (8, 7, 10);
INSERT INTO Note
VALUES (8, 12, 7);

INSERT INTO Note
VALUES (9, 13, 9);
INSERT INTO Note
VALUES (9, 11, 2);
INSERT INTO Note
VALUES (9, 7, 1);
INSERT INTO Note
VALUES (9, 11, 2);
INSERT INTO Note
VALUES (9, 11, 5);
INSERT INTO Note
VALUES (9, 7, 6);

-- Grupa C
INSERT INTO Note
VALUES (10, 6, 9);
INSERT INTO Note
VALUES (10, 8, 7);
INSERT INTO Note
VALUES (10, 10, 9);

INSERT INTO Note
VALUES (11, 6, 8);
INSERT INTO Note
VALUES (11, 3, 2);
INSERT INTO Note
VALUES (11, 8, 7);
INSERT INTO Note
VALUES (11, 3, 6);

INSERT INTO Note
VALUES (12, 10, 7);
INSERT INTO Note
VALUES (12, 8, 4);
INSERT INTO Note
VALUES (12, 6, 8);
INSERT INTO Note
VALUES (12, 8, 4);
INSERT INTO Note
VALUES (12, 8, 4);

INSERT INTO Note
VALUES (13, 12, 1);
INSERT INTO Note
VALUES (13, 6, 3);
INSERT INTO Note
VALUES (13, 10, 10);
INSERT INTO Note
VALUES (13, 12, 6);
INSERT INTO Note
VALUES (13, 6, 1);

INSERT INTO Note
VALUES (14, 6, 3);
INSERT INTO Note
VALUES (14, 8, 9);
INSERT INTO Note
VALUES (14, 12, 4);
INSERT INTO Note
VALUES (14, 6, 8);
INSERT INTO Note
VALUES (14, 12, 5);

-- Grupa D
INSERT INTO Note
VALUES (15, 6, 7);
INSERT INTO Note
VALUES (15, 11, 8);
INSERT INTO Note
VALUES (15, 10, 5);

INSERT INTO Note
VALUES (16, 7, 5);
INSERT INTO Note
VALUES (16, 6, 7);
INSERT INTO Note
VALUES (16, 3, 10);
INSERT INTO Note
VALUES (16, 11, 8);
INSERT INTO Note
VALUES (16, 9, 6);
INSERT INTO Note
VALUES (16, 8, 9);

INSERT INTO Note
VALUES (17, 10, 3);
INSERT INTO Note
VALUES (17, 8, 6);
INSERT INTO Note
VALUES (17, 6, 6);
INSERT INTO Note
VALUES (17, 10, 6);

INSERT INTO Note
VALUES (18, 11, 4);
INSERT INTO Note
VALUES (18, 12, 9);
INSERT INTO Note
VALUES (18, 3, 10);
INSERT INTO Note
VALUES (18, 11, 2);
INSERT INTO Note
VALUES (18, 11, 1);
INSERT INTO Note
VALUES (18, 11, 3);
INSERT INTO Note
VALUES (18, 11, 5);

INSERT INTO Note
VALUES (19, 12, 10);
INSERT INTO Note
VALUES (19, 10, 10);
INSERT INTO Note
VALUES (19, 11, 8);

INSERT INTO Note
VALUES (20, 7, 5);
INSERT INTO Note
VALUES (20, 2, 6);
INSERT INTO Note
VALUES (20, 13, 2);
INSERT INTO Note
VALUES (20, 13, 2);
INSERT INTO Note
VALUES (20, 13, 5);

INSERT INTO Note
VALUES (21, 5, 9);
INSERT INTO Note
VALUES (21, 9, 8);
INSERT INTO Note
VALUES (21, 7, 8);

-- 5.
SELECT Count(Id) AS "Orase din provincie"
FROM Orase
WHERE Denumire NOT LIKE (N'București');

-- 6.
SELECT Count(Id) AS "Materii cu examene"
FROM Materie
Where Id IN (
	SELECT Id_Materie
	FROM Note);

-- 7.
SELECT Nume, Prenume 
FROM Student
ORDER BY Nume, Prenume;

-- 8.
SELECT Nume, Prenume
FROM Student
WHERE Prenume LIKE '% %' or Prenume LIKE '%-%';

-- 9.
SELECT Nume, Prenume, Denumire Oras
FROM Student s
JOIN Orase o on o.Id = s.Id_Oras
WHERE Denumire NOT LIKE (N'București')
ORDER BY Denumire;

-- 10.
SELECT COUNT(Id) AS "Orase fara studenti inscrisi"
FROM Orase
WHERE Id NOT IN (
	SELECT Distinct(Id_Oras)
	FROM Student);

-- 11.
SELECT Denumire, COUNT(Id_Grupa) AS "Numar de studenti"
FROM Grupa g
JOIN Student s on s.Id_Grupa = g.Id
GROUP BY Denumire
HAVING COUNT(Id_Grupa) >= 5;

-- 12.
SELECT TOP 1 Denumire, COUNT(Id_Grupa) AS "Numar de studenti"
FROM Grupa g
JOIN Student s on s.Id_Grupa = g.Id
GROUP BY Denumire
HAVING COUNT(Id_Grupa) >= 5
ORDER BY COUNT(Id_Grupa) desc;

-- 13.
SELECT Nume
FROM Materie
WHERE Id NOT IN (
	SELECT DISTINCT(Id_Materie)
	FROM Note);

-- 14.
SELECT Nume + ' ' + Prenume AS Student
FROM Student
WHERE Id IN (
	SELECT Id_Student
	FROM Note
	GROUP BY Id_Student
    HAVING COUNT(DISTINCT(Id_Materie)) > 3);

-- 15.
WITH NoteOrdonate AS (
    SELECT Id_Student, Id_Materie, Nota,
        ROW_NUMBER() OVER (PARTITION BY Id_Student, Id_Materie ORDER BY Nota DESC) AS NotaOrdonata
    FROM Note
)
SELECT Id_Student, CONVERT(DECIMAL(10,2), AVG(Nota)) AS "Media generala"
FROM NoteOrdonate
WHERE NotaOrdonata = 1
GROUP BY Id_Student
ORDER BY Id_Student;

-- 16.

-- 17.
;WITH NoteOrdonate AS (
    SELECT Id_Student, Id_Materie, Nota,
			ROW_NUMBER() OVER (PARTITION BY Id_Student, Id_Materie ORDER BY Nota DESC) AS NotaOrdonata
	FROM Note
)

SELECT Id_Student, Subquery.[Media generala]
FROM (
	SELECT Id_Student, AVG(Nota) AS "Media generala"
	FROM NoteOrdonate
	WHERE NotaOrdonata = 1
	GROUP BY Id_Student ) AS Subquery
WHERE Subquery.[Media generala] >= 8.5
ORDER BY Subquery.[Media generala];

-- 18.
SELECT DISTINCT(s.Nume + ' ' + s.Prenume) AS Student
FROM Student s
JOIN Note n ON n.Id_Student = s.Id
JOIN Materie m on m.Id = n.Id_Materie
JOIN Student s2 ON s.Id = s2.Id
JOIN Note n2 ON n2.Id_Student = s2.Id
JOIN Materie m2 on m2.Id = n2.Id_Materie
WHERE m.Nume = 'Chimie' and m2.Nume = 'Chimie' and 
	n2.Id <> n.Id and n.Nota < 5 and n2.Nota >= 5;

-- 19.
SELECT TOP 1 Examinari.Examinari, Examinari.Id_Student, Examinari.Id_Materie
FROM (
	SELECT COUNT(Id_Student) AS "Examinari", Id_Student, Id_Materie
	FROM Note n
	JOIN Materie m ON m.Id = n.Id_Materie
	JOIN Student s ON s.Id = n.Id_Student
	GROUP BY Id_Student, Id_Materie) as Examinari
ORDER BY Examinari.Examinari desc;

-- 20.
SELECT COUNT(Id_Student) AS "Examinari", Id_Student, Id_Materie, s.Nume + ' ' + s.Prenume AS "Student"
FROM Note n
JOIN Materie m ON m.Id = n.Id_Materie
JOIN Student s ON s.Id = n.Id_Student
GROUP BY Id_Student, Id_Materie, s.Nume, s.Prenume
ORDER BY s.Nume, s.Prenume;

-- 21.
SELECT Id_Student, Id_Materie
FROM (
	SELECT Id_Student, Id_Materie, MAX(n.Nota) as "Cea mai mare nota"
	FROM Note n
	JOIN Materie m ON m.Id = n.Id_Materie
	JOIN Student s ON s.Id = n.Id_Student
	GROUP BY Id_Student, Id_Materie) AS Subquery
WHERE Subquery.[Cea mai mare nota] < 5;

-- 22.
INSERT INTO Grupa
VALUES ('E');

UPDATE s
SET Id_Grupa = 5
FROM Student s
JOIN (
    SELECT Id_Student, Id_Materie, MAX(n.Nota) as "Cea mai mare nota"
	FROM Note n
	JOIN Materie m ON m.Id = n.Id_Materie
	JOIN Student s ON s.Id = n.Id_Student
	GROUP BY Id_Student, Id_Materie) AS Subquery
ON s.Id = Subquery.Id_Student
WHERE Subquery.[Cea mai mare nota] < 5;

-- 23.
CREATE TABLE #NoteOrdonate (
    Id_Student INT,
    Id_Materie INT,
    Nota INT,
    NotaOrdonata REAL
);

INSERT INTO #NoteOrdonate (Id_Student, Id_Materie, Nota, NotaOrdonata)
SELECT Id_Student, Id_Materie, Nota,
    ROW_NUMBER() OVER (PARTITION BY Id_Student, Id_Materie ORDER BY Nota DESC) AS NotaOrdonata
FROM Note;

DELETE FROM Note
WHERE (Id_Student) IN (
    SELECT TOP 1 Id_Student
    FROM #NoteOrdonate
    WHERE NotaOrdonata = 1
    GROUP BY Id_Student
    ORDER BY AVG(Nota) ASC
);

DELETE FROM Student
WHERE (Id) IN (
    SELECT TOP 1 Id_Student
    FROM #NoteOrdonate
    WHERE NotaOrdonata = 1
    GROUP BY Id_Student
    ORDER BY AVG(Nota) ASC
);

DROP TABLE #NoteOrdonate;

-- 24.
SELECT Nume Familia, STRING_AGG(Prenume, ', ') WITHIN GROUP (ORDER BY Prenume) AS Frații
FROM Student
GROUP BY Nume
HAVING COUNT(Nume) > 1;