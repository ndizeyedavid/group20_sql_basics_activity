CREATE DATABASE alu_db
    DEFAULT CHARACTER SET = 'utf8mb4';

USE alu_db;

-- 1. Creating the Table -- Elyse
CREATE TABLE Classroom (
	classroom_id INT PRIMARY KEY,
	room_number VARCHAR(10) NOT NULL,
	building VARCHAR(50) NOT NULL,
	capacity INT
);
-- 2. Inserting 5-7 Records -- Elyse

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

-- 3. Fetching classrooms using WHERE clause -- Elyse
-- a) Classrooms in a specific building -- Elyse
SELECT *
FROM Classroom
WHERE building = 'Main Hall';

-- b) Classrooms with capacity greater than 30 -- Elyse
SELECT *
FROM Classroom
WHERE capacity > 30;
-- Updating a classroom by classroom_id -- Elyse
UPDATE Classroom
SET capacity =60,
	room_number = '303'
WHERE classroom_id = 6;
-- Verifying the update -- Elyse
SELECT *
FROM Classroom
WHERE classroom_id = 6;
-- 5. Deleting one specific classroom -- Elyse
DELETE FROM Classroom
WHERE classroom_id = 5;
-- Verifying the deletion -- Elyse
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

# Selecting course records using joins to expand the classroom and faculty details - David
SELECT Courses.course_id, Courses.course_name, Courses.credits, Faculty.name, Classroom.building, Classroom.capacity
    FROM Courses
        INNER JOIN Faculty ON Courses.faculty_id = Faculty.faculty_id 
        INNER JOIN Classroom ON Courses.classroom_id = Classroom.classroom_id;

# Selecting all courses taught by "Dr Emily Davis" - David
SELECT Courses.course_id, Courses.course_name, Courses.credits, Faculty.name, Classroom.building, Classroom.capacity
    FROM Courses
        INNER JOIN Faculty ON Courses.faculty_id = Faculty.faculty_id 
        INNER JOIN Classroom ON Courses.classroom_id = Classroom.classroom_id
            WHERE Faculty.faculty_id = 105

# Updating a Course name and credits - David
UPDATE Courses SET 
    course_name = "Game development using Unreal Engine 5",
    credits = 30
        WHERE course_id = 304

# Delete a cource - David
DELETE FROM Courses
    WHERE course_id = 305
---

# 6. Normalization, Joins & Aggregation - Jimmy

# Normalization paragraph
# This schema satisfies 1NF, 2NF, and 3NF. 1NF: every column holds a single
# atomic value, with no repeating groups (a student's courses are not stored
# as a list inside Students). 2NF: every table has a single-column primary
# key, so no non-key attribute can partially depend on only part of a key.
# 3NF: no transitive dependencies exist - e.g. a Faculty member's department
# lives only in Faculty and is reached through faculty_id, it is not
# duplicated inside Courses. The many-to-many relationships (students to
# courses, students to activities) are resolved with junction tables
# (Student_Courses, Student_Activities) instead of repeating course or
# activity lists inside Students, which is what eliminates the
# many-to-many duplication problem.

# Junction tables (needed for the joins below to run)
CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Student_Activities (
    student_id INT,
    activity_id INT,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

INSERT INTO Student_Courses (student_id, course_id) VALUES
(1, 301), (2, 302), (3, 303), (4, 304), (1, 306);

INSERT INTO Student_Activities (student_id, activity_id) VALUES
(1, 201), (2, 202), (3, 203), (4, 204), (2, 205);

# Join Query 1: student enrollment sentence
SELECT CONCAT('Student ', s.name, ' is enrolled in Course ', c.course_name,
    ', taught by Faculty ', f.name, ', in Classroom ', cl.room_number, '.') AS enrollment_sentence
FROM Students s
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

# Join Query 2: student activity sentence
SELECT CONCAT('Student ', s.name, ' participates in Activity ', a.activity_name,
    ', advised by Faculty ', f.name, '.') AS activity_sentence
FROM Students s
JOIN Student_Activities sa ON s.student_id = sa.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.faculty_advisor_id = f.faculty_id;

# Join Query 3: students, their home classroom, and their enrolled course
SELECT s.name AS student_name, cl.building, c.course_name
FROM Students s
JOIN Classroom cl ON s.classroom_id = cl.classroom_id
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id;

# Aggregate query: number of students per course
SELECT c.course_name, COUNT(sc.student_id) AS total_students
FROM Courses c
LEFT JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_name;
