-- Q1. Write a Sql query that will fetch all upcoming courses.
select * from courses 
where start_date > current_date();

-- Q2. Write a Sql query that will fetch all the registered students along with course name
select s.reg_no,s.name,s.email,s.course_id,c.course_name 
from student s join course c;

 -- Q3 Write an SQL query to fetch the complete details of a student (based on their email) along with the details of the course they are enrolled in
 
 select s.reg_no,s.name,s.email,s.course_id,c.course_name,c.description,c.fees,c.start_date,c.end_date,c.video_expire_days
 from student s join course c on s.course_id = c.course_id where s.email='student@gmail.com';
 
 -- Q4. Write an SQL query to retrieve the course details and the list of non-expired videos for a specific student using their email address. 
 -- A video is considered active (not expired) if its added_at date plus the course’s
 -- video_expire_days has not yet passed compared to the current date.
 select  c.course_id,c.course_name,c.start_date,c.end_date,c.video_expire_days,v.video_id,v.title,v.added_at
from courses c join videos v on c.course_id=v.course_id
join students s on s.course_id=c.course_id
where s.email = 'student@gmail.com' and v.added_at >= DATE_SUB(current_date, INTERVAL c.video_expire_days DAY);