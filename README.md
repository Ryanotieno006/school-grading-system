# school-grading-system
A school grading system project with a database backend.
# School Grading System Database

A simple MySQL database system for managing students, subjects, and grades in a school environment.

## Database Schema

### Tables

1. **Students**
   - `student_id` (INT, Primary Key, Auto Increment)
   - `first_name` (VARCHAR(50), Not Null)
   - `last_name` (VARCHAR(50), Not Null)
   - `email` (VARCHAR(100), Unique, Not Null)

2. **Subjects**
   - `subject_id` (INT, Primary Key, Auto Increment)
   - `subject_name` (VARCHAR(100), Not Null)
   - `teacher_name` (VARCHAR(100), Not Null)

3. **Grades**
   - `grade_id` (INT, Primary Key, Auto Increment)
   - `student_id` (INT, Foreign Key references Students)
   - `subject_id` (INT, Foreign Key references Subjects)
   - `grade` (VARCHAR(5))
   - `grade_date` (DATE)

## Setup

1. Create the database:
   ```sql
   CREATE DATABASE school_grading_system;
   USE school_grading_system;

Display all data from all tables:

sql
SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Grades;

Get grades with student and subject information:

sql
SELECT s.first_name, s.last_name, su.subject_name, g.grade, g.grade_date
FROM Grades g
JOIN Students s ON g.student_id=s.student_id
JOIN Subjects su ON g.subject_id=su.subject_id;

Get grades for a specific student:

sql
SELECT su.subject_name, g.grade
FROM Grades g
JOIN Students s ON g.student_id=s.student_id
JOIN Subjects su ON g.subject_id=su.subject_id
WHERE s.first_name='Alice' AND s.last_name='Njeri';

Count subjects taken by each student:

sql
SELECT s.first_name, s.last_name, COUNT(grade_id) AS subject_count
FROM Students s
LEFT JOIN Grades g ON s.student_id=g.student_id
GROUP BY s.student_id;

Sample Data
The database comes pre-populated with:

3 students

3 subjects (Mathematics, English, Science)

6 grade records



   
