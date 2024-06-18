-- Deleting existing tables in case they exists
drop table if exists departments cascade;
drop table if exists dept_employees cascade;
drop table if exists dept_manager cascade;
drop table if exists employees cascade;
drop table if exists salaries cascade;
drop table if exists titles cascade;

-- Create tables
create table departments (
	dept_no char(4) not null primary key,
	dept_name varchar(20) not null,
	last_updated timestamp default localtimestamp not null
);

create table employees(
	emp_no int not null primary key,
	emp_title char(5) not null,
	birth_date varchar(10),
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	sex char(1) not null,
	hire_date varchar(10),
	last_updated timestamp default localtimestamp not null
);

create table dept_employees(
	emp_no int not null references employees (emp_no),
	dept_no char(4) not null references departments (dept_no),
	last_updated timestamp default localtimestamp not null,
	primary key(emp_no, dept_no)
);

create table dept_manager(
	dept_no char(4) not null references departments (dept_no),
	emp_no int not null references employees (emp_no),
	last_updated timestamp default localtimestamp not null,
	primary key (dept_no, emp_no)
);



create table salaries(
	emp_no int not null references employees (emp_no),
	salary int not null,
	last_updated timestamp default localtimestamp not null,
	primary key (emp_no, salary)
);

create table titles(
	title_id char(5) not null,
	title varchar(20),
	last_updated timestamp default localtimestamp not null,
	primary key (title_id, title)
);

-- Data Analysis
-- 1. List the employee number, last name, first name, sex, and salary of each employee

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986

-- 3. List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.

-- 4. List the department number for each employee along with that employee’s employee
-- number, last name, first name, and department name.

-- 5. List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.

-- 6. List each employee in the Sales department, including their employee number, 
-- last name, and first name.

-- 7. List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).





