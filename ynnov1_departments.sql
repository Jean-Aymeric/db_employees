USE employees;
DROP VIEW IF EXISTS ynnov1_departments;
CREATE VIEW ynnov1_departments AS
SELECT departments.dept_no,
       departments.dept_name,
       dept_manager.emp_no
FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01'