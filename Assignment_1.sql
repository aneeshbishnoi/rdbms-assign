-- 1. Create 'spj' database'.
Create table S(
    `S#` char(5),
    Sname char(10),
    status smallint,
    city char(15)
);

insert into S(`S#`,Sname,status,City) values('S1','Smith',20,'London');
insert into S(`S#`,Sname,status,City) values('S2','Jones',10,'Paris');
insert into S(`S#`,Sname,status,City) values('S3','Blake',30,'Paris');
insert into S(`S#`,Sname,status,City) values('S4','Clark',20,'London');
insert into S(`S#`,Sname,status,City) values('S5','Adams',30,'Athens'); 

-- Q2
create table P(
    `P#` char(6),
    Pname char(20),
    Color char(6),
    Weight smallint,
    City char(15)
);
insert into P(`P#`,Pname,Color,Weight,City) values('P1','Nut','Red',12,'London');
insert into P(`P#`,Pname,Color,Weight,City) values('P2','Bolt','Green',17,'Paris');
insert into P(`P#`,Pname,Color,Weight,City) values('P3','Screw','Blue',17,'Rome');
insert into P(`P#`,Pname,Color,Weight,City) values('P4','Screw','Red',14,'London');
insert into P(`P#`,Pname,Color,Weight,City) values('P5','Cam','Blue',12,'Paris');
insert into P(`P#`,Pname,Color,Weight,City) values('P6','COg','Red',19,'London');


-- Q3
create table J(
    `j#` char(4),
    Jname char(10),
    City char(15)
);
insert into J(`J#`,Jname,City) values('J1','Sorter','Paris');
insert into J(`J#`,Jname,City) values('J2','Punch','Rome');
insert into J(`J#`,Jname,City) values('J3','Reader','Athens');
insert into J(`J#`,Jname,City) values('J4','Console','Athens');
insert into J(`J#`,Jname,City) values('J5','Collator','London');
insert into J(`J#`,Jname,City) values('J6','Terminal','Oslo');
insert into J(`J#`,Jname,City) values('J7','Tape','London');

create table SP(
    `S#` char(4),
    `P#` char(4),
    `J#` char(4),
    QTY int
);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S1','P1','J4',200);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S1','P1','J4',700);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P3','J1',400);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P3','J2',200);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P3','J3',200);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P3','J4',500);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P3','J5',600);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P3','J6',400);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P3','J7',800);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S2','P5','J2',100);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S3','P3','J1',200);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S3','P4','J2',500);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S4','P6','J3',300);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S4','P6','J7',300);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S5','P5','J5',500);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S5','P5','J7',100);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S4','P6','J7',300);
insert into SP(`S#`,`P#`,`J#`,QTY) values('S4','P6','J7',300);
