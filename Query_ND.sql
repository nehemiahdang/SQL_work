SHOW datestyle;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
  FROM employees as e
  JOIN salaries as s ON
  e.emp_no = s.emp_no
  ORDER BY emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
  WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
  ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT * FROM dept_managers;
SELECT * FROM department;
SELECT * FROM employees;

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
  FROM dept_managers as dm
  JOIN department as d ON
  dm.dept_no = d.dept_no
  JOIN employees as e ON
  dm.emp_no = e.emp_no;
  
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM dept_employee;
SELECT * FROM employees;
SELECT * FROM department;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
  FROM dept_employee as de
  JOIN employees as e ON
  de.emp_no = e.emp_no
  JOIN department as d ON
  de.dept_no = d.dept_no
  ORDER BY emp_no;
  
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees;

SELECT first_name, last_name, sex FROM employees
  WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
  ORDER BY last_name;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM dept_employee;
SELECT * FROM employees;
SELECT * FROM department;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
  FROM dept_employee as de
  JOIN employees as e ON
  de.emp_no = e.emp_no
  JOIN department as d ON
  de.dept_no = d.dept_no
  WHERE dept_name = 'Sales'
  ORDER BY emp_no;

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM dept_employee;
SELECT * FROM employees;
SELECT * FROM department;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
  FROM dept_employee as de
  JOIN employees as e ON
  de.emp_no = e.emp_no
  JOIN department as d ON
  de.dept_no = d.dept_no
  WHERE dept_name = 'Sales' OR dept_name = 'Development'
  ORDER BY emp_no;

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Count"
  FROM employees
  GROUP BY last_name
  ORDER BY "Last Name Count" DESC;
