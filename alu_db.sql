-- 1. Creating the Table -- Elyse
CREATE TABLE Classroom (
	classroom_id INT PRIMARY KEY,
	room_number VARCHAR(10) NOT NULL,
	building VARCHAR(50) NOT NULL,
	capacity INT
);
-- 2. Inserting 5-7 Records -- Elyse

INSERT INTO Classroom (classroom_id, room_number, building, capacity) VALUES
(1, '101', 'Main Hall',      30),
(2, '102', 'Main Hall',      25),
(3, '201', 'Science Block',  40),
(4, '202', 'Science Block',  35),
(5, '301', 'Arts Building',  20),
(6, '302', 'Arts Building',  50),
(7, '110', 'Main Hall',      45);

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
FROM Classroom;
