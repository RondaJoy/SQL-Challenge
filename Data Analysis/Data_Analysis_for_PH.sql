-- DATA ANALYSIS
-- 1) List employee #, last name, first name, sex, and salary of each employee.
-- Join 'employees' table with 'salaries' table.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
ORDER BY employees.emp_no;

-- 2) List first name, last name, and hire date for employees hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date LIKE '%/1986';

-- 3) List the mgr of each dept along with dept number, dept name, emp number, last + first name. 
-- Join three tables using INNER JOIN from dept_manager.
SELECT departments.dept_name, dept_manager.dept_no, dept_manager.emp_no,
	employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;

-- 4) List the dept number, employee number, last + first name and dept name for each emp.
-- Join three tables using join with middle man (1st and 3rd have no common values)
SELECT employees.emp_no, employees.last_name, employees.first_name,
	dept_emp.dept_no, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
  JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY dept_emp.emp_no;

-- 5) List first + last name and sex for employees w/first = Hercules and last begins with "B".
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6) List each employee in Sales including emp number, last + first name.
-- Join three tables for the purpose of filtering the first table.
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
  JOIN departments ON departments.dept_no = dept_emp.dept_no
  WHERE departments.dept_name = 'Sales';
  
-- 7) List emp#, last + first name, and dept name for employees in Sales and Development.
-- Join three tables and apply conditional filters.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
  JOIN departments ON departments.dept_no = dept_emp.dept_no
  WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
  
-- 8) List the frequency counts of employee last names in descending order.
-- Display count of last name(s) and group by last_name.
SELECT last_name, COUNT(*) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;
