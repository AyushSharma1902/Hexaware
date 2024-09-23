-- Task 1 Database Design
-- 1
create database if not exists SISDB;
use SISDB;

-- 3 ER diagram submitted through github link..
-- 2 and 4
CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  date_of_birth DATE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone_number VARCHAR(20)
);

CREATE TABLE Teacher (
  teacher_id INT PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50) NOT NULL,
  credits INT ,
  teacher_id INT ,
  CONSTRAINT fk_teacher FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
CREATE TABLE Enrollments (
  enrollment_id INT PRIMARY KEY,
  student_id INT,
  course_id INT,
  enrollment_date DATE,
  CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
  CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  student_id INT,
  amount DECIMAL(10, 2),
  payment_date DATE,
  CONSTRAINT fk_student_payment FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
-- 5
insert into students values
(101,"Atharva","Sharma","2002-02-26","atharva@gmail.com",8828828788);
insert into students values
(102,"Abhishek","Jain","2002-04-11","abhishek@gmail.com",9028898788);
insert into students values
(103,"Ashwin","Tiwari","2002-03-09","ashwin@gmail.com",9928358788);
insert into students values
(104,"Keshav","Yadav","2001-01-13","keshav@gmail.com",8899928788);

insert into students values
(105, 'Rohan', 'Sharma', '2000-05-01', 'rohan.sharma@gmail.com', '1234567890'),
  (106, 'Aisha', 'Khan', '2001-06-15', 'aisha.khan@gmail.com', '9876543210'),
  (107, 'Karan', 'Jain', '1999-03-20', 'karan.jain@gmail.com', '5555555555'),
  (108, 'Nisha', 'Gupta', '2002-09-10', 'nisha.gupta@gmail.com', '6666666666'),
  (109, 'Siddharth', 'Singh', '2000-11-25', 'siddharth.singh@gmail.com', '7777777777'),
  (099, 'Rhea', 'Rao', '2001-04-05', 'rhea.rao@gmail.com', '8888888888');



INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
  (111, 'Rahul', 'Sharma', 'rahul.sharma@example.com'),
  (112, 'Priya', 'Jain', 'priya.jain@example.com'),
  (113, 'Rohit', 'Kumar', 'rohit.kumar@example.com'),
  (114, 'Nalini', 'Gupta', 'nalini.gupta@example.com'),
  (155, 'Saurabh', 'Singh', 'saurabh.singh@example.com'),
  (126, 'Swati', 'Mishra', 'swati.mishra@example.com'),
  (137, 'Vikram', 'Rao', 'vikram.rao@example.com'),
  (128, 'Ritu', 'Chandra', 'ritu.chandra@example.com'),
  (129, 'Ajay', 'Khanna', 'ajay.khanna@example.com'),
  (110, 'Sonia', 'Arora', 'sonia.arora@example.com');
  
INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
  (1, 'Data Structures', 3, 111),
  (2, 'Database Management', 4, 110),
  (3, 'Computer Networks', 3, 129),
  (4, 'Operating Systems', 4, 128),
  (5, 'Algorithms', 3, 137),
  (6, 'Web Development', 4, 126),
  (7, 'Cyber Security', 3, 155),
  (8, 'Artificial Intelligence', 4, 114),
  (9, 'Machine Learning', 3, 113),
  (10, 'Cloud Computing', 4, 112);
  
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
  (1001, 101, 1, '2022-08-01'),
  (1002, 102, 2, '2022-08-01'),
  (1003, 103, 3, '2022-08-05'),
  (1004, 104, 4, '2022-08-10'),
  (1005, 105, 5, '2022-08-15'),
  (1006, 106, 6, '2022-08-20'),
  (1007, 107, 7, '2023-09-01'),
  (1008, 108, 8, '2022-09-05'),
  (1009, 109, 9, '2023-09-10'),
  (1010, 099, 10, '2022-09-15');
  
  INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
  (211, 101, 1000.00, '2022-08-01'),
  (212, 102, 500.00, '2022-09-01'),
  (213, 103, 800.00, '2022-08-05'),
  (214, 104, 1200.00, '2022-08-10'),
  (215, 105, 900.00, '2022-08-15'),
  (216, 106, 1100.00, '2022-10-15'),
  (217, 107, 1500.00, '2022-08-20'),
  (218, 108, 600.00, '2022-10-01'),
  (219, 109, 700.00, '2022-10-05'),
  (220, 099, 1000.00, '2022-10-10');
  
  
  -- task2 Select, Where, Between, AND, LIKE
  
  -- 1
  INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (
  098, 'John', 
  'Doe', 
  '1995-08-15', 
  'john.doe@example.com', 
  '1234567890'
);

-- 2
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (1011,102,3,'2002-08-08'); 

-- 3
UPDATE Teacher
SET email = 'priya.jain2@example.com'
WHERE teacher_id = 112 ;


-- 4
DELETE FROM Enrollments
WHERE student_id = 102 AND course_id = 3; 

-- 5
UPDATE Courses
SET teacher_id = 111 WHERE course_id = 4;  

-- 6
DELETE FROM Students
WHERE student_id = 106;

-- 7
UPDATE Payments
SET amount = 1200.00  
WHERE payment_id = 214;

-- task 3 Aggregate functions, Having, Order By, GroupBy and Joins:

-- 1
SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Payments p
JOIN Students s ON p.student_id = s.student_id
WHERE s.student_id = 101;  

-- 2
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY enrolled_students DESC;

-- 3
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 4
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- 5
SELECT t.teacher_id, t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id
ORDER BY t.last_name;

-- 6
SELECT s.student_id, s.first_name, s.last_name, 
       e.enrollment_date,
       c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Data Structures'
ORDER BY s.last_name, s.first_name;

-- 7
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

-- 8
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- 9
SELECT e1.student_id, s.first_name, s.last_name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id
JOIN Students s ON e1.student_id = s.student_id
WHERE e1.course_id <> e2.course_id
GROUP BY e1.student_id, s.first_name, s.last_name
HAVING COUNT(DISTINCT e1.course_id) > 1;


-- 10
SELECT t.teacher_id, t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;











  
  
 
  


