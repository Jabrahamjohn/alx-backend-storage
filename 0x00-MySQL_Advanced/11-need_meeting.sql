-- script that creates a view need_meeting that lists all students that have a score lower than 80 and have not had a meeting in the last month. The view should have the following columns:
CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
AND (last_meeting IS NULL OR last_meeting < DATE_SUB(NOW(), INTERVAL 1 MONTH));