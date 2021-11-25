-- Retirement titles
SELECT emp.emp_no, 
		emp.first_name, 
		emp.last_name, 
		ti.title, 
		ti.from_date, 
		ti.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no
;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (ret.emp_no) ret.emp_no,
								ret.first_name,
								ret.last_name,
								ret.title
INTO unique_titles
FROM retirement_titles as ret
ORDER BY emp_no, to_date DESC;

-- Retiring Titles 
SELECT COUNT (un.title), un.title
INTO retiring_titles
FROM unique_titles as un
GROUP BY un.title
ORDER BY count DESC;