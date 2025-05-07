                    -- Database Technologies – Assignment 5

-- Use appropriate SQL functions to solve following queries.
-- Note : To solve below queries use “hr” database


-- 1. Display first name and last name after converting the first letter of each name to upper case and the rest to lower case.

    select concat(upper(left(First_name,1)) , substring(First_name , 2)) as first_name , concat(upper(left(last_name,1)), substring(last_name,2)) as last_name from  employees;
    +-------------+-------------+
    | first_name  | last_name   |
    +-------------+-------------+
    | Ellen       | Abel        |
    | Sundar      | Ande        |
    | Mozhe       | Atkinson    |
    | David       | Austin      |
    | Hermann     | Baer        |
    | Shelli      | Baida       |
    | Amit        | Banda       |
    | Elizabeth   | Bates       |


-- 2. Display the first word in job title.

    select substring_index(JOB_TITLE , ' ' , 1) as first_word from jobs;
    +----------------+
    | first_word     |
    +----------------+
    | President      |
    | Administration |
    | Administration |
    | Finance        |
    | Accountant     |
    | Accounting     |
    | Public         |
    | Sales          |
    | Sales          |
    | Purchasing     |
    | Purchasing     |
    | Stock          |
    | Stock          |


-- 3. Display the length of first name for employees where last name contain character ‘b’ aftr 3rd position.

    select first_name, length(first_name) as length from employees  where left(last_name , 1) = 'b' ;
    +------------+--------+
    | first_name | length |
    +------------+--------+
    | Hermann    |      7 |
    | Shelli     |      6 |
    | Amit       |      4 |
    | Elizabeth  |      9 |
    | Sarah      |      5 |
    | David      |      5 |
    | Laura      |      5 |
    | Harrison   |      8 |
    | Alexis     |      6 |
    +------------+--------+


-- 4. Display first name in upper case and email address in lower case for employees where the first name and email address are same irrespective of the case.

    select upper(first_name) as first_name , lower(email) as email from employees where first_name = last_name; 


-- 5. Display first name, salary, and round the salary to thousands.

    select FIRST_NAME,round(salary) as salary from employees ;

    +-------------+--------+
    | FIRST_NAME  | salary |
    +-------------+--------+
    | Steven      |  24000 |
    | Neena       |  17000 |
    | Lex         |  17000 |
    | Alexander   |   9000 |
    | Bruce       |   6000 |
    | David       |   4800 |
    | Valli       |   4800 |
    | Diana       |   4200 |
    | Nancy       |  12000 |
    | Daniel      |   9000 |
    | John        |   8200 |
    | Ismael      |   7700 |
    | Jose Manuel |   7800 |
    | Luis        |   6900 |



-- 6. Display employee ID and the date on which he ended his previous job.

    select employee_id ,  end_date from job_history;
    +-------------+------------+
    | employee_id | end_date   |
    +-------------+------------+
    |         102 | 1998-07-24 |
    |         101 | 1993-10-27 |
    |         101 | 1997-03-15 |
    |         201 | 1999-12-19 |
    |         114 | 1999-12-31 |
    |         122 | 1999-12-31 |
    |         200 | 1993-06-17 |
    |         176 | 1998-12-31 |
    |         176 | 1999-12-31 |
    |         200 | 1998-12-31 |
    |           0 | 0000-00-00 |
    +-------------+------------+



-- 7. Display first name and date of first salary of the employees. (Cosider 1st day of month as salary day) HINT: LAST_DAY.

    select adddate(LAST_DAY(HIRE_DATE), interval 1 day) as salary_date from employees;
    +-------------+
    | salary_date |
    +-------------+
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
    | 1987-07-01  |
  
-- 8. Display first name and experience of the employees.

        select concat(first_name, ' has experience of ', timestampdiff(year , hire_date,date(now())),
        ' years and ' , timestampdiff(month , hire_date , now())%12 , 
        ' months.' ) as experience from employees;

        +-------------------------------------------------------+
        | experience                                            |
        +-------------------------------------------------------+
        | Steven has experience of 37 years and 10 months.      |
        | Neena has experience of 37 years and 10 months.       |
        | Lex has experience of 37 years and 10 months.         |
        | Alexander has experience of 37 years and 10 months.   |
        | Bruce has experience of 37 years and 10 months.       |
        | David has experience of 37 years and 10 months.       |
        | Valli has experience of 37 years and 10 months.       |
        | Diana has experience of 37 years and 10 months.       |
        | Nancy has experience of 37 years and 10 months.       |


-- 9. Display first name of employees who joined in 2001.

    select first_name from employees where year(hire_date) = 2001;


-- 10. Display employees who joined in the current year.

    select first_name from employees where year(hire_date) = year(now()); 

-- 11. Display the number of days between system date and 1st January 2011.

    select timestampdiff(day , '2011-01-01', sysdate());
    +----------------------------------------------+
    | timestampdiff(day , '2011-01-01', sysdate()) |
    +----------------------------------------------+
    |                                         5233 |
    +----------------------------------------------+

-- 12. Display number of employees joined after 15th of the month.

    select count(employee_id) as join_after_15 
    ->     from employees where 
    ->     day(hire_date) > 15;
    +---------------+
    | join_after_15 |
    +---------------+
    |            61 |
    +---------------+



-- 13. Display third highest salary of employees.

    select salary from employees limit 2,1;
    +----------+
    | salary   |
    +----------+
    | 17000.00 |
    +----------+


-- Sunbeam Institute of Information Technology Pune & KaradDatabase Technologies – Assignment 5


-- Note : To solve below queries use “spj” database


-- 1. Display all the Suppliers, belonging to cities starting with the letter ‘L’.

    select * from S where left(city , 1) = 'L';
    +------+-------+--------+--------+
    | S#   | Sname | status | city   |
    +------+-------+--------+--------+
    | S1   | Smith |     20 | London |
    | S4   | Clark |     20 | London |
    +------+-------+--------+--------+

-- 2. Display all the Jobs, with the third letter in JNAME as ‘n’.

    select Jname from J where substring(Jname,3,1) = 'n';
    +---------+
    | Jname   |
    +---------+
    | Punch   |
    | Console |
    +---------+

-- 3. Display all the Supplier names with the initial letter capital.

    select Sname from S where substring(Sname , 2, 1) = upper(substring(Sname , 2, 1));
    +-------+
    | Sname |
    +-------+
    | Smith |
    | Jones |
    | Blake |
    | Clark |
    | Adams |
    +-------+


-- 4. Display all the Supplier names in upper case.
    
    select upper(Sname) from S ;
    +--------------+
    | upper(Sname) |
    +--------------+
    | SMITH        |
    | JONES        |
    | BLAKE        |
    | CLARK        |
    | ADAMS        |
    +--------------+

-- 5. Display all the Supplier names in lower case.

    select lower(Sname) from S ;
    +--------------+
    | lower(Sname) |
    +--------------+
    | smith        |
    | jones        |
    | blake        |
    | clark        |
    | adams        |
    +--------------+

-- 6. Display the Supplier names and the lengths of the names.

    select Sname , length(sname) from S;
    +-------+---------------+
    | Sname | length(sname) |
    +-------+---------------+
    | Smith |             5 |
    | Jones |             5 |
    | Blake |             5 |
    | Clark |             5 |
    | Adams |             5 |
    +-------+---------------+

7. Display the current day (e.g. Thursday).

    select day(now());
    +----------------+
    | dayname(now()) |
    +----------------+
    | Wednesday      |
    +----------------+


8. Display the minimum Status in the Supplier table.

    select min(status) from S;
    +-------------+
    | min(status) |
    +-------------+
    |          10 |
    +-------------+

9. Display the maximum Weight in the Parts table.

    select max(weight) as max_weight from P where city = 'London';
    +------------+
    | max_weight |
    +------------+
    |         19 |
    +------------+

10. Display the average Weight of the Parts.

    select avg(weight) as avg_weight from P where city = 'Paris';  
    +------------+
    | avg_weight |
    +------------+
    |    14.5000 |
    +------------+

11. Display the total Quantity sold for part ‘P1’.

    select count(Pname) from P where `P#` = 'P1';
    +--------------+
    | count(Pname) |
    +--------------+
    |            1 |
    +--------------+


12. Display all the Supplier names (with ‘la’ replaced by ‘ro’).
HINT: REPLACE.

    select REPLACE(sname , 'la' , 'ro') as replaced from S;
    +----------+
    | replaced |
    +----------+
    | Smith    |
    | Jones    |
    | Broke    |
    | Crork    |
    | Adams    |
    +----------+

-- Sunbeam Institute of Information Technology Pune & Karad