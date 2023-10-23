-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON s.emp_no = e.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM dept_manager dm
LEFT JOIN departments d ON d.dept_no = dm.dept_no
LEFT JOIN employees e ON e.emp_no = dm.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no, de.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d ON d.dept_no = de.dept_no
LEFT JOIN employees e ON e.emp_no = de.emp_no
ORDER BY de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.first_name, e.last_name
FROM employees e
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp de ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY d.dept_name;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(emp_no) AS "Last Name Count"
FROM employees 
GROUP BY last_name
ORDER BY "Last Name Count" DESC;


