-- Create table for departments.
CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(25) NOT NULL);
	
-- Create table for titles.
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(25) NOT NULL);
	
-- Create table for employees.
-- Assign columm header for "emp_title_id" as "title_id".
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(10),
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	sex VARCHAR(1),
	hire_date VARCHAR(10) NOT NULL);

-- Create table for dept_emp.
CREATE TABLE dept_emp (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no));
	
-- Create table for dept_manager.
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no));
	
-- Create table for salaries.
CREATE TABLE salaries (
	id SERIAL PRIMARY KEY,
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT);
	
-- View each new table with imported data.
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;