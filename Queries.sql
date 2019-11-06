--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, 
  employees.first_name, 
  employees.last_name, 
  employees.gender,
  salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1/1/1986'
AND hire_date <= '1/1/1987';

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, dept_name, m.emp_no, last_name, first_name, from_date, to_date
FROM departments d 
JOIN dept_manager m 
ON d.dept_no = m.dept_no 
JOIN employees e 
ON m.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT m.emp_no, last_name, first_name, dept_name
FROM departments d 
JOIN dept_emp m 
ON d.dept_no = m.dept_no 
JOIN employees e 
ON m.emp_no = e.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
SELECT m.emp_no, last_name, first_name, dept_name
FROM departments d 
JOIN dept_emp m 
ON d.dept_no = m.dept_no 
JOIN employees e 
ON m.emp_no = e.emp_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT m.emp_no, last_name, first_name, dept_name
FROM departments d 
JOIN dept_emp m 
ON d.dept_no = m.dept_no 
JOIN employees e 
ON m.emp_no = e.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees 
--share each last name.
SELECT last_name, COUNT(last_name) AS "last name count"
FROM employees
GROUP BY last_name
ORDER BY "last name count" DESC;