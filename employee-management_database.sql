show databases;
create DATABASE employee_management;
show databases;
use employee_management;


create table employees(
    emp_id int,
    emp_name varchar(23),
    dept_id int,
    salary int,
    hire_date date
);

insert into employees (emp_id, emp_name, dept_id, salary, hire_date)
VALUES
(1,'John',101,60000,'2018-02-10'),
(2,'Alice',102,75000,'2019-06-12'),
(3,'Bob',101,50000,'2020-03-15'),
(4,'David',103,90000,'2017-09-01'),
(5,'Emma',102,65000,'2021-07-22');

select * from employees;

Create table projects(
    project_id varchar(10),
    project_name varchar(30),
    dept_id int,
    budget int
);


insert into projects VALUES
('P1','website Revamp',102,500000),
('P2','Recruitment Drive',101,200000),
('P3','Annual Audit',103,300000),
('P4','Cloud Migration',102,700000);

select * from projects;

create table Departments (
    dept_id int,
    dept_name varchar(20)
);

insert into departments VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance');

select * from departments;

alter table departments modify dept_name varchar(9);

# 1. Show all employee details
select * from employees;

# 2. Display employee names and their salary
select emp_name,salary from employees;

# 3. Find employees who work in department 102.
select  emp_id, emp_name,dept_id from employees
where dept_id = 102;

# 4.List all departments.
select distinct dept_name from departments;
select * from departments;

# 5. Find employees hired after 2019.
select * from employees;
select emp_id, emp_name,hire_date from employees
where hire_date > '2019-12-31';


# 6. Get the total number of employees.

select count(*) as total_emoployees from employees;

# 7. Find the highest salary.

select * from employees
order by salary DESC
limit 1;

select * from employees
where salary = (select max(salary) from employees);

# 8. Find the average salary per department.

select e.dept_id, dept_name,  avg(salary) as avg_salary
from employees e
inner join departments d
on e.dept_id  = d.dept_id
group by e.dept_id, dept_name;

select dept_id, avg(salary) as avg_salary
from employees
group by dept_id;

# 9. Show employees and their department names (using JOIN).

select emp_id,d.dept_id,dept_name,emp_name from employees e
left join departments d
on e.dept_id = d.dept_id;  

# 10. Find employees working in the IT department.
select * from employees;
select e.emp_id, e.emp_name, d.dept_name from 
employees e
left join departments d
on e.dept_id = d.dept_id
where dept_name = 'IT';

# 11. Get the department having the maximum average salary.

select d.dept_id,d.dept_name, avg(e.salary) as avg_sal
from employees e
inner join departments d
on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name
order by avg_sal desc;
limit 1;

# 12. Show all projects with their department names.

select d.dept_id,d.dept_name,p.project_name 
from departments d
join projects p
on d.dept_id = p.dept_id;

# 13. Find total project budget for each department.

select * from projects;
select d.dept_id,d.dept_name, sum(p.budget) as total_budget
from departments d
join projects p
on d.dept_id = p.dept_id
group by d.dept_id,d.dept_name;

# 14. List employees who earn more than the average salary.

select emp_name,salary,avg(salary) over() as avg_salary
from employees
where salary > (select avg(salary) from employees);

select emp_name,salary
from employees
where salary > (select avg(salary) from employees);


# 15. Get all employees ordered by salary (descending).

select * from employees
order by salary DESC;


# 16. Find the second-highest salary.
select * from employees;
select * from  employees
where salary < (select max(salary) from employees)
limit 1;

select max(salary) as highest_salary
from employees
where salary < (select max(salary) from employees);

# 17. Find employees whose names start with 'A'.

select * from employees
where emp_name like 'A%';

# 18. Count how many employees are in each department.

select d.dept_id,dept_name,count(*) as emp_count
from employees e
join departments d
on e.dept_id = d.dept_id
group by d.dept_id,d.dept_name;

# 19. Get departments that have more than one employee.

select d.dept_id,dept_name,count(*) as emp_count
from employees e
join departments d
on e.dept_id = d.dept_id
group by d.dept_id,d.dept_name
having  emp_count>1;

select dept_id
from employees
group by dept_id
having count(dept_id) >1;

# 20. Display projects with budgets above 400000.

select * from projects
where budget > 400000;

# 21. Show all employees and their project department budgets.


select * from employees e
join projects P
on e.dept_id = p.dept_id

# 22. Find employees from departments that have projects.

select  *
from employees e
where dept_id in (select dept_id from projects);)


# 23. Find employees hired earliest (oldest hire date).

select * from employees
order by hire_date;


# 24. Show total salary paid by each department.
select d.dept_id,d.dept_name,sum(e.salary) as total_salary
from employees e
join departments d
on e.dept_id = d.dept_id
group by dept_id,dept_name;


#25 25. Find the department name and project name where budget > 300000.

select e.dept_name,p.project_name
from departments e
join projects p
ON e.dept_id = p.dept_id
where budget >300000;

