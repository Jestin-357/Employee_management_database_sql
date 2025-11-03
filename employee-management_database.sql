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

11. Get the department having the maximum average salary.

