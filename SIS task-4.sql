-- task 4 Subquery and its type:

use SISDB;
-- 1
SELECT AVG(enrollment_count) AS average_enrollment
FROM (SELECT 
    c.course_id,
    c.course_name,
    COUNT(e.enrollment_id) AS enrollment_count
  FROM Courses c JOIN Enrollments e ON c.course_id = e.course_id
  GROUP BY c.course_id, c.course_name
) AS course_enrollments;


-- 2
SELECT * FROM Students
WHERE student_id IN (SELECT student_id FROM Payments
  WHERE amount = (
    SELECT MAX(amount)
    FROM Payments)
);

-- 3
SELECT c.course_name, 
  (SELECT COUNT(*) FROM Enrollments e WHERE e.course_id = c.course_id) AS enrollment_count
FROM Courses c WHERE 
  (SELECT COUNT(*) FROM Enrollments e WHERE e.course_id = c.course_id) = (
    SELECT MAX(enrollment_count) FROM (SELECT 
        course_id, 
        COUNT(*) AS enrollment_count FROM  Enrollments
      GROUP BY course_id
    ) AS subquery
  );
  
  
  -- 4
  SELECT 
  t.teacher_id,
  t.first_name,
  t.last_name,
  (SELECT SUM(p.amount) FROM 
      Payments p
      JOIN Enrollments e ON p.student_id = e.student_id
      JOIN Courses c ON e.course_id = c.course_id
    WHERE 
      c.teacher_id = t.teacher_id
  ) AS total_payments
FROM Teacher t;
  
  -- 5
  SELECT 
  s.student_id,
  s.first_name,
  s.last_name
FROM Students s WHERE 
  (SELECT COUNT(*) FROM Enrollments e WHERE e.student_id = s.student_id) = 
  (SELECT COUNT(*) FROM Courses);
  
  -- 6
  SELECT 
  t.teacher_id,
  t.first_name,
  t.last_name
FROM Teacher t
WHERE t.teacher_id NOT IN (
    SELECT 
      teacher_id FROM Courses);
  
  
  -- 7
  SELECT 
  AVG(student_age) AS average_age
FROM (SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS student_age
  FROM Students
) AS subquery;

-- 8
SELECT 
  c.course_id,
  c.course_name FROM Courses c
WHERE 
  c.course_id NOT IN (
    SELECT e.course_id 
    FROM Enrollments e
  );
  
  -- 9
  SELECT 
  s.student_id,
  s.first_name,
  s.last_name,
  c.course_id,
  c.course_name,
  SUM(p.amount) AS total_payments
FROM 
  Students s
  JOIN Enrollments e ON s.student_id = e.student_id
  JOIN Courses c ON e.course_id = c.course_id
  JOIN Payments p ON s.student_id = p.student_id
GROUP BY 
  s.student_id, s.first_name, s.last_name, c.course_id, c.course_name
ORDER BY 
  s.student_id, c.course_id;
  
  -- 10
  SELECT 
  s.student_id,
  s.first_name,
  s.last_name
FROM Students s WHERE 
  s.student_id IN (
    SELECT p.student_id FROM Payments p
    GROUP BY 
      p.student_id
    HAVING 
      COUNT(p.payment_id) > 1
  );
  
  -- 11
  SELECT 
  s.student_id,
  s.first_name,
  s.last_name,
  SUM(p.amount) AS total_payments
FROM Students s
  JOIN Payments p ON s.student_id = p.student_id
GROUP BY 
  s.student_id, s.first_name, s.last_name
ORDER BY 
  s.student_id;
  
  -- 12
  SELECT 
  c.course_id,
  c.course_name,
  COUNT(e.enrollment_id) AS enrollment_count
FROM Courses c
  JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY 
  c.course_id, c.course_name
ORDER BY 
  enrollment_count DESC;
  
  
  -- 13
SELECT 
  s.student_id,
  s.first_name,
  s.last_name,
  AVG(p.amount) AS average_payment
FROM Payments p
  JOIN Students s ON p.student_id = s.student_id
GROUP BY 
  s.student_id, s.first_name, s.last_name;




  





