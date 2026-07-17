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
