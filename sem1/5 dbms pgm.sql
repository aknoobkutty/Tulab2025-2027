create database college;

show databases;

use college;

create table person(
personId int,
lastname varchar(255),
firstname varchar(255),
Address varchar(255),
city varchar(255)
);

desc person;

insert into person values(111,'arun','kumar','tindivanam','tn');

insert into person values(222,'mahesh','babu','villupuram','vpm');

insert into person values(333,'raja','shekar','tindivanam','tn');

select * from person;

create database students_db;

use students_db;

 create table student1(id int,gender varchar(20),dob date,mark int,dept varchar(20));
 
 desc student1;
 
insert into student1 values(333,'male','2000-05-10',120,'cs');

insert into student1 values(222,'male','2001-06-11',150,'cs');

insert into student1 values(111,'male','2002-07-12',110,'cs');

select * from student1;

select personId ,address from college.person;
select id,mark,gender from students_db.student1;

select * from college.person inner join students_db.student1 on
personId=id;
