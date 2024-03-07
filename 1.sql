with title_total_minutes as
(
select
a.course_id,
a.course_title,
ROUND(SUM(b.minutes_watched),2) as total_minutes_watched,
COUNT(DISTINCT b.student_id) as num_students
from
 365_course_info a
 join 
 365_student_learning b USING(course_id)
 GROUP BY 
 a.course_id, a.course_title),
 title_average_minutes as
 (
 select
 a.course_id,
 a.course_title,
 a.total_minutes_watched,
 ROUND(AVG(b.minutes_watched),2) as average_minutes
 from
 title_total_minutes a
 join 
 365_student_learning b using (course_id)
 group by a.course_id, a.course_title, a.total_minutes_watched),
 title_ratings as
 (
 select
 a.course_id,
 a.course_title,
 a.total_minutes_watched,
 a.average_minutes,
 COUNT(c.course_id) as number_of_ratings,
 AVG(c.course_rating) as average_rating
 from
 title_average_minutes a
 left join
 365_course_ratings c using (course_id)
 GROUP BY a.course_id, a.course_title, a.total_minutes_watched, a.average_minutes)
 SELECT
 a.course_id,
 a.course_title,
 a.total_minutes_watched,
 a.average_minutes,
 number_of_ratings,
 average_rating
 FROM
 title_ratings a;
 