-- Database Technologies – Assignment 8
--  Use sub-query to solve following problems.
--  Note : To solve below queries use “sales” database

--  1. Write a query that uses a subquery to obtain all orders for the customer named 
-- Cisneros. Assume you do not know his customer number (cnum).

   select * from orders where cnum = 
      (select cnum from customers where cname = 'Cisneros');
  +------+---------+------------+------+------+
  | onum | amt     | odate      | cnum | snum |
  +------+---------+------------+------+------+
  | 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
  | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
  +------+---------+------------+------+------+


--  2. Write a query that produces the names and ratings of all customers who have above 
--    average orders.

   select cnum , cname from customers where cnum = 
      any(select cnum from orders group by cnum having count(cnum) > 
         (select avg(count) from 
            (select count(cnum) count from orders group by cnum) as avg_order));
   +------+----------+
   | cnum | cname    |
   +------+----------+
   | 2004 | Grass    |
   | 2006 | Clemens  |
   | 2008 | Cisneros |
   +------+----------+


--  3. Write a query that selects the total amount in orders for each salesperson for whom 
-- this total is greater than the amount of the largest order in the table.

   select sum(amt) total from orders group by snum having total > 
      (select max(amt) from orders);
   +----------+
   | total    |
   +----------+
   | 15382.07 |
   +----------+



--  4. Write a query that selects all customers whose ratings are equal to or greater than 
-- ANY of Serres’.

 select cname, rating from customers where rating >= 
   any(select rating from customers where snum = 
      (select snum from salespeople where sname = 'Serres'));
   +----------+--------+
   | cname    | rating |
   +----------+--------+
   | Giovanni |    200 |
   | Liu      |    200 |
   | Grass    |    300 |
   | Cisneros |    300 |
   +----------+--------+


--  5. Write a query using ANY or ALL that will find all salespeople who have no customers 
-- located in their city.

 select s.city,sname from salespeople s 
 where s.city not in 
 (select city from customers);
   
   +-----------+---------+
   | city      | sname   |
   +-----------+---------+
   | Barcelona | Rifkin  |
   | New York  | Axelrod |
   +-----------+---------+



 6. Write a query that selects all orders for amounts greater than any for the customers in
 London.

select * from orders where amt > 
   any(select amt from orders where cnum = 
      any(select cnum from customers where city = 'london')); -- return the amt of orders of customers form london
   +------+---------+------------+------+------+
   | onum | amt     | odate      | cnum | snum |
   +------+---------+------------+------+------+
   | 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
   | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
   | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
   | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
   | 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
   | 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
   +------+---------+------------+------+------+



--  7. Extract all the orders of Motika.

   select * from orders where snum = 
      any(select snum from salespeople where sname = 'Motika');
   +------+---------+------------+------+------+
   | onum | amt     | odate      | cnum | snum |
   +------+---------+------------+------+------+
   | 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
   +------+---------+------------+------+------+



 8. Find all the order attribute to salespeople servicing customers in London.

  select * from orders where snum = 
   any(select snum from salespeople where city = 
      any(select city from customers where city = 'london'));
   +------+---------+------------+------+------+
   | onum | amt     | odate      | cnum | snum |
   +------+---------+------------+------+------+
   | 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
   | 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
   | 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
   | 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
   +------+---------+------------+------+------+



--  9. Find names and numbers of all salesperson who have more than one customer.

  select sname , snum from salespeople group by sname , snum having snum = 
   any(select snum from customers group by snum having count(cnum) > 1);
   +--------+------+
   | sname  | snum |
   +--------+------+
   | Peel   | 1001 |
   | Serres | 1002 |
   +--------+------+





--  10. Find salespeople number,name and city who have multiple customers.

select sname , snum , city from salespeople 
   where snum = 
      any(select snum from customers group by snum having count(cnum) > 1);
   +--------+------+----------+
   | sname  | snum | city     |
   +--------+------+----------+
   | Peel   | 1001 | London   |
   | Serres | 1002 | San Jose |
   +--------+------+----------+


--  11. Select customers who have a greater rating than any other customer in Rome.

 select * from customers where rating >  
   any(select rating from customers where city = 'rome');
   +------+----------+----------+--------+------+
   | cnum | cname    | city     | rating | snum |
   +------+----------+----------+--------+------+
   | 2002 | Giovanni | Rome     |    200 | 1003 |
   | 2003 | Liu      | San Jose |    200 | 1002 |
   | 2004 | Grass    | Berlin   |    300 | 1002 |
   | 2008 | Cisneros | San Jose |    300 | 1007 |
   +------+----------+----------+--------+------+



--  12. Select all orders that had amounts that were greater that atleast one of the orders 
-- from ‘1990-10-04’ .

select * from orders where amt > 
   any(select amt from orders where odate = '1990-10-04');
   +------+---------+------------+------+------+
   | onum | amt     | odate      | cnum | snum |
   +------+---------+------------+------+------+
   | 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
   | 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
   | 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
   | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
   | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
   | 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
   | 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
   | 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
   +------+---------+------------+------+------+



--  13. Find all orders with amounts smaller than any amount for a customer in San Jose.

  select * from orders where amt < 
   any(select amt from orders where cnum = 
      any(select cnum from customers where city = 'san jose'));
   +------+---------+------------+------+------+
   | onum | amt     | odate      | cnum | snum |
   +------+---------+------------+------+------+
   | 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
   | 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
   | 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
   | 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
   | 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
   | 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
   | 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
   | 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
   +------+---------+------------+------+------+




--  14. Select those customers whose rating are higher than every customer in Paris.
 select cname from customers where rating  > 
   all(select rating from customers where city = 'paris');
   +----------+
   | cname    |
   +----------+
   | Hoffman  |
   | Giovanni |
   | Liu      |
   | Grass    |
   | Clemens  |
   | Cisneros |
   | Pereira  |
   +----------+
 