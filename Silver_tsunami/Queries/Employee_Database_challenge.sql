-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (	
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
  emp_no int NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT NULL,
 	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
 	PRIMARY KEY (emp_no, title, from_date)
);

-- Verifying Data Module 7 Challenge
SELECT emp_no,first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'

--Verifying Data
SELECT title, from_date, to_date
FROM titles

-- Utilizing INTO function for Employee and Titles Table
SELECT em.emp_no,
       em.first_name,
       em.last_name,
       ti.title,
       ti.from_date,
       ti.to_date
INTO retirement_group
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by em.emp_no;

-- Remove Table if error occors
DROP TABLE retirement_group CASCADE

-- Verifying Data total with duplicates total = 133776
SELECT emp_no,
       first_name,
       last_name,
       title,
       from_date,
       to_date
FROM retirement_group
ORDER BY emp_no

-- Number of retiring employees with no duplicates. Total = 90398
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
    last_name,
    title,
	from_date,
    to_date
FROM retirement_group
ORDER BY emp_no, to_date DESC;

-- Use Dictinct with Orderby to remove duplicate rows  and create unique titles table
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
    last_name,
    title
	
INTO unique_titles
FROM retirement_group
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Remove Table if error occors
DROP TABLE unique_titles

-- Verifying Data
SELECT emp_no,
       first_name,
       last_name,
       title
      
FROM unique_titles
ORDER BY emp_no

-- Number of titles from the Unique Titles table grouped by title
SELECT COUNT(ut.title), ut.title
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- Creating Retiring Titles Table in DESC order grouped by title
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- Verifying data is correct for Mentorship Eligiblity Total = 1549
SELECT DISTINCT ON (em.emp_no)
	em.emp_no,
	em.first_name, 
	em.last_name, 
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
FROM employees as em
INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no, ti.from_date DESC;

-- Creating Mentorship Eligibilty Table
SELECT DISTINCT ON (em.emp_no)
	em.emp_no,
	em.first_name, 
	em.last_name, 
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as em
INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no, ti.from_date DESC;

-- Count of each title 
SELECT COUNT(me.title),me.title
FROM mentorship_eligibility as me
GROUP BY me.title
ORDER BY count DESC;

-- Additional Analysis
--Without Silver tsunami no duplicates
SELECT DISTINCT ON (em.emp_no)
	   em.emp_no,
       em.first_name,
       em.last_name,
       ti.title,
       ti.from_date,
       ti.to_date 
INTO add_analysis	  
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN '1956-01-01' AND '2022-12-31'
order by em.emp_no;


SELECT COUNT(ad.title),ad.title
FROM add_analysis as ad
GROUP BY ad.title
ORDER BY count DESC;

-- Create Employee Table with silver tsunami no duplicates
SELECT DISTINCT ON (em.emp_no)
	   em.emp_no,
       em.first_name,
       em.last_name,
       ti.title,
       ti.from_date,
       ti.to_date
INTO total_employee	   
FROM employees as em
INNER JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE em.birth_date BETWEEN '1952-01-01' AND '2022-12-31'
order by em.emp_no;

-- Total Count reference
SELECT COUNT(te.title),te.title
FROM total_employee as te
GROUP BY te.title
ORDER BY count DESC;
