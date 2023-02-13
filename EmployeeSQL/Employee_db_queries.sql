-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,e.last_name,e.first_name, e.sex, s.salary FROM
 employees e JOIN salaries s ON (e.emp_no=s.emp_no) 
	
	
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name,e.last_name,e.hire_date FROM employees e 
	WHERE EXTRACT ('year' from e.hire_date)='1986'


-- List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,e.last_name,e.first_name
	FROM dept_manager join departments on dept_manager.dept_no=departments.dept_no 
	JOIN employees e on dept_manager.emp_no=e.emp_no 


-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no,dept_emp.emp_no,e.last_name,e.first_name,d.dept_name 
	FROM dept_emp join departments d on dept_emp.dept_no=d.dept_no 
	JOIN employees e on dept_emp.emp_no=e.emp_no


-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name,e.last_name,e.sex FROM employees e 
	WHERE  (e.last_name LIKE 'B%')AND (e.first_name='Hercules')


-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,e.first_name,e.last_name FROM employees e 
	WHERE e.emp_no IN (
		SELECT dept_emp.emp_no from dept_emp join departments d on dept_emp.dept_no=d.dept_no WHERE d.dept_name='Sales'
	)


-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.first_name,e.last_name, d.dept_name 
	FROM dept_emp join departments d on dept_emp.dept_no=d.dept_no
	JOIN employees e on dept_emp.emp_no=e.emp_no 
	WHERE d.dept_name='Development'


-- List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT e.last_name,COUNT(e.last_name) FROM employees e GROUP BY (e.last_name) ORDER BY COUNT(e.last_name) DESC

