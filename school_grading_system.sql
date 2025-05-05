USE school_grading_system;

CREATE TABLE Students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Subjects(
subject_id INT AUTO_INCREMENT PRIMARY KEY,
subject_name VARCHAR(100) NOT NULL,
teacher_name VARCHAR(100) NOT NULL
);

CREATE TABLE Grades(
grade_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
subject_id INT,
grade VARCHAR(5),
grade_date DATE,
FOREIGN KEY(student_id) REFERENCES Students(student_id),
FOREIGN KEY(subject_id) REFERENCES Subjects(subject_id)
);

INSERT INTO Students(first_name, last_name, email)
VALUES
('Alice', 'Njeri', 'alicenjeri@gmail.com'),
('Brian', 'Otieno', 'brianotieno@gmail.com'),
('Cynthia', 'Mwende', 'cynthiamwende@gmail.com');

INSERT INTO Subjects(subject_name, teacher_name)
VALUES
('Mathematics', 'Mr.Kariuki'),
('English', 'Ms.Wambui'),
('Science', 'Mr.Ochieng');

INSERT INTO Grades(student_id, subject_id, grade, grade_date)
VALUES
(1, 1, 'A', '2024-05-01'),
(1, 2, 'B', '2024-05-01'),
(2, 1, 'C', '2024-05-01'),
(2, 3, 'B+', '2024-05-01'),
(3, 2, 'A-', '2024-05-01'),
(3, 3, 'B', '2024-05-01');

SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Grades;

SELECT s.first_name, s.last_name, su.subject_name, g.grade, g.grade_date
FROM Grades g
JOIN Students s ON g.student_id=s.student_id
JOIN Subjects su ON g.subject_id=su.subject_id;

SELECT su.subject_name, g.grade
FROM Grades g
JOIN Students s ON g.student_id=s.student_id
JOIN Subjects su ON g.subject_id=su.subject_id
WHERE s.first_name='Alice' AND s.last_name='Njeri';

SELECT s.first_name, s.last_name, COUNT(grade_id) AS subject_count
FROM Students s
LEFT JOIN Grades g ON s.student_id=g.student_id
GROUP BY s.student_id;

