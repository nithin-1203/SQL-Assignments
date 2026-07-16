-- Instructions:
-- 1. Create a database named UniversityDB.
-- 2. Design three tables with proper relationships:

-- Students (StudentID, Name, Age, DepartmentID)
-- Departments (DepartmentID, DepartmentName)
-- Courses (CourseID, CourseName, StudentID)

create database UniversityDB;
use UniversityDB;
create table Students(StudentID int  primary key , Name char(20) not null  , Age int , DepartmentID int ,
						foreign key (DepartmentID) references Departments(DepartmentID));
create table Departments (DepartmentID int primary key , DepartmentName char(30)not null);
create table Courses (CourseID int primary key , CourseName char(20) not null , StudentID int , foreign key (StudentID) REFERENCES Students(StudentID));

-- 3. Establish the relationships:
-- a. A student belongs to one department (Foreign Key: DepartmentID in Students).
-- b. A student can enroll in multiple courses (Foreign Key: StudentID in Courses).
-- c. A department can have multiple students.

-- 4. Insert at least 5 records in each table.

INSERT INTO Departments
VALUES
(1,'CSE'),
(2,'Electronics'),
(3,'Mechanical'),
(4,'Civil'),
(5,'AIML');

INSERT INTO Students
VALUES
(101,'Alice Johnson',20,1),
(102,'Bob Smith',21,1),
(103,'Charlie Brown',22,2),
(104,'David Lee',20,5),
(105,'Emma Davis',21,3);

INSERT INTO Courses
VALUES
(201,'AI',101),
(202,'Database Systems',101),
(203,'Data Structures',102),
(204,'Data Analytics',104),
(205,'Machine Learning',104),
(206,'Operating Systems',105);

-- a. Retrieve all student details along with their department names.
-- b. Find the names of all students who are enrolled in 'Artificial Intelligence'.
-- c. Count how many students are in each department.
SELECT S.StudentID, S.Name, S.Age, S.DepartmentID, d.DepartmentName FROM STUDENTS as s join DEPARTMENTS as d on s.departmentID = d.departmentID;

SELECT  S.Name, c.Coursename  FROM STUDENTS as s join courses as c on s.studentID = c.studentID where coursename = 'AI';

select d.departmentname , count(*) as dept_count from students as s  join departments as d on s.departmentid = d.departmentid group by departmentname ; 

-- d. List the courses taken by 'Alice Johnson'. (assuming Alice Johnson is a student)
-- e. Find students who are enrolled in more than one course.
-- f. Get the average age of students in each department.

SELECT c.CourseName
FROM Students AS s
JOIN Courses AS c
ON s.StudentID = c.StudentID
WHERE s.Name = 'Alice Johnson';

SELECT s.StudentID,
       s.Name,
       COUNT(c.CourseID) AS TotalCourses
FROM Students AS s
JOIN Courses AS c
ON s.StudentID = c.StudentID
GROUP BY s.StudentID, s.Name
HAVING COUNT(c.CourseID) > 1;

SELECT d.DepartmentName,
       AVG(s.Age) AS AverageAge
FROM Students AS s
JOIN Departments AS d
ON s.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;


-- g. Find the department with the most students.
-- h. List all students who are NOT enrolled in any course.
-- i. Retrieve students along with the total number of courses they are enrolled in.
-- j. Find students who belong to 'Computer Science' and are taking a course with 'Data' in its name.

SELECT d.DepartmentName,
       COUNT(s.StudentID) AS TotalStudents
FROM Departments AS d
JOIN Students AS s
ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY TotalStudents DESC
LIMIT 1;

SELECT s.StudentID,
       s.Name
FROM Students AS s
LEFT JOIN Courses AS c
ON s.StudentID = c.StudentID
WHERE c.StudentID IS NULL;

SELECT s.StudentID,
       s.Name,
       COUNT(c.CourseID) AS TotalCourses
FROM Students AS s
LEFT JOIN Courses AS c
ON s.StudentID = c.StudentID

SELECT s.Name,
       c.CourseName
FROM Students AS s
JOIN Departments AS d
ON s.DepartmentID = d.DepartmentID
JOIN Courses AS c
ON s.StudentID = c.StudentID
WHERE d.DepartmentName = 'CSE'
AND c.CourseName LIKE '%Data%';
GROUP BY s.StudentID, s.Name;
