-- Database Technologies – Assignment 7

--  Use appropriate joins to solve following queries.

--  Note : To solve below queries use “sales” database

--  1. Write a query that lists each order number followed by the name of the customer who
--  made the order.

     select o.onum order_num , c.cname name from orders o inner join customers c on c.cnum = o.cnum;
    +-----------+----------+
    | order_num | name     |
    +-----------+----------+
    |      3001 | Cisneros |
    |      3003 | Hoffman  |
    |      3002 | Pereira  |
    |      3005 | Liu      |
    |      3006 | Cisneros |
    |      3009 | Giovanni |
    |      3007 | Grass    |
    |      3008 | Clemens  |
    |      3010 | Grass    |
    |      3011 | Clemens  |
    +-----------+----------+


--  2. Write a query that gives the names of both the salesperson and the customer for 
-- each order along with the order number.

    select s.sname  , c.cname  , o.onum  from salespeople s inner join customers c on s.snum = c.snum inner join orders o on o.snum = c.snum;
    +---------+----------+------+
    | sname   | cname    | onum |
    +---------+----------+------+
    | Rifkin  | Cisneros | 3001 |
    | Peel    | Clemens  | 3003 |
    | Peel    | Hoffman  | 3003 |
    | Motika  | Pereira  | 3002 |
    | Serres  | Grass    | 3005 |
    | Serres  | Liu      | 3005 |
    | Rifkin  | Cisneros | 3006 |
    | Axelrod | Giovanni | 3009 |
    | Serres  | Grass    | 3007 |
    | Serres  | Liu      | 3007 |
    | Peel    | Clemens  | 3008 |
    | Peel    | Hoffman  | 3008 |
    | Serres  | Grass    | 3010 |
    | Serres  | Liu      | 3010 |
    | Peel    | Clemens  | 3011 |
    | Peel    | Hoffman  | 3011 |
    +---------+----------+------+

--  3. Write a query that produces all customers serviced by salespeople with a commission
--  above 12%. Output the customer’s name, the salesperson’s name, and the 
-- salesperson’s rate of commission.

   select c.cname , s.sname,s.comm from customers c inner join salespeople s on s.snum = c.snum where s.comm > 0.12 ;
  +----------+--------+------+
  | cname    | sname  | comm |
  +----------+--------+------+
  | Liu      | Serres | 0.13 |
  | Grass    | Serres | 0.13 |
  | Cisneros | Rifkin | 0.15 |
  +----------+--------+------+


--  4. Write a query that calculates the amount of the salesperson’s commission on each 
-- order by a customer with a rating above 100.

     select o.amt  , s.sname , s.comm , c.rating from salespeople s inner join customers c on c.snum = s.snum inner join orders o on o.cnum = c.cnum where c.rating > 100;
    +---------+---------+------+--------+
    | amt     | sname   | comm | rating |
    +---------+---------+------+--------+
    |   18.69 | Rifkin  | 0.15 |    300 |
    | 5160.45 | Serres  | 0.13 |    200 |
    | 1098.16 | Rifkin  | 0.15 |    300 |
    | 1713.23 | Axelrod | 0.10 |    200 |
    |   75.75 | Serres  | 0.13 |    300 |
    |  309.95 | Serres  | 0.13 |    300 |
    +---------+---------+------+--------+



 5. Write a query that produces all pairs of salespeople who are living in the same 
city.Exclude combinations of salespeople with themselves as well as duplicate rows 
with the order reversed.

  select s1.sname, s2.sname, s1.city from salespeople s1 
  cross join salespeople s2 on s1.city = s2.city 
  where s1.sname<s2.sname;
  +-------+--------+--------+
  | sname | sname  | city   |
  +-------+--------+--------+
  | Peel  | Motika | London |
  +-------+--------+--------+

                  --  Sunbeam Institute of Information Technology Pune & Karad

-- Database Technologies – Assignment 7
-- Note : To solve below queries use “spj” database


--  1. Display the Supplier name and the Quantity sold.

 select s.Sname , sum(sp.QTY) from s  inner join SP  on s.`S#` = sp.`S#` group by Sname ;
  +-------+-------------+
  | Sname | sum(sp.QTY) |
  +-------+-------------+
  | Smith |        1400 |
  | Jones |        3200 |
  | Blake |         700 |
  | Clark |        1200 |
  | Adams |         600 |
  +-------+-------------+


--  2. Display the Part name and Quantity sold.

  select Pname , sum(QTY) from P inner join SP on P.`P#` = SP.`P#` group by Pname;
  +-------+----------+
  | Pname | sum(QTY) |
  +-------+----------+
  | Nut   |     1400 |
  | Screw |     3800 |
  | Cam   |      700 |
  | COg   |     1200 |
  +-------+----------+


--  3. Display the Job  name and Quantity sold.

  select Jname , sum(QTY) from j inner join sp on j.`j#` = sp.`j#` group by Jname;
  +----------+----------+
  | Jname    | sum(QTY) |
  +----------+----------+
  | Console  |     3800 |
  | Sorter   |     1200 |
  | Punch    |     1600 |
  | Reader   |     1000 |
  | Collator |     2200 |
  | Terminal |      800 |
  | Tape     |     3600 |
  +----------+----------+

 4. Display the Supplier name, Part name, Job  name and Quantity sold.
     select Sname , Pname , Jname , sum(SP.QTY) from s
    ->     inner join SP on s.`S#` = SP.`S#`
    ->     inner join P on SP.`P#` = P.`P#`
    ->     inner join j on SP.`J#` = j.`j#`
    ->     group by Sname,Pname,Jname;
    +-------+-------+----------+-------------+
    | Sname | Pname | Jname    | sum(SP.QTY) |
    +-------+-------+----------+-------------+
    | Jones | Screw | Sorter   |         800 |
    | Blake | Screw | Sorter   |         400 |
    | Jones | Cam   | Punch    |         200 |
    | Blake | Screw | Punch    |        1000 |
    | Jones | Screw | Punch    |         400 |
    | Clark | COg   | Reader   |         600 |
    | Jones | Screw | Reader   |         400 |
    | Jones | Screw | Console  |        1000 |
    | Smith | Nut   | Console  |        2800 |
    | Adams | Cam   | Collator |        1000 |
    | Jones | Screw | Collator |        1200 |
    | Jones | Screw | Terminal |         800 |
    | Clark | COg   | Tape     |        1800 |
    | Adams | Cam   | Tape     |         200 |
    | Jones | Screw | Tape     |        1600 |
    +-------+-------+----------+-------------+

  
 5. Display the Supplier name, Supplying Parts to a Job in the same City.

  select  s.Sname  , j.city  from S 
  inner join P p on s.city = p.city
  inner join J j on j.city = p.city
  group by j.city  , s.Sname ; 
  
  

--  6. Display the Part name that is ‘Red’ in color, and the Quantity sold.
    select Pname , sum(sp.QTY) from P p
    inner join SP sp on sp.`P#` = p.`P#`
    where p.Color = 'Red' group by Pname ;

    +-------+-------------+
    | Pname | sum(sp.QTY) |
    +-------+-------------+
    | Nut   |         900 |
    | Screw |         500 |
    | COg   |        1200 |
    +-------+-------------+

  

--  7. Display all the Quantity sold by Suppliers with the Status = 20.

        inner join SP sp on sp.`S#` = s.`S#`
       where s.status = 20
       group by s.Sname ;
        +-------+-------------+
        | Sname | sum(sp.QTY) |
        +-------+-------------+
        | Smith |         900 |
        | Clark |        1200 |
        +-------+-------------+


        mysql>   select sum(sp.QTY) from s
       inner join SP sp on sp.`S#` = s.`S#`
       where s.status = 20;
        +-------------+
        | sum(sp.QTY) |
        +-------------+
        |        2100 |
        +-------------+

--  8. Display all the Parts and Quantity with a Weight > 14.

      select  p.Pname , sum(sp.QTY) from SP sp
      inner join P p on p.`P#` = sp.`P#`
      where p.Weight > 14 group by p.Pname;

      +-------+-------------+
      | Pname | sum(sp.QTY) |
      +-------+-------------+
      | Screw |        3300 |
      | COg   |        1200 |
      +-------+-------------+


 9. Display all the Job  names and City, which has bought more than 500 Parts.

  select j.Jname , j.city, sum(sp.QTY) from J j
  inner join SP sp on sp.`J#` = j.`J#`
  group by j.Jname, j.city
  having sum(sp.QTY) > 500;


 10. Display all the Part names and Quantity sold that have a Weight less than 15.

     select p.Pname , sum(sp.QTY) from P p
     inner join SP sp on sp.`P#` = p.`p#`
     where p.Weight < 15
     group by p.Pname;

     +-------+-------------+
    | Pname | sum(sp.QTY) |
    +-------+-------------+
    | Nut   |         900 |
    | Cam   |         700 |
    | Screw |         500 |
    +-------+-------------+



 11. Display all the Suppliers with the same Status as the supplier, ‘CLARK’.

 select s1.Sname , s2.Sname ,  s1.status  from S s1 
 inner join S s2 on s1.status = s2.status
 where s1.Sname < s2.Sname;

  +-------+-------+--------+
  | Sname | Sname | status |
  +-------+-------+--------+
  | Clark | Smith |     20 |
  | Adams | Blake |     30 |

--  12. Display all the Parts which have more Weight than any Red parts.

    select p1.Pname , p1.Weight , p1.Color from P p1
    inner join P p2 on p1.Color = 'Red' and p2.Color = 'Red'
    where p1.Pname < p2.Pname;

    select p1.Pname from p p1 inner join  p p2 on p1.`P#` = p2.`P#`
    where p2.color = 'Red'
    group by p1.pname , p2.color;

      select p1.pname, p1.Weight,p2.pname,p2.Weight,p2.color
      from p p1 cross join p p2 on p1.`p#` = p2.`p#`
      where p2.color  = 'Red';

    select p1.pname , p1.Weight
    from p p1 cross join p p2
    where p2.color = 'RED'
    group by p1.pname , p1.Weight
    having p1.Weight > min(p2.Weight);




 13. Display all the Jobs going on in the same city as the job ‘TAPE’.
    select j1.Jname , j1.city from J j1
    join j j2 on j1.city = j2.city
    where j2.Jname = 'TAPE';
      +----------+--------+
      | Jname    | city   |
      +----------+--------+
      | Collator | London |
      | Tape     | London |
      +----------+--------+


 14. Display all the Parts with Weight less than any the Green parts.
  select p1.Weight , p1.Pname form p p1 
  join p p2 on p1.Weight < p2.Weight
  where p2.color = 'Green';
  +--------+-------+
  | Weight | Pname |
  +--------+-------+
  |     12 | Nut   |
  |     14 | Screw |
  |     12 | Cam   |
  +--------+-------+


 15. Display the name of the Supplier who has sold the maximum Quantity (in onesale).


 16. Display the name of the Supplier who has sold the maximum overall Quantity 
(sumof Sales).

--  Sunbeam Institute of Information Technology Pune & Karad


 