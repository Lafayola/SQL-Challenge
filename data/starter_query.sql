drop table if exists salary cascade;
drop table if exists title cascade;
drop table if exists department_manager cascade;
drop table if exists department_employee cascade;
drop table if exists department cascade;
drop table if exists employee cascade;
create table employee (
emp_no integer not null,
emp_title_id char(5),
birth_date date,
first_name varchar(50),
last_name varchar(50),
sex char(1),
hire_date date);
create table department (
dept_no char(5) not null,
dept_name varchar(50)
);
create table salary (
emp_no integer not null,
salary integer
);
create table title (
title_id char(5) not null,
title varchar(50)
);
create table department_manager (
dept_no char(5) not null,
emp_no integer not null
);
create table department_employee (
emp_no integer not null,
dept_no char(5) not null
);
alter table department add constraint PK_001 primary key (dept_no);
alter table salary add constraint PK_002 primary key (emp_no);
alter table title add constraint PK_003 primary key (title_id);
alter table department_manager add constraint PK_004 primary key (dept_no, emp_no);
alter table department_employee add constraint PK_005 primary key (emp_no, dept_no);
alter table employee add constraint PK_006 primary key (emp_no);
alter table employee add constraint FK_001 foreign key (emp_title_id) references title (title_id);
alter table salary add constraint FK_002 foreign key (emp_no) references employee (emp_no);
alter table department_employee add constraint FK_003 foreign key (emp_no) references employee (emp_no);
alter table department_employee add constraint FK_004 foreign key (dept_no) references department (dept_no);
alter table department_manager add constraint FK_005 foreign key (emp_no) references employee (emp_no);
alter table department_manager add constraint FK_006 foreign key (dept_no) references department (dept_no);