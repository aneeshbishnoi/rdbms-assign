-- 1. Display the PNAME and COLOR from the P table for the
-- CITY=”London”.

    select Pname , Color from P where city = 'LONDON';

            +-------+-------+
        | Pname | Color |
        +-------+-------+
        | Nut   | Red   |
        | Screw | Red   |
        | COg   | Red   |
        | Nut   | Red   |
        | Screw | Red   |
        | COg   | Red   |
        +-------+-------+


-- 2. Display all the Suppliers from London.

    select Sname from S;
    +-------+
    | Sname |
    +-------+
    | Smith |
    | Jones |
    | Blake |
    | Clark |
    | Adams |
    +-------+

-- 3. Display all the Suppliers from Paris or Athens.

    elect Sname from S where city in ('Paris','Athens');
    +-------+
    | Sname |
    +-------+
    | Jones |
    | Blake |
    | Adams |
    +-------+


-- 4. Display all the Jobs in Athens.

    select Jname from J where city = 'Athens';
        +---------+
    | Jname   |
    +---------+
    | Reader  |
    | Console |
    +---------+

-- 5. Display all the Part names with the weight between 12 and 14 (inclusive of both).

    select Pname from P where weight between 12 and 14;
    +-------+
    | Pname |
    +-------+
    | Nut   |
    | Screw |
    | Cam   |
    +-------+

-- 6. Display all the Suppliers with a Status greater than or equal to 20

    select Sname from S where status >= 20;
    +-------+
    | sname |
    +-------+
    | Smith |
    | Blake |
    | Clark |
    | Adams |
    +-------+

-- 7. Display all the Suppliers except the Suppliers from London.

    select Sname where city!='London';

    +-------+
    | Sname |
    +-------+
    | Jones |
    | Blake |
    | Adams |
    +-------+

-- 8. Display only the Cities from where the Suppliers come from.

    select distinct city from S;
    +--------+
    | city   |
    +--------+
    | London |
    | Paris  |
    | Athens |
    +--------+

-- 9. Display the Supplier table in the descending order of CITY.

    select * from S order by city;

    +------+-------+--------+--------+
    | S#   | Sname | status | city   |
    +------+-------+--------+--------+
    | S2   | Jones |     10 | Paris  |
    | S3   | Blake |     30 | Paris  |
    | S1   | Smith |     20 | London |
    | S4   | Clark |     20 | London |
    | S5   | Adams |     30 | Athens |
    +------+-------+--------+--------+

-- 10. Display the Part Table in the ascending order of CITY and within the city in the ascending order of Part names.

    select Pname from P order by city,pname asc;

    +------+-------+-------+--------+--------+
    | P#   | Pname | Color | Weight | City   |
    +------+-------+-------+--------+--------+
    | P6   | COg   | Red   |     19 | London |
    | P1   | Nut   | Red   |     12 | London |
    | P4   | Screw | Red   |     14 | London |
    | P2   | Bolt  | Green |     17 | Paris  |
    | P5   | Cam   | Blue  |     12 | Paris  |
    | P3   | Screw | Blue  |     17 | Rome   |
    +------+-------+-------+--------+--------+


-- 11. Display all the Suppliers with a status between 10 and 20.

    select * from S where status between 10 and 20;

    +------+-------+--------+--------+
    | S#   | Sname | status | city   |
    +------+-------+--------+--------+
    | S1   | Smith |     20 | London |
    | S2   | Jones |     10 | Paris  |
    | S4   | Clark |     20 | London |
    +------+-------+--------+--------+


-- 12. Display all the Parts and their Weight, which are not in the range of 10 and 15.

    select pname , weight from P where weight not between 10 and 15;
    +-------+--------+
    | pname | weight |
    +-------+--------+
    | Bolt  |     17 |
    | Screw |     17 |
    | COg   |     19 |
    +-------+--------+
