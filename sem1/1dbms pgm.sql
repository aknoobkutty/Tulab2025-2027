Create Schema 1pgm 
Use 1pgm
CREATE TABLE Students(
StudentID INT PRIMARY KEY, 
FirstName
VARCHAR(50) NOT NULL,
LastName VARCHAR(50)NOT NULL,
DateOfBirth DATE,
Email VARCHAR(100) UNIQUE
);
CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(100)NOT NULL,
CourseCode VARCHAR(10) UNIQUE NOT NULL,
Credits INT
);
 CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT NOT NULL,
CourseID INT NOT NULL,
EnrollmentDate DATE NOT NULL, 
Grade CHAR(1),
FOREIGN KEY(StudentID) REFERENCES
Students(StudentID), FOREIGN KEY (CourseID)
REFERENCES Courses(CourseID)
);
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email)
VALUES(1, 'Alice', 'Smith', '2003-05-15', 'alice.smith@example.com'),
(2, 'Bob', 'Johnson', '2002-11-22', 'bob.j@example.com'),
(3, 'Charlie', 'Brown', '2004-01-08', 'charlie.b@example.com'),
(4, 'Diana', 'Prince', '2003-09-30', 'diana.p@example.com'),
(5, 'Ethan', 'Hunt', '2002-07-12', 'ethan.h@example.com');

INSERT INTO Courses (CourseID, CourseName, CourseCode, Credits)
VALUES(101, 'Introduction to Computer Science', 'CS101', 3),
(102, 'Calculus I', 'MA101', 4),
(103, 'English Literature', 'ENGL201', 3),
(104, 'Database Management', 'DB301', 3),
(105, 'Linear Algebra', 'MA201', 4);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID,
EnrollmentDate, Grade) VALUES
(1001, 1, 101, '2024-09-01', 'A'),
(1002, 2, 102, '2024-09-01', 'B'),
(1003, 3, 101, '2024-09-05', 'C'),
(1004, 4, 103, '2024-09-01', 'A'),
(1005, 5, 104, '2024-09-10', 'B');

select* from students;
select* from courses;
select* from enrollments;
