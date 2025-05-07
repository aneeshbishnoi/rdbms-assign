        -- Database Technologies – Assignment 3

-- Note : To solve below queries use “hr” database

-- 1. Write a query to get unique department ID from employee table.

    select distinct EMPLOYEE_ID from employees;


-- 2. Write a query to get all employee details from the employee
-- table order by first name, descending.

    select * from employees order by FIRST_NAME desc;


-- 3. Write a query to get the employee ID, names (first_name,
-- last_name), salary in ascending order of salary.

    select EMPLOYEE_ID,FIRST_NAME ,LAST_NAME,SALARY from employees  order by SALARY  ;

-- 4. Display first name and join date of the employees who is
-- either IT Programmer or Sales Man.

    select HIRE_DATE,JOB_ID,FIRST_NAME from employees where JOB_ID like '%PROG' or JOB_ID = 'SA_MAN';


-- 5. Display details of employee with ID 150 or 160.

    select * from employees where EMPLOYEE_ID in (150,160);


-- 6. Display first name, salary, commission pct, and hire date for
-- employees with salary less than 10000.

    select FIRST_NAME, SALARY , COMMISSION_PCT , HIRE_DATE from employees where SALARY < 10000;


-- 7. Display employees where the first name or last name starts
-- with S.

    select FIRST_NAME , LAST_NAME from employees where FIRST_NAME like 'S%' or LAST_NAME like 'S%';


-- 8. Display details of jobs in the descending order of the title.

    select JOB_TITLE from jobs order by JOB_TITLE DESC;


-- 9. Display details of the employees where commission percentage
-- is null and salary in the range 5000 to 10000 and department is 30.

    select * from employees where COMMISSION_PCT is NULL and SALARY between 5000 and 10000 and DEPARTMENT_ID = 30;

-- 10. Display employees first_name,email who are working in
-- “Executive” department.

    select FIRST_NAME,EMAIL from employees where DEPARTMENT_ID = 90;


-- 11. Display unique contry_id from locations table.

    select distinct country_ID from locations;


-- 12. Display all employees whose have job_id IT_PROG and
-- FI_ACCOUNT.

    select * from employees where JOB_ID in ('IT_PROG' , 'FI_ACCOUNT');


-- 13. Display all countries in ascending order.

    select * from locations order by COUNTRY_ID;