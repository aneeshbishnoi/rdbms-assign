-- Database Technologies – Assignment 7 OPTIONAL
--  Note : To solve below queries use “hr” database


--  1. Display department name and manager first name.

select d.department_name , e.first_name from employees e inner join
departments d on d.manager_id = e.employee_id ;
  +-----------------+------------+
  | department_name | first_name |
  +-----------------+------------+
  | Purchasing      | Den        |
  | Shipping        | Matthew    |
  | Shipping        | Adam       |
  | Shipping        | Payam      |
  | Shipping        | Shanta     |
  | Shipping        | Kevin      |
  | Sales           | John       |
  | Sales           | Karen      |
  | Sales           | Alberto    |
  | Sales           | Gerald     |
  | Sales           | Eleni      |
  | Marketing       | Michael    |
  +-----------------+------------+

  select e.first_name , d.department_name from employees e inner join departments d on d.manager_id = e.employee_id;
+------------+------------------+
| first_name | department_name  |
+------------+------------------+
| Jennifer   | Administration   |
| Michael    | Marketing        |
| Den        | Purchasing       |
| Susan      | Human Resources  |
| Adam       | Shipping         |
| Alexander  | IT               |
| Hermann    | Public Relations |
| John       | Sales            |
| Steven     | Executive        |
| Nancy      | Finance          |
| Shelley    | Accounting       |
+------------+------------------+


mysql> select e.first_name , d.department_name from employees e inner join departments d on d.manager_id = e.employee_id where right(e.job_id , 3) = 'man';
+------------+-----------------+
| first_name | department_name |
+------------+-----------------+
| Michael    | Marketing       |
| Den        | Purchasing      |
| Adam       | Shipping        |
| John       | Sales           |
+------------+-----------------+


 2. Display department name, manager name, and city.

  select d.department_name , e.first_name,l.city , e.job_id from departments d
  inner join employees e on e.employee_id = d.manager_id
  inner join locations l on l.location_id = d.location_id;

  +------------------+------------+---------------------+---------+
  | department_name  | first_name | city                | job_id  |
  +------------------+------------+---------------------+---------+
  | Administration   | Jennifer   | Seattle             | AD_ASST |
  | Marketing        | Michael    | Toronto             | MK_MAN  |
  | Purchasing       | Den        | Seattle             | PU_MAN  |
  | Human Resources  | Susan      | London              | HR_REP  |
  | Shipping         | Adam       | South San Francisco | ST_MAN  |
  | IT               | Alexander  | Southlake           | IT_PROG |
  | Public Relations | Hermann    | Munich              | PR_REP  |
  | Sales            | John       | OX9 9ZB             | SA_MAN  |
  | Executive        | Steven     | Seattle             | AD_PRES |
  | Finance          | Nancy      | Seattle             | FI_MGR  |
  | Accounting       | Shelley    | Seattle             | AC_MGR  |
  +------------------+------------+---------------------+---------+



 3. Display country name, city, and department name.

  select c.country_name , l.city , d.department_name from departments d
  inner join locations l on l.location_id = d.location_id
  inner join countries c on c.country_id = l.country_id;

  +--------------------------+---------------------+----------------------+
  | country_name             | city                | department_name      |
  +--------------------------+---------------------+----------------------+
  | United States of America | Seattle             | Administration       |
  | Canada                   | Toronto             | Marketing            |
  | United States of America | Seattle             | Purchasing           |
  | United Kingdom           | London              | Human Resources      |
  | United States of America | South San Francisco | Shipping             |
  | United States of America | Southlake           | IT                   |
  | Germany                  | Munich              | Public Relations     |
  | United States of America | Seattle             | Executive            |
  | United States of America | Seattle             | Finance              |
  | United States of America | Seattle             | Accounting           |
  | United States of America | Seattle             | Treasury             |
  | United States of America | Seattle             | Corporate Tax        |
  | United States of America | Seattle             | Control And Credit   |
  | United States of America | Seattle             | Shareholder Services |
  | United States of America | Seattle             | Benefits             |
  | United States of America | Seattle             | Manufacturing        |
  | United States of America | Seattle             | Construction         |
  | United States of America | Seattle             | Contracting          |
  | United States of America | Seattle             | Operations           |
  | United States of America | Seattle             | IT Support           |
  | United States of America | Seattle             | NOC                  |
  | United States of America | Seattle             | IT Helpdesk          |
  | United States of America | Seattle             | Government Sales     |
  | United States of America | Seattle             | Retail Sales         |
  | United States of America | Seattle             | Recruiting           |
  | United States of America | Seattle             | Payroll              |
  +--------------------------+---------------------+----------------------+
  -- 26 rows in set (0.00 sec)

 
 4. Display job title, department name, employee last name, starting date for all jobs from 1993 to 1998.

  select j.job_title , d.department_name , e.last_name , jh.start_date from employees e
  inner join departments d on e.department_id = d.department_id
  inner join jobs j on j.job_id = e.job_id
  inner join job_history jh on jh.employee_id = e.employee_id
  where year(jh.start_date) between 1993 and 1998; 

  +-------------------------------+-----------------+-----------+------------+
  | job_title                     | department_name | last_name | start_date |
  +-------------------------------+-----------------+-----------+------------+
  | Administration Vice President | Executive       | Kochhar   | 1993-10-28 |
  | Administration Vice President | Executive       | De Haan   | 1993-01-13 |
  | Purchasing Manager            | Purchasing      | Raphaely  | 1998-03-24 |
  | Sales Representative          | Sales           | Taylor    | 1998-03-24 |
  | Administration Assistant      | Administration  | Whalen    | 1994-07-01 |
  | Marketing Manager             | Marketing       | Hartstein | 1996-02-17 |
  +-------------------------------+-----------------+-----------+------------+
  6 rows in set (0.01 sec)

 
 5. Display job title and average salary of employees.

  select j.job_title , avg(e.salary)  from employees e
  inner join jobs j on j.job_id = e.job_id
  group by j.job_title;

  +---------------------------------+---------------+
  | job_title                       | avg(e.salary) |
  +---------------------------------+---------------+
  | President                       |  24000.000000 |
  | Administration Vice President   |  17000.000000 |
  | Programmer                      |   5760.000000 |
  | Finance Manager                 |  12000.000000 |
  | Accountant                      |   7920.000000 |
  | Purchasing Manager              |  11000.000000 |
  | Purchasing Clerk                |   2780.000000 |
  | Stock Manager                   |   7280.000000 |
  | Stock Clerk                     |   2785.000000 |
  | Sales Manager                   |  12200.000000 |
  | Sales Representative            |   8350.000000 |
  | Shipping Clerk                  |   3215.000000 |
  | Administration Assistant        |   4400.000000 |
  | Marketing Manager               |  13000.000000 |
  | Marketing Representative        |   6000.000000 |
  | Human Resources Representative  |   6500.000000 |
  | Public Relations Representative |  10000.000000 |
  | Accounting Manager              |  12000.000000 |
  | Public Accountant               |   8300.000000 |
  +---------------------------------+---------------+

 6. Display job title, employee name, and the difference between maximum salary for the
 job and salary of the employee.

 select j.job_title , e.first_name , j.max_salary - e.salary as diff_max_sal from employees e
 inner join jobs j on j.job_id = e.job_id;

  +---------------------------------+-------------+--------------+
  | job_title                       | first_name  | diff_max_sal |
  +---------------------------------+-------------+--------------+
  | President                       | Steven      |     16000.00 |
  | Administration Vice President   | Neena       |     13000.00 |
  | Administration Vice President   | Lex         |     13000.00 |
  | Administration Assistant        | Jennifer    |      1600.00 |
  | Finance Manager                 | Nancy       |      4000.00 |
  | Accountant                      | Daniel      |         0.00 |
  | Accountant                      | John        |       800.00 |
  | Accountant                      | Ismael      |      1300.00 |
  | Accountant                      | Jose Manuel |      1200.00 |
  | Accountant                      | Luis        |      2100.00 |
  | Accounting Manager              | Shelley     |      4000.00 |
  | Public Accountant               | William     |       700.00 |
  | Sales Manager                   | John        |      6000.00 |
  | Sales Manager                   | Karen       |      6500.00 |
  | Sales Manager                   | Alberto     |      8000.00 |
  | Sales Manager                   | Gerald      |      9000.00 |
  | Sales Manager                   | Eleni       |      9500.00 |
  | Sales Representative            | Peter       |      2000.00 |
  | Sales Representative            | David       |      2500.00 |
  | Sales Representative            | Peter       |      3000.00 |
  | Sales Representative            | Christopher |      4000.00 |
  | Sales Representative            | Nanette     |      4500.00 |
  | Sales Representative            | Oliver      |      5000.00 |
  | Sales Representative            | Janette     |      2000.00 |
  | Sales Representative            | Patrick     |      2500.00 |
  | Sales Representative            | Allan       |      3000.00 |
  | Sales Representative            | Lindsey     |      4000.00 |
  | Sales Representative            | Louise      |      4500.00 |
  | Sales Representative            | Sarath      |      5000.00 |
  | Sales Representative            | Clara       |      1500.00 |
  | Sales Representative            | Danielle    |      2500.00 |
  | Sales Representative            | Mattea      |      4800.00 |
  | Sales Representative            | David       |      5200.00 |
  | Sales Representative            | Sundar      |      5600.00 |
  | Sales Representative            | Amit        |      5800.00 |
  | Sales Representative            | Lisa        |       500.00 |
  | Sales Representative            | Harrison    |      2000.00 |
  | Sales Representative            | Tayler      |      2400.00 |
  | Sales Representative            | William     |      4600.00 |
  | Sales Representative            | Elizabeth   |      4700.00 |
  | Sales Representative            | Sundita     |      5900.00 |
  | Sales Representative            | Ellen       |      1000.00 |
  | Sales Representative            | Alyssa      |      3200.00 |
  | Sales Representative            | Jonathon    |      3400.00 |
  | Sales Representative            | Jack        |      3600.00 |
  | Sales Representative            | Kimberely   |      5000.00 |
  | Sales Representative            | Charles     |      5800.00 |
  | Purchasing Manager              | Den         |      4000.00 |
  | Purchasing Clerk                | Alexander   |      2400.00 |
  | Purchasing Clerk                | Shelli      |      2600.00 |
  | Purchasing Clerk                | Sigal       |      2700.00 |
  | Purchasing Clerk                | Guy         |      2900.00 |
  | Purchasing Clerk                | Karen       |      3000.00 |
  | Stock Manager                   | Matthew     |       500.00 |
  | Stock Manager                   | Adam        |       300.00 |
  | Stock Manager                   | Payam       |       600.00 |
  | Stock Manager                   | Shanta      |      2000.00 |
  | Stock Manager                   | Kevin       |      2700.00 |
  | Stock Clerk                     | Julia       |      1800.00 |
  | Stock Clerk                     | Irene       |      2300.00 |
  | Stock Clerk                     | James       |      2600.00 |
  | Stock Clerk                     | Steven      |      2800.00 |
  | Stock Clerk                     | Laura       |      1700.00 |
  | Stock Clerk                     | Mozhe       |      2200.00 |
  | Stock Clerk                     | James       |      2500.00 |
  | Stock Clerk                     | TJ          |      2900.00 |
  | Stock Clerk                     | Jason       |      1700.00 |
  | Stock Clerk                     | Michael     |      2100.00 |
  | Stock Clerk                     | Ki          |      2600.00 |
  | Stock Clerk                     | Hazel       |      2800.00 |
  | Stock Clerk                     | Renske      |      1400.00 |
  | Stock Clerk                     | Stephen     |      1800.00 |
  | Stock Clerk                     | John        |      2300.00 |
  | Stock Clerk                     | Joshua      |      2500.00 |
  | Stock Clerk                     | Trenna      |      1500.00 |
  | Stock Clerk                     | Curtis      |      1900.00 |
  | Stock Clerk                     | Randall     |      2400.00 |
  | Stock Clerk                     | Peter       |      2500.00 |
  | Shipping Clerk                  | Winston     |      2300.00 |
  | Shipping Clerk                  | Jean        |      2400.00 |
  | Shipping Clerk                  | Martha      |      3000.00 |
  | Shipping Clerk                  | Girard      |      2700.00 |
  | Shipping Clerk                  | Nandita     |      1300.00 |
  | Shipping Clerk                  | Alexis      |      1400.00 |
  | Shipping Clerk                  | Julia       |      2100.00 |
  | Shipping Clerk                  | Anthony     |      2500.00 |
  | Shipping Clerk                  | Kelly       |      1700.00 |
  | Shipping Clerk                  | Jennifer    |      1900.00 |
  | Shipping Clerk                  | Timothy     |      2600.00 |
  | Shipping Clerk                  | Randall     |      3000.00 |
  | Shipping Clerk                  | Sarah       |      1500.00 |
  | Shipping Clerk                  | Britney     |      1600.00 |
  | Shipping Clerk                  | Samuel      |      2300.00 |
  | Shipping Clerk                  | Vance       |      2700.00 |
  | Shipping Clerk                  | Alana       |      2400.00 |
  | Shipping Clerk                  | Kevin       |      2500.00 |
  | Shipping Clerk                  | Donald      |      2900.00 |
  | Shipping Clerk                  | Douglas     |      2900.00 |
  | Programmer                      | Alexander   |      1000.00 |
  | Programmer                      | Bruce       |      4000.00 |
  | Programmer                      | David       |      5200.00 |
  | Programmer                      | Valli       |      5200.00 |
  | Programmer                      | Diana       |      5800.00 |
  | Marketing Manager               | Michael     |      2000.00 |
  | Marketing Representative        | Pat         |      3000.00 |
  | Human Resources Representative  | Susan       |      2500.00 |
  | Public Relations Representative | Hermann     |       500.00 |
  +---------------------------------+-------------+--------------+
  107 rows in set (0.00 sec)


 7. Display last name, job title of employees who have commission percentage and 
belongs to department 30.



select e.last_name , j.job_title from employees e
inner join jobs j on j.job_id = e.job_id
where e.department_id = 30 and e.commission_pct = 0.30;

  Empty set (0.00 sec)

select e.last_name , j.job_title from employees e
inner join jobs j on j.job_id = e.job_id
where e.department_id = 30 and e.commission_pct = 0.30;

  +------------+----------------------+
  | last_name  | job_title            |
  +------------+----------------------+
  | Raphaely   | Purchasing Manager   |
  | Khoo       | Purchasing Clerk     |
  | Baida      | Purchasing Clerk     |
  | Tobias     | Purchasing Clerk     |
  | Himuro     | Purchasing Clerk     |
  | Colmenares | Purchasing Clerk     |
  | Partners   | Sales Manager        |
  | Errazuriz  | Sales Manager        |
  | Cambrault  | Sales Manager        |
  | Tucker     | Sales Representative |
  | Smith      | Sales Representative |
  | Doran      | Sales Representative |
  | Abel       | Sales Representative |
  +------------+----------------------+


 8. Display details of jobs that were done by any employee who is currently drawing 
more than 15000 of salary.

select  j.* from jobs j
inner join employees e on e.salary > 15000;


 9. Display department name, manager name, and salary of the manager for all 
managers whose experience is more than 5 years.

    select d.department_name dept_name , e.first_name first_name , e.salary sal from employees e
    inner join departments d on d.manager_id = e.employee_id
    where TIMESTAMPDIFF(YEAR, e.hire_date, NOW()) > 5;
  +------------------+------------+----------+
  | dept_name        | first_name | sal      |
  +------------------+------------+----------+
  | Administration   | Jennifer   |  4400.00 |
  | Marketing        | Michael    | 13000.00 |
  | Purchasing       | Den        | 11000.00 |
  | Human Resources  | Susan      |  6500.00 |
  | Shipping         | Adam       |  8200.00 |
  | IT               | Alexander  |  9000.00 |
  | Public Relations | Hermann    | 10000.00 |
  | Sales            | John       | 14000.00 |
  | Executive        | Steven     | 24000.00 |
  | Finance          | Nancy      | 12000.00 |
  | Accounting       | Shelley    | 12000.00 |
  +------------------+------------+----------+



 10. Display employee name if the employee joined before his manager.

 
 11. Display employee name, job title for the jobs employee did in the past where the job 
was done less than six months.
 12. Display employee name and country in which he is working.
 13. Display department name, average salary and number of employees with 
commission within the department.
 14. Display the month in which more than 5 employees joined in any department 
located in Sydney.
 15. Display employee name, job title, start date, and end date of past jobs of all 
employees with commission percentage null. 
Sunbeam Institute of Information Technology Pune & Karad