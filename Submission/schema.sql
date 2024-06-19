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

create table titles(
	title_id char(5) not null primary key,
	title varchar(20) not null,
	last_updated timestamp default localtimestamp not null
);

create table employees(
	emp_no int not null primary key,
	emp_title char(5) not null references titles (title_id),
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