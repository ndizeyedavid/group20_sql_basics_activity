CREATE TABLE Classroom (
	classroom_id INT PRIMARY KEY,
	room_number VARCHAR(10) NOT NULL,
	building VARCHAR(50) NOT NULL,
	capacity INT
);

INSERT INTO
    Classroom (
        classroom_id,
        room_number,
        building,
        capacity
    )
VALUES (1, '101', 'Main Hall', 30),
    (2, '102', 'Main Hall', 25),
    (3, '201', 'Science Block', 40),
    (4, '202', 'Science Block', 35),
    (5, '301', 'Arts Building', 20),
    (6, '302', 'Arts Building', 50),
    (7, '110', 'Main Hall', 45);

SELECT * FROM Classroom WHERE building = 'Main Hall';

SELECT * FROM Classroom WHERE capacity > 30;

UPDATE Classroom
SET
    capacity = 60,
    room_number = '303'
WHERE
    classroom_id = 6;

SELECT * FROM Classroom WHERE classroom_id = 6;

DELETE FROM Classroom WHERE classroom_id = 5;

SELECT * FROM Classroom;

# Create faculty_table - Kelvin Bruce
CREATE TABLE Faculty ( 
	faculty_id INT PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100),
	department VARCHAR(50)
);

# Insert sample records - Kelvin Bruce
INSERT INTO Faculty (faculty_id, name, email, department)
VALUES 
(101, 'Dr. Alice Johnson', 'alice.johnson@aluedu.com', 'Software Engineering'),
(102, 'Dr. Brian Smith', 'brian.smith@aluedu.com', 'International Business and Trade'),
(103, 'Dr. Catherine Brown', 'catherine.brown@aluedu.com', 'Entrepreneurial Leadership'),
(104, 'Dr. David Wilson', 'david.wilson@aluedu.com', 'Entrepreneurial Leadership'),
(105, 'Dr. Emily Davis', 'emily.davis@aluedu.com', 'Software Engineering'),
(106, 'Dr. Frank Miller', 'frank.miller@aluedu.com', 'International Business and Trade');

# Find all faculty members that belong to 'Software Engineering' department - Kelvin Bruce
SELECT *
FROM Faculty
WHERE department = 'Software Engineering';

# Update department - Kelvin Bruce
UPDATE Faculty
SET department = 'Software Engineering'
WHERE faculty_id = 103;

# Delete a record - Kelvin Bruce
DELETE FROM Faculty

# Create Students table - Juliana Ngoh
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    classroom_id INT,
    enrollment_date DATE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

# Insert sample records - Juliana Ngoh
INSERT INTO Students (student_id, name, email, classroom_id, enrollment_date)
  VALUES
    (1, 'Student One', 'student1@alu.edu', 1, '2026-01-10'),
    (2, 'Student Two', 'student2@alu.edu', 2, '2026-01-11'),
    (3, 'Student Three', 'student3@alu.edu', 3, '2026-01-12'),
    (4, 'Student Four', 'student4@alu.edu', 4, '2026-01-13'),
    (5, 'Student Five', 'student5@alu.edu', 6, '2026-01-14');

# Find students in classroom 1 - Juliana Ngoh
SELECT * FROM Students WHERE classroom_id = 1;

# Display all students - Juliana Ngoh
SELECT *
FROM Students;

# Update a student's email - Juliana Ngoh
UPDATE Students
SET email = 'student4_updated@alu.edu'
WHERE student_id = 4;

# Delete a student record - Juliana Ngoh
DELETE FROM Students
WHERE student_id = 5;

# Create Extra_Curricular_Activities table - Calvin
CREATE TABLE Extra_Curricular_Activities (
	activity_id INT PRIMARY KEY,
	activity_name VARCHAR(100),
	category VARCHAR(50),
	faculty_advisor_id INT,
	FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);

# Insert sample records - Calvin
INSERT INTO Extra_Curricular_Activities (activity_id, activity_name, category, faculty_advisor_id)
    VALUES
        (201, 'Robotics Club', 'Technology', 101),
        (202, 'Debate Society', 'Academic', 102),
        (203, 'Basketball Team', 'Sports', 103),
        (204, 'Drama Club', 'Arts', 104),
        (205, 'Entrepreneurship Society', 'Business', 105),
        (206, 'Coding Bootcamp', 'Technology', 101),
        (207, 'Chess Club', 'Academic', 102);

# Find activities that belong to the 'Technology' category - Calvin
SELECT * FROM Extra_Curricular_Activities
WHERE category = 'Technology';

# Update an activity by activity_id - Calvin
UPDATE Extra_Curricular_Activities
SET activity_name = 'Advanced Robotics Club'
WHERE activity_id = 201;

# Delete one specific activity - Calvin
DELETE FROM Extra_Curricular_Activities
WHERE activity_id = 207;


---

# Create courses table - David
CREATE TABLE Courses(
    course_id INT NOT NULL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    faculty_id INT NOT NULL,
    classroom_id INT NOT NULL,
    Foreign Key (faculty_id) REFERENCES Faculty(faculty_id),
    Foreign Key (classroom_id) REFERENCES Classroom(classroom_id)
);

# Inserting 6 sample records - David
INSERT INTO Courses
    VALUES
        (301, 'Intro to Software Engineering', 3, 101, 1),
        (303, 'Entrepreneurship', 3, 103, 3),
        (302, 'Javascript and its origin', 4, 102, 2),
        (304, 'Drama and Performance', 2, 104, 4),
        (305, 'Business Strategy', 3, 105, 7),
        (306, 'Advanced Coding', 4, 106, 6);

# Selecting records using joins - David
SELECT Courses.course_id, Courses.course_name, Courses.credits, Faculty.name, Classroom.building, Classroom.capacity
    FROM Courses
        INNER JOIN Faculty ON Courses.faculty_id = Faculty.faculty_id 
        INNER JOIN Classroom ON Courses.classroom_id = Classroom.classroom_id
