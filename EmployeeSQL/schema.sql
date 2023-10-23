DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;


CREATE TABLE titles (
    title_id VARCHAR(5)  NOT NULL,
    title VARCHAR(30)   NOT NULL,
	PRIMARY KEY (title_id)
);


CREATE TABLE employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
  
);


CREATE TABLE departments (
    dept_no VARCHAR(5)  NOT NULL,
    dept_name VARCHAR(30)   NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(5)   NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(5)   NOT NULL,
    emp_no INT   NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
	PRIMARY KEY (salary , emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);

ALTER DATABASE employee_db SET datestyle TO "ISO, MDY";

SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
