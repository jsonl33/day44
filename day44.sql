create table dept15(
deptno number(38) primary key,
dname varchar2(50)
);

insert into dept15 values(10,'관리부');
insert into dept15 values(20,'개발부');
insert into dept15 values(30,'기업부');

select * from dept15 order by deptno asc;
commit;

create table emp15(
empno number(38) primary key,
ename varchar2(50),
job varchar2(50),
sal number(38),
comm int,
deptno number(38)
);

insert into emp15 values(21,'홍길동','관리사원',1500,0,10);
insert into emp15 values(22,'이순신','자바개발자',3000,300,20);
insert into emp15 values(23,'강감찬','C언어개발자',2800,200,20);
insert into emp15 values(24,'세종대왕','기획사원',2000,200,30);
insert into emp15 values(25,'신사임당','기획팀장',4000,400,30);
commit;

select * from emp15 order by empno;

select dname as "부서명" from dept15
where deptno = (select deptno from emp15 where ename='홍길동');

select avg(sal) as "급여평균" from emp15;

select ename, sal from emp15 where sal > (select avg (sal) from emp15);

select distinct deptno from emp15 where sal >= 1200;

select ename, sal, deptno from emp15 where deptno=(select distinct deptno from emp15 where sal>=1200);

select ename, sal, deptno from emp15
where deptno in (select distinct deptno from emp15 where sal >= 1200);

select MAX(sal) from emp15 group by deptno having deptno = 20;

select ename, sal, deptno from emp15 where sal > (select max(sal) from emp15 group by deptno having deptno = 20);

select ename, sal, deptno from emp15 where sal > (select min(sal) from emp15 group by deptno having deptno = 20);

select ename, sal, deptno from emp15 where sal > ANY(select sal from emp15 where deptno=20);

create table emp16 as select * from emp15;

create table emp17 as select empno, ename, sal, deptno from emp15;

select * from emp17 order by empno;

create table emp19 as select * from emp15 where 1=2;
select * from emp19;

create table emp21 (
empno number(38) primary key,
ename varchar2(30),
sal number(38)
);

describe emp21;
desc emp21;

alter table emp21 add(job varchar2(50));

alter table emp21 modify(job varchar2(30));

alter table emp21 drop column job;

insert into emp21 values(11,'홍길동',2000);
insert into emp21 values(12,'신사임당',3000);
select * from emp21 order by empno desc;

truncate table emp21;

rename emp21 to emp21_test;

select * from emp21;
select * from emp21_test;

drop table emp21_test;
create table emp26 (
empno int primary key,
ename varchar(30),
LOC varchar2(50)
);

insert into emp26 (LOC, ename, empno) values ('서울','홍길동',11);

insert into emp26 values (12,'세종대왕님','경복궁');

create table emp26_test as select * from emp26 where 1=2;
insert into emp26_test select * from emp26;

select * from emp26;
select * from emp26_test;

