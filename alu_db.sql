#1.
CREATE TABLE Classroom (
	classroom_id INT PRIMARY KEY,
	room_number VARCHAR(10) NOT NULL,
	building VARCHAR(50) NOT NULL,
	capacity INT
);

INSERT INTO Classroom (classroom_id, room_number, building, capacity) VALUES
(1, '101', 'Main Hall',      30),
(2, '102', 'Main Hall',      25),
(3, '201', 'Science Block',  40),
(4, '202', 'Science Block',  35),
(5, '301', 'Arts Building',  20),
(6, '302', 'Arts Building',  50),
(7, '110', 'Main Hall',      45);

SELECT *
FROM Classroom
WHERE building = 'Main Hall';

SELECT *
FROM Classroom
WHERE capacity > 30;

UPDATE Classroom
SET capacity =60,
	room_number = '303'
WHERE classroom_id = 6;

SELECT *
FROM Classroom
WHERE classroom_id = 6;

DELETE FROM Classroom
WHERE classroom_id = 5;

SELECT *
FROM Classroom;

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
WHERE faculty_id = 106;
# Create Extra_Curricular_Activities table - Calvin
CREATE TABLE Extra_Curricular_Activities (
	activity_id INT PRIMARY KEY,
	activity_name VARCHAR(100),
	category VARCHAR(50),
	faculty_advisor_id INT,
	FOREIGN KEY (faculty_advisor_id) REFERENCES Faculty(faculty_id)
);
