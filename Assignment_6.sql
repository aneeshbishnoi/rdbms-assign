                                      -- Database Technologies – Assignment 6
--  1.Use Group by clause with appropriate sql functions to solve following queries.
--  Note : To solve below queries use “sales” database


--  1. Write a query that counts the number of salespeople registering orders for eachday. 
-- (If a salesperson has more than one order on a given day, he or she should be
--  counted only once.).

 select odate,count(distinct(snum)) count from orders group by odate;
  +------------+-------+
  | odate      | count |
  +------------+-------+
  | 1990-10-03 |     4 |
  | 1990-10-04 |     3 |
  +------------+-------+

--  2. Write a query on the Customers table that will find the 
-- highest rating in each city. Put the output in this form:
-- For the city (city), the highest rating is : (rating).
  
  select concat('highest rating for the city ',city,' is ',max(rating))  as max_rating from customers group by city;
  +---------------------------------------------+
  | max_rating                                  |
  +---------------------------------------------+
  | highest rating for the city London is 100   |
  | highest rating for the city Rome is 200     |
  | highest rating for the city San Jose is 300 |
  | highest rating for the city Berlin is 300   |
  +---------------------------------------------+


--  3 Write a query that totals the orders for each day and places the results in descending 
-- order.

   select odate ,sum(amt) as count from orders group by odate order by count desc;
  +------------+----------+
  | odate      | count    |
  +------------+----------+
  | 1990-10-04 | 16713.81 |
  | 1990-10-03 |  8944.59 |
  +------------+----------+


--  4. Write a query that selects the total amount in orders for each salesperson for whom 
-- this total is greater than the average  amount of the order in the table.
--  (Note Use the average amount value directly →2565.84)

    select snum , sum(amt) as total from orders group by snum having total > avg(amt);
    +------+----------+
    | snum | total    |
    +------+----------+
    | 1007 |  1116.85 |
    | 1001 | 15382.07 |
    | 1002 |  5546.15 |
    +------+----------+


--  5. Write a query that selects the highest rating in each city.
  
  
    select max(rating) as max_rating , city from customers group by city ;
    +------------+----------+
    | max_rating | city     |
    +------------+----------+
    |        100 | London   |
    |        200 | Rome     |
    |        300 | San Jose |
    |        300 | Berlin   |
    +------------+----------+


--  6. Largest order taken by each salesperson with order value more than Rs.3000.

    select snum , max(amt) as max_amt from orders group by snum;
    +------+---------+
    | snum | max_amt |
    +------+---------+
    | 1007 | 1098.16 |
    | 1001 | 9891.88 |
    | 1004 | 1900.10 |
    | 1002 | 5160.45 |
    | 1003 | 1713.23 |
    +------+---------+

--  7. Select each customer smallest order.

    select cnum , min(amt) as min_order from orders group by cnum

    +------+-----------+
    | cnum | min_order |
    +------+-----------+
    | 2008 |     18.69 |
    | 2001 |    767.19 |
    | 2007 |   1900.10 |
    | 2003 |   5160.45 |
    | 2002 |   1713.23 |
    | 2004 |     75.75 |
    | 2006 |   4723.00 |
    +------+-----------+
 

                                                              -- Note : To solve below queries use “hr” database


--  1. Display manager ID and number of employees managed by the manager.


    select manager_id , count(employee_id) as count_emp from employees group by manager_id;
    +------------+-----------+
    | manager_id | count_emp |
    +------------+-----------+
    |          0 |         1 |
    |        100 |        14 |
    |        101 |         5 |
    |        102 |         1 |
    |        103 |         4 |
    |        108 |         5 |
    |        114 |         5 |
    |        120 |         8 |
    |        121 |         8 |
    |        122 |         8 |
    |        123 |         8 |
    |        124 |         8 |
    |        145 |         6 |
    |        146 |         6 |
    |        147 |         6 |
    |        148 |         6 |
    |        149 |         6 |
    |        201 |         1 |
    |        205 |         1 |
    +------------+-----------+

--  2. Display the country ID and number of cities we have in the country.


         select country_id , count(distinct(city)) as num_city from locations group by(country_id);
      +------------+----------+
      | country_id | num_city |
      +------------+----------+
      | "          |        1 |
      | AU         |        1 |
      | BR         |        1 |
      | CA         |        2 |
      | CH         |        2 |
      | CN         |        1 |
      | DE         |        1 |
      | IN         |        1 |
      | IT         |        2 |
      | JP         |        2 |
      | NL         |        1 |
      | Ox         |        1 |
      | SG         |        1 |
      | UK         |        2 |
      | US         |        4 |
      +------------+----------+

--  3. Display average salary of employees in each department who have commission percentage.

     select department_id, avg(salary) as avg_sal from employees where commission_pct != 0 group by department_id ;
    +---------------+-------------+
    | department_id | avg_sal     |
    +---------------+-------------+
    |             0 | 7000.000000 |
    |            80 | 8955.882353 |
    +---------------+-------------+

--  4. Display job ID, number of employees, sum of salary, and difference between highest 
-- salary and lowest salary of the employees of the job.

  select job_id , count(employee_id) as count_emp , sum(salary) as total_sal,(max(salary) - min(salary)) as diff_max_min from employees group by job_id ;
  +------------+-----------+-----------+--------------+
  | job_id     | count_emp | total_sal | diff_max_min |
  +------------+-----------+-----------+--------------+
  | AC_ACCOUNT |         1 |   8300.00 |         0.00 |
  | AC_MGR     |         1 |  12000.00 |         0.00 |
  | AD_ASST    |         1 |   4400.00 |         0.00 |
  | AD_PRES    |         1 |  24000.00 |         0.00 |
  | AD_VP      |         2 |  34000.00 |         0.00 |
  | FI_ACCOUNT |         5 |  39600.00 |      2100.00 |
  | FI_MGR     |         1 |  12000.00 |         0.00 |
  | HR_REP     |         1 |   6500.00 |         0.00 |
  | IT_PROG    |         5 |  28800.00 |      4800.00 |
  | MK_MAN     |         1 |  13000.00 |         0.00 |
  | MK_REP     |         1 |   6000.00 |         0.00 |
  | PR_REP     |         1 |  10000.00 |         0.00 |
  | PU_CLERK   |         5 |  13900.00 |       600.00 |
  | PU_MAN     |         1 |  11000.00 |         0.00 |
  | SA_MAN     |         5 |  61000.00 |      3500.00 |
  | SA_REP     |        30 | 250500.00 |      5400.00 |
  | SH_CLERK   |        20 |  64300.00 |      1700.00 |
  | ST_CLERK   |        20 |  55700.00 |      1500.00 |
  | ST_MAN     |         5 |  36400.00 |      2400.00 |
  +------------+-----------+-----------+--------------+


5. Display job ID for jobs with average salary more than 10000. 

   select job_id from employees group by job_id having avg(salary) > 10000;
    +---------+
    | job_id  |
    +---------+
    | AC_MGR  |
    | AD_PRES |
    | AD_VP   |
    | FI_MGR  |
    | MK_MAN  |
    | PU_MAN  |
    | SA_MAN  |
    +---------+
6. Display years in which more than 10 employees joined.

  select year(hire_date) as year from employees group by hire_date having count(employee_id) > 10;
    
  Empty set (0.00 sec)


 7. Display departments in which more than five employees have commission percentage.

     select department_id from employees group by department_id having count(commission_pct!=0) > 5;
    +---------------+
    | department_id |
    +---------------+
    |            30 |
    |            50 |
    |            80 |
    |           100 |
    +---------------+
 8. Display employee ID for employees who did more than one job in the past.

  select employee_id ,count(job_id) from job_history group by employee_id having count(job_id)>1;
  +-------------+---------------+
  | employee_id | count(job_id) |
  +-------------+---------------+
  |         101 |             2 |
  |         176 |             2 |
  |         200 |             2 |
  +-------------+---------------+

 9. Display job ID of jobs that were done by more than 3 employees for more than 100 
days.

     select count(employee_id) as count,job_id , sum(timestampdiff(day,start_date,end_date))  from job_history where timestampdiff(day,start_date,end_date) > 100 group by job_id having count(employee_id) > 3;
    Empty set (0.00 sec)

 10. Display department ID, year, and Number of employees joined. 

   select department_id , year(hire_date) year , count(employee_id) count_emp from employees group by department_id,year(hire_date);
    +---------------+------+-----------+
    | department_id | year | count_emp |
    +---------------+------+-----------+
    |            90 | 1987 |         3 |
    |            60 | 1987 |         5 |
    |           100 | 1987 |         6 |
    |            30 | 1987 |         6 |
    |            50 | 1987 |        45 |
    |            80 | 1987 |        34 |
    |             0 | 1987 |         1 |
    |            10 | 1987 |         1 |
    |            20 | 1987 |         2 |
    |            40 | 1987 |         1 |
    |            70 | 1987 |         1 |
    |           110 | 1987 |         2 |
    +---------------+------+-----------+

  
11. Display how many employees joined in each month of the current year.

 select count(employee_id) as emp_joined, monthname(hire_date) as month from employees group by month(hire_date);
  +------------+-----------+
  | emp_joined | month     |
  +------------+-----------+
  |         14 | June      |
  |         31 | July      |
  |         31 | August    |
  |         30 | September |
  |          1 | October   |
  +------------+-----------+


 12. Display details of departments in which the maximum salary is more than 10000

  select department_id from employees group by department_id having max(salary) > 10000;
  +---------------+
  | department_id |
  +---------------+
  |            20 |
  |            30 |
  |            80 |
  |            90 |
  |           100 |
  |           110 |
  +---------------+