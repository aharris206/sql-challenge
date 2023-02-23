-- Listing Employee Number, Last Name, First Name, Sex, and Salary

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal ON
	emp.emp_no=sal.emp_no;
	
-- Listing the First Name, Last Name, and Hire Date for the Employees Hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- Listing the Manager of each Department along with their Department Number, Department Name, 
-- Employee Number, Last Name, and First Name

SELECT deptm.dept_no, deps.dept_name, deptm.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS deptm
INNER JOIN departments AS deps ON
	deptm.dept_no=deps.dept_no
	INNER JOIN employees AS emp ON
		deptm.emp_no=emp.emp_no;

-- Listing the Department Number for each Employee along with Employee Number, Last Name, 
-- First Name, and Department Name

SELECT deps.dept_no, depte.emp_no, emp.last_name, emp.first_name, deps.dept_name
FROM dept_employee AS depte
INNER JOIN employees AS emp ON
	depte.emp_no=emp.emp_no
	INNER JOIN departments AS deps ON
		depte.dept_no=deps.dept_no;
		

-- Listing the First Name, Last Name, and Sex of each Employee whose First Name is Hercules 
-- and whose Last Name begins with the letter B 

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Listing each Employee in the Sales Department, including Employee Number, Last Name, 
-- and First Name

CREATE VIEW employees_departments AS
	SELECT depte.emp_no, emps.last_name, emps.first_name, depts.dept_name
	FROM dept_employee AS depte
	INNER JOIN employees AS emps ON
		depte.emp_no=emps.emp_no
		INNER JOIN departments AS depts ON
			depte.dept_no=depts.dept_no;
	
SELECT emp_no, last_name, first_name 
FROM employees_departments WHERE dept_name = 'Sales';

-- Listing each Employee in the Sales and Development Departments, including Employee Number,
-- Last Name, First Name, and Department Name

SELECT * FROM employees_departments
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- Tidying up by dropping this view, now that is is no longer needed
DROP VIEW employees_departments;

-- Listing how many Employees share each Last Name (in descending order)
SELECT last_name, COUNT(last_name) AS surnames
FROM employees 
GROUP BY last_name 
ORDER BY surnames DESC;