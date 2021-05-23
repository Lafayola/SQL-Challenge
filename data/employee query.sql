drop table if exists salary cascade;
drop table if exists title cascade;
drop table if exists department_manager cascade;
drop table if exists department_employee cascade;
drop table if exists department cascade;
drop table if exists employee cascade;
create table employee (
emp_no integer not null,
emp_title_id char(5),
birth_date date,
first_name varchar(50),
last_name varchar(50),
sex char(1),
hire_date date);
create table department (
dept_no char(5) not null,
dept_name varchar(50)
);
create table salary (
emp_no integer not null,
salary integer
);
create table title (
title_id char(5) not null,
title varchar(50)
);
create table department_manager (
dept_no char(5) not null,
emp_no integer not null
);
create table department_employee (
emp_no integer not null,
dept_no char(5) not null
);
alter table department add constraint PK_001 primary key (dept_no);
alter table salary add constraint PK_002 primary key (emp_no);
alter table title add constraint PK_003 primary key (title_id);
alter table department_man

-- List the following details of each employee: employee number, last name, first name, sex, and salary

SELECT employee number, last_name, first_name, sex,salary
FROM employee
LEFT JOIN Salary ON salary.emp_no = employee.emp_no;

--SQL Homework - Employee Database: A Mystery in Two Parts

SELECT first_name,last_name,hire_date
FROM employee
WHERE DATE_PART('year',hire_date)= 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT department_manager.dept_no, 
	   department.dept_name,
	   department_manager.emp_no,
	   employee.last_name,
	   employee.first_name
FROM department_Manager
INNER JOIN department ON
department_manager.dept_no = department.dept_no
INNER JOIN employee ON
department_manager.emp_no = employee.emp_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employee.emp_no,
       employee.last_name,
	   employee.first_name,
	   department.dept_name
FROM employee
INNER JOIN department_manager
ON employee.emp_no =department_manager.emp_no
INNER JOIN department 
ON department_manager.dept_no = department.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name,sex
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employee.emp_no,
       employee.last_name,
	   employee.first_name,
	   department.dept_name
FROM employee
INNER JOIN department_manager
ON employee.emp_no =department_manager.emp_no
INNER JOIN department 
ON department_manager.dept_no = department.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employee.emp_no,
       employee.last_name,
	   employee.first_name,
	   department.dept_name
FROM employee
INNER JOIN department_manager
ON employee.emp_no =department_manager.emp_no
INNER JOIN department 
ON department_manager.dept_no = department.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name,COUNT(last_name)
FROM employee
GROUP BY last_name
HAVING COUNT(last_name)>1
ORDER BY last_name DESC;

