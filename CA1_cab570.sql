create database ca1;
use ca1;

create table employee(
enp_id int unique not null,
emp_name varchar (20) not null,
age int check (age >= 18),
department varchar (50) not null,
salary int check (salary >= 10000));

sp_help employee;

select * from employee;
alter table employee add constraint chk1 check(salary >= 15000);
alter table employee add constraint chk2 check(age between 18 and 35);

insert into employee values(301,'ankit',24,'hr',32000),
(302,'riya',28,'it',48000),
(303,'mohan',31,'sales',41000),
(304,'deepak',26,'it',52000),
(305,'nisha',23,'hr',35000),
(306,'aman',29,'sales',46000);

select emp_name,department,salary from employee where department = 'it';


select * from employee where emp_name like '%[ a,k,n]';

select salary from employee where salary < = 45000 order by salary desc offset 1 rows fetch next 2 rows only;

delete from employee where enp_id = 306;

 sp_rename 'employee.department','emp_department';

 select * from employee where age in(23,24,28,32);

alter table employee add city varchar(40);

update employee set city = case
when enp_id = 302 then 'delhi'
when enp_id = 305 then 'delhi'
when enp_id = 303 then 'mumbai'
end 
where enp_id in(302,305,303);

sp_rename 'employee.enp_id','emp_id';

select * from employee;

update employee set city = 'vanaras' where emp_id =301;

update employee set city = null where emp_id = 301;
