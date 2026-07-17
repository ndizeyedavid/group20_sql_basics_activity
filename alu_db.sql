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