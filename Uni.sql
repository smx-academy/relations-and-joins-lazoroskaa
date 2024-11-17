CREATE TABLE Students (
	StudentID INT PRIMARY KEY NOT NULL,
	FirstName VARCHAR (100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	BirthDate DATE NOT NULL,
	EnrollmentYear VARCHAR (4) NOT NULL,
	Department VARCHAR (100) NOT NULL
);

CREATE TABLE Professors (
	ProfessorID INT PRIMARY KEY NOT NULL,
	FirstName VARCHAR (100) NOT NULL,
	LastName VARCHAR (100) NOT NULL,
	Department VARCHAR (100) NOT NULL,
	HireDate DATE NOT NULL
);

CREATE TABLE Subjects(
	SubjectID INT PRIMARY KEY NOT NULL,
	SubjectName VARCHAR (100) NOT NULL,
	ProfessorID INT NOT NULL
);

INSERT INTO Students (StudentID, FirstName, LastName, BirthDate, EnrollmentYear,Department) VALUES
(1, 'Ana', 'Petrova', '2005-04-15', 2020, 'Informatika'),
(2, 'Luka', 'Dimovski', '2004-11-30', 2019, 'Fizika'),
(3, 'Emilija', 'Nikolovska', '2003-02-21', 2018, 'Umetnost'),
(4, 'Maksim', 'Iliev', '2005-07-10', 2020, 'Fizichka Kultura'),
(5, 'Mija', 'Jovanovska', '2006-01-19', 2021, 'Biologija'),
(6, 'Leon', 'Kirilov', '2005-03-05', 2020, 'Informatika'),
(7, 'Sofija', 'Popovska', '2004-12-12', 2019, 'Angliski'),
(8, 'Pavle', 'Trajanovski', '2003-05-28', 2018, 'Hemija'),
(9, 'Lara', 'Krause', '2006-10-22', 2021, 'Germanski'),
(10, 'Timotej', 'Ristovski', '2005-06-30', 2020, 'Angliski'),
(11, 'Lina', 'Veljanovska', '2004-01-15', 2019, 'Psihologija'),
(12, 'Boris', 'Mitev', '2003-08-02', 2018, 'Muzika'),
(13, 'Filip', 'Dimovski', '2005-09-25', 2020, 'Angliski'),
(14, 'Marija', 'Ristovska', '2006-03-11', 2021, 'Informatika'),
(15, 'Nina', 'Stefanovska', '2004-07-18', 2019, 'Umetnost');


INSERT INTO Professors (ProfessorID, FirstName, LastName, Department, HireDate) VALUES
(1, 'Petar', 'Brajan', 'Matematika', '2015-08-12'),
(2, 'Laura', 'Hofman', 'Informatika', '2017-05-23'),
(3, 'Marko', 'Kolarov', 'Fizika', '2018-09-01'),
(4, 'Ana', 'Vagner', 'Hemija', '2020-02-15'),
(5, 'Julija', 'Shmit', 'Biologija', '2019-01-10'),
(6, 'Toma', 'Shvarc', 'Matematika', '2016-04-22'),
(7, 'Silvija', 'Majer', 'Geografija', '2021-03-14'),
(8, 'Martin', 'Fisher', 'Informatika', '2015-11-02'),
(9, 'Klara', 'Lehman', 'Umetnost', '2020-07-07'),
(10, 'Oliver', 'Jager', 'Fizichka Kultura', '2018-01-30'),
(11, 'Lisa', 'Volf', 'Psihologija', '2017-05-05'),
(12, 'David', 'Lang', 'Muzika', '2019-09-12'),
(13, 'Tina', 'Has', 'Germanski', '2021-02-19'),
(14, 'Feliks', 'Koch', 'Angliski', '2020-10-11'),
(15, 'Sofija', 'Hartman', 'Hemija', '2016-08-22');


INSERT INTO Subjects (SubjectID, SubjectName, ProfessorID) VALUES
(1, 'Kalkulus I', 1),
(2, 'Strukturi na podatoci', 2),
(3, 'Termodinamika', 3),
(4, 'Neorganska Hemija', 4),
(5, 'Genetika', 5),
(6, 'Linijarna Algebra', 1),
(7, 'Informaciski Sistemi', 7),
(8, 'Web Razvoj', 2),
(9, 'Analitichka Hemija', 4),
(10, 'Ekologija', 5),
(11, 'Fizichka Geografija', 7),
(12, 'Osnovi na Umetnost', 9),
(13, 'Fitnes i Zdravje', 10),
(14, 'Kognitivna Psihologija', 11),
(15, 'Istorija na Muzika', 12);
-------------------------------------------------------------------------------

SELECT * FROM Students WHERE EnrollmentYear>=2020;

---------------------------------------------------------------------------------

SELECT 
    s.SubjectName,
    CONCAT(p.FirstName, ' ', p.LastName) AS ProfessorName
FROM 
    Subjects s
INNER JOIN 
    Professors p ON s.ProfessorID = p.ProfessorID;

--------------------------------------------------------------------------------

SELECT  
    st.EnrollmentYear,
    CONCAT(st.FirstName, ' ', st.LastName) AS StudentName
FROM
    Students st
INNER JOIN 
    Professors p ON st.Department = p.Department 
WHERE 
    p.Department = 'Informatika'
ORDER BY
	EnrollmentYear ASC;

	